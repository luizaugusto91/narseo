unit unCadGrupoPessoas;

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
  cxCalc, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGroupBox,
  cxRadioGroup, dxGDIPlusClasses, cxImage;

type
  TfrmCadGrupoPessoas = class(TfrmCad)
    edtCodigo: TcxDBSpinEdit;
    edtDescricao: TcxDBTextEdit;
    grpConfiguracoes: TGroupBox;
    lblMotivoBloqueio: TLabel;
    lblTabelaPreco: TLabel;
    lblPrecosFatura: TLabel;
    lblFormaPgto: TLabel;
    lblLimite: TLabel;
    chbBloqueado: TcxDBCheckBox;
    edtMotivoBloqueio: TcxDBTextEdit;
    edtTabelaPreco: TcxDBSpinEdit;
    edtPrecosFatura: TcxDBSpinEdit;
    edtFormaPgto: TcxDBSpinEdit;
    edtLimite: TcxDBCalcEdit;
    cbbTabelaPrecos: TcxDBLookupComboBox;
    cbbTabelaFatura: TcxDBLookupComboBox;
    cbbFormaPgto: TcxDBLookupComboBox;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    rgTipoGrupo: TcxDBRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadGrupoPessoas: TfrmCadGrupoPessoas;

implementation

{$R *.dfm}

end.
