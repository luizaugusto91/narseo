unit unCadVendaProdutos;

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
  unSystem, unParametros;

type
  TfrmCadVendaProdutos = class(TfrmCad)
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
    edtentregue: TcxDBSpinEdit;
    cbbProduto: TcxDBLookupComboBox;
    Label6: TLabel;
    edtacrescimo_unitario: TcxDBCurrencyEdit;
    Label7: TLabel;
    edtdesconto_unitario: TcxDBCurrencyEdit;
    qProduto: TUniQuery;
    dsProduto: TUniDataSource;
    qSQL: TUniQuery;
    qConsultacodigo: TIntegerField;
    qConsultavenda: TIntegerField;
    qConsultaitem_pedido: TIntegerField;
    qConsultaproduto: TIntegerField;
    qConsultavalor_unitario: TCurrencyField;
    qConsultadesconto_unitario: TCurrencyField;
    qConsultaacrescimo_unitario: TCurrencyField;
    qConsultaquantidade: TFloatField;
    qConsultadesconto_total: TCurrencyField;
    qConsultaacrescimo_total: TCurrencyField;
    qConsultavalor_total: TCurrencyField;
    qConsultaentregue: TFloatField;
    qConsultavalor_entregue: TCurrencyField;
    qConsultacancelado: TBooleanField;
    lbldesconto_total: TLabel;
    edtdesconto_total: TcxDBCurrencyEdit;
    lblacrescimo_total: TLabel;
    edtacrescimo_total: TcxDBCurrencyEdit;
    cbbCancelado: TcxDBCheckBox;
    lblvalor_entregue: TLabel;
    edtvalor_entregue: TcxDBCurrencyEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure edtprodutoExit(Sender: TObject);
    procedure edtquantidadeExit(Sender: TObject);
    procedure edtacrescimo_unitarioExit(Sender: TObject);
    procedure edtdesconto_unitarioExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtprodutoKeyPress(Sender: TObject; var Key: Char);
    procedure edtacrescimo_totalExit(Sender: TObject);
    procedure edtdesconto_totalExit(Sender: TObject);
    procedure edtentregueExit(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CalculaTotalUnitario;
    procedure CalculaTotal;
    { Public declarations }
  end;

var
  frmCadVendaProdutos: TfrmCadVendaProdutos;

implementation

{$R *.dfm}

uses unGridProdutos;

procedure TfrmCadVendaProdutos.btnSalvarClick(Sender: TObject);
begin
  ds.DataSet.FieldByName('codigo').AsInteger := Settings.ID;
  inherited;
end;

procedure TfrmCadVendaProdutos.CalculaTotal;
var
  vrUnitario, DescontoU, AcrescimoU, Total, Qtde: Double;
begin
  // Calcula pelos Totais.
  if (ds.State in [dsEdit, dsInsert]) and (qConsultacancelado.AsBoolean = False) then
    begin
      Qtde := qConsultaquantidade.AsFloat;
      AcrescimoU := qConsultaacrescimo_total.AsCurrency / Qtde;
      DescontoU := qConsultadesconto_total.AsCurrency / Qtde;
      Total := (qConsultavalor_unitario.AsCurrency * Qtde) + qConsultaacrescimo_total.AsCurrency - qConsultadesconto_total.AsCurrency;
      qConsultaacrescimo_unitario.AsCurrency := AcrescimoU;
      qConsultadesconto_unitario.AsCurrency := DescontoU;
      qConsultavalor_total.AsCurrency := Total;
    end;
end;

procedure TfrmCadVendaProdutos.CalculaTotalUnitario;
var
  vrUnitario, DescontoT, AcrescimoT, Total: Double;
begin
  // Calcula pelos Unitarios.
  if (ds.State in [dsEdit, dsInsert]) and (qConsultacancelado.AsBoolean = False) then
    begin
      vrUnitario := qConsultavalor_unitario.AsCurrency + qConsultaacrescimo_unitario.AsCurrency - qConsultadesconto_unitario.AsCurrency;
      AcrescimoT := qConsultaquantidade.AsFloat * qConsultaacrescimo_unitario.AsCurrency;
      DescontoT := qConsultaquantidade.AsFloat * qConsultadesconto_unitario.AsCurrency;
      Total := qConsultaquantidade.AsFloat * vrUnitario;
      qConsultaacrescimo_total.AsCurrency := AcrescimoT;
      qConsultadesconto_total.AsCurrency := DescontoT;
      qConsultavalor_total.AsCurrency := Total;
    end;
end;

procedure TfrmCadVendaProdutos.edtacrescimo_totalExit(Sender: TObject);
begin
  inherited;
  CalculaTotal;
  grpContentExit(Self);
end;

procedure TfrmCadVendaProdutos.edtacrescimo_unitarioExit(Sender: TObject);
begin
  inherited;
  CalculaTotalUnitario;
  grpContentExit(Self);
end;

procedure TfrmCadVendaProdutos.edtdesconto_totalExit(Sender: TObject);
begin
  inherited;
  CalculaTotal;
  grpContentExit(Self);
end;

procedure TfrmCadVendaProdutos.edtdesconto_unitarioExit(Sender: TObject);
begin
  inherited;
  CalculaTotalUnitario;
  grpContentExit(Self);
end;

procedure TfrmCadVendaProdutos.edtentregueExit(Sender: TObject);
var
  vrUnitario, Total: Double;
begin
  inherited;
  if ds.State in [dsInsert,dsEdit] then
    begin
      // Calcula o valor do produto pela quantidade entregue.
      vrUnitario := qConsultavalor_unitario.AsCurrency + qConsultaacrescimo_unitario.AsCurrency - qConsultadesconto_unitario.AsCurrency;
      Total := qConsultaentregue.AsFloat * vrUnitario;
      qConsultavalor_entregue.AsCurrency := Total;
    end;
end;

procedure TfrmCadVendaProdutos.edtprodutoExit(Sender: TObject);
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
        end
    end;
end;

procedure TfrmCadVendaProdutos.edtprodutoKeyPress(Sender: TObject;
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

procedure TfrmCadVendaProdutos.edtquantidadeExit(Sender: TObject);
var Minimo, Negativo: Boolean;
begin
  inherited;
  // ============== ESTE CODIGO PRECISA SER REFATORADO =========================
  // Verifica se o estoque esta abaixo do minimo.
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
          CalculaTotalUnitario;
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
              CalculaTotalUnitario;
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
                  CalculaTotalUnitario;
                end;
            end
          else
            begin
              Aviso('STOP','Aviso','O produto selecionado n�o permite estoque negativo.'+#13+'Opera��o cancelada.');
              ds.DataSet.FieldByName('produto').AsInteger := 0;
              ds.DataSet.FieldByName('quantidade').AsInteger := 0;
              edtproduto.SetFocus;
            end;
        end;
    end;
  {if (qConsultavalor_total.IsNull = True) or (qConsultavalor_total.AsCurrency = 0) then
    begin
      CalculaTotal;
    end;}
end;

procedure TfrmCadVendaProdutos.FormShow(Sender: TObject);
begin
  inherited;
  if ds.State in [dsInsert] then
    ds.DataSet.FieldByName('cancelado').AsBoolean := False;
end;

end.
