unit unCadConfigHost;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCad, Vcl.ImgList, cxGraphics, Data.DB,
  MemDS, DBAccess, Uni, Vcl.StdCtrls, Vcl.ExtCtrls, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, cxGroupBox,
  cxRadioGroup, cxDBEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit,
  cxPC, Printers, cxImageComboBox, dxGDIPlusClasses, cxImage, unSystem;

type
  TfrmCadConfigHost = class(TfrmCad)
    dlgPntTermica: TPrintDialog;
    dlgPntDocumento: TPrintDialog;
    dlgPntCFe: TPrintDialog;
    dlgPntSetTermica: TPrinterSetupDialog;
    PageControlEstacao: TcxPageControl;
    tabEstacao: TcxTabSheet;
    grp1: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    cxDBTextEdit22: TcxDBTextEdit;
    cxDBTextEdit23: TcxDBTextEdit;
    cxDBDateEdit2: TcxDBDateEdit;
    btnSearchCertificado: TButton;
    cxDBTextEdit24: TcxDBTextEdit;
    cxDBRadioGroup1: TcxDBRadioGroup;
    btnGetSerial: TButton;
    tabProxy: TcxTabSheet;
    grp6: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    cxDBTextEdit18: TcxDBTextEdit;
    cxDBTextEdit19: TcxDBTextEdit;
    cxDBTextEdit20: TcxDBTextEdit;
    cxDBTextEdit21: TcxDBTextEdit;
    a: TcxTabSheet;
    grp2: TGroupBox;
    lblPrintTermica: TLabel;
    lblPrintPadrao: TLabel;
    lblPrintCFe: TLabel;
    btnPrintTermica: TButton;
    btnPrintPadrao: TButton;
    btnPrintCFe: TButton;
    cbbPrintTermica: TcxDBImageComboBox;
    cbbPrintPadrao: TcxDBImageComboBox;
    cbbPrintCFe: TcxDBImageComboBox;
    OpenDialog: TOpenDialog;
    procedure btnPrintTermicaClick(Sender: TObject);
    procedure btnPrintPadraoClick(Sender: TObject);
    procedure btnPrintCFeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGetSerialClick(Sender: TObject);
    procedure btnSearchCertificadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadConfigHost: TfrmCadConfigHost;

implementation

{$R *.dfm}
uses unConnection, unParametros;

procedure TfrmCadConfigHost.btnGetSerialClick(Sender: TObject);
begin
  inherited;
  ds.DataSet.FieldByName('estacao_serial').AsString := KeyTerminal;
end;

procedure TfrmCadConfigHost.btnPrintCFeClick(Sender: TObject);
var
  i: Integer;
  Printer: TPrinter;
begin
  inherited;
  cbbPrintCFe.Properties.Items.Clear;
  Printer:=TPrinter.Create;
  try
    for i := 0 to Printer.Printers.Count - 1 do
      begin
        with cbbPrintCFe.Properties.Items.Add do
          begin
            Description := Printer.Printers.Strings[i];
            Value := Printer.Printers.Strings[i];
          end;
      end;
  finally
    Printer.free;
  end;
end;

procedure TfrmCadConfigHost.btnPrintPadraoClick(Sender: TObject);
var
  i: Integer;
  Printer: TPrinter;
begin
  inherited;
  cbbPrintPadrao.Properties.Items.Clear;
  Printer:=TPrinter.Create;
  try
    for i := 0 to Printer.Printers.Count - 1 do
      begin
        with cbbPrintPadrao.Properties.Items.Add do
          begin
            Description := Printer.Printers.Strings[i];
            Value := Printer.Printers.Strings[i];
          end;
      end;
  finally
    Printer.free;
  end;
end;

procedure TfrmCadConfigHost.btnPrintTermicaClick(Sender: TObject);
var
  i: Integer;
  Printer: TPrinter;
begin
  inherited;
  cbbPrintTermica.Properties.Items.Clear;
  Printer:=TPrinter.Create;
  try
    for i := 0 to Printer.Printers.Count - 1 do
      begin
        with cbbPrintTermica.Properties.Items.Add do
          begin
            Description := Printer.Printers.Strings[i];
            Value := Printer.Printers.Strings[i];
          end;
      end;
  finally
    Printer.free;
  end;
end;

procedure TfrmCadConfigHost.btnSearchCertificadoClick(Sender: TObject);
begin
  inherited;
  OpenDialog.Title := 'Selecione o Certificado';
  OpenDialog.DefaultExt := '*.pfx';
  OpenDialog.Filter := 'Arquivos PFX (*.pfx)|*.pfx|Todos os Arquivos (*.*)|*.*';
  OpenDialog.InitialDir := ExtractFileDir(application.ExeName);
  if OpenDialog.Execute then
  begin
    try
       qConsulta.FieldByName('certificado_path').AsString := OpenDialog.FileName;
    finally

    end;
  end;
end;

procedure TfrmCadConfigHost.FormShow(Sender: TObject);
begin
  qConsulta.ParamByName('serial').AsString := Parametros.HostInfo.HISerial;
  inherited;
  btnPrintTermica.Click;
  btnPrintPadrao.Click;
  btnPrintCFe.Click;
end;

end.
