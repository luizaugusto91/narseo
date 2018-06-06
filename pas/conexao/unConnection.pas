unit unConnection;

interface

uses
  System.SysUtils, System.Classes, Variants, Messages, Controls, Vcl.Dialogs,
  DALoader, UniLoader, DAAlerter, UniAlerter, unParametros, unSystem,
  DADump, UniDump, CREncryption, Uni, DBAccess, Data.DB, UniProvider,
  PostgreSQLUniProvider, MemDS, DAScript, UniScript, DASQLMonitor, UniSQLMonitor,
  SQLiteUniProvider, IPPeerServer, Datasnap.DSCommonServer,
  Datasnap.DSTCPServerTransport, Datasnap.DSServer, Datasnap.Provider;

type
  TConnection = class(TDataModule)
    PostgreSQLUniProvider: TPostgreSQLUniProvider;
    Conn: TUniConnection;
    UniTransaction: TUniTransaction;
    UniEncryptor: TUniEncryptor;
    UniDump: TUniDump;
    UniAlerter: TUniAlerter;
    UniLoader: TUniLoader;
    qEmpresas: TUniQuery;
    qBasic: TUniQuery;
    qEmpresascodigo: TIntegerField;
    qEmpresaspessoa: TIntegerField;
    qEmpresasserial: TStringField;
    qEmpresaschave: TStringField;
    qEmpresasdata_inicio: TDateField;
    qEmpresasdata_fim: TDateField;
    qEmpresasmatriz: TBooleanField;
    qEmpresascd_matriz: TIntegerField;
    qEmpresasnome: TStringField;
    qEmpresasfantasia: TStringField;
    qEmpresascnpj: TStringField;
    qLogin: TUniQuery;
    qHelp: TUniQuery;
    qHelpcodigo: TIntegerField;
    qHelpformulario: TIntegerField;
    qHelpnome: TStringField;
    qHelpformname: TStringField;
    qHelptag: TIntegerField;
    qHelphtml: TMemoField;
    qHelpversao: TStringField;
    qModulos: TUniQuery;
    qFormularios: TUniQuery;
    qPermissoesGrupo: TUniQuery;
    qPermissoesUser: TUniQuery;
    qSQL: TUniQuery;
    qPermissoesGrupocodigo: TIntegerField;
    qPermissoesGrupogrupo: TIntegerField;
    qPermissoesGrupoformulario: TIntegerField;
    qPermissoesGrupoabrir: TBooleanField;
    qPermissoesGrupoalteracao: TBooleanField;
    qPermissoesGrupoexclusao: TBooleanField;
    qPermissoesGrupoexecutar: TBooleanField;
    qPermissoesGrupotag: TIntegerField;
    qAssinatura: TUniQuery;
    qAssinaturacodigo: TIntegerField;
    qAssinaturaempresa: TIntegerField;
    qAssinaturacertificado_datavencimento: TDateField;
    qAssinaturacertificado_senha: TStringField;
    qAssinaturacertificado_chave: TStringField;
    qAssinaturaarq_pastasseparadas: TBooleanField;
    qAssinaturaarq_criarpastasmensalmente: TBooleanField;
    qAssinaturaarq_separarmodelo: TBooleanField;
    qAssinaturaarq_path_nfe: TStringField;
    qAssinaturaarq_path_cancelamento: TStringField;
    qAssinaturaarq_path_cce: TStringField;
    qAssinaturaarq_path_cfe: TStringField;
    qAssinaturaarq_path_inutilizacao: TStringField;
    qAssinaturaarq_path_dpec: TStringField;
    qAssinaturaarq_path_eventos: TStringField;
    qAssinaturaweb_ufdestino: TStringField;
    qAssinaturaweb_ajustarautomaticamente: TBooleanField;
    qAssinaturaweb_ajuste_aguardar: TIntegerField;
    qAssinaturaweb_ajuste_tentativas: TIntegerField;
    qAssinaturaweb_ajuste_intervalo: TIntegerField;
    qAssinaturaweb_proxy_host: TStringField;
    qAssinaturaweb_proxy_port: TStringField;
    qAssinaturaweb_proxy_usuario: TStringField;
    qAssinaturaweb_proxy_senha: TStringField;
    qAssinaturaemail_smtp: TStringField;
    qAssinaturaemail_conexaosegura: TBooleanField;
    qAssinaturaemail_porta: TStringField;
    qAssinaturaemail_usuario: TStringField;
    qAssinaturaemail_senha: TStringField;
    qAssinaturaemail_assunto: TStringField;
    qAssinaturaemail_mensagem: TStringField;
    qAssinaturadanfe_logo: TBlobField;
    qAssinaturadanfe_retrato: TIntegerField;
    qHostConfig: TUniQuery;
    qHostConfigcodigo: TIntegerField;
    qHostConfigempresa: TIntegerField;
    qHostConfigestacao_serial: TStringField;
    qHostConfigestacao_terminal: TStringField;
    qHostConfigestacao_usuario: TStringField;
    qHostConfigcertificado_path: TStringField;
    qHostConfigcertificado_datavencimento: TDateField;
    qHostConfigcertificado_senha: TStringField;
    qHostConfigcertificado_chave: TStringField;
    qHostConfigsefaz_ambiente: TIntegerField;
    qHostConfigweb_proxy_host: TStringField;
    qHostConfigweb_proxy_port: TStringField;
    qHostConfigweb_proxy_usuario: TStringField;
    qHostConfigweb_proxy_senha: TStringField;
    ScriptHostConfig1: TUniScript;
    ScriptHostConfig: TUniQuery;
    UniSQLMonitor: TUniSQLMonitor;
    qBreak: TUniQuery;
    qPessoa: TUniQuery;
    conSQLite: TUniConnection;
    SQLiteUniProvider: TSQLiteUniProvider;
    qSlite: TUniQuery;
    dsp_Login: TDataSetProvider;
    dsp_Empresas: TDataSetProvider;
    qMatriz: TUniQuery;
    qCheckSystem: TUniQuery;
    qRN: TUniQuery;
    qRNcodigo: TIntegerField;
    qRNempresa: TIntegerField;
    qRNcompras_centro_custos: TStringField;
    qRNcompras_tipo_conta: TIntegerField;
    qRNcompras_tipo_pagamento: TIntegerField;
    qRNvendas_centro_custos: TStringField;
    qRNvendas_tipo_conta: TIntegerField;
    qRNvendas_tipo_pagamento: TIntegerField;
    procedure UniSQLMonitorSQL(Sender: TObject; Text: string;
      Flag: TDATraceFlag);
  private
    { Private declarations }
  public
    { Public declarations }
    ZeroConfig: TLAConfig;
    function Integridade: Boolean;
    function ConectZero: Boolean;
    function LoadConfig: TLAConfig;
    function EditaConfig(Config: TLAConfig): Boolean;
    function GravaConfig(Config: TLAConfig): Boolean;
    function SystemCheck: Boolean;
    function SystemBreak: Integer;
    function SystemTerminate(iBreak:Integer): Boolean;
    function SystemTimeOut(iBreak:Integer): Cardinal;
    function GetPathDOCe: string;
  end;

