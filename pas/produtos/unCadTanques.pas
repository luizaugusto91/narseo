unit unCadTanques;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCad, Vcl.ImgList, cxGraphics,
  Data.DB, MemDS, DBAccess, Uni, Vcl.StdCtrls, Vcl.ExtCtrls, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCheckBox,
  cxDBEdit, cxTextEdit, cxMaskEdit, cxSpinEdit, cxClasses, dxGaugeCustomScale,
  dxGaugeQuantitativeScale, dxGaugeCircularScale, dxGaugeControl, Vcl.AppEvnts,
  dxGDIPlusClasses, cxImage;

type
  TfrmCadTanques = class(TfrmCad)
    qDepartamentos: TUniQuery;
    dsDepartamentos: TUniDataSource;
    grpDetalhes: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCodigo: TcxDBSpinEdit;
    edtDescricao: TcxDBTextEdit;
    edtdepartamento: TcxDBSpinEdit;
    cbbestoque_negativo: TcxDBCheckBox;
    cbbDepartamento: TcxDBLookupComboBox;
    qConsultacodigo: TIntegerField;
    qConsultanome: TStringField;
    qConsultadepartamento: TIntegerField;
    qConsultaliquido: TBooleanField;
    qConsultaproduto: TLargeintField;
    qConsultacapacidade: TIntegerField;
    qConsultaestoque_negativo: TBooleanField;
    Label4: TLabel;
    edtcapacidade: TcxDBSpinEdit;
    Label5: TLabel;
    cbbUnidade: TcxDBLookupComboBox;
    GaugeControl: TdxGaugeControl;
    GaugeCircularScaleGaugeControlCircularScale: TdxGaugeCircularScale;
    qConsultaquantidade: TFloatField;
    qUnidade: TUniQuery;
    dsUnidade: TUniDataSource;
    qConsultaunidade_medida: TStringField;
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure qConsultaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTanques: TfrmCadTanques;

implementation

{$R *.dfm}

procedure TfrmCadTanques.dsDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if ds.DataSet.State in [dsEdit, dsInsert] then
    begin
      GaugeCircularScaleGaugeControlCircularScale.Visible := False;
    end
  else
    begin
      GaugeCircularScaleGaugeControlCircularScale.Visible := True;
      GaugeCircularScaleGaugeControlCircularScale.MinValue := 0;
      GaugeCircularScaleGaugeControlCircularScale.MaxValue := qConsultacapacidade.AsInteger;
      GaugeCircularScaleGaugeControlCircularScale.Value := qConsultaquantidade.AsInteger;
    end;
end;

procedure TfrmCadTanques.qConsultaBeforePost(DataSet: TDataSet);
begin
  inherited;
  qConsultaliquido.AsBoolean := True;
end;

end.
