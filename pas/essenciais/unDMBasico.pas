unit unDMBasico;

interface

uses
  System.SysUtils, System.Classes, unSystem, unParametros, unConnection,
  Data.DB, MemDS, DBAccess, Uni;

type
  TdmBasico = class(TDataModule)
    qSQL: TUniQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure OpenQuery;
  public
    { Public declarations }
    procedure GetINDEX(xQuery: TUniQuery; xKey: String; xID: Variant);
  end;

var
  dmBasico: TdmBasico;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmBasico.DataModuleCreate(Sender: TObject);
begin
  OpenQuery;
end;

procedure TdmBasico.GetINDEX(xQuery: TUniQuery; xKey: String; xID: Variant);
begin
  try
    if xQuery.Active = True then
      xQuery.Close;
    xQuery.Open;
    if xQuery.RecordCount > 0 then
      begin
        xQuery.Locate(xKey, xID, []);
      end
    else
      begin
        Aviso('INFO','Registro não encontrado','Nenhum registro foi encontrado, verifique na se o cadastro base esta correto.');
        xQuery.Close;
      end;
  except
    Aviso('ERRO','Falha na consulta','Não foi possivel realizar a consulta.'+#13+'Por favor, entre em contato com o suporte!');
  end;
end;

procedure TdmBasico.OpenQuery;
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
