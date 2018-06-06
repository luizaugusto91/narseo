unit unSystemConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, IniFiles,
  unSystem, unParametros, cxGraphics, cxControls, cxLookAndFeels,
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
  dxGDIPlusClasses, cxImage;

type
  TfrmSystemConfig = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSalvar: TButton;
    Label9: TLabel;
    Label10: TLabel;
    Button1: TButton;
    lblCopy: TLabel;
    pnlEsquerdo: TPanel;
    pnlDireito: TPanel;
    grpConfig: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    edtServidor: TEdit;
    edtPort: TEdit;
    edtBase: TEdit;
    edtMasterUser: TEdit;
    edtMasterPass: TEdit;
    edtAutomacao: TEdit;
    edtAutoPort: TEdit;
    edtPrinter: TEdit;
    chkLog: TCheckBox;
    imgTagLogo: TcxImage;
    procedure btnSalvarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edtPortKeyPress(Sender: TObject; var Key: Char);
    procedure edtBaseKeyPress(Sender: TObject; var Key: Char);
    procedure edtAutomacaoKeyPress(Sender: TObject; var Key: Char);
    procedure edtServidorKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Zero :Boolean;
  public
    { Public declarations }
  end;

var
  frmSystemConfig: TfrmSystemConfig;

implementation

{$R *.dfm}
uses unConnection;

procedure TfrmSystemConfig.btnSalvarClick(Sender: TObject);
begin
  // Registra as Configurações do Sistema
  if Parametros.SystemConfig.ASSystemConf = True then
    begin
      Try
        if Connection.Conn.Connected = True then
          begin
            Connection.Conn.Connected := False;
          end;
        if Zero = True then
          begin
            Connection.GravaConfig(Parametros.SystemConfig);
          end
        else
          begin
            Connection.EditaConfig(Parametros.SystemConfig);
          end;
        Close;
      Except
        Abort;
      End;
    end;
end;

procedure TfrmSystemConfig.Button1Click(Sender: TObject);
begin
  // Testa as configurações definidas.
  Parametros.SystemConfig.ASDBServer        := edtServidor.Text;
  Parametros.SystemConfig.ASDBPort          := edtPort.Text;
  Parametros.SystemConfig.ASDBDataBase      := edtBase.Text;
  Parametros.SystemConfig.ASDBMasterUser    := edtMasterUser.Text;
  Parametros.SystemConfig.ASDBMasterPass    := edtMasterPass.Text;
  Parametros.SystemConfig.ASAutServer       := edtAutomacao.Text;
  Parametros.SystemConfig.ASAutPort         := edtAutoPort.Text;
  Parametros.SystemConfig.ASSystemPrinter   := edtPrinter.Text;
  Parametros.SystemConfig.ASSystemLogEnable := chkLog.Checked;
  try
    with Connection.Conn do
      begin
        Server    := edtServidor.Text;
        Port      := StrToInt(edtPort.Text);
        Username  := edtMasterUser.Text;
        Password  := edtMasterPass.Text;
        Database  := edtBase.Text;
        Connected := True;
        Aviso('INFO','Informação','Configuração estabelecida sucesso!');
      end;
    btnSalvar.Enabled:= True;
    Parametros.SystemConfig.ASSystemConf := True;
  except
    Aviso('STOP','Informação','Não foi possivel estabelecer conexão com os dados informados!');
  end;
end;

procedure TfrmSystemConfig.edtAutomacaoKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    begin
      edtAutomacao.Clear;
      edtAutomacao.Text := '127.0.0.1';
    end;
end;

procedure TfrmSystemConfig.edtBaseKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    begin
      edtBase.Clear;
      edtBase.Text := 'narseo';
    end;
end;

procedure TfrmSystemConfig.edtPortKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    begin
      edtPort.Clear;
      edtPort.Text := '5432';
    end;
end;

procedure TfrmSystemConfig.edtServidorKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    begin
      edtServidor.Clear;
      edtServidor.Text := '127.0.0.1';
    end;
end;

procedure TfrmSystemConfig.FormShow(Sender: TObject);
var
  Config: TLAConfig;
begin
  Zero := True;
  // Carrega as informações ja registradas.
  Connection.conSQLite.Connect;
  Config := Connection.LoadConfig;
  if Config.ASDBServer <> '' then
    begin
      edtServidor.Text:=Config.ASDBServer;
      edtPort.Text:=Config.ASDBPort;
      edtBase.Text:=Config.ASDBDataBase;
      edtMasterUser.Text:=Config.ASDBMasterUser;
      edtMasterPass.Text:=Config.ASDBMasterPass;
      edtAutomacao.Text:=Config.ASAutServer;
      edtAutoPort.Text:=Config.ASAutPort;
      edtPrinter.Text:=Config.ASSystemPrinter;
      chkLog.Checked:=Config.ASSystemLogEnable;
      Zero := False;
    end;
  edtServidor.SetFocus;
end;

end.
