unit unCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, 
  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxClasses, dxRibbonBackstageView, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, dxSkinsdxRibbonPainter, dxRibbonCustomizationForm,
  dxSkinsdxBarPainter, dxSkinsForm, dxStatusBar, dxRibbonStatusBar, cxStyles,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  Vcl.ExtCtrls, cxLocalization, unSystem, unParametros, unNetwork, cxContainer,
  cxEdit, Data.DB, dxGDIPlusClasses, cxLabel, cxDBLabel, cxImage, Vcl.ComCtrls,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxPC, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid, Vcl.StdCtrls,
  DBAccess, Uni, MemDS, cxTextEdit, cxDBEdit;

type
  TCaixa = class(TdxRibbonForm)
    BarManager: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    Ribbon: TdxRibbon;
    MTabInicio: TdxRibbonTab;
    SkinController: TdxSkinController;
    Localizer: TcxLocalizer;
    tmrSystem: TTimer;
    ActionManager: TActionManager;
    actSair: TAction;
    actAjuda: TAction;
    StyleRepository: TcxStyleRepository;
    StyleSelecionado: TcxStyle;
    StylePrioridadeBaixa: TcxStyle;
    StylePrioridadeMedia: TcxStyle;
    StylePrioridadeAlta: TcxStyle;
    StylePrioridadeEmergencial: TcxStyle;
    StyleNeutro: TcxStyle;
    StyleConcluido: TcxStyle;
    StyleCancelado: TcxStyle;
    StyleTitulo: TcxStyle;
    BarSistema: TdxBar;
    MnSair: TdxBarLargeButton;
    MnAjuda: TdxBarLargeButton;
    pnlRazao: TPanel;
    lblRazao: TcxDBLabel;
    lblCNPJ: TcxDBLabel;
    imgSublogo: TcxImage;
    dsEmpresas: TDataSource;
    StatusBar: TdxRibbonStatusBar;
    PageControl: TcxPageControl;
    TabLogo: TcxTabSheet;
    TabCaixa: TcxTabSheet;
    imgLogo: TcxImage;
    pnlMAIN: TPanel;
    spl1: TSplitter;
    pnl4: TPanel;
    pnl5: TPanel;
    pnlBOTTOM: TPanel;
    lblStatus: TLabel;
    View: TcxGridDBTableView;
    Master: TcxGridLevel;
    Grid: TcxGrid;
    pnl1: TPanel;
    pnl2: TPanel;
    img1: TcxImage;
    img2: TcxImage;
    ColumnID: TcxGridDBColumn;
    ColumnITEM: TcxGridDBColumn;
    ColumnQUANTIDADE: TcxGridDBColumn;
    ColumnVRUNI: TcxGridDBColumn;
    ColumnVRTOTAL: TcxGridDBColumn;
    ColumnACRESCIMO: TcxGridDBColumn;
    ColumnDESCONTO: TcxGridDBColumn;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    BarVendas: TdxBar;
    actVendasNova: TAction;
    actVendasCancelar: TAction;
    MnVendasNova: TdxBarLargeButton;
    MnVendasCancelar: TdxBarLargeButton;
    pnl3: TPanel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    qConsulta: TUniQuery;
    ds: TUniDataSource;
    qSQL: TUniQuery;
    dsPessoa: TDataSource;
    lblnome: TcxDBLabel;
    lbl11: TcxDBLabel;
    lbl12: TcxDBLabel;
    lblcliente: TcxDBLabel;
    lblcnpj1: TcxDBLabel;
    lblendereco: TcxDBLabel;
    FieldConsultacodigo: TIntegerField;
    FieldConsultaempresa: TIntegerField;
    FieldConsultapedido: TIntegerField;
    FieldConsultaid_cliente: TIntegerField;
    FieldConsultacliente: TStringField;
    FieldConsultacnpj: TStringField;
    qConsultaendereco: TMemoField;
    qConsultadata_registro: TDateTimeField;
    FieldConsultaprevisao_entrega: TDateField;
    qConsultadata_venda: TDateTimeField;
    FieldConsultadata_entrega: TDateField;
    FieldConsultastatus: TStringField;
    qConsultaobservacao: TMemoField;
    FieldConsultaorigem: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actVendasNovaExecute(Sender: TObject);
    procedure actVendasCancelarExecute(Sender: TObject);
    procedure qConsultaAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Venda: TConsulta;
    SystemOut: Boolean;
    Settings :TFormMode;
    procedure ActNew(InstanceClass: TComponentClass; var Reference);
  end;

