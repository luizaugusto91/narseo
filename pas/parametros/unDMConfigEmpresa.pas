unit unDMConfigEmpresa;

interface

uses
  System.SysUtils, System.Classes, unSystem, unConnection, unParametros,
  Data.DB, MemDS, DBAccess, Uni;

type
  TdmConfigEmpresa = class(TDataModule)
    qPais: TUniQuery;
    dsPais: TUniDataSource;
    qCidade: TUniQuery;
    dsCidade: TUniDataSource;
    qCCEntradas: TUniQuery;
    dsCCEntradas: TUniDataSource;
    qTipoConta: TUniQuery;
    dsTipoConta: TUniDataSource;
    qTipoPagamento: TUniQuery;
    dsTipoPagamento: TUniDataSource;
    qCCSaidas: TUniQuery;
    dsCCSaidas: TUniDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure OpenQuery;
  public
    { Public declarations }
  end;

var
  dmConfigEmpresa: TdmConfigEmpresa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmConfigEmpresa }

procedure TdmConfigEmpresa.DataModuleCreate(Sender: TObject);
begin
  OpenQuery;
end;

procedure TdmConfigEmpresa.OpenQuery;
var i:Integer;
begin
  for I := 0 to ComponentCount -1 do
    begin
      if Components[i] is TUniQuery then
        begin
          if TUniQuery(Components[i]).Tag = 7000 then
            begin
              TUniQuery(Components[i]).Open;
            end;
        end;
    end;
  i:= 0;
  for I := 0 to ComponentCount -1 do
    begin
      if Components[i] is TUniQuery then
        begin
          if TUniQuery(Components[i]).Tag = 7100 then
            begin
              TUniQuery(Components[i]).Open;
            end;
        end;
    end;
end;

end.
