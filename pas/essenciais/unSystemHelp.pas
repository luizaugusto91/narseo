unit unSystemHelp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unMaster, unSystem, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.ImgList, Vcl.OleCtrls, SHDocVw, Vcl.StdCtrls,
  dxGDIPlusClasses, cxImage, Vcl.ExtCtrls;

type
  TfrmSystemHelp = class(TFMaster)
    pnlTop: TPanel;
    lblHeader: TLabel;
    lblJanela: TLabel;
    lblVersao: TLabel;
    imgIcon: TcxImage;
    pnlBotton: TPanel;
    btnFechar: TButton;
    pnlConteudo: TPanel;
    ImageList16: TcxImageList;
    wbPage: TWebBrowser;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure WBLoadHTML(WebBrowser: TWebBrowser; HTMLCode: string);
    function TrataHTML(TXT:string):String;
  public
    { Public declarations }
  end;

var
  frmSystemHelp: TfrmSystemHelp;

implementation

{$R *.dfm}
uses Winapi.ActiveX, unConnection, unParametros;

procedure TfrmSystemHelp.btnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmSystemHelp.FormShow(Sender: TObject);
var xHTML: String;
    NewSetting: TFormMode;
begin
  inherited;
    NewSetting := Settings;
  // Verifica e carrega os arquivo de ajuda.
  Connection.qHelp.Close;
  Connection.qHelp.ParamByName('versao').AsString := Versao;
  Connection.qHelp.ParamByName('tag').AsInteger := Settings.ID;
  try
    Connection.qHelp.Open;
    NewSetting.Modo := 'LOAD';
  except
    Aviso('ERRO','Erro ao acessar informação!','Não foi possivel acessar a HELP.'+#13+'Por favor, entre em contato com o suporte.');
    NewSetting.Modo := 'FAIL';
  end;
  // Verrifica carregamento.
  if NewSetting.Modo = 'FAIL' then
    Close
  else
    begin
      // Trata o HTML
      xHTML:= Connection.qHelp.FieldByName('html').asString;
      xHTML:= TrataHTML(xHTML);
      lblJanela.Caption := '[' + Connection.qHelp.FieldByName('nome').AsString + ']';
      lblVersao.Caption := '[versão ' + Connection.qHelp.FieldByName('versao').AsString +']';
      // Carrega o conteudo do Help
      WBLoadHTML(wbPage,xHTML);
    end;
end;

function TfrmSystemHelp.TrataHTML(TXT: string): String;
var
  Linha, SystemPath, IMG: String;
  PosicaoI, PosicaoF: Integer;
begin
  // Caminhos padroes:
  // --> Imagens: approot/sources/content/images    TAG: <<IMG>>
  Linha:= TXT;
  SystemPath := Parametros.SystemConfig.ASSystemPath;
  IMG:= SystemPath + '/sources/content/images';
  Linha := StringReplace(Linha,'<<IMG>>',IMG,[rfReplaceAll,rfIgnoreCase]);
  Result:= Linha;
end;

procedure TfrmSystemHelp.WBLoadHTML(WebBrowser: TWebBrowser; HTMLCode: string);
var
  sl: TStringList;
  ms: TMemoryStream;
begin
  WebBrowser.Navigate('about:blank');
  while WebBrowser.ReadyState < READYSTATE_INTERACTIVE do
    Application.ProcessMessages;
  if Assigned(WebBrowser.Document) then
    begin
      sl := TStringList.Create;
      try
        ms := TMemoryStream.Create;
        try
          sl.Text := HTMLCode;
          sl.SaveToStream(ms);
          ms.Seek(0, 0);
          (WebBrowser.Document as IPersistStreamInit).Load(TStreamAdapter.Create(ms));
        finally
          ms.Free;
        end;
      finally
        sl.Free;
      end;
    end;
end;

end.
