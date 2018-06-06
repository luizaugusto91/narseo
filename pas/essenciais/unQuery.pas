unit unQuery;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unSystem, unParametros, unGrid, Midaslib,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ImgList, cxGraphics, Data.DB, DBAccess, Uni,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxContainer, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxSpinEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, cxCheckBox,
  cxTimeEdit, cxCurrencyEdit;

type
  TfrmQuery = class(TForm)
    ImageList16: TcxImageList;
    pnlBotton: TPanel;
    Label26: TLabel;
    Label27: TLabel;
    Image2: TImage;
    btnFechar: TButton;
    grpCampos: TGroupBox;
    grpFiltros: TGroupBox;
    btnAdicionar: TButton;
    grpCondicoes: TGroupBox;
    dsInfo: TUniDataSource;
    GridFiltros: TcxGrid;
    ViewFiltros: TcxGridDBTableView;
    MasterFiltros: TcxGridLevel;
    GridQuery: TcxGrid;
    ViewQuery: TcxGridDBTableView;
    MasterQuery: TcxGridLevel;
    ColumnCampo: TcxGridDBColumn;
    ColumnTipo: TcxGridDBColumn;
    StyleRepository: TcxStyleRepository;
    StyleHeader: TcxStyle;
    StyleItemInativo: TcxStyle;
    StyleItemAtivo: TcxStyle;
    ColumnQCampo: TcxGridDBColumn;
    ColumnQCondicao: TcxGridDBColumn;
    ColumnQValor: TcxGridDBColumn;
    btnAplly: TButton;
    btnRemove: TButton;
    dsQuery: TUniDataSource;
    lblFiltro: TcxLabel;
    cbbCondicao: TcxComboBox;
    lblValores: TcxLabel;
    pnlFTEXTO: TPanel;
    edtTEXTO: TcxTextEdit;
    pnlFINTEGER: TPanel;
    edtINTEGER: TcxSpinEdit;
    pnlFNUMERIC: TPanel;
    edtNUMERIC: TcxCurrencyEdit;
    pnlFTIMEENTRE: TPanel;
    edtTIMEI: TcxTimeEdit;
    edtTIMEF: TcxTimeEdit;
    pnlFBOOLEAN: TPanel;
    cbSELECIONADO: TcxCheckBox;
    pnlFTIME: TPanel;
    edtTIME: TcxTimeEdit;
    pnlFDATAENTRE: TPanel;
    edtDATAI: TcxDateEdit;
    edtDATAF: TcxDateEdit;
    pnlFDATA: TPanel;
    edtDATA: TcxDateEdit;
    pnlFINTEGERENTRE: TPanel;
    edtINTEGERI: TcxSpinEdit;
    edtINTEGERF: TcxSpinEdit;
    pnlFNUMERICENTRE: TPanel;
    edtNUMERICI: TcxCurrencyEdit;
    edtNUMERICF: TcxCurrencyEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnApllyClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure cbbCondicaoPropertiesChange(Sender: TObject);
  private
    procedure RestauraFiltro;
    procedure getFiltroValue;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQuery: TfrmQuery;

implementation

{$R *.dfm}

