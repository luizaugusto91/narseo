unit unCadSystemBreak;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCad, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxDBEdit, Data.DB, Vcl.ImgList, MemDS, DBAccess, Uni,
  Vcl.StdCtrls, dxGDIPlusClasses, cxImage, Vcl.ExtCtrls, cxTimeEdit, cxMemo,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmCadSystemBreak = class(TfrmCad)
    qConsultacodigo: TIntegerField;
    qConsultausuario: TIntegerField;
    qConsultadata_registro: TDateField;
    qConsultahora_registro: TTimeField;
    qConsultahora_execucao: TTimeField;
    qConsultatempo_execucao: TIntegerField;
    qConsultaexecutada: TBooleanField;
    qConsultamotivo: TIntegerField;
    qConsultadescricao: TMemoField;
    qConsultadata_retorno: TDateField;
    qConsultahora_retorno: TTimeField;
    qConsultaexpectativa: TIntegerField;
    Label1: TLabel;
    edtcodigo: TcxDBSpinEdit;
    Label2: TLabel;
    edtmotivo: TcxDBSpinEdit;
    grpDescricao: TGroupBox;
    mmodescricao: TcxDBMemo;
    Label3: TLabel;
    edtexpectativa: TcxDBSpinEdit;
    Label4: TLabel;
    edthora_execucao: TcxDBTimeEdit;
    cbbmotivo: TcxDBLookupComboBox;
    qMotivo: TUniQuery;
    dsMotivo: TUniDataSource;
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadSystemBreak: TfrmCadSystemBreak;

implementation

Uses unParametros;
{$R *.dfm}


procedure TfrmCadSystemBreak.btnSalvarClick(Sender: TObject);
begin
  ds.DataSet.FieldByName('usuario').AsInteger := Parametros.FieldParametrosusuario.AsInteger;
  inherited;
end;

end.
