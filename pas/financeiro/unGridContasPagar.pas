unit unGridContasPagar;

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
  Vcl.Menus, cxClasses, DBAccess, Uni, MemDS, Vcl.ImgList, unSystem,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxGridCustomView, cxGrid, Vcl.StdCtrls, Vcl.ExtCtrls, cxCurrencyEdit,
  dxRibbonSkins, dxSkinsdxRibbonPainter, dxRibbonCustomizationForm,
  dxSkinsdxBarPainter, dxBar, Vcl.ComCtrls, dxRibbon;

type
  TfrmGridContasPagar = class(TfrmGrid)
    Viewcodigo: TcxGridDBColumn;
    Viewempresa: TcxGridDBColumn;
    Viewdata_registro: TcxGridDBColumn;
    Viewdata_movimento: TcxGridDBColumn;
    Viewusuario: TcxGridDBColumn;
    Viewcd_tipo_conta: TcxGridDBColumn;
    Viewdocumento: TcxGridDBColumn;
    Viewtipo_conta: TcxGridDBColumn;
    Viewcompra: TcxGridDBColumn;
    Viewvalor: TcxGridDBColumn;
    Viewparcela: TcxGridDBColumn;
    Viewtotal_parcelas: TcxGridDBColumn;
    Viewcd_tipo_pagamento: TcxGridDBColumn;
    Viewtipo_pagamento: TcxGridDBColumn;
    Viewcentro_custo: TcxGridDBColumn;
    Viewvencimento: TcxGridDBColumn;
    Viewvalor_pgto: TcxGridDBColumn;
    Viewjuros: TcxGridDBColumn;
    Viewdesconto: TcxGridDBColumn;
    Viewdata_pgto: TcxGridDBColumn;
    Viewfornecedor: TcxGridDBColumn;
    Viewdescricao: TcxGridDBColumn;
    Viewquitada: TcxGridDBColumn;
    Viewnfe: TcxGridDBColumn;
    StylePendente: TcxStyle;
    StyleCancelado: TcxStyle;
    StyleQuitado: TcxStyle;
    StyleVencido: TcxStyle;
    GerarBaixa1: TMenuItem;
    MiDetalhes: TdxBarSubItem;
    MnPagamentos: TdxBarLargeButton;
    procedure ViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure GerarBaixa1Click(Sender: TObject);
    procedure MnNovoClick(Sender: TObject);
    procedure MnVisualizarClick(Sender: TObject);
    procedure MnEditarClick(Sender: TObject);
    procedure MnExcluirClick(Sender: TObject);
    procedure MnPagamentosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGridContasPagar: TfrmGridContasPagar;

implementation

{$R *.dfm}

uses unCadContasPagar, unDMCaixaAdm, unBaixaContasPagar,
  unViewContasPagarPagamentos;

procedure TfrmGridContasPagar.GerarBaixa1Click(Sender: TObject);
var
  Config: TFormMode;
begin
  inherited;
  // Gera a baixa do contas a receber
  if (ds.DataSet.FieldByName('quitada').AsBoolean = False) then
    begin
      if dmCaixaAdm.CaixaCheck = True then
        begin
          Config.Modo := 'NEW';
          Config.ID := ds.DataSet.FieldByName('codigo').AsInteger;
          try
            Application.CreateForm(TfrmBaixaContasPagar,frmBaixaContasPagar);
            frmBaixaContasPagar.Settings := Config;
            frmBaixaContasPagar.ShowModal;
          finally
            frmBaixaContasPagar.Release;
            ds.DataSet.Refresh;
          end;
        end
      else
        begin
          Aviso('STOP','Informação','Caixa de hoje não foi aberto. Operação cancelada.');
        end;
    end;
end;

procedure TfrmGridContasPagar.MnEditarClick(Sender: TObject);
begin
  inherited;
  ActEditar(TfrmCadContasPagar,frmCadContasPagar);
end;

procedure TfrmGridContasPagar.MnExcluirClick(Sender: TObject);
begin
  inherited;
  TabelaREF:= 'contas_pagar';
  ActRemover(TfrmCadContasPagar,frmCadContasPagar);
end;

procedure TfrmGridContasPagar.MnNovoClick(Sender: TObject);
begin
  inherited;
  ActInserir(TfrmCadContasPagar,frmCadContasPagar);
end;

procedure TfrmGridContasPagar.MnPagamentosClick(Sender: TObject);
begin
  inherited;
  ActView(TfrmViewContasPagarPagamentos,frmViewContasPagarPagamentos);
end;

procedure TfrmGridContasPagar.MnVisualizarClick(Sender: TObject);
begin
  inherited;
  ActVisualizar(TfrmCadContasPagar,frmCadContasPagar);
end;

procedure TfrmGridContasPagar.ViewStylesGetContentStyle(
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
  if (ARecord is TcxGridDataRow) And Not (ARecord.Selected) And (ARecord.Values[Viewquitada.Index] = 'FALSE') and (ARecord.Values[Viewvencimento.Index] >= Now) then
    begin
      AStyle := StylePendente;
    end
  else
  // > Vencido
  if (ARecord is TcxGridDataRow) And Not (ARecord.Selected) And (ARecord.Values[Viewquitada.Index] = 'FALSE') and (ARecord.Values[Viewvencimento.Index] < Now) then
    begin
      AStyle := StyleVencido;
    end
  else
  // > Quitado
  if (ARecord is TcxGridDataRow) And Not (ARecord.Selected) And (ARecord.Values[Viewquitada.Index] = 'TRUE') then
    begin
      AStyle := StyleQuitado;
    end
  else
  // > Parcial
  {if (ARecord is TcxGridDataRow) And Not (ARecord.Selected) And (ARecord.Values[Viewstatus.Index] = 'EP') then
    begin
      AStyle := StyleParcial;
    end
  else
  // > Cancelado
  if (ARecord is TcxGridDataRow) And Not (ARecord.Selected) And (ARecord.Values[Viewstatus.Index] = 'C') then
    begin
      AStyle := StyleCancelado;
    end
  else }
    begin
      AStyle := StyleItemAtivo;
    end;
end;

end.
