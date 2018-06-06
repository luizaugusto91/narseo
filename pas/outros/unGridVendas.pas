unit unGridVendas;

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
  TfrmGridVendas = class(TfrmGrid)
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
    mniFecharvenda1: TMenuItem;
    StylePendente: TcxStyle;
    StyleConcluido: TcxStyle;
    StyleCancelado: TcxStyle;
    ColumnID: TcxGridDBColumn;
    StyleParcial: TcxStyle;
    StyleFechado: TcxStyle;
    mniConfirmarEntrega1: TMenuItem;
    Parcial1: TMenuItem;
    mniTotal: TMenuItem;
    N3: TMenuItem;
    BarSeparatorRegistros: TdxBarSeparator;
    MnCliente: TdxBarLargeButton;
    procedure ImprimirPedido1Click(Sender: TObject);
    procedure mniFecharvenda1Click(Sender: TObject);
    procedure ViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure MnNovoClick(Sender: TObject);
    procedure MnVisualizarClick(Sender: TObject);
    procedure MnEditarClick(Sender: TObject);
    procedure MnExcluirClick(Sender: TObject);
    procedure mniTotalClick(Sender: TObject);
    procedure pmItensPopup(Sender: TObject);
    procedure MnClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGridVendas: TfrmGridVendas;

implementation

{$R *.dfm}

uses unCadPedidoVendas, unNewPedidoVendas, unReport, unParametros, unCadVendas,
  unNewVendas, unGridPessoaCliente;


procedure TfrmGridVendas.mniFecharvenda1Click(Sender: TObject);
begin
  inherited;
  // Aqui que a coisa pega!
  if (ds.DataSet.FieldByName('concluido').AsBoolean = False) and (ds.DataSet.FieldByName('idstatus').AsString <> 'C') and (ds.DataSet.FieldByName('idstatus').AsString <> 'F') then
    begin
      qSQL.SQL.Clear;
      qSQL.SQL.Text := 'SELECT codigo FROM caixa WHERE data_caixa = CURRENT_DATE AND fechamento IS NULL AND conferido = FALSE;';
      qSQL.Open;
      if qSQL.RecordCount = 0 then
        begin
          qSQL.Close;
          Aviso('INFO','Informa��o','N�o foi encontrado caixa aberto para a data de hoje. A opera��o sera cancelada.');
          Abort;
        end
      else
        begin
          qSQL.Close;
          qSQL.SQL.Clear;
          qSQL.SQL.Text := 'UPDATE vendas SET fechar = TRUE WHERE codigo = :codigo ;';
          qSQL.ParamByName('codigo').AsInteger := ds.DataSet.FieldByName('codigo').AsInteger;
          qSQL.Execute;
          ActEditar(TfrmCadVendas,frmCadVendas)
        end;
    end
  else
    Aviso('INFO','Informa��o','Este pedido n�o pode ser fechado ou ja se encontra liquidado.');
end;

procedure TfrmGridVendas.ImprimirPedido1Click(Sender: TObject);
begin
  inherited;
  //Inicia a impress�o do pedido
  qPedidoVendas.ParamByName('codigo').AsInteger := ds.DataSet.FieldByName('codigo').AsInteger;
  qPedidoVendas.Open;
  Report.qEmpresa.ParamByName('codigo').asInteger := Parametros.cdsParametros.fieldbyname('empresa').asInteger;
  Report.qEmpresa.Open;
  Report.qCliente.ParamByName('codigo').AsInteger := ds.DataSet.FieldByName('cd_cliente').AsInteger;
  Report.qCliente.Open;
  RepPedidoVendas.ShowReport();
  qPedidoVendas.Close;
end;

procedure TfrmGridVendas.MnClienteClick(Sender: TObject);
begin
  inherited;
  CriaFormulario(TFrmGridPessoaCliente,ds.DataSet.FieldByName('cd_cliente').AsInteger,'LISTA',FrmGridPessoaCliente);
end;

procedure TfrmGridVendas.MnEditarClick(Sender: TObject);
begin
  inherited;
  if (ds.DataSet.FieldByName('idstatus').AsString = 'P') or (ds.DataSet.FieldByName('idstatus').AsString = 'EP') then
    ActEditar(TfrmCadVendas,frmCadVendas)
  else
    Aviso('INFO','Informa��o','Este pedido n�o pode mais ser alterado.')