procedure TfrmQuery.btnAdicionarClick(Sender: TObject);
begin
  GridFiltros.Enabled := False;
  grpCondicoes.Enabled := True;
  btnAdicionar.Enabled := False;
  // > Registra o Filtro
  dsQuery.DataSet.Insert;
  dsQuery.DataSet.FieldByName('codigo').AsInteger := dsQuery.DataSet.RecordCount + 1;
  dsQuery.DataSet.FieldByName('campo').AsString := dsInfo.DataSet.FieldByName('coluna').AsString;
  dsQuery.DataSet.FieldByName('descricao').AsString := dsInfo.DataSet.FieldByName('descricao').AsString;
  dsQuery.DataSet.FieldByName('tipo').AsString := dsInfo.DataSet.FieldByName('tipo').AsString;
  // > Carrega os tipos de Filtro
  cbbCondicao.Properties.Items.Clear;
  if dsInfo.DataSet.FieldByName('tipo').AsString = 'string' then
    begin
      cbbCondicao.Properties.Items.Add('IGUAL');
      cbbCondicao.Properties.Items.Add('INICIA');
      cbbCondicao.Properties.Items.Add('CONTEM');
      cbbCondicao.Properties.Items.Add('TERMINE');
      cbbCondicao.Properties.Items.Add('NULO');
    end;
  if dsInfo.DataSet.FieldByName('tipo').AsString = 'integer' then
    begin
      cbbCondicao.Properties.Items.Add('MENOR');
      cbbCondicao.Properties.Items.Add('IGUAL');
      cbbCondicao.Properties.Items.Add('MAIOR');
      cbbCondicao.Properties.Items.Add('MENORIGUAL');
      cbbCondicao.Properties.Items.Add('MAIORIGUAL');
      cbbCondicao.Properties.Items.Add('ENTRE');
      cbbCondicao.Properties.Items.Add('EM');
      cbbCondicao.Properties.Items.Add('NULO');
    end;
  if dsInfo.DataSet.FieldByName('tipo').AsString = 'float' then
    begin
      cbbCondicao.Properties.Items.Add('MENOR');
      cbbCondicao.Properties.Items.Add('IGUAL');
      cbbCondicao.Properties.Items.Add('MAIOR');
      cbbCondicao.Properties.Items.Add('MENORIGUAL');
      cbbCondicao.Properties.Items.Add('MAIORIGUAL');
      cbbCondicao.Properties.Items.Add('ENTRE');
      cbbCondicao.Properties.Items.Add('EM');
      cbbCondicao.Properties.Items.Add('NULO');
    end;
  if dsInfo.DataSet.FieldByName('tipo').AsString = 'date' then
    begin
      cbbCondicao.Properties.Items.Add('MENOR');
      cbbCondicao.Properties.Items.Add('IGUAL');
      cbbCondicao.Properties.Items.Add('MAIOR');
      cbbCondicao.Properties.Items.Add('MENORIGUAL');
      cbbCondicao.Properties.Items.Add('MAIORIGUAL');
      cbbCondicao.Properties.Items.Add('ENTRE');
      cbbCondicao.Properties.Items.Add('NULO');
    end;
  if dsInfo.DataSet.FieldByName('tipo').AsString = 'time' then
    begin
      cbbCondicao.Properties.Items.Add('MENOR');
      cbbCondicao.Properties.Items.Add('IGUAL');
      cbbCondicao.Properties.Items.Add('MAIOR');
      cbbCondicao.Properties.Items.Add('MENORIGUAL');
      cbbCondicao.Properties.Items.Add('MAIORIGUAL');
      cbbCondicao.Properties.Items.Add('ENTRE');
      cbbCondicao.Properties.Items.Add('NULO');
    end;
  if dsInfo.DataSet.FieldByName('tipo').AsString = 'boolean' then
    begin
      cbbCondicao.Properties.Items.Add('BOLEANO');
      cbbCondicao.Properties.Items.Add('NULO');
    end;
  //  STRING[IGUAL,INICIA,CONTEM,TERMINE]
  //  INTEGER[MENOR,IGUAL,MAIOR,MENORIGUAL,MAIORIGUAL,ENTRE,EM]
  //  DATA[MENOR,IGUAL,MAIOR,MENORIGUAL,MAIORIGUAL,ENTRE,EM]
  //  BOOLEAN[SIM,NAO]
end;

procedure TfrmQuery.btnApllyClick(Sender: TObject);
begin
  getFiltroValue;
  dsQuery.DataSet.FieldByName('filtro').AsString := cbbCondicao.Text;
  dsQuery.DataSet.Post;
  grpCondicoes.Enabled := False;
  GridFiltros.Enabled := True;
  btnAdicionar.Enabled := True;
  //
  cbbCondicao.Text := 'SELECIONE';
end;

procedure TfrmQuery.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmQuery.btnRemoveClick(Sender: TObject);
var
  I: Integer;
begin
  dsQuery.DataSet.Cancel;
  grpCondicoes.Enabled := False;
  GridFiltros.Enabled := True;
  btnAdicionar.Enabled := True;
  // Deixa os Filtros invisiveis
  cbbCondicao.Text := 'SELECIONE';
end;

