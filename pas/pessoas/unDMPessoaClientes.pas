unit unDMPessoaClientes;

interface

uses
  System.SysUtils, System.Classes, unDMBasico, Data.DB, MemDS, DBAccess, Uni;

type
  TdmPessoaClientes = class(TdmBasico)
    qBancos: TUniQuery;
    qRegras: TUniQuery;
    dsRegras: TUniDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPessoaClientes: TdmPessoaClientes;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
