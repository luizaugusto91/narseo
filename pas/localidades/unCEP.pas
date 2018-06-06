unit unCEP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, unMaster,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxClasses, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, ACBrBase, ACBrSocket, ACBrCEP, Datasnap.DBClient, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ImgList, dxGDIPlusClasses, cxImage, cxTextEdit, cxDBEdit,
  unSystem, unParametros, unFields, unEndereco, unCad;

type
  TfrmCEP = class(TFMaster)
    pnlHelp: TPanel;
    imgIconHelp: TcxImage;
    mmoHelp: TMemo;
    ImageList16: TcxImageList;
    pnlBotton: TPanel;
    Label26: TLabel;
    Label27: TLabel;
    imgHelp: TImage;
    btnCancelar: TButton;
    btnConcluir: TButton;
    pnlLista: TPanel;
    pnlPesquisa: TPanel;
    pnlDetalhes: TPanel;
    ClientDataSet: TClientDataSet;
    ClientDataSetlogradouro: TStringField;
    ClientDataSetcomplemento: TStringField;
    ClientDataSetcidade: TStringField;
    ClientDataSetuf: TStringField;
    ClientDataSetbairro: TStringField;
    ClientDataSettipo: TStringField;
    ClientDataSetcep: TStringField;
    DS: TDataSource;
    ACBrCEP: TACBrCEP;
    Grid: TcxGrid;
    View: TcxGridDBTableView;
    ColViewCEP: TcxGridDBColumn;
    ColViewTipo: TcxGridDBColumn;
    ColViewLogradouro: TcxGridDBColumn;
    ColViewComplemento: TcxGridDBColumn;
    ColViewBairro: TcxGridDBColumn;
    ColViewCidade: TcxGridDBColumn;
    ColViewUF: TcxGridDBColumn;
    Master: TcxGridLevel;
    StyleRepository: TcxStyleRepository;
    StyleHeader: TcxStyle;
    StyleItemInativo: TcxStyle;
    StyleItemAtivo: TcxStyle;
    rbCEP: TRadioButton;
    rbLogradouro: TRadioButton;
    btnBuscaCEP: TButton;
    Label1: TLabel;
    edtlogradouro: TcxDBTextEdit;
    Label2: TLabel;
    edtcomplemento: TcxDBTextEdit;
    Label3: TLabel;
    edtbairro: TcxDBTextEdit;
    Label4: TLabel;
    edtcidade: TcxDBTextEdit;
    Label5: TLabel;
    edttipo: TcxDBTextEdit;
    Label6: TLabel;
    edtcep: TcxDBTextEdit;
    Label7: TLabel;
    edtuf: TcxDBTextEdit;
    edtConsulta: TcxTextEdit;
    procedure btnBuscaCEPClick(Sender: TObject);
    procedure imgHelpMouseEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConcluirClick(Sender: TObject);
    procedure rbCEPEnter(Sender: TObject);
  private
    { Private declarations }
    procedure Focus;
  public
    Endereco: TEndereco;
    procedure GetHint(Sender: TObject);
    { Public declarations }
  end;

var
  frmCEP: TfrmCEP;

implementation

{$R *.dfm}

procedure TfrmCEP.btnBuscaCEPClick(Sender: TObject);
var
  i: integer;
begin
  // Consulta CEP.
  if rbCEP.Checked then
    ACBrCEP.BuscarPorCEP(edtConsulta.Text)
  else
    ACBrCEP.BuscarPorLogradouro('', edtConsulta.Text, '', '', '');
  // Grava na tabela temporaria.
  for I := 0 to ACBrCEP.Enderecos.Count - 1 do
    begin
      ds.DataSet.Insert;
      ClientDataSetcep.AsString := ACBrCEP.Enderecos[i].CEP;
      ClientDataSetlogradouro.AsString := ACBrCEP.Enderecos[i].Logradouro;
      ClientDataSetcomplemento.AsString := ACBrCEP.Enderecos[i].Complemento;
      ClientDataSetcidade.AsString := ACBrCEP.Enderecos[i].Municipio;
      ClientDataSetuf.AsString := ACBrCEP.Enderecos[i].UF;
      ClientDataSetbairro.AsString := ACBrCEP.Enderecos[i].Bairro;
      ClientDataSettipo.AsString := ACBrCEP.Enderecos[i].Tipo_Logradouro;
      ds.DataSet.Post;
    end;
  // Habilita botões se houverem registros
  if (ClientDataSet.RecordCount > 0) and (Settings.Modo = 'CONSULTA') then
    begin
      btnConcluir.Enabled := True;
      btnCancelar.Enabled := True;
    end;
