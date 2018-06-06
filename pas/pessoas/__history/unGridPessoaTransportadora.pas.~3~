unit unGridPessoaTransportadora;

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
  cxNavigator, Data.DB, cxDBData, cxContainer, cxClasses, DBAccess, Uni, MemDS,
  Vcl.ImgList, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.StdCtrls, Vcl.ExtCtrls, Datasnap.DBClient, Vcl.Menus,
  dxRibbonSkins, dxSkinsdxRibbonPainter, dxRibbonCustomizationForm,
  dxSkinsdxBarPainter, dxBar, Vcl.ComCtrls, dxRibbon;

type
  TfrmGridPessoaTransportadora = class(TfrmGrid)
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
  frmGridPessoaTransportadora: TfrmGridPessoaTransportadora;

implementation

{$R *.dfm}

uses unCadPessoaTransportadora;

procedure TfrmGridPessoaTransportadora.MnEditarClick(Sender: TObject);
begin
  inherited;
  ActEditar(TfrmCadPessoaTransportadora,frmCadPessoaTransportadora);
end;

procedure TfrmGridPessoaTransportadora.MnExcluirClick(Sender: TObject);
begin
  inherited;
  TabelaREF := 'pessoas';
  ActRemover(TfrmCadPessoaTransportadora,frmCadPessoaTransportadora);
end;

procedure TfrmGridPessoaTransportadora.MnNovoClick(Sender: TObject);
begin
  inherited;
  ActInserir(TfrmCadPessoaTransportadora,frmCadPessoaTransportadora);
end;

procedure TfrmGridPessoaTransportadora.MnVisualizarClick(Sender: TObject);
begin
  inherited;
  ActVisualizar(TfrmCadPessoaTransportadora,frmCadPessoaTransportadora);
end;

procedure TfrmGridPessoaTransportadora.ViewDblClick(Sender: TObject);
begin
  inherited;
  Find(ds.DataSet.FieldByName('codigo').AsInteger,ds.DataSet.FieldByName('nome').AsString);
end;

end.
