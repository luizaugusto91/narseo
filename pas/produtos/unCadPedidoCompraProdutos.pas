unit unCadPedidoCompraProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCad, Vcl.ImgList, cxGraphics, Data.DB,
  MemDS, DBAccess, Uni, Vcl.StdCtrls, Vcl.ExtCtrls, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCheckBox, cxDBEdit, cxCurrencyEdit, cxTextEdit,
  cxMaskEdit, cxSpinEdit, unConnection, unParametros, dxGDIPlusClasses, cxImage;

type
  TfrmCadPedidoCompraProdutos = class(TfrmCad)
    qConsultacodigo: TIntegerField;
    qConsultapedido: TIntegerField;
    qConsultaproduto: TIntegerField;
    qConsultavalor_unitario: TCurrencyField;
    qConsultaquantidade: TIntegerField;
    qConsultavalor_total: TCurrencyField;
    qConsultaentrada: TIntegerField;
    qConsultacancelado: TBooleanField;
    edtCodigo: TcxDBSpinEdit;
    lblCodigo: TLabel;
    Label1: TLabel;
    edtproduto: TcxDBSpinEdit;
    Label2: TLabel;
    edtvalor_unitario: TcxDBCurrencyEdit;
    Label3: TLabel;
    edtquantidade: TcxDBSpinEdit;
    Label4: TLabel;
    edtvalor_total: TcxDBCurrencyEdit;
    Label5: TLabel;
    edtentrada: TcxDBSpinEdit;
    cbbcancelado: TcxDBCheckBox;
    cbbProduto: TcxDBLookupComboBox;
    qConsultadesconto: TCurrencyField;
    qConsultaacrescimo: TCurrencyField;
    Label6: TLabel;
    edtacrescimo: TcxDBCurrencyEdit;
    Label7: TLabel;
    edtdesconto: TcxDBCurrencyEdit;
    qProduto: TUniQuery;
    dsProduto: TUniDataSource;
    qSQL: TUniQuery;
    procedure btnSalvarClick(Sender: TObject);
    procedure edtprodutoExit(Sender: TObject);
    procedure edtquantidadeExit(Sender: TObject);
    procedure edtacrescimoExit(Sender: TObject);
    procedure edtdescontoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CalculaTotal;
    { Public declarations }
  end;

var
  frmCadPedidoCompraProdutos: TfrmCadPedidoCompraProdutos;

implementation

{$R *.dfm}

procedure TfrmCadPedidoCompraProdutos.btnSalvarClick(Sender: TObject);
begin
  ds.DataSet.FieldByName('pedido').AsInteger := Settings.ID;
  inherited;
end;

procedure TfrmCadPedidoCompraProdutos.CalculaTotal;
begin
  if (ds.State in [dsEdit, dsInsert]) and (qConsultacancelado.AsBoolean = False) then
    begin
      qConsultavalor_total.AsCurrency := (qConsultavalor_unitario.AsCurrency * qConsultaquantidade.AsInteger) + qConsultaacrescimo.AsCurrency - qConsultadesconto.AsCurrency;
    end;
end;

procedure TfrmCadPedidoCompraProdutos.edtacrescimoExit(Sender: TObject);
begin
  inherited;
  CalculaTotal;
end;

procedure TfrmCadPedidoCompraProdutos.edtdescontoExit(Sender: TObject);
begin
  inherited;
  CalculaTotal;
end;

procedure TfrmCadPedidoCompraProdutos.edtprodutoExit(Sender: TObject);
begin
  inherited;
  if (qConsultaproduto.IsNull = False) or (qConsultaproduto.AsInteger <> 0) then
    begin
      qSQL.Close;
      qSQL.ParamByName('pedido').AsInteger := Settings.ID;
      qSQL.ParamByName('produto').AsInteger := qConsultaproduto.AsInteger;
      qSQL.Open;
      if (qConsultavalor_unitario.IsNull = True) or (qConsultavalor_unitario.AsCurrency = 0)  then
        begin
          qConsultavalor_unitario.AsCurrency := qSQL.FieldByName('valor').AsCurrency;
        end
    end;
end;

procedure TfrmCadPedidoCompraProdutos.edtquantidadeExit(Sender: TObject);
begin
  inherited;
  if (qConsultavalor_total.IsNull = True) or (qConsultavalor_total.AsCurrency = 0) then
    begin
      CalculaTotal;
    end;
end;

procedure TfrmCadPedidoCompraProdutos.FormShow(Sender: TObject);
begin
  inherited;
  ds.DataSet.FieldByName('cancelado').AsBoolean := False;
end;

end.
