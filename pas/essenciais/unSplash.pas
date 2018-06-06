unit unSplash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, UnSysFrameHost, UnSysFrameWork,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxGDIPlusClasses, cxImage,
  Vcl.ExtCtrls, Vcl.ComCtrls, cxLabel, Vcl.StdCtrls, Vcl.Ribbon, Vcl.ActnMan, Vcl.ActnList,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxProgressBar;

type
  TfrmSplash = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    imgSplash: TImage;
    ProgressBar: TProgressBar;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PermissaoUsuarios();
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}
uses unAplicacao, unData, unCadConfigEmpresa, unSEFAZ;

procedure TfrmSplash.PermissaoUsuarios;
var
  i, TabTag, GroupTag, FrmTag, xEmpresa: Integer;
  tab, grupo: Boolean;
  QFiltro, TAGSTR: String;
begin
  // Verifica se existe configuração para a estação
  frmAplicacao.HostInfo := GetHostInfo;
  try
    Connection.qEmpresas.ParamByName('estabelecimento').AsInteger := Connection.qEstabelecimentos.FieldByName('codestabelec').AsInteger;
    Connection.qEmpresas.Open;
    xEmpresa := Connection.qEmpresas.FieldByName('codigo').AsInteger;
    Connection.qAssinatura.ParamByName('empresa').AsInteger := xEmpresa;
    Connection.qAssinatura.Open;
    Connection.qHostConfig.ParamByName('empresa').AsInteger := xEmpresa;
    Connection.qHostConfig.ParamByName('serial').AsString := frmAplicacao.HostInfo.HISerial;
    Connection.qHostConfig.Open;
    if Connection.qAssinatura.RecordCount = 0 then
      begin
        if (Application.MessageBox('Não encontramos os registros da Assinatura Digital.'+#13+'Deseja realizar a configuração agora?','Configuração pendente',MB_ICONQUESTION + MB_YESNO) = ID_YES) then
          begin
            CriaFormulario(TFrmCadConfigEmpresa,xEmpresa,'ALTERACAO',frmCadConfigEmpresa);
          end;
      end
    else
      begin
        // Cria os diretorios de arquivos fiscais, caso eles estejam definidos.
        try
          begin
            if (Connection.qAssinaturaarq_path_nfe.IsNull = False) and not (DirectoryExists(Connection.qAssinaturaarq_path_nfe.AsString)) then ForceDirectories(Connection.qAssinaturaarq_path_nfe.AsString);
            if (Connection.qAssinaturaarq_path_cancelamento.IsNull = False) and not (DirectoryExists(Connection.qAssinaturaarq_path_cancelamento.AsString)) then ForceDirectories(Connection.qAssinaturaarq_path_cancelamento.AsString);
            if (Connection.qAssinaturaarq_path_cce.IsNull = False) and not (DirectoryExists(Connection.qAssinaturaarq_path_cce.AsString)) then ForceDirectories(Connection.qAssinaturaarq_path_cce.AsString);
            if (Connection.qAssinaturaarq_path_cfe.IsNull = False) and not (DirectoryExists(Connection.qAssinaturaarq_path_cfe.AsString)) then ForceDirectories(Connection.qAssinaturaarq_path_cfe.AsString);
            if (Connection.qAssinaturaarq_path_inutilizacao.IsNull = False) and not (DirectoryExists(Connection.qAssinaturaarq_path_inutilizacao.AsString)) then ForceDirectories(Connection.qAssinaturaarq_path_inutilizacao.AsString);
            if (Connection.qAssinaturaarq_path_eventos.IsNull = False) and not (DirectoryExists(Connection.qAssinaturaarq_path_eventos.AsString)) then ForceDirectories(Connection.qAssinaturaarq_path_eventos.AsString);
            if (Connection.qAssinaturaarq_path_dpec.IsNull = False) and not (DirectoryExists(Connection.qAssinaturaarq_path_dpec.AsString)) then ForceDirectories(Connection.qAssinaturaarq_path_dpec.AsString);
          end;
        except
          Aviso('ERRO','Informação','Não foi possivel criar os diretórios de armazenamento dos arquivos fiscais.' +
                #13 + 'Por favor, entre em contato com o suporte.');
        end;
      end;
    if Connection.qHostConfig.RecordCount = 0 then
      begin
        // Inicia processo de registro de configuração da estação.
        Connection.ScriptHostConfig.Params.ParamByName('iempresa').AsInteger := Connection.qEmpresas.FieldByName('codigo').AsInteger;
        Connection.ScriptHostConfig.Params.ParamByName('sserial').AsString := frmAplicacao.HostInfo.HISerial;
        Connection.ScriptHostConfig.Execute;
        Connection.qHostConfig.Close;
        Connection.qHostConfig.Open;
        if Connection.qHostConfig.RecordCount = 0 then
          begin
          Aviso('ERRO','Falha ao carregar configuração da estação','Não foi possivel localizar a configuração da estação atual.'+
                #13+'Por favor entre em contato com o suporte!');
          end
      end;
    dmSeFaz.ConfigSeFaz;
  except
    Aviso('STOP','Falha de carregamento.','Não foi possivel carregar os dados de configurações.'+#13+'Entre em contato com o Suporte!');
  end;

  ProgressBar.Max := frmAplicacao.ComponentCount;
  // Liberar botões de acordo com as permissões no banco por formulario.
  // A principio formularios de pesquisa são de livre acesso a todos.
  for I := 0 to frmAplicacao.ComponentCount -1 do
    begin
      ProgressBar.Position := i;
      // Paginas
      {if frmAplicacao.Components[i] is TRibbonPage then
        begin
          {if TRibbonPage(frmAplicacao.Components[i]).Tag = 0 then
            begin
              TRibbonPage(frmAplicacao.Components[i]).Enabled := True;
              TRibbonPage(frmAplicacao.Components[i]).Visible := True;
            end
          else
            begin
              TAGSTR := IntToStr(TRibbonPage(frmAplicacao.Components[i]).Tag);
              if Length(TAGSTR) = 5 then
                begin
                  TAGSTR := Copy(TAGSTR,2,1) + '000';
                  TabTag := StrToInt(TAGSTR);
                end;
              if Length(TAGSTR) = 4 then
                begin
                  TAGSTR := Copy(TAGSTR,1,1) + '000';
                  TabTag := StrToInt(TAGSTR);
                end;
              QFiltro:= 'tabtag = '+ IntToStr(TabTag);
              // Verifica Permissoes especificas do Usuario;
              dmData.qPermissoesUser.Filter := QFiltro;
              dmData.qPermissoesUser.Filtered := True;
              if dmData.qPermissoesUser.RecordCount = 1 then
                begin
                  TRibbonPage(frmAplicacao.Components[i]).Enabled := True;
                  TRibbonPage(frmAplicacao.Components[i]).Visible := True;
                end
              else
                begin
                  dmData.qPermissoesUser.Filtered := False;
                  dmData.qPermissoesGrupo.Filter := QFiltro;
                  dmData.qPermissoesGrupo.Filtered := True;
                  if dmData.qPermissoesGrupo.RecordCount = 1 then
                    begin
                      TRibbonPage(frmAplicacao.Components[i]).Enabled := True;
                      TRibbonPage(frmAplicacao.Components[i]).Visible := True;
                      dmData.qPermissoesGrupo.Filtered := False;
                    end
                  else
                    begin
                      TRibbonPage(frmAplicacao.Components[i]).Enabled := False;
                      TRibbonPage(frmAplicacao.Components[i]).Visible := False;
                      dmData.qPermissoesGrupo.Filtered := False;
                    end;
                end;
            end;
        end;}
      // Grupos
      {if frmAplicacao.Components[i] is TRibbonGroup then
        begin
          if TRibbonGroup(frmAplicacao.Components[i]).Tag = 0 then
            begin
              TRibbonGroup(frmAplicacao.Components[i]).Enabled := True;
              TRibbonGroup(frmAplicacao.Components[i]).Visible := True;
            end
          else
            begin
              TAGSTR := IntToStr(TRibbonGroup(frmAplicacao.Components[i]).Tag);
              // Copy(Valor,Inicio,Variavel)
              if Length(TAGSTR) = 5 then
                begin
                  TAGSTR := Copy(TAGSTR,3,1) + '00';
                  GroupTag := StrToInt(TAGSTR);
                end;
              if Length(TAGSTR) = 4 then
                begin
                  TAGSTR := Copy(TAGSTR,2,1) + '00';
                  GroupTag := StrToInt(TAGSTR);
                end;
              QFiltro:= 'grupotag = '+ IntToStr(GroupTag);
              // Verifica Permissoes especificas do Usuario;
              dmData.qPermissoesUser.Filter := QFiltro;
              dmData.qPermissoesUser.Filtered := True;
              if dmData.qPermissoesUser.RecordCount = 1 then
                begin
                  //TRibbonGroup(frmAplicacao.Components[i]).Enabled := True;
                  TRibbonGroup(frmAplicacao.Components[i]).Visible := True;
                end
              else
                begin
                  dmData.qPermissoesUser.Filtered := False;
                  dmData.qPermissoesGrupo.Filter := QFiltro;
                  dmData.qPermissoesGrupo.Filtered := True;
                  if dmData.qPermissoesGrupo.RecordCount = 1 then
                    begin
                      //TRibbonGroup(frmAplicacao.Components[i]).Enabled := True;
                      TRibbonGroup(frmAplicacao.Components[i]).Visible := True;
                      dmData.qPermissoesGrupo.Filtered := False;
                    end
                  else
                    begin
                      //TRibbonGroup(frmAplicacao.Components[i]).Enabled := False;
                      TRibbonGroup(frmAplicacao.Components[i]).Visible := False;
                      dmData.qPermissoesGrupo.Filtered := False;
                    end;
                end;
            end;
        end;
      // Itens
      {if frmAplicacao.Components[i] is TAction then
        begin
          if TAction(frmAplicacao.Components[i]).Tag = 0 then
            begin
              TAction(frmAplicacao.Components[i]).Enabled := True;
              TAction(frmAplicacao.Components[i]).Visible := True;
            end
          else
            begin
              FrmTag := TAction(frmAplicacao.Components[i]).Tag;
              QFiltro:= 'formulario = '+ IntToStr(FrmTag);
              // Verifica Permissoes especificas do Usuario;
              dmData.qPermissoesUser.Filter := QFiltro;
              dmData.qPermissoesUser.Filtered := True;
              if dmData.qPermissoesUser.RecordCount = 1 then
                begin
                  TAction(frmAplicacao.Components[i]).Enabled := True;
                  TAction(frmAplicacao.Components[i]).Visible := True;
                end
              else
                begin
                  dmData.qPermissoesUser.Filtered := False;
                  dmData.qPermissoesGrupo.Filter := QFiltro;
                  dmData.qPermissoesGrupo.Filtered := True;
                  if dmData.qPermissoesGrupo.RecordCount = 1 then
                    begin
                      TAction(frmAplicacao.Components[i]).Enabled := True;
                      TAction(frmAplicacao.Components[i]).Visible := True;
                      dmData.qPermissoesGrupo.Filtered := False;
                    end
                  else
                    begin
                      TAction(frmAplicacao.Components[i]).Enabled := False;
                      TAction(frmAplicacao.Components[i]).Visible := False;
                      dmData.qPermissoesGrupo.Filtered := False;
                    end;
                end;
            end;
        end; }
    end;
    // Verifica Permissoes especificas do Usuario;
    {QFiltro := 'formulario = ' + IntToStr(Tag);
    dmData.qPermissoesUser.Filter := QFiltro;
    dmData.qPermissoesGrupo.Filter:= QFiltro;
    dmData.qPermissoesUser.Filtered := True;
    dmData.qPermissoesGrupo.Filtered:= True;
    // Problema do Locate é que não é obrigatorio o registro da permissão ao usuario.
    // dmData.qPermissoesUser.Locate('formulario',Tag,[loCaseInsensitive]);
    if dmData.qPermissoesUser.RecordCount = 1 then
        end;
    end;}
    Close;
end;

procedure TfrmSplash.Timer1Timer(Sender: TObject);
begin
  AlphaBlendValue := AlphaBlendValue + 3;
  if AlphaBlendValue >= 255 then
    begin
      Timer1.Enabled:= False;
      //ProgressBar.Visible:= True;
      PermissaoUsuarios;
      Timer2.Enabled:= True;
    end;
end;

procedure TfrmSplash.Timer2Timer(Sender: TObject);
begin
  ProgressBar.Position := ProgressBar.Position + 3;
  if ProgressBar.Position >= ProgressBar.Max then
    begin
      Timer2.Enabled := False;
      Close;
    end;
end;

end.
