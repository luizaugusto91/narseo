unit unCadPedidoVendaProdutos;

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
  cxMaskEdit, cxSpinEdit, unConnection, dxGDIPlusClasses, cxImage,
  unSystem, unParametros, JvExControls, JvDBLookup, Vcl.Mask, JvExMask,
  JvToolEdit, JvDBLookupComboEdit;

type
  TfrmCadPedidoVendaProdutos = class(TfrmCad)
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
    procedure edtprodutoKeyPress(Sender: TObject; var Key: Char);
    procedure cbbProdutoEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    procedure CalculaTotal;
    { Public declarations }
  end;

var
  frmCadPedidoVendaProdutos: TfrmCadPedidoVendaProdutos;
  iQuantidade :Integer;

implementation

{$R *.dfm}

uses unGridProdutos;

procedure TfrmCadPedidoVendaProdutos.btnSalvarClick(Sender: TObject);
begin
  ds.DataSet.FieldByName('pedido').AsInteger := Settings.ID;
  inherited;
end;

procedure TfrmCadPedidoVendaProdutos.CalculaTotal;
begin
  if (ds.State in [dsEdit, dsInsert]) and (qConsultacancelado.AsBoolean = False) then
    begin
      qConsultavalor_total.AsCurrency := (qConsultavalor_unitario.AsCurrency * qConsultaquantidade.AsInteger) + qConsultaacrescimo.AsCurrency - qConsultadesconto.AsCurrency;
    end;
end;

procedure TfrmCadPedidoVendaProdutos.cbbProdutoEnter(Sender: TObject);
begin
  inherited;
  grpContentEnter(Sender);
  edtprodutoExit(Sender);
end;

procedure TfrmCadPedidoVendaProdutos.edtacrescimoExit(Sender: TObject);
begin
  inherited;
  CalculaTotal;
end;

procedure TfrmCadPedidoVendaProdutos.edtdescontoExit(Sender: TObject);
begin
  inherited;
  CalculaTotal;
end;

procedure TfrmCadPedidoVendaProdutos.edtprodutoExit(Sender: TObject);
begin
  inherited;
  if (qConsultaproduto.IsNull = False) or (qConsultaproduto.AsInteger <> 0) then
    begin
      qSQL.Close;
      qSQL.ParamByName('empresa').AsInteger := Parametros.cdsParametros.FieldByName('empresa').asInteger;
      qSQL.ParamByName('produto').AsInteger := qConsultaproduto.AsInteger;
      qSQL.Open;
      if (qConsultavalor_unitario.IsNull = True) or (qConsultavalor_unitario.AsCurrency = 0)  then
        begin
          qConsultavalor_unitario.AsCurrency := qSQL.FieldByName('valor').AsCurrency;
          qConsultaquantidade.AsInteger := 1;
        end
    end;
end;

procedure TfrmCadPedidoVendaProdutos.edtprodutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    begin
      if (edtproduto.Value > 0) then
        begin
          cbbProduto.SetFocus;
        end
      else
        begin
          CriaFormulario(TfrmGridProdutos,0,'CONSULTA',frmGridProdutos);
          if Parametros.Find.eValido = True then
            begin
              ds.DataSet.FieldByName('produto').AsInteger := Parametros.Find.eChave;
              cbbProduto.SetFocus;
            end;
        end;
    end;
end;

procedure TfrmCadPedidoVendaProdutos.edtquantidadeExit(Sender: TObject);
var Minimo, Negativo: Boolean;
begin
  inherited;
  // ============== ESTE CODIGO PRECISA SER REFATORADO =========================
  // Verifica se o estoque esta abaixo do minimo.
  if (ds.State = dsEdit) and (ds.DataSet.FieldByName('quantidade').AsInteger <= iQuantidade) then
    Exit;
  if (qSQL.FieldByName('estoque_minimo').AsFloat >= (qSQL.FieldByName('total_disponivel').AsFloat - edtquantidade.Value)) then
    Minimo := True
  else
    Minimo := False;
  // Verifica se o Estoque ficara negativo
  if (qSQL.FieldByName('total_disponivel').AsFloat - edtquantidade.Value) < 0 then
    Negativo := True
  else
    Negativo := False;
  // Verifica os valores
  if (Minimo = False) and (Negativo = False) then
    begin
      if (qConsultavalor_total.IsNull = True) or (qConsultavalor_total.AsCurrency = 0) then
        begin
          CalculaTotal;
        end;
    end
  else
    begin
      if (Negativo = False) then
        begin
          // Avisa sobre o estoque estar abaixo do recomendado!
          if (qSQL.FieldByName('aviso_estoque_minimo').AsBoolean = True) then
            begin
              Aviso('ALER','Aviso','O produto selecionado esta com volume abaixo do minimo definido para a empresa.');
            end;
          if (qConsultavalor_total.IsNull = True) or (qConsultavalor_total.AsCurrency = 0) then
            begin
              CalculaTotal;
            end;
        end
      else
        begin
          if (qSQL.FieldByName('estoque_negativo').AsBoolean = True) then
            begin
              if (qSQL.FieldByName('aviso_estoque_minimo').AsBoolean = True) then
                begin
                  Aviso('ALER','Aviso','O produto selecionado esta com volume abaixo do minimo definido para a empresa.');
                end;
              if (qConsultavalor_total.IsNull = True) or (qConsultavalor_total.AsCurrency = 0) then
                begin
                  CalculaTotal;
                end;
            end
          else
            begin
              Aviso('STOP','Aviso','O produto selecionado n�o permite estoque negativo.'+#13+'Opera��o cancelada.');
              //ds.DataSet.FieldByName('produto').AsInteger := 0;
              ds.DataSet.FieldByName('quantidade').AsInteger := qSQL.FieldByName('total_disponivel').AsInteger;
              //edtproduto.SetFocus;
            end;
        end;
    end;
  {if (qConsultavalor_total.IsNull = True) or (qConsultavalor_total.AsCurrency = 0) then
    begin
      CalculaTotal;
    end;}
end;

procedure TfrmCadPedidoVendaProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F10 then
    btnSalvar.Click;
end;

procedure TfrmCadPedidoVendaProdutos.FormShow(Sender: TObject);
begin
  inherited;
  if ds.State in [dsInsert] then
    ds.DataSet.FieldByName('cancelado').AsBoolean := False;
  if ds.State in [dsEdit] then
    iQuantidade := ds.DataSet.FieldByName('quantidade').AsInteger;
end;

end.
