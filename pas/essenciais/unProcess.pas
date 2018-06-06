unit unProcess;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ImgList, cxGraphics, System.StrUtils,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, cxImage, cxTextEdit, cxMemo,
  Vcl.StdCtrls, JvGIF, Vcl.ExtCtrls, JvExControls, JvAnimatedImage, JvGIFCtrl,
  dxGDIPlusClasses;

type
  TfrmProcess = class(TForm)
    lbl1: TLabel;
    mmoMensagem: TcxMemo;
    img1: TcxImage;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ProcessStart(vType,vTitulo,vMensagem:String);
    procedure NextMessage(vMensagem:String);
    procedure ProcessFinish;
  end;

var
  frmProcess: TfrmProcess;

implementation

{$R *.dfm}

{ TfrmProcess }

procedure TfrmProcess.NextMessage(vMensagem: String);
begin
  mmoMensagem.Lines.Add(vMensagem);
end;

procedure TfrmProcess.ProcessFinish;
begin
  Close;
end;

procedure TfrmProcess.ProcessStart(vType, vTitulo, vMensagem: String);
begin
  Show;
  Caption := vTitulo;
  mmoMensagem.Lines.Add(vMensagem);
end;

end.
