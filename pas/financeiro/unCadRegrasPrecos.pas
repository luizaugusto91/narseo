unit unCadRegrasPrecos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCad, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, Vcl.ImgList, Data.DB, MemDS,
  DBAccess, Uni, Vcl.StdCtrls, dxGDIPlusClasses, cxImage, Vcl.ExtCtrls,
  cxCheckBox, cxDBEdit, cxMemo, cxTextEdit, cxMaskEdit, cxSpinEdit, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxClasses, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, unSystem;

type
  TfrmCadRegrasPrecos = class(TfrmCad)
    lblCodigo: TLabel;
    edtCodigo: TcxDBSpinEdit;
    lbl1: TLabel;
    edtdescricao: TcxDBTextEdit;
    grpObservacao: TGroupBox;
    mmoobservacao: TcxDBMemo;
    FieldConsultacodigo: TIntegerField;
    FieldConsultaempresa: TIntegerField;
    FieldConsultadescricao: TStringField;
    FieldConsultaobservacao: TStringField;
    FieldConsultabloqueada: TBooleanField;
    cbbbloqueada: TcxDBCheckBox;
    grpProdutos: TGroupBox;
    Grid: TcxGrid;
    View: TcxGridDBTableView;
    ColumnID: TcxGridDBColumn;
    ColumnProduto: TcxGridDBColumn;
    ColumnCategoria: TcxGridDBColumn;
    ColumnMarkup_vista: TcxGridDBColumn;
    ColumnValor_vista: TcxGridDBColumn;
    ColumnMarkup_prazo: TcxGridDBColumn;
    ColumnValor_prazo: TcxGridDBColumn;
    Master: TcxGridLevel;
    pnlACT: TPanel;
    btnADD: TButton;
    btnEDT: TButton;
    btnRMV: TButton;
    btnAtualizar: TButton;
    StyleRepository: TcxStyleRepository;
    StyleHeader: TcxStyle;
    StyleItemInativo: TcxStyle;
    StyleItemAtivo: TcxStyle;
    qItens: TUniQuery;
    dsItens: TUniDataSource;
    procedure btnADDClick(Sender: TObject);
    procedure btnEDTClick(Sender: TObject);
    procedure btnRMVClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadRegrasPrecos: TfrmCadRegrasPrecos;

implementation

{$R *.dfm}

uses unCadRegrasPrecosProdutos;

procedure TfrmCadRegrasPrecos.btnADDClick(Sender: TObject);
begin
  inherited;
  try
    Application.CreateForm(TfrmCadRegrasPrecosProdutos, frmCadRegrasPrecosProdutos);
    TfrmCad(frmCadRegrasPrecosProdutos).Settings.Modo := 'NEW';
    TfrmCad(frmCadRegrasPrecosProdutos).Settings.ID := ds.DataSet.FieldByName('codigo').asInteger;
    TfrmCad(frmCadRegrasPrecosProdutos).ShowModal;
  finally
    TfrmCad(frmCadRegrasPrecosProdutos).Release;
    dsItens.DataSet.Refresh;
  end;
end;

procedure TfrmCadRegrasPrecos.btnAtualizarClick(Sender: TObject);
begin
  inherited;
  dsItens.DataSet.Refresh;
end;

procedure TfrmCadRegrasPrecos.btnEDTClick(Sender: TObject);
begin
  inherited;
  try
    Application.CreateForm(TfrmCadRegrasPrecosProdutos, frmCadRegrasPrecosProdutos);
    TfrmCad(frmCadRegrasPrecosProdutos).Settings.Modo := 'ALTERACAO';
    TfrmCad(frmCadRegrasPrecosProdutos).Settings.ID := ds.DataSet.FieldByName('codigo').asInteger;
    TfrmCad(frmCadRegrasPrecosProdutos).ShowModal;
  finally
    TfrmCad(frmCadRegrasPrecosProdutos).Release;
    dsItens.DataSet.Refresh;
  end;
end;

procedure TfrmCadRegrasPrecos.btnRMVClick(Sender: TObject);
begin
  inherited;
  if Pergunta('INFO','Exclusão de registro','Tem certeza que deseja remover o registro selecionado?','SN') = ID_YES then
    begin
      dsItens.DataSet.Delete;
      dsItens.DataSet.Refresh;
    end;
end;

procedure TfrmCadRegrasPrecos.FormShow(Sender: TObject);
begin
  inherited;
  if (dsItens.DataSet.RecordCount > 0) and (ds.State in [dsInsert, dsEdit]) then
    begin
      btnADD.Enabled := True;
      btnEDT.Enabled := True;
      btnRMV.Enabled := True;
    end
  else
    begin
      if (dsItens.DataSet.RecordCount = 0) and (ds.State in [dsInsert, dsEdit]) then
        begin
          btnADD.Enabled := True;
          btnEDT.Enabled := False;
          btnRMV.Enabled := False;
        end
      else
        begin
          btnADD.Enabled := False;
          btnEDT.Enabled := False;
          btnRMV.Enabled := False;
        end;
    end;
end;

end.
