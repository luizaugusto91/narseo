unit unCadDepartamentoPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCad, Vcl.ImgList, cxGraphics, Data.DB,
  MemDS, DBAccess, Uni, Vcl.StdCtrls, Vcl.ExtCtrls, cxControls, cxLookAndFeels,
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
  cxCheckBox, cxDBEdit, cxDropDownEdit, cxCalc, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxTimeEdit, cxCurrencyEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxMemo, dxGDIPlusClasses, cxImage;

type
  TfrmCadDepartamentoPessoas = class(TfrmCad)
    qConsultacodigo: TIntegerField;
    qConsultanome: TStringField;
    qConsultadescricao: TStringField;
    qConsultaturno_inicio: TTimeField;
    qConsultaturno_fim: TTimeField;
    qConsultaresponsavel: TIntegerField;
    qConsultadesativado: TBooleanField;
    qResponsavel: TUniQuery;
    dsResponsavel: TUniDataSource;
    lblCodigo: TLabel;
    edtCodigo: TcxDBSpinEdit;
    lblNome: TLabel;
    edtNome: TcxDBTextEdit;
    lblDescricao: TLabel;
    edtDescricao: TcxDBTextEdit;
    lblResposavel: TLabel;
    edtResponsavel: TcxDBSpinEdit;
    cbbResponsavel: TcxDBLookupComboBox;
    grpConfiguracoes: TGroupBox;
    lblCargaH: TLabel;
    lblCargaHSemana: TLabel;
    edtTurnoInicio: TcxDBTimeEdit;
    edtTurnoTermino: TcxDBTimeEdit;
    chbInativo: TcxDBCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadDepartamentoPessoas: TfrmCadDepartamentoPessoas;

implementation

{$R *.dfm}

end.
