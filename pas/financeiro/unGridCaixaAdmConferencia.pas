unit unGridCaixaAdmConferencia;

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
  Vcl.Menus, cxClasses, DBAccess, Uni, MemDS, Vcl.ImgList, unSystem,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxGridCustomView, cxGrid, Vcl.StdCtrls, Vcl.ExtCtrls, dxRibbonSkins,
  dxSkinsdxRibbonPainter, dxRibbonCustomizationForm, dxSkinsdxBarPainter, dxBar,
  Vcl.ComCtrls, dxRibbon;

type
  TfrmGridCaixaAdmConferencia = class(TfrmGrid)
    Viewcodigo: TcxGridDBColumn;
    Viewdata_caixa: TcxGridDBColumn;
    Viewturno: TcxGridDBColumn;
    Viewempresa: TcxGridDBColumn;
    Viewcd_operador_sistema: TcxGridDBColumn;
    Viewoperador_sistema: TcxGridDBColumn;
    Viewabertura: TcxGridDBColumn;
    Viewfechamento: TcxGridDBColumn;
    Viewconferencia: TcxGridDBColumn;
    Viewcd_pessoa_conferente: TcxGridDBColumn;
    Viewpessoa_conferente: TcxGridDBColumn;
    Viewtroco_inicial: TcxGridDBColumn;
    Viewtroco_final: TcxGridDBColumn;
    Viewconferido: TcxGridDBColumn;
    Viewsangria: TcxGridDBColumn;
    Viewreforco: TcxGridDBColumn;
    Viewdespesas: TcxGridDBColumn;
    Viewrecebimentos: TcxGridDBColumn;
    Viewcd_operador_caixa: TcxGridDBColumn;
    Viewoperador_caixa: TcxGridDBColumn;
    Viewobs: TcxGridDBColumn;
    Viewmanual: TcxGridDBColumn;
    StyleConferido: TcxStyle;
    StyleManual: TcxStyle;
    Fecharcaixa1: TMenuItem;
    ColumnViewfechado: TcxGridDBColumn;
    procedure pmFuncoesPopup(Sender: TObject);
    procedure Fecharcaixa1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGridCaixaAdmConferencia: TfrmGridCaixaAdmConferencia;

implementation

{$R *.dfm}

procedure TfrmGridCaixaAdmConferencia.Fecharcaixa1Click(Sender: TObject);
begin
  inherited;
  if Pergunta('INFO','Confirmação','Confirma o fechamendo do caixa selecionado?','SN') = ID_YES then
    begin
      qSQL.Close;
      qSQL.SQL.Clear;
      qSQL.SQL.Text := 'SELECT set_fechamento_caixa(' + ds.DataSet.FieldByName('codigo').AsString + ');';
      qSQL.Open;
      if qSQL.FieldByName('set_fechamento_caixa').AsBoolean = True then
        Aviso('INFO','Informação','Caixa fechado com sucesso.')
      else
        Aviso('ERRO','Informação','Não foi possivel finalizar o caixa selecionado.');
      ds.DataSet.Refresh;
    end;
end;

procedure TfrmGridCaixaAdmConferencia.pmFuncoesPopup(Sender: TObject);
begin
  inherited;
  if ds.DataSet.FieldByName('fechado').AsBoolean = True then
    begin
      Fecharcaixa1.Enabled := False;
    end
  else
    begin
      Fecharcaixa1.Enabled := True;
    end;
end;

end.
