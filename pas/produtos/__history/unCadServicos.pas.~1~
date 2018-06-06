unit unCadServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCad, Vcl.ImgList, cxGraphics, Data.DB,
  MemDS, DBAccess, Uni, Vcl.StdCtrls, Vcl.ExtCtrls, cxControls, cxLookAndFeels,
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
  cxCheckBox, cxDBEdit, cxTextEdit, cxMaskEdit, cxSpinEdit, dxSkinscxPCPainter,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxCalc, cxCurrencyEdit, cxDropDownEdit, cxCalendar,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxMemo, cxPC, dxGDIPlusClasses, cxImage;

type
  TfrmCadServicos = class(TfrmCad)
    grpDetalhes: TGroupBox;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    edtCodigo: TcxDBSpinEdit;
    edtNome: TcxDBTextEdit;
    cbbinativo: TcxDBCheckBox;
    PageControl: TcxPageControl;
    tabGeral: TcxTabSheet;
    grp1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtIDGrupo: TcxDBSpinEdit;
    edtIDSubGrupo: TcxDBSpinEdit;
    edtCategoria: TcxDBSpinEdit;
    grpProdDescriLonga: TGroupBox;
    mmoProdDescricaoLonga: TcxDBMemo;
    cbbCategoria: TcxDBLookupComboBox;
    cbbGrupo: TcxDBLookupComboBox;
    cbbSubGrupo: TcxDBLookupComboBox;
    tabFiscal: TcxTabSheet;
    grp2: TGroupBox;
    TabPoliticas: TcxTabSheet;
    grpEmpresas: TGroupBox;
    GridEmpresas: TcxGrid;
    ViewEmpresas: TcxGridDBTableView;
    ColumnID: TcxGridDBColumn;
    ColumnEmpresa: TcxGridDBColumn;
    ColumnMatriz: TcxGridDBColumn;
    ColumnIDMatriz: TcxGridDBColumn;
    MasterEmpresas: TcxGridLevel;
    grpConfiguracoes: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtmarkup_vista: TcxDBCalcEdit;
    edtvalor_vista: TcxDBCurrencyEdit;
    edtmarkup_prazo: TcxDBCalcEdit;
    edtvalor_prazo: TcxDBCurrencyEdit;
    edtcomissao: TcxDBCalcEdit;
    TabEmpenho: TcxTabSheet;
    grpEmpenho: TGroupBox;
    qConsultacodigo: TIntegerField;
    qConsultanome: TStringField;
    qConsultadescricao: TMemoField;
    qConsultatipo: TStringField;
    qConsultagrupo: TIntegerField;
    qConsultasubgrupo: TIntegerField;
    qConsultacategoria: TIntegerField;
    qConsultainativo: TBooleanField;
    qConsultaempenho: TBooleanField;
    qConsultaexecucao_minimo: TIntegerField;
    qConsultaexecucao_maximo: TIntegerField;
    qConsultacertificado: TBooleanField;
    qConsultacf_servico: TStringField;
    cbbempenho: TcxDBCheckBox;
    Label5: TLabel;
    edtexecucao_minimo: TcxDBSpinEdit;
    Label6: TLabel;
    edtexecucao_maximo: TcxDBSpinEdit;
    cbbcertificado: TcxDBCheckBox;
    GridEmpenho: TcxGrid;
    ViewEmpenho: TcxGridDBTableView;
    MasterEmpenho: TcxGridLevel;
    ColumnPDID: TcxGridDBColumn;
    ColumnPDNome: TcxGridDBColumn;
    ColumnPDQuantidade: TcxGridDBColumn;
    ColumnPDObrigatorio: TcxGridDBColumn;
    pnlACT: TPanel;
    btnNovo: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    StyleRepository: TcxStyleRepository;
    StyleHeader: TcxStyle;
    StyleItemInativo: TcxStyle;
    StyleItemAtivo: TcxStyle;
    qProdutoEmpresa: TUniQuery;
    dsProdutoEmpresa: TUniDataSource;
    qProdutoEmpresacodigo: TIntegerField;
    qProdutoEmpresaempresa: TIntegerField;
    qProdutoEmpresaproduto: TIntegerField;
    qProdutoEmpresamarkup_vista: TFloatField;
    qProdutoEmpresavalor_vista: TCurrencyField;
    qProdutoEmpresamarkup_prazo: TFloatField;
    qProdutoEmpresavalor_prazo: TCurrencyField;
    qProdutoEmpresacomissao: TFloatField;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbbempenhoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadServicos: TfrmCadServicos;

implementation

{$R *.dfm}

uses unDMProdutoConsultas;

procedure TfrmCadServicos.btnSalvarClick(Sender: TObject);
begin
  if dsProdutoEmpresa.State in [dsEdit] then
    qProdutoEmpresa.Post;
  ds.DataSet.FieldByName('tipo').AsString := 'S';
  inherited;
end;

procedure TfrmCadServicos.cbbempenhoExit(Sender: TObject);
begin
  inherited;
    if ds.State in [dsEdit] then
    begin
      if cbbempenho.Checked = True then
        begin
          TabEmpenho.Visible := True;
        end
      else
        begin
          TabEmpenho.Visible := False;
        end;
    end;
end;

procedure TfrmCadServicos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dmProdutoConsultas.Free;
end;

procedure TfrmCadServicos.FormCreate(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TdmProdutoConsultas, dmProdutoConsultas);
end;

procedure TfrmCadServicos.FormShow(Sender: TObject);
begin
  qProdutoEmpresa.ParamByName('produto').AsInteger := Settings.ID;
  inherited;
end;

end.
