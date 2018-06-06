unit unCadProdutoFornecedor;

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
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCurrencyEdit, cxDBEdit, cxCalendar, cxTextEdit, cxMaskEdit, cxSpinEdit;

type
  TfrmCadProdutoFornecedor = class(TfrmCad)
    qConsultacodigo: TIntegerField;
    qConsultaproduto: TIntegerField;
    qConsultafornecedor: TIntegerField;
    qConsultarepresentante: TIntegerField;
    qConsultaultima_compra: TDateField;
    qConsultapreco_compra: TCurrencyField;
    qConsultatempo_entrega: TIntegerField;
    qConsultaminimo_compra: TIntegerField;
    Label1: TLabel;
    edtfornecedor: TcxDBSpinEdit;
    Label2: TLabel;
    edtrepresentante: TcxDBSpinEdit;
    Label3: TLabel;
    edtultima_compra: TcxDBDateEdit;
    Label4: TLabel;
    edtpreco_compra: TcxDBCurrencyEdit;
    Label5: TLabel;
    edttempo_entrega: TcxDBSpinEdit;
    Label6: TLabel;
    edtminimo_compra: TcxDBSpinEdit;
    cbbFornecedor: TcxDBLookupComboBox;
    cbbRepresentante: TcxDBLookupComboBox;
    qFornecedor: TUniQuery;
    dsFornecedor: TUniDataSource;
    qRepresentante: TUniQuery;
    dsRepresentante: TUniDataSource;
    procedure btnSalvarClick(Sender: TObject);
    procedure qConsultaAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProdutoFornecedor: TfrmCadProdutoFornecedor;

implementation

{$R *.dfm}

procedure TfrmCadProdutoFornecedor.btnSalvarClick(Sender: TObject);
begin
  qConsultaproduto.AsInteger := Settings.ID;
  inherited;
end;

procedure TfrmCadProdutoFornecedor.qConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  qFornecedor.ParamByName('codigo').AsInteger := qConsulta.ParamByName('codigo').AsInteger;
end;

end.
