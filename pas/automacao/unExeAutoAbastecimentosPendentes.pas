unit unExeAutoAbastecimentosPendentes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unExe, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, Vcl.ImgList, Data.DB, MemDS,
  DBAccess, Uni, Vcl.StdCtrls, dxGDIPlusClasses, cxImage, Vcl.ExtCtrls,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxDBEdit, cxTimeEdit, cxCalendar,
  cxDropDownEdit, cxCalc, cxCheckBox, unSystem;

type
  TfrmExeAutoAbastecimentosPendentes = class(TfrmExe)
    lblCodigo: TLabel;
    edtCodigo: TcxDBSpinEdit;
    grpBaixa: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    edtplaca: TcxDBTextEdit;
    edtkm: TcxDBTextEdit;
    cbbTrocaOleo: TcxDBCheckBox;
    Label7: TLabel;
    edtencerrante_final: TcxDBCalcEdit;
    edtencerrante_inicial: TcxDBCalcEdit;
    Label6: TLabel;
    Label2: TLabel;
    edtbomba: TcxDBTextEdit;
    Label1: TLabel;
    edtbico: TcxDBTextEdit;
    Label3: TLabel;
    edtquantidade: TcxDBCalcEdit;
    edtdata: TcxDBDateEdit;
    Label4: TLabel;
    edthora: TcxDBTimeEdit;
    Label5: TLabel;
    edtcombustivel: TcxDBTextEdit;
    Label8: TLabel;
    qConsultacodigo: TIntegerField;
    qConsultanr_logico: TStringField;
    qConsultaidbico: TIntegerField;
    qConsultabico: TStringField;
    qConsultabomba: TStringField;
    qConsultaquantidade: TFloatField;
    qConsultapreco_unitario: TFloatField;
    qConsultavalor: TFloatField;
    qConsultadata: TDateField;
    qConsultahora: TTimeField;
    qConsultaencerrante_inicial: TFloatField;
    qConsultaencerrante_final: TFloatField;
    qConsultatarget_id: TIntegerField;
    qConsultapunp_id: TIntegerField;
    qConsultaprocesso_date: TDateTimeField;
    qConsultakm: TFloatField;
    qConsultaplaca: TStringField;
    qConsultamanual: TBooleanField;
    qConsultatroca_oleo: TBooleanField;
    qConsultacombustivel: TStringField;
    qSQL: TUniQuery;
    procedure FormShow(Sender: TObject);
    procedure edtplacaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExeAutoAbastecimentosPendentes: TfrmExeAutoAbastecimentosPendentes;

implementation

{$R *.dfm}

procedure TfrmExeAutoAbastecimentosPendentes.edtplacaExit(Sender: TObject);
begin
  inherited;
  // Valida a placa informada
  if edtplaca.Text <> '' then
    begin
      qSQL.ParamByName('placa').AsString := ds.DataSet.FieldByName('placa').AsString;
      qSQL.Open;
      if qSQL.RecordCount > 0 then
        begin
          if qSQL.FieldByName('inativo').AsBoolean = True then
            begin
              Aviso('WARN','Informação','A Placa informada ' + edtplaca.Text + ', se encontra INATIVA no cadastro de Frotas.'+#13+'Verifique o cadastro e tente novamente.');
              ds.DataSet.FieldByName('placa').AsString := '';
              edtplaca.Clear;
              Abort;
            end;
        end
      else
        begin
          Aviso('WARN','Informação','A Placa informada ' + edtplaca.Text + ', não se encontra no cadastro de Frotas.'+#13+'Verifique o cadastro e tente novamente.');
          ds.DataSet.FieldByName('placa').AsString := '';
          edtplaca.Clear;
          Abort;
        end;
    end;
end;

procedure TfrmExeAutoAbastecimentosPendentes.FormShow(Sender: TObject);
begin
  inherited;
  edtplaca.SetFocus;
end;

end.
