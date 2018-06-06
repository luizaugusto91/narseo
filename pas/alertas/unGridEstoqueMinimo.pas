unit unGridEstoqueMinimo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unGrid, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Datasnap.DBClient,
  Vcl.Menus, cxClasses, DBAccess, Uni, MemDS, Vcl.ImgList,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxGridCustomView, cxGrid, Vcl.StdCtrls, Vcl.ExtCtrls, dxRibbonSkins,
  dxSkinsdxRibbonPainter, dxRibbonCustomizationForm, dxSkinsdxBarPainter, dxBar,
  Vcl.ComCtrls, dxRibbon;

type
  TfrmGridEstoqueMinimo = class(TfrmGrid)
    Viewcodigo: TcxGridDBColumn;
    Viewempresa: TcxGridDBColumn;
    Viewcd_produto: TcxGridDBColumn;
    Viewproduto: TcxGridDBColumn;
    Viewdata_atualizacao: TcxGridDBColumn;
    Viewtotal_geral: TcxGridDBColumn;
    Viewtotal_disponovel: TcxGridDBColumn;
    Viewtotal_anterior: TcxGridDBColumn;
    Viewtotal_emprenhado: TcxGridDBColumn;
    ViewCategoria: TcxGridDBColumn;
    ColumnStatus: TcxGridDBColumn;
    StyleItemCRT: TcxStyle;
    StyleItemALT: TcxStyle;
    StyleItemDES: TcxStyle;
    StyleItemPDR: TcxStyle;
    MnMovimentar: TdxBarLargeButton;
    Mn2: TdxBarLargeButton;
    MnRelatorio: TdxBarLargeButton;
    procedure FormShow(Sender: TObject);
    procedure ViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure MnMovimentarClick(Sender: TObject);
    procedure MnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGridEstoqueMinimo: TfrmGridEstoqueMinimo;

implementation

{$R *.dfm}

uses unParametros, unCadProdutos, unCadEstoqueMovimentoManual;

procedure TfrmGridEstoqueMinimo.FormShow(Sender: TObject);
begin
  qConsulta.ParamByName('empresa').asInteger := Parametros.cdsParametros.Fieldbyname('empresa').asInteger;
  inherited;
end;

procedure TfrmGridEstoqueMinimo.MnMovimentarClick(Sender: TObject);
begin
  inherited;
  ActInject(TfrmCadEstoqueMovimentoManual,frmCadEstoqueMovimentoManual);
end;

procedure TfrmGridEstoqueMinimo.MnVisualizarClick(Sender: TObject);
begin
  inherited;
  ActVisualizar(TfrmCadProdutos,frmCadProdutos);
end;

procedure TfrmGridEstoqueMinimo.ViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  // Aqui?
  // >> Define o Style
  if (ARecord is TcxGridDataRow) and (ARecord.Selected) then
    begin
      AStyle := StyleItemAtivo;
    end
  else
  // > Aprovado
  if (ARecord is TcxGridDataRow) And Not (ARecord.Selected) And (ARecord.Values[ColumnStatus.Index] = 'CRT') then
    begin
      AStyle := StyleItemCRT;
    end
  else
  if (ARecord is TcxGridDataRow) And Not (ARecord.Selected) And (ARecord.Values[ColumnStatus.Index] = 'ALT') then
    begin
      AStyle := StyleItemALT;
    end
  else
  // > Cancelado
  if (ARecord is TcxGridDataRow) And Not (ARecord.Selected) And (ARecord.Values[ColumnStatus.Index] = 'DES') then
    begin
      AStyle := StyleItemDES;
    end
  else
  // > Inutilizado
  if (ARecord is TcxGridDataRow) And Not (ARecord.Selected) And (ARecord.Values[ColumnStatus.Index] = 'PDR') then
    begin
      AStyle := StyleItemPDR;
    end
  else
    begin
      AStyle := StyleItemAtivo;
    end;

end;

end.
