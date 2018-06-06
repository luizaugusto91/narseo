unit unNewVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unNew, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, cxMemo, cxDBEdit,
  cxDropDownEdit, cxCalendar, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxTextEdit, cxMaskEdit, cxSpinEdit, Data.DB, DBAccess, Uni, MemDS,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.ExtCtrls, unSystem, unParametros;

type
  TfrmNewVendas = class(TfrmNew)
    lblCodigo: TLabel;
    edtCodigo: TcxDBSpinEdit;
    Label1: TLabel;
    edtCliente: TcxDBSpinEdit;
    cbbCliente: TcxDBLookupComboBox;
    Label2: TLabel;
    edtrepresentante: TcxDBSpinEdit;
    cbbRepresentante: TcxDBLookupComboBox;
    Label4: TLabel;
    edtdata_compra: TcxDBDateEdit;
    Label3: TLabel;
    edtprevisao_entrega: TcxDBDateEdit;
    grpObservacao: TGroupBox;
    mmoobservacao: TcxDBMemo;
    qRepresentante: TUniQuery;
    dsRepresentante: TUniDataSource;
    qCliente: TUniQuery;
    dsCliente: TUniDataSource;
    lblPedido: TLabel;
    edtPedido: TcxDBSpinEdit;
    qConsultacodigo: TIntegerField;
    qConsultaempresa: TIntegerField;
    qConsultapedido: TIntegerField;
    qConsultacliente: TIntegerField;
    qConsultarepresentante: TIntegerField;
    qConsultadata_registro: TDateTimeField;
    qConsultaprevisao_entrega: TDateField;
    qConsultadata_venda: TDateTimeField;
    qConsultadata_entrega: TDateField;
    qConsultastatus: TStringField;
    qConsultaobservacao: TMemoField;
    procedure btnAvancarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure edtrepresentanteKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNewVendas: TfrmNewVendas;

implementation

{$R *.dfm}

uses unCadPedidoVendas, unGridPessoaCliente, unGridPessoaRepresentante;

procedure TfrmNewVendas.btnAvancarClick(Sender: TObject);
begin
  inherited;
  ActAvancar(TfrmCadPedidoVendas,frmCadPedidoVendas);
  Close;
end;

procedure TfrmNewVendas.edtClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    begin
      if (edtCliente.Value > 0) then
        begin
          cbbCliente.SetFocus;
        end
      else
        begin
          CriaFormulario(TfrmGridPessoaCliente,0,'CONSULTA',frmGridPessoaCliente);
          if Parametros.Find.eValido = True then
            begin
              ds.DataSet.FieldByName('cliente').AsInteger := Parametros.Find.eChave;
              cbbCliente.SetFocus;
            end;
        end;
    end;
end;

procedure TfrmNewVendas.edtrepresentanteKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    begin
      if (edtrepresentante.Value > 0) then
        begin
          cbbRepresentante.SetFocus;
        end
      else
        begin
          CriaFormulario(TfrmGridPessoaRepresentante,0,'CONSULTA',frmGridPessoaRepresentante);
          if Parametros.Find.eValido = True then
            begin
              ds.DataSet.FieldByName('representante').AsInteger := Parametros.Find.eChave;
              cbbRepresentante.SetFocus;
            end;
        end;
    end;
end;

procedure TfrmNewVendas.FormShow(Sender: TObject);
begin
  qSQL.ParamByName('sequencial').AsString := 'vendas_codigo_seq';
  inherited;
  edtCliente.SetFocus;
  ds.DataSet.FieldByName('data_venda').AsDateTime := Date;
end;

end.