procedure TfrmQuery.cbbCondicaoPropertiesChange(Sender: TObject);
begin
  // Verifica qual o pnl de Filtro a ser utilizado
  RestauraFiltro;
  if cbbCondicao.Text = 'SELECIONE' then
    Exit;
  if cbbCondicao.Text = 'NULO' then
    begin
      pnlFBOOLEAN.Visible := True;
      cbSELECIONADO.Caption := 'NULO';
      Exit;
    end;
  if (dsQuery.DataSet.FieldByName('tipo').AsString = 'string') or (cbbCondicao.Text = 'EM') then
    begin
      pnlFTEXTO.Visible := True;
      Exit;
    end;
  if (cbbCondicao.Text <> 'ENTRE') and (dsQuery.DataSet.FieldByName('tipo').AsString = 'integer') then
    begin
      pnlFINTEGER.Visible := True;
      Exit;
    end;
  if (cbbCondicao.Text = 'ENTRE') and (dsQuery.DataSet.FieldByName('tipo').AsString = 'integer') then
    begin
      pnlFINTEGERENTRE.Visible := True;
      Exit;
    end;
  if (cbbCondicao.Text <> 'ENTRE') and (dsQuery.DataSet.FieldByName('tipo').AsString = 'float') then
    begin
      pnlFNUMERIC.Visible := True;
      Exit;
    end;
  if (cbbCondicao.Text = 'ENTRE') and (dsQuery.DataSet.FieldByName('tipo').AsString = 'float') then
    begin
      pnlFNUMERICENTRE.Visible := True;
      Exit;
    end;
  if (cbbCondicao.Text <> 'ENTRE') and (dsQuery.DataSet.FieldByName('tipo').AsString = 'date') then
    begin
      pnlFDATA.Visible := True;
      Exit;
    end;
  if (cbbCondicao.Text = 'ENTRE') and (dsQuery.DataSet.FieldByName('tipo').AsString = 'date') then
    begin
      pnlFDATAENTRE.Visible := True;
      Exit;
    end;
  if (cbbCondicao.Text <> 'ENTRE') and (dsQuery.DataSet.FieldByName('tipo').AsString = 'time') then
    begin
      pnlFTIME.Visible := True;
      Exit;
    end;
  if (cbbCondicao.Text = 'ENTRE') and (dsQuery.DataSet.FieldByName('tipo').AsString = 'time') then
    begin
      pnlFTIMEENTRE.Visible := True;
      Exit;
    end;
  if cbbCondicao.Text = 'BOLEANO' then
    begin
      pnlFBOOLEAN.Visible := True;
      cbSELECIONADO.Caption := dsQuery.DataSet.FieldByName('descricao').AsString;
      Exit;
    end;
end;

procedure TfrmQuery.FormShow(Sender: TObject);
begin
  if dsInfo.DataSet.RecordCount > 0 then
    begin
      btnAdicionar.Enabled := True;
    end
  else
    begin
      btnAdicionar.Enabled := False;
    end;
end;

