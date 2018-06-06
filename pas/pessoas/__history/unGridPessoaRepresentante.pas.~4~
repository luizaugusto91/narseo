unit unGridPessoaRepresentante;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unGrid, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
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
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, Datasnap.DBClient, Vcl.Menus, cxClasses,
  DBAccess, Uni, MemDS, Vcl.ImgList, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid, Vcl.StdCtrls,
  Vcl.ExtCtrls, dxRibbonSkins, dxSkinsdxRibbonPainter,
  dxRibbonCustomizationForm, dxSkinsdxBarPainter, dxBar, Vcl.ComCtrls, dxRibbon;

type
  TfrmGridPessoaRepresentante = class(TfrmGrid)
    ColumnID: TcxGridDBColumn;
    ColumnCNPJ: TcxGridDBColumn;
    ColumnNome: TcxGridDBColumn;
    ColumnFantasia: TcxGridDBColumn;
    ColumnCidade: TcxGridDBColumn;
    ColumnTelefone: TcxGridDBColumn;
    procedure ViewDblClick(Sender: TObject);
    procedure MnExcluirClick(Sender: TObject);
    procedure MnEditarClick(Sender: TObject);
    procedure MnVisualizarClick(Sender: TObject);
    procedure MnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGridPessoaRepresentante: TfrmGridPessoaRepresentante;

implementation

{$R *.dfm}

uses unCadPessoaRepresentante;

procedure TfrmGridPessoaRepresentante.MnEditarClick(Sender: TObject);
begin
  inherited;
  ActEditar(TFrmCadPessoaRepresentante,FrmCadPessoaRepresentante);
end;

procedure TfrmGridPessoaRepresentante.MnExcluirClick(Sender: TObject);
begin
  inherited;
  TabelaREF := 'pessoas';
  ActRemover(TFrmCadPessoaRepresentante,FrmCadPessoaRepresentante);
end;

procedure TfrmGridPessoaRepresentante.MnNovoClick(Sender: TObject);
begin
  inherited;
  ActInserir(TFrmCadPessoaRepresentante,FrmCadPessoaRepresentante);
end;

procedure TfrmGridPessoaRepresentante.MnVisualizarClick(Sender: TObject);
begin
  inherited;
  ActVisualizar(TFrmCadPessoaRepresentante,FrmCadPessoaRepresentante);
end;

procedure TfrmGridPessoaRepresentante.ViewDblClick(Sender: TObject);
begin
  inherited;
  Find(ds.DataSet.FieldByName('codigo').AsInteger,ds.DataSet.FieldByName('nome').AsString);
end;

end.
