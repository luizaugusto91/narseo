unit unCadPessoaFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCadPessoa, unSystem, unCad, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxBarBuiltInMenu, Vcl.ImgList,
  Data.DB, MemDS, DBAccess, Uni, cxImageComboBox, cxDBEdit, cxMemo,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxPC,
  cxCheckBox, cxCalendar, cxTextEdit, cxMaskEdit, cxSpinEdit, Vcl.StdCtrls,
  Vcl.ExtCtrls, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, dxGDIPlusClasses,
  cxImage;

type
  TfrmCadPessoaFornecedor = class(TfrmCadPessoa)
    grpFornecedores: TGroupBox;
    Grid: TcxGrid;
    View: TcxGridDBTableView;
    ColumnFornecedor: TcxGridDBColumn;
    ColumnRepresentante: TcxGridDBColumn;
    ColumnUltimaCompra: TcxGridDBColumn;
    ColumnPrecoCompra: TcxGridDBColumn;
    ColumnTempoEntrega: TcxGridDBColumn;
    ColumnMinimoCompra: TcxGridDBColumn;
    Master: TcxGridLevel;
    pnl1: TPanel;
    btnNovo: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    qProdutos: TUniQuery;
    dsProdutos: TUniDataSource;
    StyleRepository: TcxStyleRepository;
    StyleHeader: TcxStyle;
    StyleItemInativo: TcxStyle;
    StyleItemAtivo: TcxStyle;
    procedure btnSalvarClick(Sender: TObject);
    procedure edtCNPJExit(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qProdutosAfterRefresh(DataSet: TDataSet);
    procedure qConsultaAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPessoaFornecedor: TfrmCadPessoaFornecedor;

implementation

uses
  unCadFornecedorProduto;

{$R *.dfm}

procedure TfrmCadPessoaFornecedor.btnEditarClick(Sender: TObject);
begin
  inherited;
  try
    Application.CreateForm(TfrmCadFornecedorProduto, frmCadFornecedorProduto);
    TfrmCad(frmCadFornecedorProduto).Settings.Modo := 'ALTERACAO';
    TfrmCad(frmCadFornecedorProduto).Settings.ID := ds.DataSet.FieldByName('codigo').asInteger;
    TfrmCad(frmCadFornecedorProduto).ShowModal;
  finally
    TfrmCad(frmCadFornecedorProduto).Release;
    dsProdutos.DataSet.Refresh;
  end;
end;

procedure TfrmCadPessoaFornecedor.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if Pergunta('INFO','Exclusão de registro','Tem certeza que deseja remover o registro selecionado?','SN') = ID_YES then
    begin
      dsProdutos.DataSet.Delete;
      dsProdutos.DataSet.Refresh;
    end
end;

procedure TfrmCadPessoaFornecedor.btnNovoClick(Sender: TObject);
begin
  inherited;
  try
    Application.CreateForm(TfrmCadFornecedorProduto, frmCadFornecedorProduto);
    TfrmCad(frmCadFornecedorProduto).Settings.Modo := 'NEW';
    TfrmCad(frmCadFornecedorProduto).Settings.ID := ds.DataSet.FieldByName('codigo').asInteger;
    TfrmCad(frmCadFornecedorProduto).ShowModal;
  finally
    TfrmCad(frmCadFornecedorProduto).Release;
    dsProdutos.DataSet.Refresh;
  end;
end;

procedure TfrmCadPessoaFornecedor.btnSalvarClick(Sender: TObject);
begin
  qConsultafornecedor.AsBoolean := True;
  inherited;
end;

procedure TfrmCadPessoaFornecedor.edtCNPJExit(Sender: TObject);
var sMensagem: String;
    xID: Integer;
begin
  inherited;
  // Verifica se o cadastro ja existe!
  if edtCNPJ.Text = '' then
    Exit
  else
    begin
      if ds.State in [dsInsert] then
        begin
          qSQL.Close;
          qSQL.SQL.Clear;
          qSQL.SQL.Text := ' SELECT codigo, '+
                           '        cliente, '+
                           '        colaborador, '+
                           '        fornecedor, '+
                           '        representante, '+
                           '        transportadora, '+
                           '        inativo, '+
                           '        (case when (cliente or colaborador or fornecedor or representante or transportadora or inativo) then true else false end)::boolean as existe '+
                           '   FROM pessoas WHERE cnpj = :cnpj';
          qSQL.ParamByName('cnpj').AsString := ds.DataSet.FieldByName('cnpj').AsString;
          qSQL.Open;
          if qSQL.RecordCount > 0 then
            begin
              sMensagem := 'Foi encontrado um registro para este documento.' + #13;
              if qSQL.FieldByName('existe').AsBoolean = True then
                begin
                  sMensagem := sMensagem + 'Detalhes do cadastro: ' + #13;
                  if qSQL.FieldByName('inativo').AsBoolean = True then sMensagem := sMensagem + '   ● Inativo' + #13;
                  if qSQL.FieldByName('cliente').AsBoolean = True then sMensagem := sMensagem + '   ● Cliente' + #13;
                  if qSQL.FieldByName('colaborador').AsBoolean = True then sMensagem := sMensagem + '   ● Colaborador' + #13;
                  if qSQL.FieldByName('fornecedor').AsBoolean = True then sMensagem := sMensagem + '    ● Fornecedor' + #13;
                  if qSQL.FieldByName('representante').AsBoolean = True then sMensagem := sMensagem + '   ● Representante' + #13;
                  if qSQL.FieldByName('transportadora').AsBoolean = True then sMensagem := sMensagem + '   ● Transportadora' + #13;
                end;
              sMensagem := sMensagem + 'Deseja utilizar este mesmo cadastro?';
              // Cria aviso que o cliente ja esta cadastrado e pergunta o que deseja fazer!
              if Pergunta('WHAT','Cadastro localizado', sMensagem, 'SN') = ID_YES then
                begin
                  xID := qSQL.FieldByName('codigo').AsInteger;
                  {qSQL.Close;
                  qSQL.SQL.Clear;
                  qSQL.SQL.Text := 'UPDATE pessoas SET colaborador = true WHERE codigo = :codigo';
                  qSQL.ParamByName('codigo').AsInteger := xID;
                  qSQL.Execute;}
                  ds.DataSet.Cancel;
                  qConsulta.Close;
                  qConsulta.ParamByName('codigo').AsInteger := xID;
                  qConsulta.Open;
                  ds.DataSet.Edit;
                end
              else
                begin
                  Aviso('INFO','Informação','Informe um documento diferente para realizar o cadastro.');
                  qConsultacnpj.AsString := '';
                  edtCNPJ.Clear;
                  edtCNPJ.SetFocus;
                end;
            end;
        end;
    end;
end;

procedure TfrmCadPessoaFornecedor.FormShow(Sender: TObject);
begin
  inherited;
  if ds.State in [dsEdit] then
    begin
      btnNovo.Enabled := True;
      if dsProdutos.DataSet.RecordCount > 0 then
        begin
          btnEditar.Enabled := True;
          btnExcluir.Enabled := True;
        end
      else
        begin
          btnEditar.Enabled := False;
          btnExcluir.Enabled := False;
        end;
    end
  else
    begin
      btnNovo.Enabled := False;
      btnEditar.Enabled := False;
      btnExcluir.Enabled := False;
    end;
end;

procedure TfrmCadPessoaFornecedor.qConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  qProdutos.ParamByName('codigo').AsInteger := qConsultacodigo.AsInteger;
end;

procedure TfrmCadPessoaFornecedor.qProdutosAfterRefresh(DataSet: TDataSet);
begin
  inherited;
  if dsProdutos.DataSet.RecordCount > 0 then
    begin
      btnEditar.Enabled := True;
      btnExcluir.Enabled := True;
    end
  else
    begin
      btnEditar.Enabled := False;
      btnExcluir.Enabled := False;
    end;
end;

end.
