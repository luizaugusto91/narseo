unit unCadGrupoUsuarios;

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
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxDBEdit,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxCheckBox, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dxGDIPlusClasses, cxImage;

type
  TfrmCadGrupoUsuarios = class(TfrmCad)
    qConsultacodigo: TIntegerField;
    qConsultanome: TStringField;
    qConsultaativo: TBooleanField;
    qUsuariosGrupo: TUniQuery;
    dsSub: TUniDataSource;
    qSetor: TUniQuery;
    dsSetor: TUniDataSource;
    cbAtivo: TcxDBCheckBox;
    cbbSetor: TcxDBLookupComboBox;
    edtCodigo: TcxDBSpinEdit;
    edtNome: TcxDBTextEdit;
    edtSetor: TcxDBSpinEdit;
    grpUsuarios: TGroupBox;
    Grid: TcxGrid;
    View: TcxGridDBTableView;
    ColumnID: TcxGridDBColumn;
    ColumnPessoa: TcxGridDBColumn;
    ColumnAtivo: TcxGridDBColumn;
    Master: TcxGridLevel;
    lblCodigo: TLabel;
    lblNome: TLabel;
    lblSetor: TLabel;
    FieldConsultadepartamento: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadGrupoUsuarios: TfrmCadGrupoUsuarios;

implementation

{$R *.dfm}

end.
