unit unEGrid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, unSystem, unMaster, unParametros, unNetwork, pcnConversao,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ImgList,
  cxGraphics, Data.DB, DBAccess, Uni, MemDS, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, unCad, dxRibbonSkins,
  dxSkinsdxRibbonPainter, dxRibbonCustomizationForm, dxSkinsdxBarPainter, dxBar,
  dxRibbon, unSEFAZ, ShellAPI, cxGridExportLink;

type
  TfrmEGrid = class(TFMaster)
    pnlBotton: TPanel;
    Label26: TLabel;
    Label27: TLabel;
    Image2: TImage;
    btnNovo: TButton;
    btnVisualizar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    ImageList16: TcxImageList;
    grpLista: TGroupBox;
    pnlFuncoes: TPanel;
    btnFiltro: TButton;
    btnColunas: TButton;
    btnReload: TButton;
    qConsulta: TUniQuery;
    ds: TUniDataSource;
    Grid: TcxGrid;
    View: TcxGridDBTableView;
    Master: TcxGridLevel;
    qInfo: TUniQuery;
    RibbonTab1: TdxRibbonTab;
    Ribbon: TdxRibbon;
    BarManager: TdxBarManager;
    BarSystem: TdxBar;
    BarGerenciamento: TdxBar;
    LButtonNovo23: TdxBarLargeButton;
    MnVisualizar: TdxBarLargeButton;
    MnAlterar: TdxBarLargeButton;
    MnEmitir: TdxBarLargeButton;
    MnInutilizar: TdxBarLargeButton;
    MnCancelar: TdxBarLargeButton;
    MnStatus: TdxBarLargeButton;
    MnImprimir: TdxBarLargeButton;
    MnAjuda: TdxBarLargeButton;
    MnFechar: TdxBarLargeButton;
    ImageList32: TcxImageList;
    RibbonTab2: TdxRibbonTab;
    barServidor: TdxBar;
    barFerramentas: TdxBar;
    MnServerStatus: TdxBarLargeButton;
    MnBaixarXML: TdxBarLargeButton;
    MnChave: TdxBarLargeButton;
    MiNovo: TdxBarSubItem;
    LButtonNFeCFe: TdxBarLargeButton;
    StyleRepository: TcxStyleRepository;
    StyleHeader: TcxStyle;
    StyleCancelado: TcxStyle;
    StyleAprovada: TcxStyle;
    StyleInutilizada: TcxStyle;
    StyleSelecionado: TcxStyle;
    StyleNeutro: TcxStyle;
    StyleIncompleto: TcxStyle;
    grpLog: TGroupBox;
    mmoLog: TMemo;
    qXML: TUniQuery;
    qSQL: TUniQuery;
    BarOutros: TdxBar;
    MiInteracoes: TdxBarSubItem;
    BsArquivos: TdxBarSeparator;
    MnExportarExcel: TdxBarLargeButton;
    MnExportarXML: TdxBarLargeButton;
    dlgSave: TSaveDialog;
    MnCarregarXML: TdxBarLargeButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnReloadClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure qConsultaBeforeDelete(DataSet: TDataSet);
    //--------------------------
    procedure ActInserir(InstanceClass: TComponentClass; var Reference);
    procedure ActNew(InstanceClass: TComponentClass; var Reference);
    procedure ActVisualizar(InstanceClass: TComponentClass; var Reference);
    procedure ActEditar(InstanceClass: TComponentClass; var Reference);
    procedure ActRemover(InstanceClass: TComponentClass; var Reference);
    procedure MnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure qConsultaAfterRefresh(DataSet: TDataSet);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure MnExportarExcelClick(Sender: TObject);
  private
    { Private declarations }
    Consulta: TConsulta;
    procedure OpenQuery;
    procedure SetButtons;
  public
    { Public declarations }
    Settings: TFormMode;
    procedure ExportGrid(Sender: TObject);
  end;

var
  frmEGrid: TfrmEGrid;

implementation

{$R *.dfm}
uses unConnection, unNew;

