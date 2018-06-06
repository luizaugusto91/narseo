unit unNetwork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Vcl.StdCtrls, ExtCtrls, ComCtrls, IdStackWindows, IdIPWatch, OleCtnrs;

// Registros de Gerais
type
  THostInfo = record
    HISerial      :String;
    HIEstacao     :String;
    HIUsuario     :String;
  end;

var
  gn_speed_y: Integer;
  gn_text_y: Integer;

const
  gn_speed_x: Integer = 8;
  gn_text_x: Integer = 15;
  gl_start: Boolean = True;

  function DIR(sDiretorio, sBusca:string; bNomeCompleto: Boolean):TStringList;
  function GetBiosCheckSum: string;
  function GetHostInfo():THostInfo;
  function ResolveHost():String;
  function ResolveIP(Host:String):String;
  procedure RegistrarLogNFe(sPath,sLOG:String);
  procedure MoverArquivo(Origem, Destino,Arquivo: String);

implementation

function GetBiosCheckSum: string;
var
  s: Int64;
  i: longword;
  p: PChar;
begin
  i := 0;
  s := 0;
  p := PChar($F0000);
  repeat
    inc(s,ord(^p)shl i);
    if i < 64 then inc(i) else i := 0;
    inc(p);
  until p > PChar($FFFFF);
  Result := IntToHex(s,16);
end;

function ResolveHost():String;
var
  Host : TIdIPWatch;
begin
  try
    Host := TIdIPWatch.Create(nil);
    Result := Host.LocalIP;
  finally
    Host.free;
  end;
end;

function ResolveIP(Host:String):String;
var
  IdStackWin: TIdStackWindows;
begin
  IdStackWin := TIdStackWindows.Create;
  try
    Result:= IdStackWin.ResolveHost(Host);
  finally
    IdStackWin.Free;
  end;
end;

procedure ChangeByteOrder( var Data; Size : Integer );
var
  ptr : PChar;
  i : Integer;
  c : Char;
begin
  ptr := @Data;
  for i := 0 to (Size shr 1)-1 do
  begin
    c := ptr^;
    ptr^ := (ptr+1)^;
    (ptr+1)^ := c;
    Inc(ptr,2);
  end;
end;

procedure RegistrarLogNFe(sPath,sLOG:String);
var
  LogXML:TextFile;
  NomeArquivoLog: String;
begin
  NomeArquivoLog := sPath+'\log\nfe\log_nfe_'+FormatDateTime('YYYYMMDD', Date)+'.txt';
  AssignFile(LogXML, NomeArquivoLog);
  try
    if FileExists(NomeArquivoLog) then
      begin
        Append(LogXML);
      end
    else
      begin
        Rewrite(LogXML);
      end;
    Writeln(LogXML, sLOG);
  finally
      CloseFile(LogXML);
  end;
end;

function DIR(sDiretorio, sBusca:string; bNomeCompleto: Boolean):TStringList;
var
  srProcura: TSearchRec;
  iAux: integer;
begin
  iAux := FindFirst( sDiretorio+sBusca, faAnyFile, srProcura );
  Result := TStringList.Create;
  result.Clear;
  while iAux = 0 do
  begin
    if (srProcura.Attr and faDirectory) <> faDirectory then
    begin
      if bNomeCompleto then
        Result.Add(sDiretorio + srProcura.Name)
      else
        Result.Add(srProcura.Name);
    end;
      //ISSO AQUI DELETARIA *.* if not DeleteFile('c:\Teste\' + srProcura.Name) then ShowMessage('Não consegui excluir '+ sDiretorio + srProcura.Name);
    iAux := FindNext(srProcura);
  end;
end;

function GetHostInfo():THostInfo;
var
  a, b, c, d: LongWord;
  Info: THostInfo;
begin
  asm
    push EAX
    push EBX
    push ECX
    push EDX

    mov eax, 1
    db $0F, $A2
    mov a, EAX
    mov b, EBX
    mov c, ECX
    mov d, EDX

    pop EDX
    pop ECX
    pop EBX
    pop EAX

  end;
  {Info.HISerial := inttohex(a, 8) + '-' +
            inttohex(b, 8) + '-' +
            inttohex(c, 8) + '-' +
            inttohex(d, 8); }
  Info.HISerial := GetBiosCheckSum;
  Info.HIUsuario := '';
  Info.HIEstacao := '';
  Result := Info;
end;

procedure MoverArquivo(Origem, Destino,Arquivo: String);
var
  o, d: PWideChar;
begin
  o:= PWideChar(Origem + '\' + Arquivo);
  d:= PWideChar(Destino + '\' + Arquivo);
  MoveFile(o,d);
end;

end.
