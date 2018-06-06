unit unCadTipoFrota;

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
  cxCheckBox, cxDBEdit, cxTextEdit, cxMaskEdit, cxSpinEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCalc, dxGDIPlusClasses,
  cxImage;

type
  TfrmCadTipoFrota = class(TfrmCad)
    qConsultacodigo: TIntegerField;
    qConsultadescricao: TStringField;
    qConsultabloqueado: TBooleanField;
    qUnidade: TUniQuery;
    dsUnidade: TUniDataSource;
    qConsultacarregamento_unidade: TStringField;
    cbbUnidade: TcxDBLookupComboBox;
    chbBloqueado: TcxDBCheckBox;
    edtCodigo: TcxDBSpinEdit;
    edtDescricao: TcxDBTextEdit;
    edtUnCarregamento: TcxDBTextEdit;
    lblCapacidade: TLabel;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    lblUnidade: TLabel;
    qConsultacarregamento_capacidade: TFloatField;
    edtcarregamento_capacidade: TcxDBCalcEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoFrota: TfrmCadTipoFrota;

implementation

{$R *.dfm}

end.
