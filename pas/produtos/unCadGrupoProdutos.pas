unit unCadGrupoProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCad, Vcl.ImgList, cxGraphics, Data.DB,
  MemDS, DBAccess, Uni, Vcl.StdCtrls, Vcl.ExtCtrls, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  cxNavigator, cxDBData, cxContainer, cxMaskEdit, cxSpinEdit, cxDBEdit,
  cxTextEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxDropDownEdit, cxCalc,
  cxCheckBox, Vcl.AppEvnts, dxGDIPlusClasses, cxImage;

type
  TfrmCadGrupoProdutos = class(TfrmCad)
    qConsultacodigo: TIntegerField;
    qConsultadescricao: TStringField;
    qConsultaflag: TStringField;
    qConsultaestoque_negativo: TBooleanField;
    qConsultaaviso_estoque_minimo: TBooleanField;
    qConsultaminimo: TIntegerField;
    qConsultaestoque_negativo_deposito: TBooleanField;
    qConsultagerar_ponto_valor: TBooleanField;
    qConsultagerar_ponto_qtde: TBooleanField;
    qConsultatrocar_ponto: TBooleanField;
    qConsultareajusta_preco_auto: TBooleanField;
    qConsultacomissao: TFloatField;
    qConsultatipo_comissao: TStringField;
    qConsultamargem_lucro: TFloatField;
    qSubGrupo: TUniQuery;
    dsSub: TUniDataSource;
    qSubGrupocodigo: TIntegerField;
    qSubGrupocodgrupo: TIntegerField;
    qSubGrupodescricao: TStringField;
    qSubGrupoflag: TStringField;
    qSubGrupocomissao: TFloatField;
    qSubGrupotipo_comissao: TStringField;
    chbAvisaEstoqueMinimo: TcxDBCheckBox;
    chbDepositoEstoqueNegativo: TcxDBCheckBox;
    chbEstoqueNegativo: TcxDBCheckBox;
    chbGeraPontoQtde: TcxDBCheckBox;
    chbGeraPontoValor: TcxDBCheckBox;
    chbReajustaPreco: TcxDBCheckBox;
    chbTrocarPonto: TcxDBCheckBox;
    edtcomissao1: TcxDBCalcEdit;
    edtmargem_lucro: TcxDBCalcEdit;
    edtcodigo: TcxDBSpinEdit;
    edtdescricao1: TcxDBTextEdit;
    edtflag: TcxDBTextEdit;
    edtEstoqueMinimo: TcxDBSpinEdit;
    edtTipo: TcxDBTextEdit;
    grpSubGrupo: TGroupBox;
    pnlbottonSub: TPanel;
    lblDescricao: TLabel;
    lblComissao: TLabel;
    btnCancel: TButton;
    btnConfirm: TButton;
    edtDescricao: TcxDBTextEdit;
    edtComissao: TcxDBSpinEdit;
    Grid: TcxGrid;
    View: TcxGridDBTableView;
    ColViewID: TcxGridDBColumn;
    ColViewDescricao: TcxGridDBColumn;
    ColViewComissao: TcxGridDBColumn;
    Master: TcxGridLevel;
    pnlTool: TPanel;
    btnAdd: TButton;
    btnRemove: TButton;
    btnReload: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblMinimo: TLabel;
    lblTipo: TLabel;
    procedure btnAddClick(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnReloadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadGrupoProdutos: TfrmCadGrupoProdutos;

implementation

{$R *.dfm}

procedure TfrmCadGrupoProdutos.btnAddClick(Sender: TObject);
begin
  inherited;
  pnlbottonSub.Visible:= True;
  dsSub.DataSet.Insert;
  edtDescricao.SetFocus;
end;

procedure TfrmCadGrupoProdutos.btnCancelClick(Sender: TObject);
begin
  inherited;
  dsSub.DataSet.FieldByName('codgrupo').AsInteger:= Settings.ID;
  dsSub.DataSet.Post;
  pnlbottonSub.Visible:= False;
  dsSub.DataSet.Refresh;
end;

procedure TfrmCadGrupoProdutos.btnConfirmClick(Sender: TObject);
begin
  inherited;
  dsSub.DataSet.Cancel;
  pnlbottonSub.Visible:= False;
  dsSub.DataSet.Refresh;
end;

procedure TfrmCadGrupoProdutos.btnReloadClick(Sender: TObject);
begin
  inherited;
  dsSub.DataSet.Refresh;
end;

procedure TfrmCadGrupoProdutos.btnRemoveClick(Sender: TObject);
begin
  inherited;
  if (Application.MessageBox('Tem certeza que deseja apagar este subgrupo?','Exclusão!',MB_ICONQUESTION + MB_YESNO) = ID_YES) then
    begin
      dsSub.DataSet.Delete;
      dsSub.DataSet.Refresh;
    end;
end;

end.
