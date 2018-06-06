unit unCadAberturaCaixa;

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
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCalc,
  cxDBEdit, cxSpinEdit, cxTextEdit, cxMaskEdit, cxCalendar, cxMemo, unSystem,
  unParametros, unFields;

type
  TfrmCadAberturaCaixa = class(TfrmCad)
    qConsultacodigo: TIntegerField;
    qConsultadata_caixa: TDateField;
    qConsultaturno: TIntegerField;
    qConsultaempresa: TIntegerField;
    qConsultaoperador_sistema: TIntegerField;
    qConsultaabertura: TDateTimeField;
    qConsultatroco_inicial: TFloatField;
    qConsultaoperador_caixa: TIntegerField;
    qConsultaobs: TStringField;
    lblData: TLabel;
    edtdata_caixa: TcxDBDateEdit;
    lblOperador: TLabel;
    edtoperador_caixa: TcxDBSpinEdit;
    lblTrocoInicial: TLabel;
    edttroco_inicial: TcxDBCalcEdit;
    lblTurno: TLabel;
    edtturno: TcxDBSpinEdit;
    cbbOperador: TcxDBLookupComboBox;
    grpObservacao: TGroupBox;
    mmoObservacao: TcxDBMemo;
    qOperador: TUniQuery;
    dsOperador: TUniDataSource;
    procedure FormShow(Sender: TObject);
    procedure edtoperador_caixaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadAberturaCaixa: TfrmCadAberturaCaixa;

implementation

{$R *.dfm}

uses unGridPessoaFuncionario, unDMCaixaAdm;

procedure TfrmCadAberturaCaixa.edtoperador_caixaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    begin
      if (edtoperador_caixa.Value > 0) then
        begin
          cbbOperador.SetFocus;
        end
      else
        begin
          CriaFormulario(TfrmGridPessoaFuncionario,0,'CONSULTA',frmGridPessoaFuncionario);
          if Parametros.Find.eValido = True then
            begin
              ds.DataSet.FieldByName('operador_caixa').AsInteger := Parametros.Find.eChave;
              edtturno.SetFocus;
            end;
        end;
    end;
end;

procedure TfrmCadAberturaCaixa.FormShow(Sender: TObject);
begin
  inherited;
  if ds.State in [dsInsert] then
    begin
      ds.DataSet.FieldByName('empresa').AsInteger := Parametros.cdsParametros.FieldByName('empresa').AsInteger;
      ds.DataSet.FieldByName('operador_sistema').AsInteger := Parametros.cdsParametros.FieldByName('pessoa').AsInteger;
      ds.DataSet.FieldByName('data_caixa').AsDateTime := Now;
      ds.DataSet.FieldByName('turno').AsInteger := dmCaixaAdm.GetCaixaTurno + 1;
      ds.DataSet.FieldByName('troco_inicial').AsCurrency := 0;
    end;
end;

end.
