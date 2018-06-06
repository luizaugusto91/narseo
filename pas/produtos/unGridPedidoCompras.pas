unit unGridPedidoCompras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unGrid, cxGraphics, cxControls,
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
  cxNavigator, Data.DB, cxDBData, Datasnap.DBClient, Vcl.Menus, cxClasses,
  DBAccess, Uni, MemDS, Vcl.ImgList, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid, Vcl.StdCtrls,
  Vcl.ExtCtrls, unSystem, dxRibbonSkins, dxSkinsdxRibbonPainter,
  dxRibbonCustomizationForm, dxSkinsdxBarPainter, dxBar, Vcl.ComCtrls, dxRibbon;

type
  TfrmGridPedidoCompras = class(TfrmGrid)
    Viewcodigo: TcxGridDBColumn;
    Viewfornecedor: TcxGridDBColumn;
    Viewrepresentante: TcxGridDBColumn;
    Viewdata_pedido: TcxGridDBColumn;
    Viewprevisao_entrega: TcxGridDBColumn;
    Viewstatus: TcxGridDBColumn;
    procedure MnNovoClick(Sender: TObject);
    procedure MnVisualizarClick(Sender: TObject);
    procedure MnEditarClick(Sender: TObject);
    procedure MnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGridPedidoCompras: TfrmGridPedidoCompras;

implementation

{$R *.dfm}

uses unNewPedidoCompras, unCadPedidoCompras;

procedure TfrmGridPedidoCompras.MnEditarClick(Sender: TObject);
begin
  inherited;
  if ds.DataSet.FieldByName('status').AsString = 'Pendente' then
    ActEditar(TfrmCadPedidoCompras,frmCadPedidoCompras)
  else
    Aviso('INFO','Informa��o','Este pedido n�o pode mais ser alterado.');
end;

procedure TfrmGridPedidoCompras.MnExcluirClick(Sender: TObject);
begin
  inherited;
  TabelaREF := 'pedido_compras';
  ActRemover(TfrmCadPedidoCompras,frmCadPedidoCompras);
end;

procedure TfrmGridPedidoCompras.MnNovoClick(Sender: TObject);
begin
  inherited;
  ActNew(TfrmNewPedidoCompras,frmNewPedidoCompras);
end;

procedure TfrmGridPedidoCompras.MnVisualizarClick(Sender: TObject);
begin
  inherited;
  ActVisualizar(TfrmCadPedidoCompras,frmCadPedidoCompras);
end;

end.
