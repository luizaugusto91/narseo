unit unBanco;

interface

uses
  System.SysUtils, System.Classes, DALoader, UniLoader, DAAlerter, UniAlerter,
  DADump, UniDump, CREncryption, Uni, DBAccess, Data.DB, UniProvider,
  PostgreSQLUniProvider;

type
  TdmBanco = class(TDataModule)
    PostgreSQLUniProvider: TPostgreSQLUniProvider;
    Conn: TUniConnection;
    UniTransaction: TUniTransaction;
    UniEncryptor: TUniEncryptor;
    UniDump: TUniDump;
    UniAlerter: TUniAlerter;
    UniLoader: TUniLoader;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmBanco: TdmBanco;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
