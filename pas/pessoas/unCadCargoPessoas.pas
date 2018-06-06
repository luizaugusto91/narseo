unit unCadCargoPessoas;

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
  cxSpinEdit, cxTimeEdit, cxCurrencyEdit, cxMemo, dxGDIPlusClasses, cxImage;

type
  TfrmCadCargoPessoas = class(TfrmCad)
    qConsultadescricao: TStringField;
    qConsultasalario_base: TFloatField;
    qConsultavalor_hora_extra: TFloatField;
    qConsultaseguro_vida: TBooleanField;
    qConsultavale_transporte: TBooleanField;
    qConsultacesta_basica: TBooleanField;
    qConsultaticket: TBooleanField;
    qConsultacarga_horaria: TStringField;
    edtCodigo: TcxDBSpinEdit;
    edtDescricao: TcxDBTextEdit;
    grpConfiguracoes: TGroupBox;
    lblCargaH: TLabel;
    lblCargaHSemana: TLabel;
    lblSalario: TLabel;
    lblHExtra: TLabel;
    chbValeTransporte: TcxDBCheckBox;
    chbTicket: TcxDBCheckBox;
    chbCestaBasica: TcxDBCheckBox;
    chbSeguroVida: TcxDBCheckBox;
    edtSalario: TcxDBCurrencyEdit;
    edtHExtra: TcxDBCurrencyEdit;
    edtCargaHoraria: TcxDBTimeEdit;
    edtCargaHSemana: TcxDBTextEdit;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    FieldConsultacarga_horaria_semana: TStringField;
    FieldConsultacodigo: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCargoPessoas: TfrmCadCargoPessoas;

implementation

{$R *.dfm}

end.