procedure TfrmQuery.getFiltroValue;
begin
  // Filtro NULO
  if cbbCondicao.Text = 'NULO' then
    begin
      if cbSELECIONADO.Checked = True then
        dsQuery.DataSet.FieldByName('valor').AsString := 'NULO'
      else
        dsQuery.DataSet.FieldByName('valor').AsString := 'NAO NULO';
      Exit;
    end;
  // Para textos
  if dsQuery.DataSet.FieldByName('tipo').AsString = 'string' then
    begin
      // STRING > [IGUAL,INICIA,CONTEM,TERMINE]
      if cbbCondicao.Text = 'IGUAL' then
        begin
          dsQuery.DataSet.FieldByName('valor').AsString := edtTEXTO.Text;
          Exit;
        end;
      if cbbCondicao.Text = 'INICIA' then
        begin
          dsQuery.DataSet.FieldByName('valor').AsString := edtTEXTO.Text  + '%';
          Exit;
        end;
      if cbbCondicao.Text = 'CONTEM' then
        begin
          dsQuery.DataSet.FieldByName('valor').AsString := '%' + edtTEXTO.Text + '%';
          Exit;
        end;
      if cbbCondicao.Text = 'TERMINE' then
        begin
          dsQuery.DataSet.FieldByName('valor').AsString := '%' + edtTEXTO.Text;
          Exit;
        end;
    end;
  // Para Inteiros
  if dsQuery.DataSet.FieldByName('tipo').AsString = 'integer' then
    begin
      // INTEGER > [MENOR,IGUAL,MAIOR,MENORIGUAL,MAIORIGUAL,ENTRE,EM]
      if cbbCondicao.Text = 'EM' then
        begin
          dsQuery.DataSet.FieldByName('valor').AsString := '(' + edtTEXTO.Text + ')';
          Exit;
        end
      else
        begin
          if cbbCondicao.Text = 'ENTRE' then
            begin
              dsQuery.DataSet.FieldByName('valor').AsString := edtINTEGERI.Text + '|' + edtINTEGERF.Text;
              Exit;
            end
          else
            begin
              dsQuery.DataSet.FieldByName('valor').AsString := edtINTEGER.Text;
              Exit;
            end;
        end;
    end;
  // > Para Numeros Reais
  if dsQuery.DataSet.FieldByName('tipo').AsString = 'float' then
    begin
      // NUMERIC > [MENOR,IGUAL,MAIOR,MENORIGUAL,MAIORIGUAL,ENTRE,EM]
      if cbbCondicao.Text = 'EM' then
        begin
          dsQuery.DataSet.FieldByName('valor').AsString := '(' + edtTEXTO.Text + ')';
          Exit;
        end
      else
        begin
          if cbbCondicao.Text = 'ENTRE' then
            begin
              dsQuery.DataSet.FieldByName('valor').AsString := edtNUMERICI.Text + '|' + edtNUMERICF.Text;
              Exit;
            end
          else
            begin
              dsQuery.DataSet.FieldByName('valor').AsString := edtNUMERIC.Text;
              Exit;
            end;
        end;
    end;
  // > Para Datas
  if dsQuery.DataSet.FieldByName('tipo').AsString = 'date' then
    begin
      // DATA > [MENOR,IGUAL,MAIOR,MENORIGUAL,MAIORIGUAL,ENTRE,EM]
      if cbbCondicao.Text = 'EM' then
        begin
          dsQuery.DataSet.FieldByName('valor').AsString := '(' + edtTEXTO.Text + ')';
          Exit;
        end
      else
        begin
          if cbbCondicao.Text = 'ENTRE' then
            begin
              dsQuery.DataSet.FieldByName('valor').AsString := edtDATAI.Text + '|' + edtDATAF.Text;
              Exit;
            end
          else
            begin
              dsQuery.DataSet.FieldByName('valor').AsString := edtDATA.Text;
              Exit;
            end;
        end;
    end;
  // > Para Horas
  if dsQuery.DataSet.FieldByName('tipo').AsString = 'time' then
    begin
      // > HORA > [MENOR,IGUAL,MAIOR,MENORIGUAL,MAIORIGUAL,ENTRE,EM]
      if cbbCondicao.Text = 'EM' then
        begin
          dsQuery.DataSet.FieldByName('valor').AsString := '(' + edtTEXTO.Text + ')';
          Exit;
        end
      else
        begin
          if cbbCondicao.Text = 'ENTRE' then
            begin
              dsQuery.DataSet.FieldByName('valor').AsString := edtTIMEI.Text + '|' + edtTIMEF.Text;
              Exit;
            end
          else
            begin
              dsQuery.DataSet.FieldByName('valor').AsString := edtTIME.Text;
              Exit;
            end;
        end;
    end;
  if dsQuery.DataSet.FieldByName('tipo').AsString = 'boolean' then
    begin
      if cbSELECIONADO.Checked = True then
        dsQuery.DataSet.FieldByName('valor').AsString := 'SIM'
      else
        dsQuery.DataSet.FieldByName('valor').AsString := 'NAO';
    end;
end;

procedure TfrmQuery.RestauraFiltro;
var
  I: Integer;
begin
  // Deixa os Filtros invisiveis
  for I := 0 to Self.ComponentCount - 1 do
    begin
      if Self.Components[i] is TPanel then
        begin
          if TPanel(Self.Components[i]).Tag = 999 then
            TPanel(Self.Components[i]).Visible := False;
        end;
    end;
end;

end.