var
  Connection: TConnection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


function TConnection.ConectZero: Boolean;
var SQL: String;
begin
  if conSQLite.Connected = True then
    begin
      qSlite.Open;
      if qSlite.RecordCount = 0 then
        begin
          Result := False;
        end
      else
        begin
          qSlite.Close;
          SQL:= qSlite.SQL.Text;
          qSlite.SQL.Text := 'SELECT * FROM servidores WHERE defaultconn = 1';
          qSlite.Open;
          // Passa os parametros da conexão!
          ZeroConfig.ASDBServer := qSlite.FieldByName('ASDBServer').AsString;
          ZeroConfig.ASDBPort := qSlite.FieldByName('ASDBPort').AsString;
          ZeroConfig.ASDBDataBase := qSlite.FieldByName('ASDBDataBase').AsString;
          ZeroConfig.ASDBMasterUser := qSlite.FieldByName('ASDBMasterUser').AsString;
          ZeroConfig.ASDBMasterPass := qSlite.FieldByName('ASDBMasterPass').AsString;
          ZeroConfig.ASAutServer := qSlite.FieldByName('ASAutServer').AsString;
          ZeroConfig.ASAutPort := qSlite.FieldByName('ASAutPort').AsString;
          ZeroConfig.ASSystemPrinter := qSlite.FieldByName('ASSystemPrinter').AsString;
          ZeroConfig.ASSystemLogEnable := IntToBool(qSlite.FieldByName('ASSystemLogEnable').AsInteger);
          qSlite.Close;
          Result := True;
        end;
    end
  else
    begin
      Result := False;
    end;
end;

