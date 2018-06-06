unit unGridAutoAbastecimentosBaixados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unGrid, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Datasnap.DBClient,
  Vcl.Menus, cxClasses, DBAccess, Uni, MemDS, Vcl.ImgList,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxGridCustomView, cxGrid, Vcl.StdCtrls, Vcl.ExtCtrls, cxImageComboBox;

type
  TfrmGridAutoAbastecimentosBaixados = class(TfrmGrid)
    ColumnID: TcxGridDBColumn;
    ColumnPUNP: TcxGridDBColumn;
    ColumnLitros: TcxGridDBColumn;
    ColumnHora: TcxGridDBColumn;
    ColumnData: TcxGridDBColumn;
    ColumnBomba: TcxGridDBColumn;
    ColumnBico: TcxGridDBColumn;
    ColumnCombustivel: TcxGridDBColumn;
    ColumnPlaca: TcxGridDBColumn;
    ColumnKM: TcxGridDBColumn;
    ColumnManual: TcxGridDBColumn;
    qConsultacodigo: TIntegerField;
    qConsultanr_logico: TStringField;
    qConsultaidbico: TIntegerField;
    qConsultabico: TStringField;
    qConsultabomba: TStringField;
    qConsultaquantidade: TFloatField;
    qConsultapreco_unitario: TFloatField;
    qConsultavalor: TFloatField;
    qConsultadata: TDateField;
    qConsultahora: TTimeField;
    qConsultaencerrante_inicial: TFloatField;
    qConsultaencerrante_final: TFloatField;
    qConsultatarget_id: TIntegerField;
    qConsultapunp_id: TIntegerField;
    qConsultahora_baixa: TDateTimeField;
    qConsultakm_baixa: TFloatField;
    qConsultaplaca: TStringField;
    qConsultamanual: TBooleanField;
    qConsultatroca_oleo: TBooleanField;
    qConsultacombustivel: TStringField;
    procedure btnNovoClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGridAutoAbastecimentosBaixados: TfrmGridAutoAbastecimentosBaixados;

implementation

{$R *.dfm}

uses unExeAutoAbastecimentosPendentes, unCadAutoAbastecimentosPendentes;

procedure TfrmGridAutoAbastecimentosBaixados.btnEditarClick(Sender: TObject);
begin
  inherited;
  ActInserir(TfrmCadAutoAbastecimentosPendentes,frmCadAutoAbastecimentosPendentes);
end;

procedure TfrmGridAutoAbastecimentosBaixados.btnNovoClick(Sender: TObject);
begin
  inherited;
  ActEditar(TfrmExeAutoAbastecimentosPendentes,frmExeAutoAbastecimentosPendentes);
end;

procedure TfrmGridAutoAbastecimentosBaixados.btnVisualizarClick(
  Sender: TObject);
begin
  inherited;
  ActVisualizar(TfrmCadAutoAbastecimentosPendentes,frmCadAutoAbastecimentosPendentes);
end;

end.