end;

procedure TfrmCEP.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Endereco.Valido := False;
  Close;
end;

procedure TfrmCEP.btnConcluirClick(Sender: TObject);
begin
  inherited;
  if Settings.Modo = 'CONSULTA' then
    begin
      Endereco.Cep := ClientDataSetcep.AsString;
      Endereco.Logradouro := ClientDataSetlogradouro.AsString;
      Endereco.Bairro := ClientDataSetbairro.AsString;
      Endereco.Complemento := ClientDataSetcomplemento.AsString;
      Endereco.Cidade := ClientDataSetcidade.AsString;
      Endereco.Estado := ClientDataSetuf.AsString;
      Endereco.Tipologradouro := ClientDataSettipo.AsString;
      Endereco.Valido := True;
      Close;
    end;
end;

procedure TfrmCEP.Focus;
  var
  I: integer;
  // Teste
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TEdit then
      InOutFocus(Components[I] as TEdit);
    if (Components[I] is TcxDBSpinEdit) then
      InOutFocus(Components[I] as TcxDBSpinEdit);
    if (Components[I] is TcxDBTextEdit) then
      InOutFocus(Components[I] as TcxDBTextEdit);
    if (Components[I] is TcxDBMemo) then
      InOutFocus(Components[I] as TcxDBMemo);
    if (Components[I] is TcxDBDateEdit) then
      InOutFocus(Components[I] as TcxDBDateEdit);
    if (Components[I] is TcxDBCalcEdit) then
      InOutFocus(Components[I] as TcxDBCalcEdit);
    if (Components[I] is TcxTextEdit) then
      InOutFocus(Components[I] as TcxTextEdit);
    if (Components[I] is TcxDBCheckBox) then
      InOutFocus(Components[I] as TcxDBCheckBox);
  end;
end;

procedure TfrmCEP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Settings.Modo <> 'CONSULTA' then
    begin
      Action := caFree;
    end
  else
    begin
      Parametros.PEndereco := Endereco;
    end;
end;

procedure TfrmCEP.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria o DataCliente
  ClientDataSet.CreateDataSet;
  Endereco := TEndereco.Create;
  Endereco.Valido := False;
end;

procedure TfrmCEP.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 112 then
    begin
      if pnlHelp.Visible = False then
        begin
          Self.ClientHeight := Self.ClientHeight + 44;
          pnlHelp.Visible := True
        end
      else
        begin
          Self.ClientHeight := Self.ClientHeight - 44;
          pnlHelp.Visible := False
        end;
    end;
end;

procedure TfrmCEP.FormShow(Sender: TObject);
begin
  inherited;
  Self.ClientHeight := Self.ClientHeight - 44;
  // Verifica o Tipo do Form
  if Settings.Modo <> 'CONSULTA' then
    begin
      btnConcluir.Enabled := False;
      btnCancelar.Enabled := False;
      Exit;
    end;
end;

procedure TfrmCEP.GetHint(Sender: TObject);
var
  HelpString: String;
begin
  if pnlHelp.Visible = True then
    begin
      mmoHelp.Lines.Clear;
      if Sender is TPanel then
        begin
          HelpString := TPanel(Sender).Hint;
        end;
      if Sender is TGroupBox then
        begin
          HelpString := TGroupBox(Sender).Hint;
        end;
      if Sender is TButton then
        begin
          HelpString := TButton(Sender).Hint;
        end;
      if Sender is TRadioButton then
        begin
          HelpString := TRadioButton(Sender).Hint;
        end;
      if Sender is TEdit then
        begin
          HelpString := TEdit(Sender).Hint;
        end;
      if Sender is TcxDBSpinEdit then
        begin
          HelpString := TcxDBSpinEdit(Sender).Hint;
        end;
      if Sender is TcxDBTextEdit then
        begin
          HelpString := TcxDBTextEdit(Sender).Hint;
        end;
      if Sender is TcxDBMemo then
        begin
          HelpString := TcxDBMemo(Sender).Hint;
        end;
      if Sender is TcxDBCalcEdit then
        begin
          HelpString := TcxDBCalcEdit(Sender).Hint;
        end;
      if Sender is TcxTextEdit then
        begin
          HelpString := TcxTextEdit(Sender).Hint;
        end;
       mmoHelp.Lines.Append(HelpString);
      MemoScroll(SB_LINEUP,mmoHelp);
    end;
end;

procedure TfrmCEP.imgHelpMouseEnter(Sender: TObject);
begin
  GetHint(Sender);
end;

procedure TfrmCEP.rbCEPEnter(Sender: TObject);
begin
  inherited;
  Focus;
end;

end.