function TConnection.EditaConfig(Config: TLAConfig): Boolean;
begin
  if conSQLite.Connected = True then
    begin
      try
        begin
          ZeroConfig := Config;
          qSlite.Open;
          qSlite.Edit;
          if qSlite.RecordCount = 0 then
            begin
              qSlite.FieldByName('codigo').AsInteger := 0;
              qSlite.FieldByName('defaultconn').AsInteger:= 1;
              qSlite.FieldByName('nome').AsString:= 'Padrao';
            end
          else
            begin
              qSlite.FieldByName('defaultconn').AsInteger:= 1;
            end;
          // Passa os parametros da conexão!
          qSlite.FieldByName('ASDBServer').AsString:= ZeroConfig.ASDBServer;
          qSlite.FieldByName('ASDBPort').AsString:= ZeroConfig.ASDBPort;
          qSlite.FieldByName('ASDBDataBase').AsString:= ZeroConfig.ASDBDataBase;
          qSlite.FieldByName('ASDBMasterUser').AsString:= ZeroConfig.ASDBMasterUser;
          qSlite.FieldByName('ASDBMasterPass').AsString:= ZeroConfig.ASDBMasterPass;
          qSlite.FieldByName('ASAutServer').AsString:= ZeroConfig.ASAutServer;
          qSlite.FieldByName('ASAutPort').AsString:= ZeroConfig.ASAutPort;
          qSlite.FieldByName('ASSystemPrinter').AsString:= ZeroConfig.ASSystemPrinter;
          qSlite.FieldByName('ASSystemLogEnable').AsInteger:= BoolToInt(ZeroConfig.ASSystemLogEnable);
          qSlite.Post;
          Result := True;
        end;
      except
        Aviso('ERRO','Informação do sistema','Não foi possivel guardar as configurações de conexão.'+#13+'Por favor, entre em contato com o suporte!');
        qSlite.Cancel;
        Result := False;
      end;
    end
  else
    begin
      Result := False;
    end;
end;

function TConnection.GetPathDOCe: string;
var
  Mes, Ano, CNPJ, Path: string;
begin
  //if qEmpresas then
  Ano := FormatDateTime('yyyy', Date );
  Mes := FormatDateTime('mm', Date );
  Path := Ano + '\' + Mes + '\';
  Result := Path;
end;

function TConnection.GravaConfig(Config: TLAConfig): Boolean;
var SQL: string;
begin
  if conSQLite.Connected = True then
    begin
      try
        begin
          ZeroConfig := Config;
          qSlite.Open;
          qSlite.Insert;
          if qSlite.RecordCount = 0 then
            begin
              qSlite.FieldByName('codigo').AsInteger := 0;
              qSlite.FieldByName('defaultconn').AsInteger:= 1;
              qSlite.FieldByName('nome').AsString:= 'Padrao';
            end
          else
            begin
              qSlite.FieldByName('defaultconn').AsInteger:= 0;
            end;
          // Passa os parametros da conexão!
          qSlite.FieldByName('ASDBServer').AsString:= ZeroConfig.ASDBServer;
          qSlite.FieldByName('ASDBPort').AsString:= ZeroConfig.ASDBPort;
          qSlite.FieldByName('ASDBDataBase').AsString:= ZeroConfig.ASDBDataBase;
          qSlite.FieldByName('ASDBMasterUser').AsString:= ZeroConfig.ASDBMasterUser;
          qSlite.FieldByName('ASDBMasterPass').AsString:= ZeroConfig.ASDBMasterPass;
          qSlite.FieldByName('ASAutServer').AsString:= ZeroConfig.ASAutServer;
          qSlite.FieldByName('ASAutPort').AsString:= ZeroConfig.ASAutPort;
          qSlite.FieldByName('ASSystemPrinter').AsString:= ZeroConfig.ASSystemPrinter;
          qSlite.FieldByName('ASSystemLogEnable').AsInteger:= BoolToInt(ZeroConfig.ASSystemLogEnable);
          qSlite.Post;
          Result := True;
        end;
      except
        Aviso('ERRO','Informação do sistema','Não foi possivel guardar as configurações de conexão.'+#13+'Por favor, entre em contato com o suporte!');
        qSlite.Cancel;
        Result := False;
      end;
    end
  else
    begin
      Result := False;
    end;
end;

function TConnection.Integridade: Boolean;
begin
  conSQLite.Database := Parametros.SystemConfig.ASSystemPath + '/config/dbconfig.sqlite';
  try
    begin
      Try
        conSQLite.Connect;
      Finally
        Result := True;
      End;
    end;
  Except
    begin
      Result := False;
    end;
  end;
end;

function TConnection.LoadConfig: TLAConfig;
var
  Config: TLAConfig;
begin
  // Carrega as informações ja registradas.
  if conSQLite.Connected = True then
    begin
      qSlite.Open;
      if qSlite.RecordCount = 1 then
        begin
          Config.ASDBServer := qSlite.FieldByName('ASDBServer').AsString;
          Config.ASDBPort := qSlite.FieldByName('ASDBPort').AsString;
          Config.ASDBDataBase := qSlite.FieldByName('ASDBDataBase').AsString;
          Config.ASDBMasterUser := qSlite.FieldByName('ASDBMasterUser').AsString;
          Config.ASDBMasterPass := qSlite.FieldByName('ASDBMasterPass').AsString;
          Config.ASAutServer := qSlite.FieldByName('ASAutServer').AsString;
          Config.ASAutPort := qSlite.FieldByName('ASAutPort').AsString;
          Config.ASSystemPrinter := qSlite.FieldByName('ASSystemPrinter').AsString;
          Config.ASSystemLogEnable :=  IntTOBool(qSlite.FieldByName('ASSystemLogEnable').AsInteger);
        end
      else
        begin
          Config.ASDBServer := '';
          Config.ASDBPort := '';
          Config.ASDBDataBase := '';
          Config.ASDBMasterUser := '';
          Config.ASDBMasterPass := '';
          Config.ASAutServer := '';
          Config.ASAutPort := '';
          Config.ASSystemPrinter := '';
          Config.ASSystemLogEnable := False;
        end;
    end;
  Result := Config;
end;

function TConnection.SystemBreak: Integer;
begin
  try
    qBreak.Open;
  finally
    Result := qBreak.FieldByName('result').AsInteger;
    qBreak.Close;
  end;
end;

function TConnection.SystemCheck: Boolean;
begin
  try
    qSQL.SQL.Clear;
    qSQL.SQL.Text := 'SELECT system_integridade();';
    qSQL.Open;
    Result := qSQL.FieldByName('system_integridade').AsBoolean;
    qSQL.Close;
    qSQL.SQL.Clear;
  except
    Result := False;
  end;
end;

function TConnection.SystemTerminate(iBreak:Integer): Boolean;
begin
  try
    qSQL.SQL.Clear;
    qSQL.SQL.Text := 'SELECT system_break('+ IntToStr(iBreak) +')';
    qSQL.Open
  finally
    Result := qSQL.FieldByName('system_break').AsBoolean;
    qSQL.Close;
    qSQL.SQL.Clear;
  end;
end;

function TConnection.SystemTimeOut(iBreak: Integer): Cardinal;
begin
  try
    qSQL.SQL.Clear;
    qSQL.SQL.Text := 'SELECT system_breakout('+ IntToStr(iBreak) +')';
    qSQL.Open
  finally
    Result := qSQL.FieldByName('system_breakout').AsInteger;
    qSQL.Close;
    qSQL.SQL.Clear;
  end;
end;

procedure TConnection.UniSQLMonitorSQL(Sender: TObject; Text: string;
  Flag: TDATraceFlag);
var
  i: integer;
  s: string;
begin
  if Parametros.SystemConfig.ASSystemLogEnable = True then
    begin
      if (Sender is TCustomDADataSet) and  (Text <> EmptyStr) then
        begin
          if TCustomDADataSet(Sender).Tag = 7000 then
            begin
              s:= TCustomDADataSet(Sender).FinalSQL;
              for i:= 0 to TCustomDADataSet(Sender).ParamCount -1 do
                begin
                  case TCustomDADataSet(Sender).Params.Items[i].DataType of
                    ftInteger, ftFloat:
                      begin
                        s := StringReplace(s, ':'+TUniQuery(Sender).Params.Items[i].Name, TUniQuery(Sender).Params.Items[i].Value, [rfReplaceAll]);
                      end;
                    ftString:
                      begin
                        s := StringReplace(s, ':'+TUniQuery(Sender).Params.Items[i].Name, QuotedStr(TUniQuery(Sender).Params.Items[i].Value), [rfReplaceAll]);
                      end;
                  end;
                end;
              Text := s;
            end;
        end;
      Parametros.grava_logSQL(Text)
    end;
end;

end.
