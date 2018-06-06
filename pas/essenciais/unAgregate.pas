unit unAgregate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unMaster, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ImgList, dxGDIPlusClasses, cxImage, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Datasnap.DBClient, DBAccess, Uni,
  MemDS, unConnection, MidasLib;

type
  TfrmAgregate = class(TFMaster)
    pnlHelp: TPanel;
    imgIconHelp: TcxImage;
    mmoHelp: TMemo;
    ImageList16: TcxImageList;
    pnlBotton: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    imgHelp: TImage;
    btnCancelar: TButton;
    btnAvancar: TButton;
    grpFiltro: TGroupBox;
    Grid: TcxGrid;
    View: TcxGridDBTableView;
    Master: TcxGridLevel;
    qConsulta: TUniQuery;
    ds: TUniDataSource;
    cds: TClientDataSet;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenQuery;
  end;

var
  frmAgregate: TfrmAgregate;

implementation

{$R *.dfm}

procedure TfrmAgregate.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmAgregate.FormShow(Sender: TObject);
begin
  inherited;
  Self.ClientHeight := Self.ClientHeight - 44;
  OpenQuery;
end;

procedure TfrmAgregate.OpenQuery;
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
