unit unGridConfigEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unSystem, cxGraphics, cxControls,
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
  cxGrid, Vcl.StdCtrls, Vcl.ExtCtrls, unGrid, Datasnap.DBClient, Vcl.Menus,
  dxRibbonSkins, dxSkinsdxRibbonPainter, dxRibbonCustomizationForm,
  dxSkinsdxBarPainter, dxBar, Vcl.ComCtrls, dxRibbon;

type
  TfrmGridConfigEmpresa = class(TfrmGrid)
    ColumnID: TcxGridDBColumn;
    ColumnCNPJ: TcxGridDBColumn;
    ColumnRazaoSocial: TcxGridDBColumn;
    ColumnMatriz: TcxGridDBColumn;
    ColumnInativo: TcxGridDBColumn;
    procedure btnEditarClick(Sender: TObject);
    procedure MnNovoClick(Sender: TObject);
    procedure MnVisualizarClick(Sender: TObject);
    procedure MnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGridConfigEmpresa: TfrmGridConfigEmpresa;

implementation

{$R *.dfm}

uses unCadConfigEmpresa; //, unSEFAZ;

procedure TfrmGridConfigEmpresa.btnEditarClick(Sender: TObject);
begin
  inherited;

  //dmSefaz.ReloadConfig;
end;

procedure TfrmGridConfigEmpresa.MnEditarClick(Sender: TObject);
begin
  inherited;
  ActEditar(TFrmCadConfigEmpresa,FrmCadConfigEmpresa);
end;

procedure TfrmGridConfigEmpresa.MnNovoClick(Sender: TObject);
begin
  inherited;
  ActInserir(TFrmCadConfigEmpresa,FrmCadConfigEmpresa);
end;

procedure TfrmGridConfigEmpresa.MnVisualizarClick(Sender: TObject);
begin
  inherited;
  ActVisualizar(TFrmCadConfigEmpresa,FrmCadConfigEmpresa);
end;

end.

