unit unBaixaContasPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unBaixa, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, Vcl.ImgList, Data.DB, MemDS,
  DBAccess, Uni, Vcl.StdCtrls, dxGDIPlusClasses, cxImage, Vcl.ExtCtrls,
  cxCurrencyEdit, cxDBEdit, cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxMemo, unSystem,
  unParametros, unConnection;

type
  TfrmBaixaContasPagar = class(TfrmBaixa)
    qConsultacodigo: TIntegerField;
    qConsultacaixa: TIntegerField;
    qConsultaturno: TIntegerField;
    qConsultadata_movimento: TDateField;
    qConsultaoperador_sistema: TIntegerField;
    qConsultamotivo: TStringField;
    qConsultavalor: TCurrencyField;
    qConsultacupom: TIntegerField;
    qConsultadata_hora: TDateTimeField;
    qConsultatipo: TStringField;
    qConsultaoperador_caixa: TIntegerField;
    qConsultatipo_pagamento: TIntegerField;
    qConsultaconta: TIntegerField;
    qConsultaobservacao: TStringField;
    lblCodigo: TLabel;
    edtCodigo: TcxDBSpinEdit;
    Label9: TLabel;
    edtconta: TcxDBSpinEdit;
    Label3: TLabel;
    edtdata_movimento: TcxDBDateEdit;
    Label4: TLabel;
    edtoperador_sistema: TcxDBSpinEdit;
    Label1: TLabel;
    edtvalor: TcxDBCurrencyEdit;
    Label2: TLabel;
    edtdata_hora: TcxDBDateEdit;
    Label6: TLabel;
    edtoperador_caixa: TcxDBSpinEdit;
    Label7: TLabel;
    edttipo_pagamento: TcxDBSpinEdit;
    qPessoas: TUniQuery;
    dsPessoas: TUniDataSource;
    cbbOperador: TcxDBLookupComboBox;
    cbbCaixa: TcxDBLookupComboBox;
    grpObservacao: TGroupBox;
    mmoobservacao: TcxDBMemo;
    qTipoPagamento: TUniQuery;
    dsTipoPagamento: TUniDataSource;
    cbbTipoPagamento: TcxDBLookupComboBox;
    qContas: TUniQuery;
    qSQL: TUniQuery;
    procedure FormShow(Sender: TObject);
    procedure edtvalorEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaixaContasPagar: TfrmBaixaContasPagar;

implementation

{$R *.dfm}

uses unDMCaixaAdm;

procedure TfrmBaixaContasPagar.edtvalorEnter(Sender: TObject);
begin
  inherited;
  if ds.State in [dsInsert] then
    begin
      if (edtvalor.Text = '') or (edtvalor.Value = 0) then
        begin
          ds.DataSet.FieldByName('valor').AsCurrency := qContas.FieldByName('valor').AsCurrency;
        end;
    end;
end;

procedure TfrmBaixaContasPagar.FormShow(Sender: TObject);
begin
  inherited;
  if ds.State in [dsInsert] then
    begin
      qContas.Close;
      qContas.ParamByName('codigo').AsInteger := NConta;
      qContas.Open;
      ds.DataSet.FieldByName('caixa').AsInteger := dmCaixaAdm.GetCaixa;
      ds.DataSet.FieldByName('turno').AsInteger := dmCaixaAdm.GetCaixaTurno;
      ds.DataSet.FieldByName('conta').AsInteger := NConta;
      ds.DataSet.FieldByName('operador_sistema').AsInteger := Parametros.cdsParametros.FieldByName('pessoa').AsInteger;
      ds.DataSet.FieldByName('operador_caixa').AsInteger := dmCaixaAdm.GetCaixaOperador;
      if qContas.FieldByName('despesa').AsBoolean = True then
        begin
          ds.DataSet.FieldByName('tipo').AsString := 'D';
        end
      else
        begin
          ds.DataSet.FieldByName('tipo').AsString := 'C';
        end;
      ds.DataSet.FieldByName('tipo_pagamento').AsInteger := 1;
      ds.DataSet.FieldByName('data_movimento').AsDateTime := Now;
      ds.DataSet.FieldByName('data_hora').AsDateTime := Now;
      qSQL.Close;
    end
end;

end.
