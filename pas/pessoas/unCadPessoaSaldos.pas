unit unCadPessoaSaldos;

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
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxDBEdit, cxCurrencyEdit, cxMemo,
  cxCheckBox, cxDropDownEdit, cxImageComboBox, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;

type
  TfrmCadPessoaSaldos = class(TfrmCad)
    lblCodigo: TLabel;
    edtCodigo: TcxDBSpinEdit;
    qConsultacodigo: TIntegerField;
    qConsultapessoa: TIntegerField;
    qConsultadata_registro: TDateField;
    qConsultatipo_receita: TIntegerField;
    qConsultavalor: TCurrencyField;
    qConsultaparcial: TBooleanField;
    qConsultaorigem: TIntegerField;
    qConsultadescricao: TStringField;
    qConsultamovimento: TIntegerField;
    qConsultaobservacao: TStringField;
    lblTipReceita: TLabel;
    edttipo_receita: TcxDBSpinEdit;
    lblValor: TLabel;
    edtvalor: TcxDBCurrencyEdit;
    lblOrigem: TLabel;
    edtorigem: TcxDBSpinEdit;
    lbldescricao: TLabel;
    edtdescricao: TcxDBTextEdit;
    lblmovimento: TLabel;
    edtmovimento: TcxDBSpinEdit;
    cbbparcial: TcxDBCheckBox;
    grpObservacao: TGroupBox;
    mmoobservacao: TcxDBMemo;
    cbbtipo_conta: TcxDBImageComboBox;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPessoaSaldos: TfrmCadPessoaSaldos;

implementation

{$R *.dfm}

procedure TfrmCadPessoaSaldos.btnSalvarClick(Sender: TObject);
begin
  if ds.State = dsInsert then
    ds.DataSet.FieldByName('pessoa').AsInteger := Settings.ID;
  inherited;
end;

procedure TfrmCadPessoaSaldos.FormShow(Sender: TObject);
begin
  inherited;
  if ds.State in [dsInsert] then
    begin
      ds.DataSet.FieldByName('tipo_receita').AsInteger := 0;
    end;
end;

end.
