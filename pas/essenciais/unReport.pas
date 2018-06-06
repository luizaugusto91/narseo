unit unReport;

interface

uses
  System.SysUtils, System.Classes, Data.DB, MemDS, DBAccess, Uni,
  Midaslib, unSystem, unParametros, unNetwork, unEndereco;

type
  TReport = class(TDataModule)
    qEmpresa: TUniQuery;
    qEmpresacodigo: TIntegerField;
    qEmpresaempresa: TIntegerField;
    qEmpresanome: TStringField;
    qEmpresafantasia: TStringField;
    qEmpresanomereduzido: TStringField;
    qEmpresatipopessoa: TIntegerField;
    qEmpresacnpj: TStringField;
    qEmpresaie: TStringField;
    qEmpresaim: TStringField;
    qEmpresaendereco: TStringField;
    qEmpresaendereco_numero: TStringField;
    qEmpresacomplemento: TStringField;
    qEmpresareferencia: TStringField;
    qEmpresabairro: TStringField;
    qEmpresacep: TStringField;
    qEmpresauf: TStringField;
    qEmpresatel1: TStringField;
    qEmpresatel2: TStringField;
    qEmpresatel3: TStringField;
    qEmpresaemail: TStringField;
    qEmpresasite: TStringField;
    qCliente: TUniQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    IntegerField3: TIntegerField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    MemoField1: TMemoField;
    BooleanField1: TBooleanField;
    qEmpresacidade: TStringField;
    qClientecidade: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Report: TReport;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