end;

procedure TfrmGridVendas.MnExcluirClick(Sender: TObject);
begin
  inherited;
  TabelaREF := 'vendas';
  ActRemover(TfrmCadVendas,frmCadVendas);
end;

procedure TfrmGridVendas.MnNovoClick(Sender: TObject);
var
  nPedido, nVenda: Integer;
begin
  inherited;
  if Pergunta('INFO','Informa��o','Deseja relacionar a nova venda a um pedido ja existente?','SN') = ID_YES then
    begin
      // GERA A VENDA
      nPedido := StrToInt(InputBox('Venda por pedido','Por favor, insira o numero do pedido que deseja realizar a venda:',''));
      qSQL.Close;
      qSQL.SQL.Clear;
      qSQL.SQL.Text := 'SELECT gera_venda_pedido(:codigo);';
      qSQL.ParamByName('codigo').AsInteger := nPedido;
      qSQL.Open;
      nVenda := qSQL.FieldByName('gera_venda_pedido').AsInteger;
      // Abre a venda gerada
      ds.DataSet.Refresh;
      ds.DataSet.Locate('codigo',nVenda,[]);
      ActVisualizar(TfrmCadVendas,frmCadVendas);
    end
  else
    begin
      ActNew(TfrmNewVendas,frmNewVendas);
    end;
end;

procedure TfrmGridVendas.MnVisualizarClick(Sender: TObject);
begin
  inherited;
  ActVisualizar(TfrmCadVendas,frmCadVendas);
end;

procedure TfrmGridVendas.pmItensPopup(Sender: TObject);
begin
  inherited;
  if ds.DataSet.FieldByName('entregue').AsBoolean = True then
    begin
      mniConfirmarEntrega1.Enabled := False;
      mniFecharvenda1.Enabled := False;
    end
  else
    begin
      mniConfirmarEntrega1.Enabled := True;
      mniFecharvenda1.Enabled := True;
    end;
  if ds.DataSet.FieldByName('concluido').AsBoolean = True then
    mniFecharvenda1.Enabled := False
  else
    mniFecharvenda1.Enabled := True;
end;

procedure TfrmGridVendas.mniTotalClick(Sender: TObject);
var
  SQL: string;
begin
  inherited;
  SQL:= 'select set_entrega_venda_completa('+ds.DataSet.FieldByName('codigo').AsString+');';
  SQLPrepare(SQL);
  qSQL.Open;
  if qSQL.FieldByName('set_entrega_venda_completa').AsBoolean = True then
    begin
      Aviso('INFO','Informa��o','Todos os produtos foram relacionados como entregues!');
      ds.DataSet.Refresh;
    end
  else
    Aviso('ERRO','Informa��o','Houve um erro ao relacionar a entrega total dos produtos!');
end;

procedure TfrmGridVendas.ViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
// >> Define o Style
  if (ARecord is TcxGridDataRow) and (ARecord.Selected) then
    begin
      AStyle := StyleItemAtivo;
    end
  else
  // > Pendente
  if (ARecord is TcxGridDataRow) And Not (ARecord.Selected) And (ARecord.Values[ColumnID.Index] = 'P') then
    begin
      AStyle := StylePendente;
    end
  else
  // > Entregue
  if (ARecord is TcxGridDataRow) And Not (ARecord.Selected) And (ARecord.Values[ColumnID.Index] = 'E') then
    begin
      AStyle := StyleConcluido;
    end
  else
  // > Concluido
  if (ARecord is TcxGridDataRow) And Not (ARecord.Selected) And (ARecord.Values[ColumnID.Index] = 'F') then
    begin
      AStyle := StyleFechado;
    end
  else
  // > Parcial
  if (ARecord is TcxGridDataRow) And Not (ARecord.Selected) And (ARecord.Values[ColumnID.Index] = 'EP') then
    begin
      AStyle := StyleParcial;
    end
  else
  // > Cancelado
  if (ARecord is TcxGridDataRow) And Not (ARecord.Selected) And (ARecord.Values[ColumnID.Index] = 'C') then
    begin
      AStyle := StyleCancelado;
    end
  else
    begin
      AStyle := StyleItemAtivo;
    end;
end;

end.
