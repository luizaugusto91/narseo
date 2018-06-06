unit unGridPedidoVendas;

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
  Vcl.ExtCtrls, unSystem, frxClass, frxDBSet, frxExportPDF, dxRibbonSkins,
  dxSkinsdxRibbonPainter, dxRibbonCustomizationForm, dxSkinsdxBarPainter, dxBar,
  dxRibbon, Vcl.ComCtrls;

type
  TfrmGridPedidoVendas = class(TfrmGrid)
    Viewcodigo: TcxGridDBColumn;
    Viewfornecedor: TcxGridDBColumn;
    Viewrepresentante: TcxGridDBColumn;
    Viewdata_pedido: TcxGridDBColumn;
    Viewprevisao_entrega: TcxGridDBColumn;
    Viewstatus: TcxGridDBColumn;
    RepPedidoVendas: TfrxReport;
    frxPDFExport: TfrxPDFExport;
    FRDataSetConsulta: TfrxDBDataset;
    FRDataSetEmpresa: TfrxDBDataset;
    pmItens: TPopupMenu;
    ImprimirPedido1: TMenuItem;
    FRDataSetCliente: TfrxDBDataset;
    qItens: TUniQuery;
    FRDataSetItensPedido: TfrxDBDataset;
    qPedidoVendas: TUniQuery;
    N2: TMenuItem;
    GerarVenda1: TMenuItem;
    procedure ImprimirPedido1Click(Sender: TObject);
    procedure GerarVenda1Click(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
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
  frmGridPedidoVendas: TfrmGridPedidoVendas;

implementation

{$R *.dfm}

uses unCadPedidoVendas, unNewPedidoVendas, unReport, unParametros, unGridVendas;


procedure TfrmGridPedidoVendas.dsDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  // testar aqui
  if ds.DataSet.RecordCount = 0 then
    begin
      pmItens.Items.Enabled := False;
    end
  else
    begin
      pmItens.Items.Enabled := True;
    end;
end;

procedure TfrmGridPedidoVendas.GerarVenda1Click(Sender: TObject);
var
  nVenda: Integer;
begin
  inherited;
  if (ds.DataSet.FieldByName('status').AsString = 'Cancelado') or (ds.DataSet.FieldByName('status').AsString = 'Fechado') then
    begin
      Aviso('STOP','Informação','O pedido selecionado não pode gerar venda.');
    end
  else
    begin
      if Pergunta('WHAT','Confirmação','Confirma gerar a venda sobre o pedido selecionado?','SN') = ID_YES then
        begin
          qSQL.Close;
          qSQL.SQL.Clear;
          qSQL.SQL.Text := 'SELECT gera_venda_pedido(:codigo);';
          qSQL.ParamByName('codigo').AsInteger := ds.DataSet.FieldByName('codigo').AsInteger;
          qSQL.Open;
          nVenda := qSQL.FieldByName('gera_venda_pedido').AsInteger;
          qSQL.Close;
          // Abre a venda gerada
          CriaFormulario(TfrmGridVendas,nVenda,'LISTA',frmGridVendas);
          ds.DataSet.Refresh;
        end;
    end;
end;

procedure TfrmGridPedidoVendas.ImprimirPedido1Click(Sender: TObject);
begin
  inherited;
  //Inicia a impressão do pedido
  qPedidoVendas.Close;
  qPedidoVendas.ParamByName('codigo').AsInteger := ds.DataSet.FieldByName('codigo').AsInteger;
  qPedidoVendas.Open;
  Application.CreateForm(TReport,Report);
  Report.qEmpresa.Close;
  Report.qEmpresa.ParamByName('codigo').asInteger := Parametros.cdsParametros.fieldbyname('empresa').asInteger;
  Report.qEmpresa.Open;
  Report.qCliente.Close;
  Report.qCliente.ParamByName('codigo').AsInteger := ds.DataSet.FieldByName('cd_cliente').AsInteger;
  Report.qCliente.Open;
  RepPedidoVendas.ShowReport();
  Report.qEmpresa.Close;
  Report.qCliente.Close;
  Report.Free;
  qPedidoVendas.Close;
end;

procedure TfrmGridPedidoVendas.MnEditarClick(Sender: TObject);
begin
  inherited;
  if ds.DataSet.FieldByName('status').AsString = 'Pendente' then
    ActEditar(TfrmCadPedidoVendas,frmCadPedidoVendas)
  else
    Aviso('INFO','Informação','Este pedido não pode mais ser alterado.');
end;

procedure TfrmGridPedidoVendas.MnExcluirClick(Sender: TObject);
begin
  inherited;
  TabelaREF := 'pedido_vendas';
  ActRemover(TfrmCadPedidoVendas,frmCadPedidoVendas);
end;

procedure TfrmGridPedidoVendas.MnNovoClick(Sender: TObject);
begin
  inherited;
  ActNew(TfrmNewPedidoVendas,frmNewPedidoVendas);
end;

procedure TfrmGridPedidoVendas.MnVisualizarClick(Sender: TObject);
begin
  inherited;
  ActVisualizar(TfrmCadPedidoVendas,frmCadPedidoVendas);
end;

end.
