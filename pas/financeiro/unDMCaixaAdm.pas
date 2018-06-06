unit unDMCaixaAdm;

interface

uses
  System.SysUtils, System.Classes, unSystem, unParametros, unConnection,
  Data.DB, MemDS, DBAccess, Uni;

type
  TdmCaixaAdm = class(TDataModule)
    qSQL: TUniQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    // Variaveis
    // Funcoes
    function CaixaCheck():Boolean;
    function GetCaixaTurno():Integer;
    function GetCaixaOperador():Integer;
    function GetCaixa():Integer;
    // Procedures
  end;

var
  dmCaixaAdm: TdmCaixaAdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmCaixaAdm }

function TdmCaixaAdm.CaixaCheck: Boolean;
begin
 // Verifica se ja existe caixa aberto!
  qSQL.SQL.Clear;
  qSQL.SQL.Text := 'SELECT codigo FROM caixa WHERE data_caixa = CURRENT_DATE AND fechamento IS NULL AND conferido = FALSE;';
  qSQL.Open;
  if qSQL.RecordCount = 0 then
    begin
      Result := False;
    end
  else
    begin
      Result := True;
    end;
  qSQL.Close;
end;

function TdmCaixaAdm.GetCaixa: Integer;
begin
  if CaixaCheck = True then
    begin
      qSQL.SQL.Clear;
      qSQL.SQL.Text := 'SELECT codigo FROM caixa WHERE data_caixa = CURRENT_DATE AND fechamento IS NULL AND conferido = FALSE;';
      qSQL.Open;
      if qSQL.RecordCount = 1 then
        begin
          Result := qSQL.FieldByName('codigo').AsInteger;
        end
      else
        begin
          Result := 0;
        end;
      qSQL.Close;
    end;
end;

function TdmCaixaAdm.GetCaixaOperador: Integer;
begin
  if CaixaCheck = True then
    begin
      qSQL.SQL.Clear;
      qSQL.SQL.Text := 'SELECT operador_caixa FROM caixa WHERE data_caixa = CURRENT_DATE AND fechamento IS NULL AND conferido = FALSE;';
      qSQL.Open;
      if (qSQL.RecordCount = 0) or (qSQL.FieldByName('operador_caixa').IsNull = True) then
        begin
          Result := 0;
        end
      else
        begin
          Result := qSQL.FieldByName('operador_caixa').AsInteger;
        end;
      qSQL.Close;
    end
end;

function TdmCaixaAdm.GetCaixaTurno: Integer;
begin

  qSQL.SQL.Clear;
  qSQL.SQL.Text := 'SELECT max(turno) as turno FROM caixa WHERE data_caixa = CURRENT_DATE AND fechamento IS not NULL;';
  qSQL.Open;
  if (qSQL.RecordCount = 0) or (qSQL.FieldByName('turno').IsNull = True) then
    begin
      Result := 0;
    end
  else
    begin
      Result := qSQL.FieldByName('turno').AsInteger;
    end;
  qSQL.Close;
end;

end.
