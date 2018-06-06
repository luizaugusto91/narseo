unit unCadDepositos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCad, Vcl.ImgList, cxGraphics, Data.DB,
  MemDS, DBAccess, Uni, Vcl.StdCtrls, Vcl.ExtCtrls, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
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
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxClasses, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, cxCheckBox,
  cxDBEdit, cxTextEdit, cxMaskEdit, cxSpinEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, Vcl.AppEvnts, dxGDIPlusClasses, cxImage;

type
  TfrmCadDepositos = class(TfrmCad)
    grpGrupos: TGroupBox;
    Grid: TcxGrid;
    View: TcxGridDBTableView;
    ColViewID: TcxGridDBColumn;
    ColViewDescricao: TcxGridDBColumn;
    Master: TcxGridLevel;
    pnlTool: TPanel;
    btnAdd: TButton;
    btnRemove: TButton;
    btnReload: TButton;
    qGrupos: TUniQuery;
    qGruposcodigo: TIntegerField;
    qGruposdeposito: TIntegerField;
    qGruposgrupo: TIntegerField;
    qGruposdescricao: TStringField;
    dsGrupos: TDataSource;
    StyleRepository: TcxStyleRepository;
    StyleSelecionado: TcxStyle;
    StyleNeutro: TcxStyle;
    StyleTitle: TcxStyle;
    qDepartamentos: TUniQuery;
    dsDepartamentos: TUniDataSource;
    cbbDepartamento: TcxDBLookupComboBox;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBSpinEdit1: TcxDBSpinEdit;
    cxDBSpinEdit2: TcxDBSpinEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadDepositos: TfrmCadDepositos;

implementation

{$R *.dfm}

end.
