unit unConnectionDeveloper;

interface

uses
  System.SysUtils, System.Classes, Data.DB, MemDS, DBAccess, Uni, DALoader,
  UniLoader, DAAlerter, UniAlerter, DADump, UniDump, CREncryption, UniProvider,
  PostgreSQLUniProvider;

type
  TDeveloper = class(TDataModule)
    PostgreSQLUniProvider: TPostgreSQLUniProvider;
    Conn: TUniConnection;
    UniTransaction: TUniTransaction;
    UniEncryptor: TUniEncryptor;
    UniDump: TUniDump;
    UniAlerter: TUniAlerter;
    UniLoader: TUniLoader;
    qBasic: TUniQuery;
    qRegistro: TUniQuery;
    qCheckKey: TUniQuery;
    qclient_check: TUniQuery;
    qterminais: TUniQuery;
    FieldRegistrocodigo: TIntegerField;
    FieldRegistrodatacadastro: TDateField;
    FieldRegistrotipopessoa: TIntegerField;
    FieldRegistronome: TStringField;
    FieldRegistrofantasia: TStringField;
    FieldRegistroapelido: TStringField;
    FieldRegistrocnpj: TStringField;
    FieldRegistroie: TStringField;
    FieldRegistroim: TStringField;
    FieldRegistrodatanascimento: TDateField;
    FieldRegistrosexo: TStringField;
    FieldRegistroendereco: TStringField;
    FieldRegistroendereco_numero: TStringField;
    FieldRegistrocomplemento: TStringField;
    FieldRegistroreferencia: TStringField;
    FieldRegistrobairro: TStringField;
    FieldRegistrocep: TStringField;
    FieldRegistrocidade: TIntegerField;
    FieldRegistrouf: TStringField;
    FieldRegistropais: TIntegerField;
    FieldRegistrotelefone: TStringField;
    FieldRegistrocelular: TStringField;
    FieldRegistroempresa: TStringField;
    FieldRegistroemail: TStringField;
    FieldRegistrosite: TStringField;
    qRegistroobs: TMemoField;
    FieldRegistroalerta: TStringField;
    FieldRegistroinativo: TBooleanField;
    FieldRegistrosync: TStringField;
    qGetKey: TUniQuery;
    Fieldqterminaiscodigo: TIntegerField;
    Fieldqterminais_data_inicial: TDateField;
    Fieldqterminais_data_final: TDateField;
    Fieldqterminais_client_hash: TStringField;
    Fieldqterminais_terminal_hash: TStringField;
    Fieldqterminais_server_hash: TStringField;
    Fieldqterminaisinativo: TBooleanField;
    Fieldqterminaispessoa: TIntegerField;
    qGetClient: TUniQuery;
    Field1: TIntegerField;
    Field2: TDateField;
    Field3: TIntegerField;
    Field4: TStringField;
    Field5: TStringField;
    Field6: TStringField;
    Field7: TStringField;
    Field8: TStringField;
    Field9: TStringField;
    Field10: TDateField;
    Field11: TStringField;
    Field12: TStringField;
    Field13: TStringField;
    Field14: TStringField;
    Field15: TStringField;
    Field16: TStringField;
    Field17: TStringField;
    Field18: TIntegerField;
    Field19: TStringField;
    Field20: TIntegerField;
    Field21: TStringField;
    Field22: TStringField;
    Field23: TStringField;
    Field24: TStringField;
    Field25: TStringField;
    MemoField1: TMemoField;
    Field26: TStringField;
    Field27: TBooleanField;
    Field28: TStringField;
    FieldGetClienthash: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Developer: TDeveloper;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
