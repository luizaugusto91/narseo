﻿unit unCadPessoaFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCadPessoa, unSystem, cxGraphics, cxControls,
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
  Vcl.ExtCtrls, Vcl.AppEvnts, cxGroupBox, cxRadioGroup, cxCurrencyEdit,
  dxGDIPlusClasses, cxImage;

type
  TfrmCadPessoaFuncionario = class(TfrmCadPessoa)
    grp2: TGroupBox;
    qFuncionario: TUniQuery;
    dsFuncionario: TUniDataSource;
    qFuncionariocodigo: TIntegerField;
    qFuncionariopessoa: TIntegerField;
    qFuncionarionumero_pis: TIntegerField;
    qFuncionarioctps_numero: TIntegerField;
    qFuncionarioctps_serie: TIntegerField;
    qFuncionarioctps_uf: TStringField;
    qFuncionariodepartamento: TIntegerField;
    qFuncionariocargo: TIntegerField;
    qFuncionariofuncao: TIntegerField;
    qFuncionariosalario: TCurrencyField;
    qFuncionariodata_demissao: TDateField;
    qFuncionariodata_ultimo_reajuste: TDateField;
    qFuncionariodata_ultima_ferias: TDateField;
    qFuncionarioforma_pagamento: TIntegerField;
    qFuncionariotipo_pagamento: TIntegerField;
    qFuncionariotipo_contrato: TIntegerField;
    lblNIS: TLabel;
    edtnumero_pis: TcxDBSpinEdit;
    Label10: TLabel;
    edtctps_numero: TcxDBSpinEdit;
    Label23: TLabel;
    edtctps_serie: TcxDBSpinEdit;
    Label29: TLabel;
    edtctps_uf: TcxDBTextEdit;
    rgTipoContrato: TcxDBRadioGroup;
    Label30: TLabel;
    edtdepartamento: TcxDBSpinEdit;
    Label31: TLabel;
    edtcargo: TcxDBSpinEdit;
    Label32: TLabel;
    edtfuncao: TcxDBSpinEdit;
    cbbDepartamento: TcxDBLookupComboBox;
    cbbCargo: TcxDBLookupComboBox;
    cbbFuncao: TcxDBLookupComboBox;
    lblSalario: TLabel;
    edtsalario: TcxDBCurrencyEdit;
    Label33: TLabel;
    edtdata_admissao: TcxDBDateEdit;
    qFuncionariodata_admissao: TDateField;
    Label34: TLabel;
    edtdata_demissao: TcxDBDateEdit;
    Label35: TLabel;
    edtdata_ultimo_reajuste: TcxDBDateEdit;
    Label36: TLabel;
    edtdata_ultima_ferias: TcxDBDateEdit;
    Label37: TLabel;
    cxDBSpinEdit1: TcxDBSpinEdit;
    Label38: TLabel;
    cxDBSpinEdit2: TcxDBSpinEdit;
    cbbTipoPagamento: TcxDBLookupComboBox;
    cbbFormaPagamento: TcxDBLookupComboBox;
    qDepartamento: TUniQuery;
    qCargo: TUniQuery;
    qFuncao: TUniQuery;
    dsDepartamento: TUniDataSource;
    dsCargo: TUniDataSource;
    dsFuncoes: TUniDataSource;
    procedure btnSalvarClick(Sender: TObject);
    procedure edtCNPJExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPessoaFuncionario: TfrmCadPessoaFuncionario;

implementation

{$R *.dfm}

procedure TfrmCadPessoaFuncionario.btnCancelarClick(Sender: TObject);
begin
  dsFuncionario.DataSet.Cancel;
  inherited;
end;

procedure TfrmCadPessoaFuncionario.btnSalvarClick(Sender: TObject);
begin
  //ValidaCamposObrigatorios(qFuncionario);
  //dsFuncionario.DataSet.Post;
  qConsultacolaborador.AsBoolean := True;
  inherited;
end;

procedure TfrmCadPessoaFuncionario.edtCNPJExit(Sender: TObject);
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
              if Pergunta('WHAT','Cadastro localizado',
                          sMensagem,
                          'SN') = ID_YES then
                begin
                  xID := qSQL.FieldByName('codigo').AsInteger;
                  OpenQuery;
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
                  dsFuncionario.DataSet.Edit;
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

procedure TfrmCadPessoaFuncionario.FormShow(Sender: TObject);
begin
  inherited;
  if ds.State in [dsInsert, dsEdit] then
    begin
      TabPerfil.Enabled := False;
    end;
end;

end.
