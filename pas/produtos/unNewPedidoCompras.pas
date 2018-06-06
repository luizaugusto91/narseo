unit unNewPedidoCompras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unNew, Data.DB, DBAccess, Uni, MemDS,
  Vcl.ImgList, cxGraphics, Vcl.StdCtrls, Vcl.ExtCtrls, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
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
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxSpinEdit, cxDBEdit, cxMemo,
  cxDropDownEdit, cxCalendar, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmNewPedidoCompras = class(TfrmNew)
    qConsultacodigo: TIntegerField;
    qConsultaempresa: TIntegerField;
    qConsultafornecedor: TIntegerField;
    qConsultarepresentante: TIntegerField;
    qConsultadata_pedido: TDateTimeField;
    qConsultaprevisao_entrega: TDateField;
    qConsultadata_compra: TDateField;
    qConsultadata_entrada: TDateField;
    qConsultastatus: TStringField;
    lblCodigo: TLabel;
    edtCodigo: TcxDBSpinEdit;
    Label1: TLabel;
    edtfornecedor: TcxDBSpinEdit;
    Label2: TLabel;
    edtrepresentante: TcxDBSpinEdit;
    Label3: TLabel;
    edtprevisao_entrega: TcxDBDateEdit;
    Label4: TLabel;
    edtdata_compra: TcxDBDateEdit;
    qConsultaobservacao: TMemoField;
    grpObservacao: TGroupBox;
    mmoobservacao: TcxDBMemo;
    cbbFornecedor: TcxDBLookupComboBox;
    qFornecedor: TUniQuery;
    dsFornecedor: TUniDataSource;
    qRepresentante: TUniQuery;
    dsRepresentante: TUniDataSource;
    cbbRepresentante: TcxDBLookupComboBox;
    procedure btnAvancarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNewPedidoCompras: TfrmNewPedidoCompras;

implementation

{$R *.dfm}

uses unCadPedidoCompras;

procedure TfrmNewPedidoCompras.btnAvancarClick(Sender: TObject);
begin
  inherited;
  ActAvancar(TfrmCadPedidoCompras,frmCadPedidoCompras);
  Close;
end;

procedure TfrmNewPedidoCompras.FormShow(Sender: TObject);
begin
  qSQL.ParamByName('sequencial').AsString := 'pedido_compras_codigo_seq';
  inherited;
  edtfornecedor.SetFocus;
  ds.DataSet.FieldByName('data_compra').AsDateTime := Date;
end;

end.
