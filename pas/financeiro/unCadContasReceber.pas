unit unCadContasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCad, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, Vcl.ImgList, Data.DB, MemDS,
  DBAccess, Uni, Vcl.StdCtrls, dxGDIPlusClasses, cxImage, Vcl.ExtCtrls, unSystem,
  unParametros, unConnection, cxTextEdit, cxMaskEdit, cxSpinEdit, cxDBEdit,
  cxCheckBox, cxCurrencyEdit, cxCalc, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxCalendar, cxMemo, cxImageComboBox;

type
  TfrmCadContasReceber = class(TfrmCad)
    lblCodigo: TLabel;
    edtCodigo: TcxDBSpinEdit;
    qConsultacodigo: TIntegerField;
    qConsultaempresa: TIntegerField;
    qConsultadata_registro: TDateTimeField;
    qConsultadata_movimento: TDateField;
    qConsultatipo_conta: TIntegerField;
    qConsultavenda: TIntegerField;
    qConsultausuario: TIntegerField;
    qConsultavalor: TCurrencyField;
    qConsultaparcela: TIntegerField;
    qConsultatotal_parcelas: TIntegerField;
    qConsultatipo_pagamento: TIntegerField;
    qConsultacentro_custo: TMemoField;
    qConsultavencimento: TDateField;
    qConsultavalor_corrigido: TCurrencyField;
    qConsultajuros_porc: TFloatField;
    qConsultajuros_valor: TCurrencyField;
    qConsultadesconto_porc: TFloatField;
    qConsultadesconto_valor: TCurrencyField;
    qConsultadocumento: TStringField;
    qConsultadata_recebimento: TDateField;
    qConsultajuros_dia: TFloatField;
    qConsultacarencia: TIntegerField;
    qConsultapessoa: TIntegerField;
    qConsultadescricao: TStringField;
    qConsultacondicao_pagamento: TIntegerField;
    qConsultastatus: TStringField;
    qConsultaquitada: TBooleanField;
    qConsultamulta: TFloatField;
    qConsultaobservacoes: TMemoField;
    qConsultanfe: TIntegerField;
    qConsultacnpj: TMemoField;
    qConsultamesclado_para: TIntegerField;
    qConsultatipo: TIntegerField;
    qConsultacupom: TIntegerField;
    qConsultafatura: TBooleanField;
    qConsultagerado_titulo: TBooleanField;
    qConsultagerar_boleto: TBooleanField;
    qConsultamao_de_obra: TBooleanField;
    qConsultacd_fatura: TLargeintField;
    qConsultaobs_comanda: TMemoField;
    qConsultacomanda: TIntegerField;
    qConsultapara_quitar: TBooleanField;
    qConsultaparcial: TIntegerField;
    qConsultavalor_original: TFloatField;
    qConsultafatura_acresc: TFloatField;
    qConsultafatura_cred: TFloatField;
    qConsultafatura_desc: TFloatField;
    qConsultafatura_tipo: TIntegerField;
    qConsultanunca_titulo: TBooleanField;
    qConsultaconta_original: TIntegerField;
    qPessoas: TUniQuery;
    dsPessoas: TUniDataSource;
    qUsuario: TUniQuery;
    dsUsuario: TUniDataSource;
    qCentroCustos: TUniQuery;
    dsCentroCustos: TUniDataSource;
    qTipoConta: TUniQuery;
    dsTipoConta: TUniDataSource;
    qTipoPagamento: TUniQuery;
    dsTipoPagamento: TUniDataSource;
    Label1: TLabel;
    edtdata_registro: TcxDBDateEdit;
    Label2: TLabel;
    edtdata_movimento: TcxDBDateEdit;
    lblusuario: TLabel;
    edtusuario: TcxDBSpinEdit;
    cbbusuario: TcxDBLookupComboBox;
    lblTipoConta: TLabel;
    edttipo_conta: TcxDBSpinEdit;
    cbbTipoConta: TcxDBLookupComboBox;
    lblValor: TLabel;
    edtvalor: TcxDBCalcEdit;
    lblParcela: TLabel;
    edtparcela: TcxDBSpinEdit;
    lblParcelas: TLabel;
    edttotal_parcelas: TcxDBSpinEdit;
    lblVencimento: TLabel;
    edtvencimento: TcxDBDateEdit;
    lbldocumento: TLabel;
    edtdocumento: TcxDBTextEdit;
    lbljuros_porc: TLabel;
    edtjuros_porc: TcxDBCalcEdit;
    lbljuros: TLabel;
    edtjuros: TcxDBCalcEdit;
    lbldesconto_porc: TLabel;
    edtdesconto_porc: TcxDBCalcEdit;
    lbldesconto: TLabel;
    edtdesconto: TcxDBCurrencyEdit;
    lblMoraDia: TLabel;
    edtMoraDia: TcxDBCalcEdit;
    lblCarencia: TLabel;
    edtcarencia: TcxDBSpinEdit;
    lblCredor: TLabel;
    edtCredor: TcxDBSpinEdit;
    cbbCredor: TcxDBLookupComboBox;
    lblDescricao: TLabel;
    edtdescricao: TcxDBTextEdit;
    lblcentrocustos: TLabel;
    edtcentro_custo: TcxDBTextEdit;
    cbbCentroCustos: TcxDBLookupComboBox;
    lblTipoPagamento: TLabel;
    edttipo_pagamento: TcxDBSpinEdit;
    cbbTipoPagamento: TcxDBLookupComboBox;
    lblcontaorigem: TLabel;
    edtFaturamento: TcxDBSpinEdit;
    lblCompra: TLabel;
    edtvenda: TcxDBSpinEdit;
    lbldata_pagto: TLabel;
    edtdata_recebimento: TcxDBDateEdit;
    cbbquitada: TcxDBCheckBox;
    lblNFe: TLabel;
    edtnfe: TcxDBSpinEdit;
    lblSerie: TLabel;
    edtserie: TcxDBSpinEdit;
    lblcnpj: TLabel;
    edtcnpj: TcxDBTextEdit;
    lblContaOriginal: TLabel;
    edtconta_original: TcxDBSpinEdit;
    lblvalor_corrigido: TLabel;
    edtvalor_corrigido: TcxDBCurrencyEdit;
    cbbfatura: TcxDBCheckBox;
    cbbgerado_titulo: TcxDBCheckBox;
    cbbgerar_boleto: TcxDBCheckBox;
    grpDetalhesCompra: TGroupBox;
    grpObservacoes: TGroupBox;
    mmoobservacoes: TcxDBMemo;
    qVenda: TUniQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    qConsultapedido: TIntegerField;
    qConsultacliente: TIntegerField;
    qConsultarepresentante: TIntegerField;
    DateTimeField1: TDateTimeField;
    qConsultaprevisao_entrega: TDateField;
    qConsultadata_venda: TDateTimeField;
    qConsultadata_entrega: TDateField;
    StringField1: TStringField;
    qConsultaobservacao: TMemoField;
    qConsultatotal_pedido: TCurrencyField;
    qConsultatotal_produtos: TCurrencyField;
    qConsultaconcluido: TBooleanField;
    qConsultaentregue: TBooleanField;
    qConsultaliquidado: TBooleanField;
    dsVenda: TUniDataSource;
    Label3: TLabel;
    edtrepresentante: TcxDBSpinEdit;
    Label7: TLabel;
    cbbstatus: TcxDBImageComboBox;
    Label4: TLabel;
    edtprevisao_entrega: TcxDBDateEdit;
    Label6: TLabel;
    edtdata_entrega: TcxDBDateEdit;
    lbltotal_produtos: TLabel;
    edttotal_produtos: TcxDBCurrencyEdit;
    Label8: TLabel;
    edttotal_pedido: TcxDBCurrencyEdit;
    cbbconcluido: TcxDBCheckBox;
    cbbentregue: TcxDBCheckBox;
    cbbliquidado: TcxDBCheckBox;
    cbbRepresentante: TcxDBLookupComboBox;
    qRepresentante: TUniQuery;
    dsRepresentante: TUniDataSource;
    procedure FormShow(Sender: TObject);
    procedure edtCredorKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtvencimentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadContasReceber: TfrmCadContasReceber;

