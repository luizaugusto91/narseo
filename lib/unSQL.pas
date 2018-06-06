unit unSQL;

interface

uses Windows, Variants, Classes, SysUtils, StrUtils, DateUtils;

const
  CHAVEGERAL = '';

// Registros de Gerais
type
  TSQL = record
    SQLOriginal :String;
    SQLSelect   :String;
    SQLFrom     :String;
    SQLLeftJoin :String;
    SQLWhere    :String;
    SQLGroup    :String;
    SQLOrder    :String;
    SQLLimit    :String;
    SQLFilter   :String;
  public
    function GeraSQL():String;
    procedure GetSQL(SQL: String);
    procedure SetFilter(Filter: String);
  end;

implementation

{ TSQL }

function TSQL.GeraSQL: String;
begin
  // Gera a sentença em SQL;
  if SQLFilter <> '' then
    SQLWhere := ' WHERE ' + SQLFilter + ' ';
  Result := SQLSelect + #13 + SQLFrom + #13 + SQLLeftJoin + #13 + SQLWhere +
            #13 + SQLGroup + #13 + SQLOrder + #13 + SQLLimit + ' ;';
end;

procedure TSQL.SetFilter(Filter: String);
begin
  SQLFilter := Filter;
end;

procedure TSQL.GetSQL(SQL: String);
var
  Linha: String;
  PosicaoI, PosicaoF: Integer;
begin
  // Destrincha o SQL original e atribui aos seus segmentos.
  Linha := SQL;
  // SQL Total
  SQLOriginal := SQL;
  // SELECT (6) - Obrigatório
  // >> ------------------------------------------------------------------------
  if Pos('SELECT',Linha) > 0 then
    begin
      PosicaoI := Pos('SELECT',Linha);
      PosicaoF := Pos('FROM',Linha)-1;
      SQLSelect:= Copy(Linha,PosicaoI,PosicaoF);
    end;
  // >> ------------------------------------------------------------------------
  // FROM (4) - Obrigatório
  if Pos('LEFT JOIN',Linha) > 0 then
    begin
      PosicaoI := Pos('FROM',Linha);
      PosicaoF := (Pos('LEFT JOIN',Linha)-1)-(PosicaoI);
      SQLFrom  := Copy(Linha,PosicaoI,PosicaoF);
    end
  else
  if Pos('WHERE',Linha) > 0 then
    begin
      PosicaoI := Pos('FROM',Linha);
      PosicaoF := (Pos('WHERE',Linha)-1)-(PosicaoI);
      SQLFrom  := Copy(Linha,PosicaoI,PosicaoF);
    end
  else
  if Pos(';',Linha) > 0 then
    begin
      PosicaoI := Pos('FROM',Linha);
      PosicaoF := (Pos(';',Linha)-1)-(PosicaoI);
      SQLFrom  := Copy(Linha,PosicaoI,PosicaoF);
    end;
  // >> ------------------------------------------------------------------------
  // LEFT JOIN (9)
  if Pos('LEFT JOIN',Linha) > 0 then
    begin
      if Pos('WHERE',Linha) > 0 then
        begin
          PosicaoI := Pos('LEFT JOIN',Linha);
          PosicaoF := (Pos('WHERE',Linha)-1)-(PosicaoI);
          SQLLeftJoin  := Copy(Linha,PosicaoI,PosicaoF);
        end
      else
      if Pos('GROUP',Linha) > 0 then
        begin
          PosicaoI := Pos('LEFT JOIN',Linha);
          PosicaoF := (Pos('GROUP',Linha)-1)-(PosicaoI);
          SQLLeftJoin  := Copy(Linha,PosicaoI,PosicaoF);
        end
      else
      if Pos('ORDER',Linha) > 0 then
        begin
          PosicaoI := Pos('LEFT JOIN',Linha);
          PosicaoF := (Pos('ORDER',Linha)-1)-(PosicaoI);
          SQLLeftJoin  := Copy(Linha,PosicaoI,PosicaoF);
        end
      else
      if Pos(';',Linha) > 0 then
        begin
          PosicaoI := Pos('LEFT JOIN',Linha);
          PosicaoF := (Pos(';',Linha)-1)-(PosicaoI);
          SQLLeftJoin  := Copy(Linha,PosicaoI,PosicaoF);
        end;
    end;
  // >> ------------------------------------------------------------------------
  // WHERE (5)
  if (Pos('WHERE',Linha) > 0) Then
    begin
      if (Pos('GROUP',Linha) > 0) then
        begin
          PosicaoI := Pos('WHERE',Linha);
          PosicaoF := (Pos('GROUP',Linha)-1)-(PosicaoI);
          SQLWhere  := Copy(Linha,PosicaoI,PosicaoF);
        end
      else
      if Pos('ORDER',Linha) > 0 then
        begin
          PosicaoI := Pos('WHERE',Linha);
          PosicaoF := (Pos('ORDER',Linha)-1)-(PosicaoI);
          SQLWhere  := Copy(Linha,PosicaoI,PosicaoF);
        end
      else
      if Pos(';',Linha) > 0 then
        begin
          PosicaoI := Pos('WHERE',Linha);
          PosicaoF := (Pos(';',Linha)-1)-(PosicaoI);
          SQLWhere  := Copy(Linha,PosicaoI,PosicaoF);
        end;
    end;
  // >> ------------------------------------------------------------------------
  // GROUP (5)
  if (Pos('GROUP',Linha) > 0) then
    begin
      if (Pos('ORDER',Linha) > 0) then
        begin
          PosicaoI := Pos('GROUP',Linha);
          PosicaoF := (Pos('ORDER',Linha)-1)-(PosicaoI);
          SQLGroup  := Copy(Linha,PosicaoI,PosicaoF);
        end
      else
      if Pos(';',Linha) > 0 then
        begin
          PosicaoI := Pos('GROUP',Linha);
          PosicaoF := (Pos(';',Linha)-1)-(PosicaoI);
          SQLGroup  := Copy(Linha,PosicaoI,PosicaoF);
        end;
    end;
  // >> ------------------------------------------------------------------------
  // ORDER (5)
  if (Pos('ORDER',Linha) > 0) and (Pos(';',Linha) > 0) then
    begin
      PosicaoI := Pos('ORDER',Linha);
      PosicaoF := (Pos(';',Linha)-1)-(PosicaoI);
      SQLOrder  := Copy(Linha,PosicaoI,PosicaoF);
    end;
  // >> ------------------------------------------------------------------------
end;

end.
