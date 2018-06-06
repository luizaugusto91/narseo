unit unConfigGrupoUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unMaster, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
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
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  DBAccess, Uni, MemDS, Vcl.ImgList, Vcl.StdCtrls, Vcl.ExtCtrls, cxContainer,
  cxDBEdit, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel, unSystem, Vcl.Menus,
  cxCheckBox;

type
  TfrmConfigGrupoUsuario = class(TFMaster)
    pnlGrupo: TPanel;
    pnlBotton: TPanel;
    Label26: TLabel;
    Label27: TLabel;
    Image2: TImage;
    btnFechar: TButton;
    ImageList16: TcxImageList;
    qModulos: TUniQuery;
    dsModulos: TUniDataSource;
    pnlCorpo: TPanel;
    pnlModulos: TPanel;
    pnlGrid: TPanel;
    GridPermissao: TcxGrid;
    ViewPermissao: TcxGridDBTableView;
    MasterPermissao: TcxGridLevel;
    pnlCondicao: TPanel;
    GridLiberacoes: TcxGrid;
    ViewLiberacoes: TcxGridDBTableView;
    MasterLiberacoes: TcxGridLevel;
    lblGrupo: TcxLabel;
    edtGrupo: TcxDBSpinEdit;
    edtGrupoNome: TcxDBTextEdit;
    grpModulos: TGroupBox;
    qConsulta: TUniQuery;
    ds: TUniDataSource;
    GridModulos: TcxGrid;
    ViewModulos: TcxGridDBTableView;
    ColumnModulo: TcxGridDBColumn;
    MasterModulos: TcxGridLevel;
    StyleRepository: TcxStyleRepository;
    StyleBGModulos: TcxStyle;
    StyleModulo: TcxStyle;
    StyleMInativo: TcxStyle;
    StyleMSelect: TcxStyle;
    qFomularios: TUniQuery;
    dsFormularios: TUniDataSource;
    qPermissao: TUniQuery;
    dsPermissao: TUniDataSource;
    ColumnFTag: TcxGridDBColumn;
    ColumnFNome: TcxGridDBColumn;
    ColumnFAtivo: TcxGridDBColumn;
    StyleHEADER: TcxStyle;
    ColumnPTag: TcxGridDBColumn;
    ColumnPFormulario: TcxGridDBColumn;
    ColumnPAbrir: TcxGridDBColumn;
    ColumnPAlterar: TcxGridDBColumn;
    ColumnExcluir: TcxGridDBColumn;
    ColumnPExecutar: TcxGridDBColumn;
    pmAdc: TPopupMenu;
    pmAlt: TPopupMenu;
    Alterar1: TMenuItem;
    N1: TMenuItem;
    Remover1: TMenuItem;
    Adicionar1: TMenuItem;
    qSPG: TUniQuery;
    grpPermissoesConfig: TGroupBox;
    qSPGcodigo: TIntegerField;
    qSPGgrupo: TIntegerField;
    qSPGformulario: TIntegerField;
    qSPGabrir: TBooleanField;
    qSPGalteracao: TBooleanField;
    qSPGexclusao: TBooleanField;
    qSPGexecutar: TBooleanField;
    dsSPG: TUniDataSource;
    cbbabrir: TcxDBCheckBox;
    cbbexclusao: TcxDBCheckBox;
    cbbexecutar: TcxDBCheckBox;
    cbbalteracao: TcxDBCheckBox;
    btnSalvar: TButton;
    btnCancelar: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure ViewModulosCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure dsFormulariosDataChange(Sender: TObject; Field: TField);
    procedure dsPermissaoDataChange(Sender: TObject; Field: TField);
    procedure Adicionar1Click(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Alterar1Click(Sender: TObject);
    procedure Remover1Click(Sender: TObject);
  private
    { Private declarations }
    procedure OpenQuery;
    procedure AbrePermissoes;
  public
    { Public declarations }
  end;

var
  frmConfigGrupoUsuario: TfrmConfigGrupoUsuario;

implementation

{$R *.dfm}

procedure TfrmConfigGrupoUsuario.AbrePermissoes;
begin
  try
    begin
      qFomularios.Close;
      qFomularios.ParamByName('modulo').AsInteger := dsModulos.DataSet.FieldByName('codigo').AsInteger;
      qFomularios.ParamByName('grupo').AsInteger := ds.DataSet.FieldByName('codigo').AsInteger;
      qFomularios.Open;
      qPermissao.Close;
      GridPermissao.Visible := True;
      qPermissao.ParamByName('modulo').AsInteger := dsModulos.DataSet.FieldByName('codigo').AsInteger;
      qPermissao.ParamByName('grupo').AsInteger := ds.DataSet.FieldByName('codigo').AsInteger;
      qPermissao.Open;
      GridLiberacoes.Visible := True;
    end;
  except
    begin
      Aviso('ERRO','Informação','Não foi possivel abrir as configurações de permissão.'+#13+'Entre em contato com o suporte.');
    end;
  end;
end;

procedure TfrmConfigGrupoUsuario.Adicionar1Click(Sender: TObject);
begin
  inherited;
  qSPG.Open;
  qSPG.Insert;
  qSPGgrupo.AsInteger := ds.DataSet.FieldByName('codigo').AsInteger;
  qSPGformulario.AsInteger := dsFormularios.DataSet.FieldByName('codigo').AsInteger;
  pnlCondicao.Visible := True;
  pnlModulos.Enabled := False;
  GridPermissao.Enabled := False;
  GridLiberacoes.Enabled := False;
  // SETA COMO PADRÃO DESABILITADO
  qSPGabrir.AsBoolean := False;
  qSPGalteracao.AsBoolean := False;
  qSPGexclusao.AsBoolean := False;
  qSPGexecutar.AsBoolean := False;
end;

procedure TfrmConfigGrupoUsuario.Alterar1Click(Sender: TObject);
var Filtro: string;
begin
  inherited;
  Filtro := 'codigo = ' + dsPermissao.DataSet.FieldByName('codigo').AsString;
  qSPG.Filter := Filtro;
  qSPG.Filtered := True;
  if qSPG.RecordCount > 0 then
    begin
      qSPG.Edit;
      pnlCondicao.Visible := True;
      pnlModulos.Enabled := False;
      GridPermissao.Enabled := False;
      GridLiberacoes.Enabled := False;
    end
  else
    begin
      Aviso('ERRO','Informação','Não foi possivel encontrar o reistro especificado. Entre em contato com o suporte.');
    end;
end;

procedure TfrmConfigGrupoUsuario.btnCancelarClick(Sender: TObject);
begin
  inherited;
  qSPG.Post;
  pnlCondicao.Visible := False;
  pnlModulos.Enabled := True;
  GridPermissao.Enabled := True;
  GridLiberacoes.Enabled := True;
  dsFormularios.DataSet.Refresh;
  dsPermissao.DataSet.Refresh;
end;

procedure TfrmConfigGrupoUsuario.btnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmConfigGrupoUsuario.btnSalvarClick(Sender: TObject);
begin
  inherited;
  qSPG.Cancel;
  pnlCondicao.Visible := False;
  pnlModulos.Enabled := True;
  GridPermissao.Enabled := True;
  GridLiberacoes.Enabled := True;
end;

procedure TfrmConfigGrupoUsuario.dsFormulariosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if dsFormularios.DataSet.RecordCount > 0 then
    begin
      Adicionar1.Enabled := True;
    end
  else
    begin
      Adicionar1.Enabled := False;
    end;
end;

procedure TfrmConfigGrupoUsuario.dsPermissaoDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if dsPermissao.DataSet.RecordCount > 0 then
    begin
      Alterar1.Enabled := True;
      Remover1.Enabled := True;
    end
  else
    begin
      Alterar1.Enabled := False;
      Remover1.Enabled := False;
    end;
end;

procedure TfrmConfigGrupoUsuario.FormShow(Sender: TObject);
begin
  inherited;
   if Settings.Modo = 'CONSULTA' then
    begin
      // Relacionais
      qConsulta.ParamByName('codigo').asInteger := Settings.ID;
      OpenQuery;
      qConsulta.ReadOnly:= True;
      //btnCancelar.Enabled := False;
      //btnSalvar.Enabled := False;
      btnFechar.Enabled := True;
      Exit;
    end;
  if Settings.Modo = 'NEW' then
    begin
      qConsulta.ParamByName('codigo').asInteger := Settings.ID;
      OpenQuery;
      ds.DataSet.Insert;
      qConsulta.ReadOnly:= False;
      //btnCancelar.Enabled := True;
      //btnSalvar.Enabled := True;
      btnFechar.Enabled := True;
      Exit;
    end;
  if Settings.Modo = 'ALTERACAO' then
    begin
      qConsulta.ParamByName('codigo').asInteger := Settings.ID;
      OpenQuery;
      qConsulta.ReadOnly:= False;
      ds.DataSet.Edit;
      //btnCancelar.Enabled := True;
      //btnSalvar.Enabled := True;
      btnFechar.Enabled := True;
      Exit;
    end;
end;

procedure TfrmConfigGrupoUsuario.OpenQuery;
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

procedure TfrmConfigGrupoUsuario.Remover1Click(Sender: TObject);
var Filtro: string;
begin
  inherited;
  qSPG.Refresh;
  Filtro := 'codigo = ' + dsPermissao.DataSet.FieldByName('codigo').AsString;
  qSPG.Filter := Filtro;
  qSPG.Filtered := True;
  if qSPG.RecordCount > 0 then
    begin
      if Pergunta('INFO','Confirmação','Tem certeza que deseja remover a permissão selecionada?','SN') = ID_YES then
        begin
          dsPermissao.DataSet.Delete;
          dsFormularios.DataSet.Refresh;
          dsPermissao.DataSet.Refresh;
        end;
    end
  else
    begin
      Aviso('ERRO','Informação','Não foi possivel encontrar o reistro especificado. Entre em contato com o suporte.');
    end;
end;

procedure TfrmConfigGrupoUsuario.ViewModulosCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  AbrePermissoes;
end;

end.
