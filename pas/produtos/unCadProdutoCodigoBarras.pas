unit unCadProdutoCodigoBarras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unMaster, cxGraphics, cxControls,
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
  cxNavigator, Data.DB, cxDBData, cxClasses, Vcl.ImgList, Vcl.ExtCtrls,
  Vcl.StdCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, DBAccess, Uni, MemDS, cxTextEdit;

type
  TfrmCadProdutoCodigobarras = class(TFMaster)
    grpContent: TGroupBox;
    pnlAction: TPanel;
    btnAdd: TButton;
    btnRemover: TButton;
    Grid: TcxGrid;
    View: TcxGridDBTableView;
    ColumnID: TcxGridDBColumn;
    ColumnDescricao: TcxGridDBColumn;
    Master: TcxGridLevel;
    pnlBotton: TPanel;
    Label26: TLabel;
    Label27: TLabel;
    Image2: TImage;
    btnFechar: TButton;
    ImageList16: TcxImageList;
    StyleRepository: TcxStyleRepository;
    StyleHeader: TcxStyle;
    StyleItemInativo: TcxStyle;
    StyleItemAtivo: TcxStyle;
    qConsulta: TUniQuery;
    ds: TUniDataSource;
    qConsultacodigo: TIntegerField;
    qConsultaproduto: TIntegerField;
    qConsultacodigobarras: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure qConsultaBeforePost(DataSet: TDataSet);
    procedure btnFecharClick(Sender: TObject);
    procedure qConsultaAfterRefresh(DataSet: TDataSet);
    procedure ViewEditKeyDown(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProdutoCodigobarras: TfrmCadProdutoCodigobarras;

implementation

{$R *.dfm}

procedure TfrmCadProdutoCodigobarras.btnAddClick(Sender: TObject);
begin
  inherited;
  ds.DataSet.Insert;
end;

procedure TfrmCadProdutoCodigobarras.btnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadProdutoCodigobarras.btnRemoverClick(Sender: TObject);
begin
  inherited;
  ds.DataSet.Delete;
end;

procedure TfrmCadProdutoCodigobarras.FormShow(Sender: TObject);
begin
  inherited;
  qConsulta.ParamByName('codigo').asInteger := Settings.ID;
  qConsulta.Open;
  qConsulta.ReadOnly:= False;
  btnFechar.Enabled := True;
  if ds.DataSet.RecordCount > 0 then
    begin
      btnRemover.Enabled:= True;
    end
  else
    begin
      btnRemover.Enabled:= False;
    end;
  Exit;
end;

procedure TfrmCadProdutoCodigobarras.qConsultaAfterRefresh(DataSet: TDataSet);
begin
  inherited;
  if ds.DataSet.RecordCount > 0 then
    begin
      btnRemover.Enabled:= True;
    end
  else
    begin
      btnRemover.Enabled:= False;
    end;
end;

procedure TfrmCadProdutoCodigobarras.qConsultaBeforePost(DataSet: TDataSet);
begin
  inherited;
  qConsultaproduto.AsInteger := Settings.ID;
end;

procedure TfrmCadProdutoCodigobarras.ViewEditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  inherited;
    if ds.State in [dsInsert, dsEdit] then
    begin
      if Key = 13 then
        begin
          ShowMessage('Aqui kd!');
          ds.DataSet.Post;
          ds.DataSet.Refresh;
          btnAdd.SetFocus;
        end;

    end;
end;

end.
