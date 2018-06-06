unit unGridTipoImovel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unFrmGrid, cxGraphics, cxControls,
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
  cxGrid, Vcl.StdCtrls, Vcl.ExtCtrls, UnSysFrameWork, UnSysFrameHost;

type
  TfrmGridTipoImovel = class(TfrmGrid)
    ColViewID: TcxGridDBColumn;
    ColViewDescricao: TcxGridDBColumn;
    ColViewBloqueado: TcxGridDBColumn;
    procedure btnNovoClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure ViewDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGridTipoImovel: TfrmGridTipoImovel;

implementation

{$R *.dfm}

uses unCadTipoImovel;

procedure TfrmGridTipoImovel.btnEditarClick(Sender: TObject);
begin
  inherited;
  ActEditar(TFrmCadTipoImovel,FrmCadTipoImovel);
end;

procedure TfrmGridTipoImovel.btnNovoClick(Sender: TObject);
begin
  inherited;
  ActInserir(TFrmCadTipoImovel,FrmCadTipoImovel);
end;

procedure TfrmGridTipoImovel.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  ActVisualizar(TFrmCadTipoImovel,FrmCadTipoImovel);
end;

procedure TfrmGridTipoImovel.ViewDblClick(Sender: TObject);
var NewConsulta :TConsulta;
begin
  inherited;
  if Settings.Modo = 'CONSULTA' then
    begin
      NewConsulta.eConsulta := True;
      NewConsulta.eChave := ds.DataSet.FieldByName('codigo').AsInteger;
      NewConsulta.eDescricao := ds.DataSet.FieldByName('descricao').AsString;
      NewConsulta.eValido := True;
      Consulta := NewConsulta;
      Close;
    end;
  if Settings.Modo = 'LISTA' then
    begin
      btnVisualizar.Click;
    end;
end;

end.