var
  Caixa: TCaixa;

implementation

{$R *.dfm}
Uses unConnection, unNewVendasCaixa, unNew;
{ TForm1 }

procedure TCaixa.ActNew(InstanceClass: TComponentClass; var Reference);
begin
  try
    begin
      Connection.qPermissoesUser.Close;
      Connection.qPermissoesUser.ParamByName('usuario').AsInteger := Parametros.FieldParametrosusuario.AsInteger;
      Connection.qPermissoesUser.ParamByName('tag').AsInteger := Self.Tag;
      Connection.qPermissoesUser.Open;
      if Connection.qPermissoesUser.RecordCount = 1 then
      begin
        if Connection.qPermissoesUser.FieldByName('alteracao').AsBoolean = True then
        begin
          try
            Application.CreateForm(InstanceClass, Reference);
            TfrmNew(Reference).Settings.Modo := 'NEW';
            TfrmNew(Reference).ShowModal;
          finally
            TfrmNew(Reference).Release;
            ds.DataSet.Refresh;
          end;
        end
        else
        begin
          Aviso('STOP', 'Informa��o', 'Voc� n�o possui autoriza��o para realizar esta opera��o.');
          Exit;
        end;
      end
      else
      begin
        Connection.qPermissoesGrupo.Close;
        Connection.qPermissoesGrupo.ParamByName('grupo').AsInteger := Parametros.FieldParametrosgrupo.AsInteger;
        Connection.qPermissoesGrupo.ParamByName('tag').AsInteger := Self.Tag;
        Connection.qPermissoesGrupo.Open;
        if Connection.qPermissoesGrupo.RecordCount = 1 then
        begin
          if Connection.qPermissoesGrupo.FieldByName('alteracao').AsBoolean = True then
          begin
            try
              Application.CreateForm(InstanceClass, Reference);
              TfrmNew(Reference).Settings.Modo := 'NEW';
              TfrmNew(Reference).ShowModal;
            finally
              TfrmNew(Reference).Release;
              //ds.DataSet.Refresh;
            end;
          end
          else
          begin
            Aviso('STOP', 'Informa��o', 'Voc� n�o possui autoriza��o para realizar esta opera��o.');
            Exit;
          end;
        end
        else
        begin
          Aviso('ALER', 'Informa��o', 'Voc� n�o possui autoriza��o para realizar esta opera��o.');
          Exit;
        end;
      end;
    end;
  except
    Aviso('ERRO', 'Erro critico de execu��o.', 'Houve um erro ao abrir o formulario.' + #13 + 'Contate o suporte.');
  end;
end;

procedure TCaixa.actSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TCaixa.actVendasCancelarExecute(Sender: TObject);
begin
  if ds.DataSet.Active then
    begin
      if Pergunta('WHAT','Confirma��o','Tem certeza que deseja cancelar a venda em andamento?','SN') = ID_YES then
        begin
          if Venda.eValido then
            begin
              ds.DataSet.Close;
              qSQL.Close;
              qSQL.SQL.Clear;
              qSQL.SQL.Text := 'DELETE FROM vendas WHERE codigo = ' + IntToStr(Venda.eChave);
              try
                try
                  qSQL.Execute;
                finally
                  Aviso('INFO','Informa��o','Venda cancelada com sucesso.');
                  Venda.eValido := False;
                end;
              except
                Aviso('ERRO','Erro','N�o foi possivel cancelar a venda atual, favor entrar em contato com o suporte.');
              end;
              // Cancela a venda em andamento.
              PageControl.ActivePage := TabLogo;
              actVendasNova.Enabled := True;
              actVendasCancelar.Enabled := False;
              lblStatus.Caption := 'CAIXA LIVRE';
              lblStatus.Font.Color := clGreen;
            end;
        end;
    end;
end;

procedure TCaixa.actVendasNovaExecute(Sender: TObject);
begin
  // Abre a venda.
  if ds.DataSet.Active then
    begin
      Aviso('STOP','Informa��o','Finalize a venda em andamento para realizar uma nova.');
    end
  else
    begin
      actNew(TfrmNewVendasCaixa, frmNewVendasCaixa);
      PageControl.ActivePage := TabCaixa;
      actVendasNova.Enabled := False;
      actVendasCancelar.Enabled := True;
      if Venda.eValido then
        begin
          qConsulta.Close;
          qConsulta.ParamByName('codigo').AsInteger := Venda.eChave;
          qConsulta.Open;
          if qConsulta.RecordCount = 0 then
            ShowMessage('ERRO');
          lblStatus.Caption := 'VENDA EM ANDAMENTO';
          lblStatus.Font.Color := clMaroon;
        end
      else
        PageControl.ActivePage := TabLogo;
    end;
end;

procedure TCaixa.FormCreate(Sender: TObject);
begin
  DisableAero := True;
  if FileExists(ExtractFilePath(Application.ExeName)+'\config\trdCompDev.trl') then
    begin
      Localizer.LoadFromFile(ExtractFilePath(Application.ExeName)+'\config\trdCompDev.trl');
      Localizer.LanguageIndex := 1;
      Localizer.Active := true;
    end
  else
    begin
      Aviso('WARN','Arquivo pendente.','N�o foi possivel encontrar um dos arquivos do sistema.'#13'ID: [FPTRL]'#13'Entre em contato com o suporte.');
    end;
  //PageControl.HideTabs := True;
end;

procedure TCaixa.FormShow(Sender: TObject);
begin
  if Parametros.SystemConfig.ASSystemAuth = False then
    Application.Terminate
  else
    begin
      PageControl.HideTabs := True;
      MnVendasCancelar.Enabled := False;
      imgLogo.Align := alClient;
      imgLogo.Picture.LoadFromFile(Parametros.SystemConfig.ASSystemPath + '\sources\content\images\clientsplah.png');
      SystemOut := False;
      // Define as configura��es na barra de status;
      StatusBar.Panels.Items[1].Text:= Parametros.SystemConfig.ASDBServer + ':' + Parametros.SystemConfig.ASDBPort;
      StatusBar.Panels.Items[3].Text:= AnsiUpperCase(Parametros.SystemConfig.ASDBDataBase);
      StatusBar.Panels.Items[5].Text:= ResolveHost;
      StatusBar.Panels.Items[7].Text:= AnsiUpperCase(Connection.qLogin.FieldByName('login').AsString);
      StatusBar.Panels.Items[11].Text:= 'BUILD: ' + Versao;
      if Connection.qHostConfigsefaz_ambiente.AsInteger = 1 then
        StatusBar.Panels.Items[9].Text:= 'PRODUCAO'
      else
        StatusBar.Panels.Items[9].Text:= 'HOMOLOGACAO';
      // Informa na configura��o do form principal qual o ID do usuario logado.
      Settings.Modo := 'MAIN';
      Settings.ID := Connection.qLogin.FieldByName('codigo').AsInteger;
      // Verifica se existe interrup��o registrada.
      {IDBreak := Connection.SystemBreak;
      if IDBreak <> 0 then
        begin
          CriaFormulario(TfrmSystemBreak,IDBreak,'',frmSystemBreak);
        end;}
    end;
  // Verifica se h� venda pendente
  qSQL.Close;
  qSQL.SQL.Clear;
  qSQL.SQL.Text := 'SELECT codigo FROM vendas WHERE status = ' + QuotedStr('P') + ' AND origem = '+ QuotedStr('CX') + ';';
  qSQL.Open;
  if qSQl.RecordCount = 1 then
    begin
      qConsulta.Close;
      qConsulta.ParamByName('codigo').AsInteger := qSQL.FieldByName('codigo').AsInteger;
      qConsulta.Open;
      if qConsulta.RecordCount = 0 then
        ShowMessage('ERRO');
      lblStatus.Caption := 'VENDA EM ANDAMENTO';
      lblStatus.Font.Color := clMaroon;
      PageControl.ActivePage := TabCaixa;
      actVendasNova.Enabled := False;
      actVendasCancelar.Enabled := True;
      MnVendasCancelar.Enabled := True;
    end;
  qSQL.Close;
end;

procedure TCaixa.qConsultaAfterOpen(DataSet: TDataSet);
begin
  if Length(FieldConsultacnpj.AsString) = 14 then
    begin
      FieldConsultacnpj.EditMask := '00\.000\.000\/0000\-00;0;_';
    end
  else
    begin
      FieldConsultacnpj.EditMask := '000\.000\.000\-00;0;_';
    end;
end;

end.
