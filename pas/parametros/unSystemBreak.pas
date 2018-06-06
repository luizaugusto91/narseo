unit unSystemBreak;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unMaster, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, Vcl.ImgList, cxImage,
  Vcl.StdCtrls, Vcl.ExtCtrls, cxTextEdit, cxMemo, cxDBEdit, Data.DB, MemDS,
  DBAccess, Uni, cxLabel, cxDBLabel, dxGDIPlusClasses, unParametros;

type
  TfrmSystemBreak = class(TFMaster)
    pnlBotton: TPanel;
    btnFechar: TButton;
    imgAlert: TcxImage;
    ImageList16: TcxImageList;
    lblMotivo: TcxDBLabel;
    ds: TUniDataSource;
    qConsulta: TUniQuery;
    grpDetalhes: TGroupBox;
    lblhora_execucao: TcxDBLabel;
    lblHoraIni: TLabel;
    lblTempoEstimado: TLabel;
    lblestimativa: TcxDBLabel;
    mmodescricao: TcxDBMemo;
    qConsultacodigo: TIntegerField;
    qConsultausuario: TStringField;
    qConsultadata_registro: TDateField;
    qConsultahora_registro: TTimeField;
    qConsultahora_execucao: TTimeField;
    qConsultaestimativa: TTimeField;
    qConsultatempo_execucao: TIntegerField;
    qConsultaexecutada: TBooleanField;
    qConsultamotivo: TStringField;
    qConsultadescricao: TMemoField;
    qConsultadata_retorno: TDateField;
    qConsultahora_retorno: TTimeField;
    qConsultaexpectativa: TIntegerField;
    qConsultaimg: TStringField;
    lblOUT: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSystemBreak: TfrmSystemBreak;

implementation

{$R *.dfm}

procedure TfrmSystemBreak.btnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmSystemBreak.FormShow(Sender: TObject);
var
  imgPath: String;
begin
  inherited;
  qConsulta.ParamByName('codigo').AsInteger := Settings.ID;
  if Settings.Modo = 'OUT' then lblOUT.Visible := True;
  qConsulta.Open;
  imgPath := Parametros.SystemConfig.ASSystemPath + '\sources\content\break\' + qConsultaimg.AsString;
  imgAlert.Picture.LoadFromFile(imgPath);
end;

end.
