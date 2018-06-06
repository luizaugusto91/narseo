unit unGridGrupoUsuarios;

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
  cxNavigator, Data.DB, cxDBData, cxClasses, DBAccess, Uni, MemDS, Vcl.ImgList,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,
  Datasnap.DBClient, dxRibbonSkins, dxSkinsdxRibbonPainter,
  dxRibbonCustomizationForm, dxSkinsdxBarPainter, dxBar, Vcl.ComCtrls, dxRibbon;

type
  TfrmGridGrupoUsuarios = class(TfrmGrid)
    qConsultacodigo: TIntegerField;
    qConsultanome: TStringField;
    qConsultaativo: TBooleanField;
    Viewcodigo: TcxGridDBColumn;
    Viewnome: TcxGridDBColumn;
    Viewativo: TcxGridDBColumn;
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
  frmGridGrupoUsuarios: TfrmGridGrupoUsuarios;

implementation

{$R *.dfm}

uses unCadGrupoUsuarios;

procedure TfrmGridGrupoUsuarios.MnEditarClick(Sender: TObject);
begin
  inherited;
  ActEditar(TfrmCadGrupoUsuarios,frmCadGrupoUsuarios);
end;

procedure TfrmGridGrupoUsuarios.MnExcluirClick(Sender: TObject);
begin
  inherited;
  TabelaREF := 'system_grupo_usuarios';
  ActRemover(TfrmCadGrupoUsuarios,frmCadGrupoUsuarios);
end;

procedure TfrmGridGrupoUsuarios.MnNovoClick(Sender: TObject);
begin
  inherited;
  ActInserir(TfrmCadGrupoUsuarios,frmCadGrupoUsuarios);
end;

procedure TfrmGridGrupoUsuarios.MnVisualizarClick(Sender: TObject);
begin
  inherited;
  ActVisualizar(TfrmCadGrupoUsuarios,frmCadGrupoUsuarios);
end;

end.
