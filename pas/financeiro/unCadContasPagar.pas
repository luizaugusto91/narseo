unit unCadContasPagar;

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
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCalendar,
  cxCurrencyEdit, cxCalc, cxMemo, cxCheckBox;

type
  TfrmCadContasPagar = class(TfrmCad)
    lblCodigo: TLabel;
    edtCodigo: TcxDBSpinEdit;
    qConsultacodigo: TIntegerField;
    qConsultaempresa: TIntegerField;
    qConsultadata_registro: TDateTimeField;
    qConsultadata_movimento: TDateField;
    qConsultausuario: TIntegerField;
    qConsultatipo_conta: TIntegerField;
    qConsultavalor: TFloatField;
    qConsultaparcela: TIntegerField;
    qConsultatotal_parcelas: TIntegerField;
    qConsultatipo_pagamento: TIntegerField;
    qConsultacentro_custo: TStringField;
    qConsultavencimento: TDateField;
    qConsultavalor_pgto: TCurrencyField;
    qConsultajuros_porc: TFloatField;
    qConsultajuros: TFloatField;
    qConsultadesconto_porc: TFloatField;
    qConsultadesconto: TCurrencyField;
    qConsultadocumento: TStringField;
    qConsultadata_pgto: TDateField;
    qConsultajuros_dia: TFloatField;
    qConsultacarencia: TIntegerField;
    qConsultapessoa: TIntegerField;
    qConsultadescricao: TStringField;
    qConsultacondicao_pagamento: TIntegerField;
    qConsultaconta_origem: TLargeintField;
    qConsultadesmembrada: TBooleanField;
    qConsultaquitada: TBooleanField;
    qConsultaempresa_referente: TIntegerField;
    qConsultaempresa_origem: TIntegerField;
    qConsultamulta: TFloatField;
    qConsultaobservacoes: TMemoField;
    qConsultanfe: TIntegerField;
    qConsultacd_nfentrada: TIntegerField;
    qConsultachave_nfe: TStringField;
    qConsultaserie: TIntegerField;
    qConsultacnpj: TStringField;
    qConsultadata_agend: TDateField;
    qConsultavezes_agend: TIntegerField;
    qConsultacompra: TIntegerField;
    qConsultamao_de_obra: TBooleanField;
    Label1: TLabel;
    edtdata_registro: TcxDBDateEdit;
    Label2: TLabel;
    edtdata_movimento: TcxDBDateEdit;
    lblusuario: TLabel;
    edtusuario: TcxDBSpinEdit;
    cbbusuario: TcxDBLookupComboBox;
    qPessoas: TUniQuery;
    dsPessoas: TUniDataSource;
    qUsuario: TUniQuery;
    dsUsuario: TUniDataSource;
    lblTipoConta: TLabel;
    edttipo_conta: TcxDBSpinEdit;
    lblValor: TLabel;
    edtvalor: TcxDBCalcEdit;
    lblParcela: TLabel;
    edtparcela: TcxDBSpinEdit;
    lblParcelas: TLabel;
    edttotal_parcelas: TcxDBSpinEdit;
    cbbTipoConta: TcxDBLookupComboBox;
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
    lblcontaorigem: TLabel;
    edtconta_origem: TcxDBSpinEdit;
    cbbdesmembrada: TcxDBCheckBox;
    cbbquitada: TcxDBCheckBox;
    lblCompra: TLabel;
    edtcompra: TcxDBSpinEdit;
    lbldata_pagto: TLabel;
    edtdata_pgto: TcxDBDateEdit;
    lblNFe: TLabel;
    edtnfe: TcxDBSpinEdit;
    lblSerie: TLabel;
    edtserie: TcxDBSpinEdit;
    lblcnpj: TLabel;
    edtcnpj: TcxDBTextEdit;
    grpDetalhesCompra: TGroupBox;
    grpObservacoes: TGroupBox;
    mmoobservacoes: TcxDBMemo;
    qCentroCustos: TUniQuery;
    dsCentroCustos: TUniDataSource;
    qTipoConta: TUniQuery;
    dsTipoConta: TUniDataSource;
    qTipoPagamento: TUniQuery;
    dsTipoPagamento: TUniDataSource;
    lblTipoPagamento: TLabel;
    edttipo_pagamento: TcxDBSpinEdit;
    cbbTipoPagamento: TcxDBLookupComboBox;
    lblChaveNFe: TLabel;
    edtchave_nfe: TcxDBTextEdit;
    qConsultadespesa: TBooleanField;
    cbbdespesa: TcxDBCheckBox;
    procedure FormShow(Sender: TObject);
    procedure edtCredorKeyPress(Sender: TObject; var Key: Char);
    procedure edtparcelaEnter(Sender: TObject);
    procedure edtvencimentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadContasPagar: TfrmCadContasPagar;

implementation

{$R *.dfm}

uses unGridPessoaFornecedor;

procedure TfrmCadContasPagar.edtCredorKeyPress(Sender: TObject; var Key: Char);
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
          CriaFormulario(TfrmGridPessoaFornecedor,0,'CONSULTA',frmGridPessoaFornecedor);
          if Parametros.Find.eValido = True then
            begin
              ds.DataSet.FieldByName('cliente').AsInteger := Parametros.Find.eChave;
              cbbCredor.SetFocus;
            end;
        end;
    end;
end;

procedure TfrmCadContasPagar.edtparcelaEnter(Sender: TObject);
begin
  inherited;
  if (ds.State in [dsInsert]) and ((ds.DataSet.FieldByName('parcela').AsInteger = 0) or (ds.DataSet.FieldByName('parcela').IsNull = True)) then
    begin
      ds.DataSet.FieldByName('parcela').AsInteger := 1;
      ds.DataSet.FieldByName('total_parcelas').AsInteger := 1;
    end;
end;

procedure TfrmCadContasPagar.edtvencimentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ds.State = dsInsert then
    begin
      if (Key = VK_RETURN) and (ds.DataSet.FieldByName('vencimento').IsNull = True) then
        ds.DataSet.FieldByName('vencimento').AsDateTime := Date;
    end;
end;

procedure TfrmCadContasPagar.FormShow(Sender: TObject);
begin
  inherited;
  if ds.State in [dsInsert] then
    begin
      ds.DataSet.FieldByName('empresa').AsInteger := Parametros.cdsParametros.FieldByName('empresa').AsInteger;
      ds.DataSet.FieldByName('usuario').AsInteger := Parametros.cdsParametros.FieldByName('pessoa').AsInteger;
      ds.DataSet.FieldByName('data_movimento').AsDateTime := Date;
    end;
end;

end.
