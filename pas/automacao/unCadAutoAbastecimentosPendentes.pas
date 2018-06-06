unit unCadAutoAbastecimentosPendentes;

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
  DBAccess, Uni, Vcl.StdCtrls, dxGDIPlusClasses, cxImage, Vcl.ExtCtrls,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxDBEdit, cxCalendar, cxTimeEdit,
  cxDropDownEdit, cxCalc, cxCheckBox, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, unSystem;

type
  TfrmCadAutoAbastecimentosPendentes = class(TfrmCad)
    lblCodigo: TLabel;
    edtCodigo: TcxDBSpinEdit;
    Label3: TLabel;
    edtquantidade: TcxDBCalcEdit;
    Label4: TLabel;
    edthora: TcxDBTimeEdit;
    Label5: TLabel;
    edtdata: TcxDBDateEdit;
    Label6: TLabel;
    edtencerrante_inicial: TcxDBCalcEdit;
    Label7: TLabel;
    edtencerrante_final: TcxDBCalcEdit;
    Label8: TLabel;
    grpBaixa: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    cbbTrocaOleo: TcxDBCheckBox;
    cbbBico: TcxDBLookupComboBox;
    qConsultacodigo: TIntegerField;
    qConsultabico: TStringField;
    qConsultaquantidade: TFloatField;
    qConsultadata: TDateField;
    qConsultahora: TTimeField;
    qConsultaencerrante_inicial: TFloatField;
    qConsultaencerrante_final: TFloatField;
    qConsultaprocesso_date: TDateTimeField;
    qConsultaplaca: TStringField;
    qConsultakm: TFloatField;
    qConsultatroca_oleo: TBooleanField;
    edtplaca: TcxDBTextEdit;
    edtkm: TcxDBCalcEdit;
    qBicos: TUniQuery;
    dsBico: TUniDataSource;
    qSQL: TUniQuery;
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtplacaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadAutoAbastecimentosPendentes: TfrmCadAutoAbastecimentosPendentes;

implementation

{$R *.dfm}

procedure TfrmCadAutoAbastecimentosPendentes.btnSalvarClick(Sender: TObject);
begin
  ds.DataSet.FieldByName('manual').AsBoolean := True;
  inherited;
end;

procedure TfrmCadAutoAbastecimentosPendentes.edtplacaExit(Sender: TObject);
begin
  inherited;
  // Valida a placa informada
  if edtplaca.Text <> '' then
    begin
      qSQL.ParamByName('placa').AsString := edtplaca.Text;
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

procedure TfrmCadAutoAbastecimentosPendentes.FormShow(Sender: TObject);
begin
  inherited;
  cbbBico.SetFocus;
end;

end.
