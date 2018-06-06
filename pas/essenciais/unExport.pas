unit unExport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unMaster, Vcl.StdCtrls, Data.DB,
  DBAccess, Uni, cxStyles, cxClasses, Vcl.ImgList, cxGraphics, MemDS,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxGDIPlusClasses, cxImage,
  Vcl.ExtCtrls, FileCtrl, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

const
  SELDIRHELP = 1000;

type
  TfrmExport = class(TFMaster)
    grpContent: TGroupBox;
    grpItens: TGroupBox;
    qConsulta: TUniQuery;
    ImageList16: TcxImageList;
    StyleRepository: TcxStyleRepository;
    StyleHeader: TcxStyle;
    StyleItemInativo: TcxStyle;
    StyleItemAtivo: TcxStyle;
    ds: TUniDataSource;
    pnlBotton: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    imgHelp: TImage;
    btnExportar: TButton;
    pnlHelp: TPanel;
    imgIconHelp: TcxImage;
    mmoHelp: TMemo;
    Grid: TcxGrid;
    View: TcxGridDBTableView;
    Master: TcxGridLevel;
    qXML: TUniQuery;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetDir:string;
  end;

var
  frmExport: TfrmExport;

implementation

{$R *.dfm}

uses unParametros;

procedure TfrmExport.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 112 then
    begin
      if pnlHelp.Visible = False then
        begin
          Self.ClientHeight := Self.ClientHeight + 44;
          pnlHelp.Visible := True
        end
      else
        begin
          Self.ClientHeight := Self.ClientHeight - 44;
          pnlHelp.Visible := False
        end;
    end;
end;

procedure TfrmExport.FormShow(Sender: TObject);
begin
  inherited;
  Self.ClientHeight := Self.ClientHeight - 44;
end;

function TfrmExport.GetDir: string;
var
  Dir: String;
begin
  Dir := Parametros.SystemConfig.ASSystemPath;
  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt], SELDIRHELP) then
  Result := Dir;
end;

end.
