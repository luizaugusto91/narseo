unit unCadFrota;

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
  cxCalendar, cxDBEdit, cxDropDownEdit, cxCalc, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxMemo, cxCheckBox, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, dxGDIPlusClasses, cxImage;

type
  TfrmCadFrota = class(TfrmCad)
    qConsultacodigo: TIntegerField;
    qConsultatipo: TIntegerField;
    qConsultaplaca: TStringField;
    qConsultaveiculo: TStringField;
    qConsultamotorista: TIntegerField;
    qConsultaultimokm: TFloatField;
    qConsultadata_aquisicao: TDateField;
    qConsultadata_ultimamanutencao: TDateField;
    qConsultadata_venda: TDateField;
    qConsultadata_ultimatrocaoleo: TDateField;
    qConsultainativo: TBooleanField;
    qConsultaobservacao: TMemoField;
    qTipoFrota: TUniQuery;
    dsTipoFrota: TUniDataSource;
    dsMotorista: TUniDataSource;
    qMotorista: TUniQuery;
    qConsultakm_oleomotor: TFloatField;
    qConsultakm_oleocambio: TFloatField;
    qConsultakm_manutencao: TFloatField;
    qConsultaterceiro: TBooleanField;
    qConsultaesporadico: TBooleanField;
    grpObservacao: TGroupBox;
    mmoobservacao: TcxDBMemo;
    grpDatas: TGroupBox;
    lblAquisicao: TLabel;
    lblManutencao: TLabel;
    lblOleo: TLabel;
    lblVenda: TLabel;
    edtAquisicao: TcxDBDateEdit;
    edtManutencao: TcxDBDateEdit;
    edtOleo: TcxDBDateEdit;
    edtVenda: TcxDBDateEdit;
    cbbinativo: TcxDBCheckBox;
    cbbterceiro: TcxDBCheckBox;
    cbbesporadico: TcxDBCheckBox;
    grpPrevencao: TGroupBox;
    lblKmMotor: TLabel;
    lblKmCambio: TLabel;
    lblKmManutencao: TLabel;
    edtKmMotor: TcxDBCalcEdit;
    edtKmCambio: TcxDBCalcEdit;
    edtKmManutencao: TcxDBCalcEdit;
    cbbMotorista: TcxDBLookupComboBox;
    cbbTipo: TcxDBLookupComboBox;
    edtCartao: TcxDBTextEdit;
    edtCodigo: TcxDBSpinEdit;
    edtid: TcxDBTextEdit;
    edtKM: TcxDBCalcEdit;
    edtMotorista: TcxDBSpinEdit;
    edtPlaca: TcxDBTextEdit;
    edtTipo: TcxDBSpinEdit;
    edtVeiculo: TcxDBTextEdit;
    lblCartao: TLabel;
    lblCodigo: TLabel;
    lblid: TLabel;
    lblKM: TLabel;
    lblMotorista: TLabel;
    lblPlaca: TLabel;
    lblTipo: TLabel;
    lblVeiculo: TLabel;
    qConsultatransportadora: TIntegerField;
    qConsultaidentificacao: TStringField;
    qConsultaautomacao: TStringField;
    lblTransportadora: TLabel;
    edttransportadora: TcxDBSpinEdit;
    cbbTransportadora: TcxDBLookupComboBox;
    qTransportadora: TUniQuery;
    dsTransportadora: TUniDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFrota: TfrmCadFrota;

implementation

{$R *.dfm}

end.