procedure TfrmEGrid.ActEditar(InstanceClass: TComponentClass; var Reference);
begin
  // Editar Registro
  try
    begin
      try
        Application.CreateForm(InstanceClass, Reference);
        TfrmCad(Reference).Settings.Modo := 'ALTERACAO';
        TfrmCad(Reference).Settings.ID := ds.DataSet.FieldByName('codigo').asInteger;
        TfrmCad(Reference).ShowModal;
      finally
        TfrmCad(Reference).Release;
        ds.DataSet.Refresh;
      end;
    end;
  except
    Aviso('ERRO','Erro critico de execução.','Houve um erro ao abrir o formulario.'+#13+'Contate o suporte.');
  end;
end;

procedure TfrmEGrid.ActInserir(InstanceClass: TComponentClass; var Reference);
begin
  // Novo Registro
  try
    begin
      try
        Application.CreateForm(InstanceClass, Reference);
        TfrmCad(Reference).Settings.Modo := 'NEW';
        TfrmCad(Reference).ShowModal;
      finally
        TfrmCad(Reference).Release;
        ds.DataSet.Refresh;
      end;
    end;
  except
    Aviso('ERRO','Erro critico de execução.','Houve um erro ao abrir o formulario.'+#13+'Contate o suporte.');
  end;
end;

procedure TfrmEGrid.ActNew(InstanceClass: TComponentClass; var Reference);
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
          Aviso('STOP', 'Informação', 'Você não possui autorização para realizar esta operação.');
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
              ds.DataSet.Refresh;
            end;
          end
          else
          begin
            Aviso('STOP', 'Informação', 'Você não possui autorização para realizar esta operação.');
            Exit;
          end;
        end
        else
        begin
          Aviso('ALER', 'Informação', 'Você não possui autorização para realizar esta operação.');
          Exit;
        end;
      end;
    end;
  except
    Aviso('ERRO', 'Erro critico de execução.', 'Houve um erro ao abrir o formulario.' + #13 + 'Contate o suporte.');
  end;
end;

procedure TfrmEGrid.ActRemover(InstanceClass: TComponentClass; var Reference);
begin
  // Remover Registro
end;

procedure TfrmEGrid.ActVisualizar(InstanceClass: TComponentClass; var Reference);
begin
  // Alterar Registro
  try
    begin
      try
        Application.CreateForm(InstanceClass, Reference);
        TfrmCad(Reference).Settings.Modo := 'CONSULTA';
        TfrmCad(Reference).Settings.ID := ds.DataSet.FieldByName('codigo').asInteger;
        TfrmCad(Reference).ShowModal;
      finally
        TfrmCad(Reference).Release;
        ds.DataSet.Refresh;
      end;
    end;
  except
    Aviso('ERRO','Erro critico de execução.','Houve um erro ao abrir o formulario.'+#13+'Contate o suporte.');
  end;
end;

procedure TfrmEGrid.MnExportarExcelClick(Sender: TObject);
begin
  inherited;
  ExportGrid(Self);
end;

procedure TfrmEGrid.MnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmEGrid.OpenQuery;
var i:Integer;
begin
  for I := 0 to ComponentCount -1 do
    begin
      if Components[i] is TUniQuery then
        begin
          if TUniQuery(Components[i]).Tag = 7000 then
            begin
              TUniQuery(Components[i]).Open;
            end;
        end;
    end;
  i:= 0;
  for I := 0 to ComponentCount -1 do
    begin
      if Components[i] is TUniQuery then
        begin
          if TUniQuery(Components[i]).Tag = 7100 then
            begin
              TUniQuery(Components[i]).Open;
            end;
        end;
    end;
end;

procedure TfrmEGrid.btnExcluirClick(Sender: TObject);
begin
  inherited;
  try
    ds.DataSet.Delete;
  except
    Aviso('ERRO','ERRO','Operação abortada.');
  end;
end;

procedure TfrmEGrid.btnReloadClick(Sender: TObject);
begin
  inherited;
  ds.DataSet.Refresh;
end;

procedure TfrmEGrid.dsDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  SetButtons;
end;

procedure TfrmEGrid.ExportGrid(Sender: TObject);
var
  FileExt: String;
begin
  dlgSave.Filter := 'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  dlgSave.Title := Caption;
  dlgSave.DefaultExt:= 'xls';
  if dlgSave.Execute then
  begin
    FileExt := LowerCase(ExtractFileExt(dlgSave.FileName));
    if FileExt = '.xls' then
          ExportGridToExcel(dlgSave.FileName,Grid, False)
    else if FileExt = '.xml' then
          ExportGridToXML(dlgSave.FileName,Grid, False)
    else if FileExt = '.txt' then
          ExportGridToText(dlgSave.FileName,Grid, False)
    else if FileExt = '.html' then
          ExportGridToHTML(dlgSave.FileName,Grid, False);
    ShellExecute(Handle, 'open', pchar(dlgSave.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure TfrmEGrid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  {if Settings.Modo = 'CONSULTA' then
    begin
      Connection.Find:= Consulta;
    end;}
end;

procedure TfrmEGrid.FormCreate(Sender: TObject);
begin
  inherited;
  //SQL.GetSQL(qConsulta.SQL.Text);
end;

procedure TfrmEGrid.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F6 then
    begin
      if grpLog.Visible = True then
        begin
          grpLog.Visible := False;
          ClientHeight := ClientHeight - 100;
        end
      else
        begin
          grpLog.Visible := True;
          ClientHeight := ClientHeight + 100;
        end;
    end;
end;

procedure TfrmEGrid.FormShow(Sender: TObject);
begin
  inherited;
  try
    if grpLog.Visible = True then
      begin
        ClientHeight := ClientHeight + 100;
      end
    else
      begin
        ClientHeight := ClientHeight - 100;
      end;
    qInfo.Open;
    ds.DataSet.Open;
  except
    Aviso('ERRO','Erro ao abrir tabela','Não foi possivel abrir a tabela ' + 'TABELA' + '.'+#13+
          'Feche o sistema e tente novamente, se persistir, entre em contato com o suporte.');
    Close;
  end;
  OpenQuery;
  SetButtons;
end;

procedure TfrmEGrid.qConsultaAfterRefresh(DataSet: TDataSet);
begin
  inherited;
  if ds.DataSet.RecordCount > 0 then
    begin
      btnVisualizar.Enabled := True;
      btnEditar.Enabled := True;
      btnExcluir.Enabled := True;
    end
  else
    begin
      btnVisualizar.Enabled := False;
      btnEditar.Enabled := False;
      btnExcluir.Enabled := False;
    end
end;

procedure TfrmEGrid.qConsultaBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if Application.MessageBox('Tem certeza que deseja apagar o registro?'+#13+'Caso haja outro registros relacionados a operação sera abortada automaticamente.','Exclusão de registro.', MB_ICONWARNING + MB_YESNO) = ID_NO then
    begin
      Abort;
    end;
end;

procedure TfrmEGrid.SetButtons;
begin
  if ds.DataSet.RecordCount = 0 then
    begin
      MiNovo.Enabled := True;
      MnVisualizar.Enabled := False;
      MnAlterar.Enabled := False;
      MnEmitir.Enabled := False;
      MnInutilizar.Enabled := False;
      MnCancelar.Enabled := False;
      MnStatus.Enabled := False;
      MnImprimir.Enabled := False;
    end
  else
    begin
      if ds.DataSet.FieldByName('status').AsString = 'P' then
        begin
          MiNovo.Enabled := True;
          MnVisualizar.Enabled := True;
          MnAlterar.Enabled := True;
          MnEmitir.Enabled := True;
          MnInutilizar.Enabled := True;
          MnCancelar.Enabled := False;
          MnStatus.Enabled := False;
          MnImprimir.Enabled := False;
        end
      else if ds.DataSet.FieldByName('status').AsString = 'E' then
        begin
          MiNovo.Enabled := True;
          MnVisualizar.Enabled := True;
          MnAlterar.Enabled := False;
          MnEmitir.Enabled := False;
          MnInutilizar.Enabled := False;
          MnCancelar.Enabled := True;
          MnStatus.Enabled := True;
          MnImprimir.Enabled := True;
        end
      else if (ds.DataSet.FieldByName('status').AsString = 'C') or (ds.DataSet.FieldByName('status').AsString = 'I') then
        begin
          MiNovo.Enabled := True;
          MnVisualizar.Enabled := True;
          MnAlterar.Enabled := False;
          MnEmitir.Enabled := False;
          MnInutilizar.Enabled := False;
          MnCancelar.Enabled := False;
          MnStatus.Enabled := True;
          MnImprimir.Enabled := True;
        end
      else
        begin
          MiNovo.Enabled := True;
          MnVisualizar.Enabled := True;
          MnAlterar.Enabled := True;
          MnEmitir.Enabled := True;
          MnInutilizar.Enabled := True;
          MnCancelar.Enabled := True;
          MnStatus.Enabled := True;
          MnImprimir.Enabled := True;
        end;
    end;
end;

end.
