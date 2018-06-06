unit unCadBombas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unSystem, unParametros,
  unCad, Vcl.ImgList, cxGraphics, Data.DB,
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
  cxNavigator, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxMaskEdit,
  cxSpinEdit, cxDBEdit, cxTextEdit, cxCheckBox, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dxGDIPlusClasses, cxImage;

type
  TfrmCadBombas = class(TfrmCad)
    qConsultacodigo: TIntegerField;
    qConsultadescricao: TStringField;
    qConsultainativo: TBooleanField;
    qConsultafabricante: TIntegerField;
    qConsultamodelo: TIntegerField;
    qConsultanr_serie: TStringField;
    qBicos: TUniQuery;
    dsSub: TUniDataSource;
    qFabricante: TUniQuery;
    dsFabricante: TUniDataSource;
    qModelo: TUniQuery;
    dsModelo: TUniDataSource;
    qModelocodigo: TIntegerField;
    qModelofabricante: TIntegerField;
    qModelodescricao: TStringField;
    qFabricantecodigo: TIntegerField;
    qFabricantedescricao: TStringField;
    qTanques: TUniQuery;
    dsTanques: TUniDataSource;
    cbbFabricante: TcxDBLookupComboBox;
    cbbModelo: TcxDBLookupComboBox;
    chbInativo: TcxDBCheckBox;
    edtCodigo: TcxDBSpinEdit;
    edtDescricao: TcxDBTextEdit;
    edtFabricante: TcxDBSpinEdit;
    edtModelo: TcxDBSpinEdit;
    edtNSerie: TcxDBTextEdit;
    grpBicos: TGroupBox;
    pnlbottonSub: TPanel;
    lblBico: TLabel;
    lblTanque: TLabel;
    btnCancel: TButton;
    btnConfirm: TButton;
    cbbTanque: TcxDBLookupComboBox;
    edtTanque: TcxDBSpinEdit;
    edtNLogico: TcxDBTextEdit;
    Grid: TcxGrid;
    View: TcxGridDBTableView;
    ColViewID: TcxGridDBColumn;
    ColViewNumero: TcxGridDBColumn;
    ColViewNLogico: TcxGridDBColumn;
    Master: TcxGridLevel;
    pnlTool: TPanel;
    btnAdd: TButton;
    btnRemove: TButton;
    btnReload: TButton;
    Label1: TLabel;
    lblCodigo: TLabel;
    lblFabricante: TLabel;
    lblModelo: TLabel;
    lblNSerie: TLabel;
    ColViewTanque: TcxGridDBColumn;
    qBicoscodigo: TIntegerField;
    qBicosbomba: TIntegerField;
    qBicostanque: TIntegerField;
    qBicostanque_descricao: TStringField;
    qBicosnr_bico: TStringField;
    qBicosnr_logico: TStringField;
    qBicosnr_ilha: TStringField;
    qBicosempresa: TIntegerField;
    qBicosinativo: TBooleanField;
    procedure qConsultafabricanteValidate(Sender: TField);
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnReloadClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadBombas: TfrmCadBombas;

implementation

{$R *.dfm}

procedure TfrmCadBombas.btnAddClick(Sender: TObject);
begin
  inherited;
  pnlbottonSub.Visible:= True;
  dsSub.DataSet.Insert;
  edtNLogico.SetFocus;
end;

procedure TfrmCadBombas.btnCancelClick(Sender: TObject);
begin
  inherited;
  dsSub.DataSet.FieldByName('bomba').AsInteger:= Settings.ID;
  dsSub.DataSet.Post;
  pnlbottonSub.Visible:= False;
  dsSub.DataSet.Refresh;
end;

procedure TfrmCadBombas.btnConfirmClick(Sender: TObject);
begin
  inherited;
  dsSub.DataSet.Cancel;
  pnlbottonSub.Visible:= False;
  dsSub.DataSet.Refresh;
end;

procedure TfrmCadBombas.btnReloadClick(Sender: TObject);
begin
  inherited;
  dsSub.DataSet.Refresh;
end;

procedure TfrmCadBombas.btnRemoveClick(Sender: TObject);
begin
  inherited;
  if (Application.MessageBox('Tem certeza que deseja apagar este Bico?','Exclusão!',MB_ICONQUESTION + MB_YESNO) = ID_YES) then
    begin
      dsSub.DataSet.Delete;
      dsSub.DataSet.Refresh;
    end;
end;

procedure TfrmCadBombas.FormShow(Sender: TObject);
begin
  inherited;
  qModelo.Close;
  qModelo.ParamByName('codigo').AsInteger := ds.DataSet.FieldByName('fabricante').AsInteger;
  qModelo.Open;
end;

procedure TfrmCadBombas.qConsultafabricanteValidate(Sender: TField);
begin
  inherited;
  // Testando se Fabricante foi informado.
  if ds.State in [dsEdit,dsInsert] then
    begin
      if Sender.IsNull = false then
        begin
          // Define a variavel do filtro de acordo com o codigo setado anteriormente.
          qModelo.Close;
          qModelo.ParamByName('codigo').AsInteger := ds.DataSet.FieldByName('fabricante').AsInteger;
          qModelo.Open;
          edtModelo.Enabled:= True;
          cbbModelo.Enabled:= True;
        end
      else
        begin
          Aviso('INFO','Campo Obrigatório!','O campo Fabricante deve ser preenchido.');
          cbbFabricante.SetFocus;
        end;
    end;
end;

end.
