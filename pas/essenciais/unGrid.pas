unit unGrid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, unSystem, unMaster, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ImgList, cxGraphics, Data.DB, DBAccess, Uni, MemDS, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, unCad, Midaslib, Vcl.Menus,
  Datasnap.DBClient, unSQL, System.StrUtils, unNew, unReport, ShellAPI, cxGridExportLink,
  dxRibbonSkins, dxSkinsdxRibbonPainter, dxRibbonCustomizationForm,
  dxSkinsdxBarPainter, dxBar, Vcl.PlatformDefaultStyleActnCtrls, System.Actions,
  Vcl.ActnList, Vcl.ActnMan, dxRibbon, Vcl.ComCtrls;

type
  TfrmGrid = class(TFMaster)
    pnlBotton: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
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
    StyleRepository: TcxStyleRepository;
    StyleHeader: TcxStyle;
    pnlFiltros: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    GridFiltros: TcxGrid;
    ViewFiltros: TcxGridDBTableView;
    MasterFiltros: TcxGridLevel;
    dsQuery: TUniDataSource;
    StyleItemInativo: TcxStyle;
    StyleItemAtivo: TcxStyle;
    pmFiltros: TPopupMenu;
    AdicionarFiltro1: TMenuItem;
    N1: TMenuItem;
    RemoverFiltro1: TMenuItem;
    ColumnCampo: TcxGridDBColumn;
    cdsQuery: TClientDataSet;
    FieldQuerycodigo: TIntegerField;
    FieldQuerycampo: TStringField;
    FieldQueryfiltro: TStringField;
    FieldQueryvalor: TStringField;
    FieldQuerydescricao: TStringField;
    FieldQuerytipo: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    qSQL: TUniQuery;
    pmFuncoes: TPopupMenu;
    Save: TSaveDialog;
    Label3: TLabel;
    Label4: TLabel;
    Ribbon: TdxRibbon;
    BarManager: TdxBarManager;
    MTabRegistros: TdxRibbonTab;
    BarOpcoes: TdxBar;
    BarOutros: TdxBar;
    BarSistem: TdxBar;
    MnNovo: TdxBarLargeButton;
    MnVisualizar: TdxBarLargeButton;
    MnEditar: TdxBarLargeButton;
    MnExcluir: TdxBarLargeButton;
    MnAjuda: TdxBarLargeButton;
    Mnsair: TdxBarLargeButton;
    MiInteracoes: TdxBarSubItem;
    MnExportar: TdxBarLargeButton;
    BarSeparatorGerencial: TdxBarSeparator;
    stb: TStatusBar;
    qQuery: TUniQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnReloadClick(Sender: TObject);
    procedure qConsultaBeforeDelete(DataSet: TDataSet);
    //---------------------------
    procedure CfgEditar(InstanceClass: TComponentClass; var Reference);
    procedure CfgVisualizar(InstanceClass: TComponentClass; var Reference);
    procedure ActNew(InstanceClass: TComponentClass; var Reference);
    procedure ActInserir(InstanceClass: TComponentClass; var Reference);
    procedure ActInject(InstanceClass: TComponentClass; var Reference);
    procedure ActVisualizar(InstanceClass: TComponentClass; var Reference);
    procedure ActView(InstanceClass: TComponentClass; var Reference);
    procedure ActEditar(InstanceClass: TComponentClass; var Reference);
    procedure ActRemover(InstanceClass: TComponentClass; var Reference);
    //---------------------------
    procedure Find(id:Integer; descricao:string);
    //---------------------------
    procedure btnFiltroClick(Sender: TObject);
    procedure RemoverFiltro1Click(Sender: TObject);
    procedure AdicionarFiltro1Click(Sender: TObject);
    procedure cdsQueryAfterPost(DataSet: TDataSet);
    procedure qConsultaAfterRefresh(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actSairExecute(Sender: TObject);
    procedure actExportarExecute(Sender: TObject);
    procedure MnAjudaClick(Sender: TObject);
  private
    { Private declarations }
    SQL: TSQL;
    GridConsulta: TConsulta;
    function GetFiltros: string;
    procedure SetConsulta(const Value: TConsulta);
    function GetConsulta: TConsulta;
  public
    { Public declarations }
    TabelaREF: String;
    procedure SQLPrepare(SQL: string);
    procedure OcultaColunas;
    procedure CarregaFiltros;
    property Consulta: TConsulta read GetConsulta write SetConsulta;
    procedure ExportGrid(Sender: TObject);
  end;

var
  frmGrid: TfrmGrid;
  QueryFilter: Boolean;

implementation

uses
  unConnection, unParametros, unQuery, unSystemHelp, unView;

{$R *.dfm}

procedure TfrmGrid.ActEditar(InstanceClass: TComponentClass; var Reference);
begin
  // Editar Registro
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
            TfrmCad(Reference).Settings.Modo := 'ALTERACAO';
            TfrmCad(Reference).Settings.ID := ds.DataSet.FieldByName('codigo').asInteger;
            TfrmCad(Reference).ShowModal;
          finally
            TfrmCad(Reference).Release;
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
              TfrmCad(Reference).Settings.Modo := 'ALTERACAO';
              TfrmCad(Reference).Settings.ID := ds.DataSet.FieldByName('codigo').asInteger;
              TfrmCad(Reference).ShowModal;
            finally
              TfrmCad(Reference).Release;
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

procedure TfrmGrid.actExportarExecute(Sender: TObject);
begin
  ExportGrid(frmGrid);
end;

procedure TfrmGrid.ActInject(InstanceClass: TComponentClass; var Reference);
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
            TfrmCad(Reference).Settings.Modo := 'NEW';
            TfrmCad(Reference).Settings.ID := ds.DataSet.FieldByName('codigo').asInteger;
            TfrmCad(Reference).ShowModal;
          finally
            TfrmCad(Reference).Release;
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
              TfrmCad(Reference).Settings.Modo := 'NEW';
              TfrmCad(Reference).Settings.ID := ds.DataSet.FieldByName('codigo').asInteger;
              TfrmCad(Reference).ShowModal;
            finally
              TfrmCad(Reference).Release;
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

procedure TfrmGrid.ActInserir(InstanceClass: TComponentClass; var Reference);
begin
  // Novo Registro   grupo, tag
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
            TfrmCad(Reference).Settings.Modo := 'NEW';
            TfrmCad(Reference).ShowModal;
          finally
            TfrmCad(Reference).Release;
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
              TfrmCad(Reference).Settings.Modo := 'NEW';
              TfrmCad(Reference).ShowModal;
            finally
              TfrmCad(Reference).Release;
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

procedure TfrmGrid.ActNew(InstanceClass: TComponentClass; var Reference);
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

procedure TfrmGrid.ActRemover(InstanceClass: TComponentClass; var Reference);
begin
  if Pergunta('WHAT','Remoção de registro','Tem certeza que deseja remover o registro selecionado?','SN') = ID_YES then
    begin
      try
        begin
          Connection.qPermissoesUser.Close;
          Connection.qPermissoesUser.ParamByName('usuario').AsInteger := Parametros.FieldParametrosusuario.AsInteger;
          Connection.qPermissoesUser.ParamByName('tag').AsInteger := Self.Tag;
          Connection.qPermissoesUser.Open;
          if Connection.qPermissoesUser.RecordCount = 1 then
            begin
              if Connection.qPermissoesUser.FieldByName('exclusao').AsBoolean = True then
                begin
                  try
                    qSQL.SQL.Clear;
                    qSQL.SQL.Text := 'DELETE FROM ' + TabelaREF + 'WHERE codigo = ' + ds.DataSet.FieldByName('codigo').AsString;
                    qSQL.Execute;
                  finally
                    qSQL.SQL.Clear;
                    ds.DataSet.Refresh;
                  end
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
                  if Connection.qPermissoesGrupo.FieldByName('exclusao').AsBoolean = True then
                    begin
                      try
                        qSQL.SQL.Clear;
                        qSQL.SQL.Text := 'DELETE FROM ' + TabelaREF + ' WHERE codigo = ' + ds.DataSet.FieldByName('codigo').AsString;
                        qSQL.Execute;
                      finally
                        qSQL.SQL.Clear;
                        ds.DataSet.Refresh;
                      end
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
end;

procedure TfrmGrid.actSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmGrid.ActView(InstanceClass: TComponentClass; var Reference);
begin
  try
    begin
      Connection.qPermissoesUser.Close;
      Connection.qPermissoesUser.ParamByName('usuario').AsInteger := Parametros.FieldParametrosusuario.AsInteger;
      Connection.qPermissoesUser.ParamByName('tag').AsInteger := Self.Tag;
      Connection.qPermissoesUser.Open;
      if Connection.qPermissoesUser.RecordCount = 1 then
      begin
        if Connection.qPermissoesUser.FieldByName('abrir').AsBoolean = True then
        begin
          try
            Application.CreateForm(InstanceClass, Reference);
            TfrmView(Reference).Settings.Modo := 'CONSULTA';
            TfrmView(Reference).Settings.ID := ds.DataSet.FieldByName('codigo').asInteger;
            TfrmView(Reference).ShowModal;
          finally
            TfrmView(Reference).Release;
            ds.DataSet.Refresh;
          end
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
          if Connection.qPermissoesGrupo.FieldByName('abrir').AsBoolean = True then
          begin
            try
              Application.CreateForm(InstanceClass, Reference);
              TfrmView(Reference).Settings.Modo := 'CONSULTA';
              TfrmView(Reference).Settings.ID := ds.DataSet.FieldByName('codigo').asInteger;
              TfrmView(Reference).ShowModal;
            finally
              TfrmView(Reference).Release;
              ds.DataSet.Refresh;
            end
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

procedure TfrmGrid.ActVisualizar(InstanceClass: TComponentClass; var Reference);
begin
  try
    begin
      Connection.qPermissoesUser.Close;
      Connection.qPermissoesUser.ParamByName('usuario').AsInteger := Parametros.FieldParametrosusuario.AsInteger;
      Connection.qPermissoesUser.ParamByName('tag').AsInteger := Self.Tag;
      Connection.qPermissoesUser.Open;
      if Connection.qPermissoesUser.RecordCount = 1 then
      begin
        if Connection.qPermissoesUser.FieldByName('abrir').AsBoolean = True then
        begin
          try
            Application.CreateForm(InstanceClass, Reference);
            TfrmCad(Reference).Settings.Modo := 'CONSULTA';
            TfrmCad(Reference).Settings.ID := ds.DataSet.FieldByName('codigo').asInteger;
            TfrmCad(Reference).ShowModal;
          finally
            TfrmCad(Reference).Release;
            ds.DataSet.Refresh;
          end
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
          if Connection.qPermissoesGrupo.FieldByName('abrir').AsBoolean = True then
          begin
            try
              Application.CreateForm(InstanceClass, Reference);
              TfrmCad(Reference).Settings.Modo := 'CONSULTA';
              TfrmCad(Reference).Settings.ID := ds.DataSet.FieldByName('codigo').asInteger;
              TfrmCad(Reference).ShowModal;
            finally
              TfrmCad(Reference).Release;
              ds.DataSet.Refresh;
            end
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

procedure TfrmGrid.AdicionarFiltro1Click(Sender: TObject);
begin
  inherited;
  // Verifica se o Formulario ja foi Instanciado
  try
    Application.CreateForm(TfrmQuery, frmQuery);
    frmQuery.dsInfo.DataSet := Self.qInfo;
    frmQuery.dsQuery.DataSet := Self.cdsQuery;
    frmQuery.ShowModal;
    CarregaFiltros;
  finally
    frmQuery.Release;
  end;
end;

procedure TfrmGrid.btnFiltroClick(Sender: TObject);
begin
  inherited;
  // Rotina de Filtros
  if QueryFilter = False then
  begin
    QueryFilter := True;
    pnlFiltros.Visible := True;
    Self.ClientWidth := Self.ClientWidth + 300;
    Self.Left := Self.Left - 150;
  end
  else
  begin
    QueryFilter := False;
    pnlFiltros.Visible := False;
    Self.ClientWidth := Self.ClientWidth - 300;
    Self.Left := Self.Left + 150;
  end;
end;

procedure TfrmGrid.btnReloadClick(Sender: TObject);
begin
  inherited;
  ds.DataSet.Refresh;
end;

procedure TfrmGrid.CarregaFiltros;
begin
  try
    if cdsQuery.RecordCount > 0 then
    begin
      SQL.SetFilter(GetFiltros);
      qConsulta.Close;
      qConsulta.SQL.Text := SQL.GeraSQL;
      qConsulta.Open;
    end
    else
    begin
      qConsulta.Close;
      qConsulta.SQL.Text := SQL.SQLOriginal;
      qConsulta.Open;
      qInfo.Close;
      qInfo.ParamByName('colunas').AsString := '';
      qInfo.Open;
    end;
  except
    Aviso('STOP', 'Erro ao Filtrar', 'GF0001: Não foi possivel obter os dados do filtro informado.' + #13 + 'O sistema esta exibindo a consulta padrão.' + #13 + 'Entre em contato com o suporte.');
    qConsulta.SQL.Clear;
    qConsulta.SQL.Text := SQL.SQLOriginal;
    qConsulta.Open;
  end;
end;

procedure TfrmGrid.cdsQueryAfterPost(DataSet: TDataSet);
begin
  inherited;
  OcultaColunas
end;

procedure TfrmGrid.CfgEditar(InstanceClass: TComponentClass; var Reference);
var
  FmSettings: TFormMode;
begin
  // Editar Registro
  try
    begin
      try
        Application.CreateForm(InstanceClass, Reference);
        FmSettings.Modo := 'ALTERACAO';
        FmSettings.ID := ds.DataSet.FieldByName('codigo').asInteger;
        TFMaster(Reference).Settings := FmSettings;
        TFMaster(Reference).ShowModal;
      finally
        TFMaster(Reference).Release;
        ds.DataSet.Refresh;
      end;
    end;
  except
    Aviso('ERRO', 'Erro critico de execução.', 'Houve um erro ao abrir o formulario.' + #13 + 'Contate o suporte.');
  end;
end;

procedure TfrmGrid.CfgVisualizar(InstanceClass: TComponentClass; var Reference);
var
  FmSettings: TFormMode;
begin
  // Alterar Registro
  try
    begin
      try
        Application.CreateForm(InstanceClass, Reference);
        FmSettings.Modo := 'CONSULTA';
        FmSettings.ID := ds.DataSet.FieldByName('codigo').asInteger;
        TFMaster(Reference).Settings := FmSettings;
        TFMaster(Reference).ShowModal;
      finally
        TFMaster(Reference).Release;
        ds.DataSet.Refresh;
      end
    end;
  except
    Aviso('ERRO', 'Erro critico de execução.', 'Houve um erro ao abrir o formulario.' + #13 + 'Contate o suporte.');
  end;
end;

procedure TfrmGrid.ExportGrid(Sender: TObject);
var
  FileExt: String;
begin
  Save.Filter := 'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  Save.Title := Caption;
  Save.DefaultExt:= 'xls';
  if Save.Execute then
  begin
    FileExt := LowerCase(ExtractFileExt(Save.FileName));
    if FileExt = '.xls' then
          ExportGridToExcel(Save.FileName,Grid, False)
    else if FileExt = '.xml' then
          ExportGridToXML(Save.FileName,Grid, False)
    else if FileExt = '.txt' then
          ExportGridToText(Save.FileName,Grid, False)
    else if FileExt = '.html' then
          ExportGridToHTML(Save.FileName,Grid, False);
    ShellExecute(Handle, 'open', pchar(Save.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure TfrmGrid.Find(id: Integer; descricao: string);
var NewConsulta :TConsulta;
begin
  if Settings.Modo = 'CONSULTA' then
    begin
      NewConsulta.eConsulta := True;
      NewConsulta.eChave := id;
      NewConsulta.eDescricao := descricao;
      NewConsulta.eValido := True;
      Consulta := NewConsulta;
      Close;
    end;
  if Settings.Modo = 'LISTA' then
    begin
      btnVisualizar.Click;
    end;
end;

procedure TfrmGrid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  cdsQuery.EmptyDataSet;
  cdsQuery.Close;
  if Settings.Modo = 'CONSULTA' then
  begin
    Parametros.Find := Consulta;
  end;
end;

procedure TfrmGrid.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.GetSQL(qConsulta.SQL.Text);
end;

procedure TfrmGrid.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F1:begin
      // Help
    end;
    VK_F2:begin
      // Inserir
      if btnNovo.Enabled = True then
        btnNovo.Click;
    end;
    VK_F3:begin
      // Visualizar
      if btnVisualizar.Enabled = True then
        btnNovo.Click;
    end;
    VK_F4:begin
      // Editar
      if btnEditar.Enabled = True then
        btnNovo.Click;
    end;
    VK_F5:begin
      // Atualizar
      ds.DataSet.Refresh;
    end;
    VK_F8:begin
      ExportGrid(frmGrid);
    end;
  end;
end;

procedure TfrmGrid.FormShow(Sender: TObject);
begin
  inherited;
  // Filtros
  try
    QueryFilter := False;
    Self.ClientWidth := Self.ClientWidth - 300;
    //
    //cdsQuery.CreateDataSet;
    if cdsQuery.Active = True then
      begin
        cdsQuery.EmptyDataSet;
        cdsQuery.Close;
      end
    else
      begin
        cdsQuery.CreateDataSet;
      end;
    //
    qInfo.Open;
    ds.DataSet.Open;
  except
    Aviso('ERRO', 'Erro ao abrir tabela', 'Não foi possivel abrir a tabela ' + 'TABELA' + '.' + #13 + 'Feche o sistema e tente novamente, se persistir, entre em contato com o suporte.');
    Close;
  end;
  // Acerta botoes
  // >> Registros
  if ds.DataSet.RecordCount > 0 then
    begin
      MnVisualizar.Enabled := True;
      MnEditar.Enabled := True;
      MnExcluir.Enabled := True;
      btnVisualizar.Enabled := True;
      btnEditar.Enabled := True;
      btnExcluir.Enabled := True;
    end
  else
    begin
      MnVisualizar.Enabled := False;
      MnEditar.Enabled := False;
      MnExcluir.Enabled := False;
      btnVisualizar.Enabled := False;
      btnEditar.Enabled := False;
      btnExcluir.Enabled := False;
    end;
  // >> Funcoes
  if qInfo.RecordCount = 0 then
    begin
      btnFiltro.Enabled := False;
    end
  else
    begin
      btnFiltro.Enabled := True;
    end;
  // Localiza registros
  if (Settings.Modo = 'LISTA') and (Settings.ID <> 0) then
    begin
      try
        ds.DataSet.Locate('codigo',Settings.ID,[]);
      except
        // Notifica que o registro não foi encontrado.
        Aviso('INFO','Informação','O registro solicitado não foi encontrado.');
      end;
    end;
end;

function TfrmGrid.GetFiltros: string;
var
  PFiltro, Condicao: string;
begin
  cdsQuery.First;
  while cdsQuery.Eof = false do
  begin
    if FieldQuerytipo.AsString = 'string' then
    begin
      case AnsiIndexStr(UpperCase(FieldQueryfiltro.AsString), ['IGUAL', 'INICIA', 'CONTEM', 'TERMINE', 'NULO']) of
        0:
          begin
            if PFiltro = '' then
              PFiltro := FieldQuerycampo.AsString + ' = ' + QuotedStr(FieldQueryvalor.AsString)
            else
              PFiltro := PFiltro + ' AND ' + FieldQuerycampo.AsString + ' = ' + QuotedStr(FieldQueryvalor.AsString);
          end;
        1:
          begin
            if PFiltro = '' then
              PFiltro := FieldQuerycampo.AsString + ' ILIKE ' + QuotedStr(FieldQueryvalor.AsString)
            else
              PFiltro := PFiltro + ' AND ' + FieldQuerycampo.AsString + ' ILIKE ' + QuotedStr(FieldQueryvalor.AsString);
          end;
        2:
          begin
            if PFiltro = '' then
              PFiltro := FieldQuerycampo.AsString + ' ILIKE ' + QuotedStr(FieldQueryvalor.AsString)
            else
              PFiltro := PFiltro + ' AND ' + FieldQuerycampo.AsString + ' ILIKE ' + QuotedStr(FieldQueryvalor.AsString);
          end;
        3:
          begin
            if PFiltro = '' then
              PFiltro := FieldQuerycampo.AsString + ' ILIKE ' + QuotedStr(FieldQueryvalor.AsString)
            else
              PFiltro := PFiltro + ' AND ' + FieldQuerycampo.AsString + ' ILIKE ' + QuotedStr(FieldQueryvalor.AsString);
          end;
        4:
          begin
            if FieldQueryvalor.AsString = 'NULO' then
              Condicao := ' IS NULL '
            else
              Condicao := ' IS NOT NULL ';
            if PFiltro = '' then
              PFiltro := FieldQuerycampo.AsString + Condicao
            else
              PFiltro := PFiltro + ' AND ' + FieldQuerycampo.AsString + Condicao;
          end;
      end;
    end;
    if FieldQuerytipo.AsString = 'integer' then
    begin
          // Falta IMPLEMENTAR
    end;
      //if FieldQuerytipo.AsString = 'float' then
      //if FieldQuerytipo.AsString = 'date' then
      //if FieldQuerytipo.AsString = 'time' then
    if FieldQuerytipo.AsString = 'boolean' then
    begin
      case AnsiIndexStr(UpperCase(FieldQueryfiltro.AsString), ['BOLEANO', 'NULO']) of
        0:
          begin
            if FieldQueryvalor.AsString = 'SIM' then
              Condicao := ' = TRUE'
            else
              Condicao := ' = FALSE ';
            if PFiltro = '' then
              PFiltro := FieldQuerycampo.AsString + Condicao
            else
              PFiltro := PFiltro + ' AND ' + FieldQuerycampo.AsString + Condicao;
          end;
        1:
          begin
            if FieldQueryvalor.AsString = 'NULO' then
              Condicao := ' IS NULL '
            else
              Condicao := ' IS NOT NULL ';
            if PFiltro = '' then
              PFiltro := FieldQuerycampo.AsString + Condicao
            else
              PFiltro := PFiltro + ' AND ' + FieldQuerycampo.AsString + Condicao;
          end;
      end;
    end;
    cdsQuery.Next;
  end;
  //
  Result := PFiltro;
end;

procedure TfrmGrid.MnAjudaClick(Sender: TObject);
begin
  inherited;
  // Abre a ajuda
  CriaFormulario(TfrmSystemHelp, Self.Tag,'FAIL',frmSystemHelp);
end;

procedure TfrmGrid.OcultaColunas;
var
  colunas: string;
begin
  qInfo.Close;
  cdsQuery.First;
  while cdsQuery.Eof = false do
  begin
    if colunas = '' then
      colunas := FieldQuerycampo.AsString
    else
      colunas := colunas + ',' + FieldQuerycampo.AsString;
    cdsQuery.Next;
  end;
  qInfo.ParamByName('colunas').AsString := colunas;
  qInfo.Open;
end;

function TfrmGrid.GetConsulta: TConsulta;
begin
  Result := GridConsulta;
end;

procedure TfrmGrid.qConsultaAfterRefresh(DataSet: TDataSet);
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

procedure TfrmGrid.qConsultaBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if Application.MessageBox('Tem certeza que deseja apagar o registro?' + #13 + 'Caso haja outro registros relacionados a operação sera abortada automaticamente.', 'Exclusão de registro.', MB_ICONWARNING + MB_YESNO) = ID_NO then
  begin
    Abort;
  end;
end;

procedure TfrmGrid.RemoverFiltro1Click(Sender: TObject);
begin
  inherited;
  if Pergunta('INFO', 'Remover Filtro', 'Tem certeza que deseja remover o filtro selecionado?', 'SN') = ID_YES then
  begin
      // Remove o Filtro
    cdsQuery.Delete;
      // Recarrega a query
    CarregaFiltros;
  end;
end;

procedure TfrmGrid.SetConsulta(const Value: TConsulta);
begin
  GridConsulta := Value;
end;

procedure TfrmGrid.SQLPrepare(SQL: string);
begin
  qSQL.Close;
  qSQL.SQL.Clear;
  qSQL.SQL.Text := SQL;
end;

end.


