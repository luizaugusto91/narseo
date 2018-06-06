unit unSystemSplashCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, unSystem, unNetwork, unConnection, unParametros,
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
  dxSkinXmas2008Blue, cxProgressBar, JvExComCtrls, JvProgressBar;

type
  TfrmSystemSplashCaixa = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    imgSplash: TImage;
    lblPrecesso: TcxLabel;
    ProgressBar: TJvProgressBar;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PermissaoUsuarios();
  end;

var
  frmSystemSplashCaixa: TfrmSystemSplashCaixa;

implementation

{$R *.dfm}
uses unCaixa, Vcl.Clipbrd;

procedure TfrmSystemSplashCaixa.FormShow(Sender: TObject);
begin
  lblPrecesso.Caption := 'Versão ' + Versao;
end;

procedure TfrmSystemSplashCaixa.PermissaoUsuarios;
var
  i, TabTag, GroupTag, FrmTag, xEmpresa: Integer;
  tab, grupo: Boolean;
  QFiltro, TAGSTR: String;
begin
  // Verifica se existe configuração para a estação
  Application.ProcessMessages;
  Parametros.HostInfo := GetHostInfo;
  lblPrecesso.Caption := 'Carregando informações basicas...';
  try
    // Configurações de Regras de Negocio.
    Connection.qRN.ParamByName('empresa').AsInteger := Parametros.FieldParametrosempresa.AsInteger;
    Connection.qRN.Open;
    Parametros.SetParamRNEmpresa(Connection.qRN.FieldByName('empresa').AsInteger);
    Parametros.SetParamRNComprasCC(Connection.qRN.FieldByName('compras_centro_custos').AsString);
    Parametros.SetParamRNVendasCC(Connection.qRN.FieldByName('vendas_centro_custos').AsString);
    Parametros.SetParamRNComprasTipoConta(Connection.qRN.FieldByName('compras_tipo_conta').AsInteger);
    Parametros.SetParamRNVendasTipoConta(Connection.qRN.FieldByName('vendas_tipo_conta').AsInteger);
    Parametros.SetParamRNComprasTipoPagamento(Connection.qRN.FieldByName('compras_tipo_pagamento').AsInteger);
    Parametros.SetParamRNVendasTipoPagamento(Connection.qRN.FieldByName('vendas_tipo_pagamento').AsInteger);
    Connection.qRN.Close;
    // Configurações de Servidores externos
    lblPrecesso.Caption := 'Carregando configurações do servidor...';
    xEmpresa := Connection.qEmpresas.FieldByName('codigo').AsInteger;
    Connection.qAssinatura.ParamByName('empresa').AsInteger := xEmpresa;
    Connection.qAssinatura.Open;
    Connection.qHostConfig.ParamByName('empresa').AsInteger := xEmpresa;
    Connection.qHostConfig.ParamByName('serial').AsString := Parametros.HostInfo.HISerial;
    Connection.qHostConfig.Open;
    if Connection.qAssinatura.RecordCount <> 0 then
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
        lblPrecesso.Caption := 'Carregando configurações do terminal...';
        // Inicia processo de registro de configuração da estação.
        Connection.ScriptHostConfig.Params.ParamByName('iempresa').AsInteger := xEmpresa;
        Connection.ScriptHostConfig.Params.ParamByName('sserial').AsString := Parametros.HostInfo.HISerial;
        Connection.ScriptHostConfig.Execute;
        Connection.qHostConfig.Close;
        Connection.qHostConfig.Open;
        if Connection.qHostConfig.RecordCount = 0 then
          begin
            Aviso('ERRO','Falha ao carregar configuração da estação','Não foi possivel localizar a configuração da estação atual.'+
                #13+'Por favor entre em contato com o suporte!');
          end
      end;
  except
    Aviso('STOP','Falha de carregamento.','Não foi possivel carregar os dados de configurações.'+#13+'Entre em contato com o Suporte!');
  end;

  ProgressBar.Max := Caixa.ComponentCount;
  // Liberar botões de acordo com as permissões no banco por formulario.
  // A principio formularios de pesquisa são de livre acesso a todos.
  lblPrecesso.Caption := 'Carregando componentes...';
  for I := 0 to Caixa.ComponentCount -1 do
    begin
      ProgressBar.Position := i;
      if Caixa.Components[i] is TAction then
        TAction(Caixa.Components[i]).Enabled := False;
    end;
  lblPrecesso.Caption := 'Carregando permissões...';
  for I := 0 to Caixa.ComponentCount -1 do
    begin
      ProgressBar.Position := i;
      // Paginas
      Connection.qPermissoesUser.Close;
      Connection.qPermissoesUser.ParamByName('usuario').AsInteger := Parametros.FieldParametrosusuario.AsInteger;
      Connection.qPermissoesGrupo.Close;
      Connection.qPermissoesGrupo.ParamByName('grupo').AsInteger := Parametros.FieldParametrosgrupo.AsInteger;
      // Itens
      if Caixa.Components[i] is TAction then
        begin
          // > Se TAG = 0 é liberado a todos os usuarios.
          if TAction(Caixa.Components[i]).Tag = 0 then
            begin
              TAction(Caixa.Components[i]).Enabled := True;
              TAction(Caixa.Components[i]).Visible := True;
            end
          // > Caso contrario, verifica permissão.
          else
            begin
              FrmTag := TAction(Caixa.Components[i]).tag;
              Connection.qPermissoesUser.Close;
              Connection.qPermissoesUser.ParamByName('tag').AsInteger := FrmTag;
              Connection.qPermissoesGrupo.Close;
              Connection.qPermissoesGrupo.ParamByName('tag').AsInteger := FrmTag;
              // Verifica Permissoes especificas do Usuario;
              Connection.qPermissoesUser.Open;
              if Connection.qPermissoesUser.RecordCount = 1 then
                begin
                  TAction(Caixa.Components[i]).Enabled := True;
                end
              else
                begin
                  Connection.qPermissoesGrupo.Open;
                  if Connection.qPermissoesGrupo.RecordCount = 1 then
                    begin
                      TAction(Caixa.Components[i]).Enabled := True;
                    end
                  else
                    begin
                      TAction(Caixa.Components[i]).Enabled := False;
                    end;
                  Connection.qPermissoesGrupo.Close;
                end;
              Connection.qPermissoesUser.Close;
            end;
        end;
    //end;
    // Verifica Permissoes especificas do Usuario;
    {QFiltro := 'formulario = ' + IntToStr(Tag);
    dmData.qPermissoesUser.Filter := QFiltro;
    dmData.qPermissoesGrupo.Filter:= QFiltro;
    dmData.qPermissoesUser.Filtered := True;
    dmData.qPermissoesGrupo.Filtered:= True;
    // Problema do Locate é que não é obrigatorio o registro da permissão ao usuario.
    // dmData.qPermissoesUser.Locate('formulario',Tag,[loCaseInsensitive]);
    if dmData.qPermissoesUser.RecordCount = 1 then
        end;}
    end;
  Close;
end;

procedure TfrmSystemSplashCaixa.Timer1Timer(Sender: TObject);
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

procedure TfrmSystemSplashCaixa.Timer2Timer(Sender: TObject);
begin
  ProgressBar.Position := ProgressBar.Position + 3;
  if ProgressBar.Position >= ProgressBar.Max then
    begin
      Timer2.Enabled := False;
      Close;
    end;
end;

end.
