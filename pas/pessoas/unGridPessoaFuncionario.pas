unit unGridPessoaFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unSystem, unGrid, cxGraphics, cxControls,
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
  TfrmGridPessoaFuncionario = class(TfrmGrid)
    ColViewID: TcxGridDBColumn;
    ColViewCNPJ: TcxGridDBColumn;
    ColViewNome: TcxGridDBColumn;
    ColViewFantasia: TcxGridDBColumn;
    ColViewCidade: TcxGridDBColumn;
    ColViewTelefone: TcxGridDBColumn;
    procedure MnNovoClick(Sender: TObject);
    procedure MnVisualizarClick(Sender: TObject);
    procedure MnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGridPessoaFuncionario: TfrmGridPessoaFuncionario;

implementation

{$R *.dfm}

uses unCadPessoaFuncionario;

procedure TfrmGridPessoaFuncionario.MnEditarClick(Sender: TObject);
begin
  inherited;
  ActEditar(TFrmCadPessoaFuncionario,FrmCadPessoaFuncionario);
end;

procedure TfrmGridPessoaFuncionario.MnNovoClick(Sender: TObject);
begin
  inherited;
  ActInserir(TFrmCadPessoaFuncionario,FrmCadPessoaFuncionario);
end;

procedure TfrmGridPessoaFuncionario.MnVisualizarClick(Sender: TObject);
begin
  inherited;
  //  Find(ds.DataSet.FieldByName('codigo').AsInteger,ds.DataSet.FieldByName('nome').AsString);
  ActVisualizar(TFrmCadPessoaFuncionario,FrmCadPessoaFuncionario);
end;

end.