implementation

{$R *.dfm}

uses unGridPessoaCliente;

procedure TfrmCadContasReceber.btnSalvarClick(Sender: TObject);
begin
  if ds.State = dsInsert then
    ds.DataSet.FieldByName('valor_corrigido').AsCurrency := ds.DataSet.FieldByName('valor').AsCurrency;
  inherited;
end;

procedure TfrmCadContasReceber.edtCredorKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    begin
      if (edtCredor.Value > 0) then
        begin
          edtCredor.SetFocus;
        end
      else
        begin
          CriaFormulario(TfrmGridPessoaCliente,0,'CONSULTA',frmGridPessoaCliente);
          if Parametros.Find.eValido = True then
            begin
              ds.DataSet.FieldByName('cliente').AsInteger := Parametros.Find.eChave;
              cbbCredor.SetFocus;
            end;
        end;
    end;
end;

procedure TfrmCadContasReceber.edtvencimentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ds.State = dsInsert then
    begin
      if (Key = VK_RETURN) and (ds.DataSet.FieldByName('vencimento').IsNull = True) then
        ds.DataSet.FieldByName('vencimento').AsDateTime := Date;
    end;
end;

procedure TfrmCadContasReceber.FormShow(Sender: TObject);
begin
  inherited;
  if ds.State in [dsInsert] then
    begin
      ds.DataSet.FieldByName('empresa').AsInteger := Parametros.cdsParametros.FieldByName('empresa').AsInteger;
      ds.DataSet.FieldByName('usuario').AsInteger := Parametros.cdsParametros.FieldByName('pessoa').AsInteger;
      ds.DataSet.FieldByName('data_movimento').AsDateTime := Date;
      ds.DataSet.FieldByName('parcela').AsInteger := 1;
      ds.DataSet.FieldByName('total_parcelas').AsInteger := 1;
      ds.DataSet.FieldByName('status').AsString := 'A';
    end;
end;

end.
