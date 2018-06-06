unit unRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unMaster, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, Vcl.StdCtrls,
  dxGDIPlusClasses, cxImage, Data.DB, DBAccess, Uni, MemDS, Vcl.ImgList,
  Vcl.ExtCtrls, unReport;

type
  TfrmRelatorio = class(TFMaster)
    pnlBotton: TPanel;
    Label26: TLabel;
    Label27: TLabel;
    imgHelp: TImage;
    btnImprimir: TButton;
    btnFechar: TButton;
    ImageList16: TcxImageList;
    qConsulta: TUniQuery;
    ds: TUniDataSource;
    pnlHelp: TPanel;
    imgIconHelp: TcxImage;
    mmoHelp: TMemo;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenQuery;
  end;

var
  frmRelatorio: TfrmRelatorio;

implementation

{$R *.dfm}

procedure TfrmRelatorio.btnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmRelatorio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Report.Free;
end;

procedure TfrmRelatorio.FormCreate(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TReport, Report);
end;

procedure TfrmRelatorio.FormShow(Sender: TObject);
begin
  inherited;
  OpenQuery;
end;

procedure TfrmRelatorio.OpenQuery;
var i:Integer;
begin
  for I := 0 to ComponentCount -1 do
    begin
      if Components[i] is TUniQuery then
        begin
          if TUniQuery(Components[i]).Tag = 7000 then
            begin
              TUniQuery(Components[i]).Open;
            end;
        end;
    end;
  i:= 0;
  for I := 0 to ComponentCount -1 do
    begin
      if Components[i] is TUniQuery then
        begin
          if TUniQuery(Components[i]).Tag = 7100 then
            begin
              TUniQuery(Components[i]).Open;
            end;
        end;
    end;
end;

end.
