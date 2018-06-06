unit unGridSystemBreak;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unGrid, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Datasnap.DBClient,
  Vcl.Menus, cxClasses, DBAccess, Uni, MemDS, Vcl.ImgList,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxGridCustomView, cxGrid, Vcl.StdCtrls, Vcl.ExtCtrls, dxRibbonSkins,
  dxSkinsdxRibbonPainter, dxRibbonCustomizationForm, dxSkinsdxBarPainter, dxBar,
  Vcl.ComCtrls, dxRibbon;

type
  TfrmGridSystemBreak = class(TfrmGrid)
    ColumnID: TcxGridDBColumn;
    ColumnTipo: TcxGridDBColumn;
    ColumnData: TcxGridDBColumn;
    ColumnHora: TcxGridDBColumn;
    ColumnExpectativa: TcxGridDBColumn;
    procedure MnNovoClick(Sender: TObject);
    procedure MnVisualizarClick(Sender: TObject);
    procedure MnEditarClick(Sender: TObject);
    procedure MnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGridSystemBreak: TfrmGridSystemBreak;

implementation

uses
  unCadSystemBreak;

{$R *.dfm}

procedure TfrmGridSystemBreak.MnEditarClick(Sender: TObject);
begin
  inherited;
  ActEditar(TfrmCadSystemBreak,frmCadSystemBreak);
end;

procedure TfrmGridSystemBreak.MnExcluirClick(Sender: TObject);
begin
  inherited;
  TabelaREF := 'system_break';
  ActRemover(TfrmCadSystemBreak,frmCadSystemBreak);
end;

procedure TfrmGridSystemBreak.MnNovoClick(Sender: TObject);
begin
  inherited;
  ActInserir(TfrmCadSystemBreak,frmCadSystemBreak);
end;

procedure TfrmGridSystemBreak.MnVisualizarClick(Sender: TObject);
begin
  inherited;
  ActVisualizar(TfrmCadSystemBreak,frmCadSystemBreak);
end;

end.
