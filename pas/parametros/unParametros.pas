unit unParametros;

interface

uses
  System.SysUtils, System.Classes, DBClient, Data.DB, unSystem, Vcl.ImgList,
  Vcl.Controls, cxGraphics, Midaslib, unNetwork, unEndereco, MemDS, DBAccess,
  Uni;

type
  TParametros = class(TDataModule)
    cdsParametros: TClientDataSet;
    ImageList32: TcxImageList;
    ImageList16: TcxImageList;
    FieldParametrosempresa: TIntegerField;
    FieldParametrosusuario: TIntegerField;
    FieldParametrospessoa: TIntegerField;
    FieldParametrosgrupo: TIntegerField;
    cdsRegrasNegocio: TClientDataSet;
    FieldRNempresa: TIntegerField;
    FieldRNcompras_centrocustos: TStringField;
    FieldRNcompras_tipoconta: TIntegerField;
    FieldRNcompras_tipopagamento: TIntegerField;
    FieldRNvendas_centrocustos: TStringField;
    FieldRNvendas_tipoconta: TIntegerField;
    FieldRNvendas_tipopagamento: TIntegerField;
    ImageListICO32: TcxImageList;
    ImageListICO16: TcxImageList;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SystemConfig: TLAConfig;                                                    // Guarda as configurações de inicialização.
    HostInfo: THostInfo;                                                        // Guarda as informações de rede.
    PEndereco: TEndereco;                                                       // Ponteiro de Consultas
    Find: TConsulta;                                                            // Busca de Label para edit.
    // Procedures
    procedure SetParamEmpresa(Empresa: Integer);
    procedure SetParamPessoa(Pessoa: Integer);
    procedure SetParamUsuario(Usuario: Integer);
    procedure SetParamGrupo(Grupo: Integer);
    // >> Parametros de Regras de Negocio
    procedure SetParamRNEmpresa(Empresa: Integer);
    procedure SetParamRNComprasCC(CC:String);
    procedure SetParamRNVendasCC(CC:String);
    procedure SetParamRNComprasTipoConta(Conta: Integer);
    procedure SetParamRNVendasTipoConta(Conta: Integer);
    procedure SetParamRNComprasTipoPagamento(Pagamento: Integer);
    procedure SetParamRNVendasTipoPagamento(Pagamento: Integer);
    // >> Interação do Sistema
    procedure grava_logSQL(sql: String);
  end;

var
  Parametros: TParametros;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TParametros.DataModuleCreate(Sender: TObject);
begin
  SystemConfig.ASSystemAuth := False;
  PEndereco := TEndereco.Create;
  if cdsParametros.Active = True then
    begin
      cdsParametros.EmptyDataSet;
      cdsParametros.Close;
    end
  else
    begin
      cdsParametros.CreateDataSet;
      cdsParametros.Insert;
      FieldParametrosempresa.AsInteger := 0;
      FieldParametrosusuario.AsInteger := 0;
      FieldParametrospessoa.AsInteger := 0;
      FieldParametrosgrupo.AsInteger := 0;
      cdsParametros.Post;
    end;
  if cdsRegrasNegocio.Active = True then
    begin
      cdsRegrasNegocio.EmptyDataSet;
      cdsRegrasNegocio.Close;
    end
  else
    begin
      cdsRegrasNegocio.CreateDataSet;
      cdsRegrasNegocio.Insert;
      FieldRNempresa.AsInteger := 0;
      FieldRNcompras_centrocustos.AsString := '';
      FieldRNcompras_tipoconta.AsInteger := 0;
      FieldRNcompras_tipopagamento.AsInteger := 0;
      FieldRNvendas_centrocustos.AsString := '';
      FieldRNvendas_tipoconta.AsInteger := 0;
      FieldRNvendas_tipopagamento.AsInteger := 0;
      cdsRegrasNegocio.Post;
    end;
end;

procedure TParametros.DataModuleDestroy(Sender: TObject);
begin
  cdsParametros.EmptyDataSet;
  cdsRegrasNegocio.EmptyDataSet;
end;

procedure TParametros.grava_logSQL(sql: String);
var
  ArqLog : TextFile;
  ArqName: String;
begin
  ArqName := SystemConfig.ASSystemPath+'\log\System'+FormatDateTime('yyyymmdd',now)+'.log';
  AssignFile(ArqLog,ArqName);
  if not FileExists(ArqName) then
    begin
      Rewrite(ArqLog);
    end;
  Append(ArqLog);
  Writeln(ArqLog, '============================|| '+TimetoStr(now)+' ||============================');
  Writeln(ArqLog, sql);
  CloseFile(ArqLog);
end;

procedure TParametros.SetParamEmpresa(Empresa: Integer);
begin
  cdsParametros.Edit;
  cdsParametros.FieldByName('empresa').AsInteger := Empresa;
  cdsParametros.Post;
end;

procedure TParametros.SetParamGrupo(Grupo: Integer);
begin
  cdsParametros.Edit;
  cdsParametros.FieldByName('grupo').AsInteger := Grupo;
  cdsParametros.Post;
end;

procedure TParametros.SetParamPessoa(Pessoa: Integer);
begin
  cdsParametros.Edit;
  cdsParametros.FieldByName('pessoa').AsInteger := Pessoa;
  cdsParametros.Post;
end;

procedure TParametros.SetParamRNComprasCC(CC: String);
begin
  cdsRegrasNegocio.Edit;
  cdsRegrasNegocio.FieldByName('compras_centrocustos').AsString := CC;
  cdsRegrasNegocio.Post;
end;

procedure TParametros.SetParamRNComprasTipoConta(Conta: Integer);
begin
  cdsRegrasNegocio.Edit;
  cdsRegrasNegocio.FieldByName('compras_tipoconta').AsInteger := Conta;
  cdsRegrasNegocio.Post;
end;

procedure TParametros.SetParamRNComprasTipoPagamento(Pagamento: Integer);
begin
  cdsRegrasNegocio.Edit;
  cdsRegrasNegocio.FieldByName('compras_tipopagamento').AsInteger := Pagamento;
  cdsRegrasNegocio.Post;
end;

procedure TParametros.SetParamRNEmpresa(Empresa: Integer);
begin
  cdsRegrasNegocio.Edit;
  cdsRegrasNegocio.FieldByName('empresa').AsInteger := Empresa;
  cdsRegrasNegocio.Post;
end;

procedure TParametros.SetParamRNVendasCC(CC: String);
begin
  cdsRegrasNegocio.Edit;
  cdsRegrasNegocio.FieldByName('vendas_centrocustos').AsString := CC;
  cdsRegrasNegocio.Post;
end;

procedure TParametros.SetParamRNVendasTipoConta(Conta: Integer);
begin
  cdsRegrasNegocio.Edit;
  cdsRegrasNegocio.FieldByName('vendas_tipoconta').AsInteger := Conta;
  cdsRegrasNegocio.Post;
end;

procedure TParametros.SetParamRNVendasTipoPagamento(Pagamento: Integer);
begin
  cdsRegrasNegocio.Edit;
  cdsRegrasNegocio.FieldByName('vendas_tipopagamento').AsInteger := Pagamento;
  cdsRegrasNegocio.Post;
end;

procedure TParametros.SetParamUsuario(Usuario: Integer);
begin
  cdsParametros.Edit;
  cdsParametros.FieldByName('usuario').AsInteger := Usuario;
  cdsParametros.Post;
end;

end.
