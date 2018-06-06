unit unRelatorioCTe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unRelatorios, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxGroupBox,
  cxRadioGroup, Data.DB, DBAccess, Uni, MemDS, Vcl.ImgList, Vcl.StdCtrls,
  dxGDIPlusClasses, cxImage, Vcl.ExtCtrls, frxClass, frxDBSet, System.DateUtils,
  Vcl.Clipbrd;

type
  TfrmRelatorioCTe = class(TfrmRelatorio)
    rgRelatorio: TcxRadioGroup;
    grpPeriodo: TcxGroupBox;
    lblDTInicio: TLabel;
    lblDTFinal: TLabel;
    RepCTe: TfrxReport;
    FRDataSetCTe: TfrxDBDataset;
    FRDataSetEmpresa: TfrxDBDataset;
    edtDTInicio: TDateTimePicker;
    edtDTFinal: TDateTimePicker;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioCTe: TfrmRelatorioCTe;
  sSQL:string;

implementation

{$R *.dfm}
uses unReport;

procedure TfrmRelatorioCTe.btnImprimirClick(Sender: TObject);
var
  Filtro, Datas, Registros: string;
begin
  inherited;
  qConsulta.Close;
  qConsulta.SQL.Clear;
  qConsulta.SQL.Text := sSQL;
  Filtro := '';
  // Verifica a data do relatório
  {if (edtDTInicio.Date = StrToDate('00/00/0000')) or (edtDTFinal.Date = StrToDate('00/00/0000')) then
    begin
      Datas := '';
    end
  else}
    begin
      Datas := ' ct.data_registro BETWEEN ' + QuotedStr(FormatDateTime('YYYY-MM-DD',edtDTInicio.Date)) + ' and ' + QuotedStr(FormatDateTime('YYYY-MM-DD',edtDTFinal.Date));
      Filtro := Filtro + ' AND ' + Datas;
    end;

  // Verifica o tipo de registro
  if rgRelatorio.ItemIndex <> null then
    begin
      Registros := 'ct.status = ' + QuotedStr(rgRelatorio.Properties.Items.Items[rgRelatorio.ItemIndex].Value);
      Filtro := Filtro + ' AND ' + Registros;
    end;
  qConsulta.SQL.Add(Filtro);
  qConsulta.Open;
  Clipboard.AsText := qConsulta.SQL.Text;
  RepCTe.ShowReport();
end;

procedure TfrmRelatorioCTe.FormShow(Sender: TObject);
begin
  inherited;
  edtDTInicio.Date := StartOfTheMonth(Date);
  edtDTFinal.Date := EndOfTheMonth(Date);
  sSQL := qConsulta.SQL.Text;
end;

end.
