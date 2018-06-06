unit unSystem;

interface

 // Classes especificas requeridas:
 // >> UniDAC
 // >> FireDAC
 // >> zLib
 // >> IdStackWindows

uses Windows, Variants, AnsiStrings, Forms, Classes, SysUtils,
  StrUtils, DateUtils, zlib, FileCtrl, iniFiles, Uni, IdStackWindows,
  IdIPWatch;

  // Types Basicos para funcionamento do sistema.
type
  TLAConfig = Record
    // Configurações de Acesso ao banco.
    ASDBServer: String[20];
    ASDBPort: String[5];
    ASDBDataBase: String[50];
    ASDBMasterUser: String[50];
    ASDBMasterPass: String[50];
    // Configurações de acesso a automação.
    ASAutServer: String[20];
    ASAutPort: String[5];
    // Configurações do Terminal
    ASSystemHost: String[20];
    ASSystemPath: String[254];
    ASSystemPrinter: String[254];
    ASSystemLogEnable: Boolean;
    ASSystemLogPath: String[254];
    // Variaveis de Ambiente
    ASSystemAuth: Boolean;
    ASSystemConectado: Boolean;
    ASSystemConf: Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GeraIni();
    procedure CarregarIni();
    procedure CarregarConfigServer(Config: TLAConfig);
    procedure OpenConnection(Connection: TObject);
  End;
  TFormMode = Record
    Modo: String;
    ID:   Integer;
  End;
  TConsulta = record
    eConsulta       : Boolean;
    eDescricao      : String[250];
    eChave          : Integer;
    eValido         : Boolean;
  end;

  // Procedures e Funções basicas do sistema.
  //----------------------------------------------------------------------------
  // > Funções
  // >> Textos e Dados
      function InvertBool(B : Boolean): Boolean;
      function IntToCard(I : integer): Cardinal;
      function IntToBool(I : integer): Boolean;
      function BoolToInt(B : Boolean): Integer;
      function StrToHex(S: String): string;
      function HexToStr(H: String): String;
      function StrToPWideChar(const s: string): PWideChar;                      // Converte String em PWideChar.
      function Porcentagem(VInicial, VFinal: Double): Double;
      function Margem(VInicial, VPorcentagem: Double): Double;
      function validaCGC(CGC: string): boolean;
      function imprimeCGC(CGC: string): string;
      function LimpaTexto(sTexto: string):string;
      function PreencheEsquerda(sTexto:string;sPre:string;iQtde:integer):string;
  // >> Alertas e Consultas
      function Pergunta(vType,vTitulo,vMensagem,vOpcao:String):Integer;         // Cria janela de questionamento (Application.Messagebox) aguardando retorno.
  // >> Janelas
  // >> Rotinas
      function Versao: String;
      function KeySystema(ID, kCliente:Integer):string;
      function KeyTerminal():string;
  //----------------------------------------------------------------------------
  // > Procedures
  // >> Textos e Dados
  // >> Alertas e Consultas
    procedure Aviso(vType,vTitulo,vMensagem:String);                            // Cria janela de aviso (Application.Messagebox).
  // >> Janelas
    procedure CriaDM(InstanceClass: TComponentClass; var Reference);            // Abre formularios > Substitui o Application.CreateForm
    procedure AbreFormulario(InstanceClass: TComponentClass; var Reference);    // Abre formularios > Substitui o Application.CreateForm
    procedure CriaFormulario(InstanceClass: TComponentClass; TID: Integer; TModo:String; var Reference);
  // >> Rotinas
    procedure Descompactar(const ASrc, ADest: string);
  //----------------------------------------------------------------------------

implementation

uses
  unMaster;

function InvertBool(B : Boolean): Boolean;
begin
  if B = True then
    Result := False
  else
    Result := True;
end;

function LimpaTexto(sTexto: string):string;
begin
  Result := StringReplace(sTexto,'.','',[rfReplaceAll]);
end;

function IntToCard(I : integer): Cardinal;
begin
  Result := I - Low(Integer)
end;

function IntToBool(I : integer): Boolean;
begin
  if I = 0 then
    Result := False
  else
    Result := True;
end;
function BoolToInt(B : Boolean): Integer;
begin
  if B = False then
    Result := 0
  else
    Result := 1;
end;

function StrToHex(S: String): string;
var I: Integer;
begin
  Result:= '';
  for I := 1 to length (S) do
    Result:= Result+IntToHex(ord(S[i]),2);
end;

function HexToStr(H: String): String;
var I: Integer;
begin
  Result:= '';
  for I := 1 to length (H) div 2 do
    Result:= Result+Char(StrToInt('$'+Copy(H,(I-1)*2+1,2)));
end;

function PreencheEsquerda(sTexto:string;sPre:string;iQtde:integer):string;
var
  iCont :integer;
begin
  iCont := length(sTexto);
  while iCont < iQtde do
    begin
      sTexto := sPre + sTexto ;
      inc(iCont);
    end;
  result:= sTexto;
  //Se a string é maior que a qtde ele só pega o começo
  if Length(sTexto)>iQtde then
    begin
      result := copy(sTexto, 1, iQtde);
    end;
end;

function Versao: String;
type
   PFFI = ^vs_FixedFileInfo;
var
   F       : PFFI;
   Handle  : Dword;
   Len     : Longint;
   Data    : Pchar;
   Buffer  : Pointer;
   Tamanho : Dword;
   Parquivo: Pchar;
   Arquivo : String;
begin
   Arquivo  := Application.ExeName;
   Parquivo := StrAlloc(Length(Arquivo) + 1);
   StrPcopy(Parquivo, Arquivo);
   Len := GetFileVersionInfoSize(Parquivo, Handle);
   Result := '';
   if Len > 0 then
   begin
      Data:=StrAlloc(Len+1);
      if GetFileVersionInfo(Parquivo,Handle,Len,Data) then
      begin
         VerQueryValue(Data, '',Buffer,Tamanho);
         F := PFFI(Buffer);
         Result := Format('%d.%d.%d.%d',
                          [HiWord(F^.dwFileVersionMs),
                           LoWord(F^.dwFileVersionMs),
                           HiWord(F^.dwFileVersionLs),
                           Loword(F^.dwFileVersionLs)]
                         );
      end;
      StrDispose(Data);
   end;
   StrDispose(Parquivo);
end;

function KeySystema(ID, kCliente:Integer):string;
var HID, HKCliente: string;
begin
  HKCliente := HextoStr(IntToHex(kCliente,14));
  HID := HextoStr(IntToHex(ID,6));
  if Length(HID) = 4 then
    HID := '0' + HID;
  //Result:=  + HextoStr(IntToHex(kCliente))
  Result:= HKCliente + HID;
end;

function KeyTerminal():string;
var
  a, b, c, d: LongWord;
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
  result := inttohex(a, 8) + '-' +
            inttohex(b, 8) + '-' +
            inttohex(c, 8) + '-' +
            inttohex(d, 8);
end;

function StrToPWideChar(const s: string): PWideChar;
begin
  Result := PWideChar(WideString(s));
end;

function Porcentagem(VInicial, VFinal: Double): Double;
begin
  Result := ((VFinal - VInicial)/VInicial * 100);
end;

function Margem(VInicial, VPorcentagem: Double): Double;
begin
  Result := VInicial + ((VPorcentagem * VInicial)/100);
end;

function validaCGC(CGC: string): boolean;
var dig10, dig11, dig13, dig14: String;
    s, sm, i, r, peso: Integer;
begin
  if Length(CGC) > 14 then
    begin
      Aviso('INFO','Informação','Dados invalidos! Verifique a numeração informada.');
      Result := False;
      Exit;
    end;
  if Length(CGC) = 14 then // CNPJ
    begin
      // length - retorna o tamanho da string do CNPJ (CNPJ é um número formado por 14 dígitos)
      if ((CGC = '00000000000000') or (CGC = '11111111111111') or
          (CGC = '22222222222222') or (CGC = '33333333333333') or
          (CGC = '44444444444444') or (CGC = '55555555555555') or
          (CGC = '66666666666666') or (CGC = '77777777777777') or
          (CGC = '88888888888888') or (CGC = '99999999999999') or
          (length(CGC) <> 14))
      then
        begin
          Aviso('INFO','Informação','Dados invalidos! Verifique a numeração informada.');
          Result := False;
          Exit;
        end;

      // "try" - protege o código para eventuais erros de conversão de tipo através da função "StrToInt"
      try
        begin
          { *-- Cálculo do 1o. Digito Verificador --* }
          sm := 0;
          peso := 2;
          for i := 12 downto 1 do
            begin
              // StrToInt converte o i-ésimo caractere do CNPJ em um número
              sm := sm + (StrToInt(CGC[i]) * peso);
              peso := peso + 1;
              if (peso = 10) then peso := 2;
            end;
          r := sm mod 11;
          if ((r = 0) or (r = 1)) then dig13 := '0'
          else str((11-r):1, dig13); // converte um número no respectivo caractere numérico

          { *-- Cálculo do 2o. Digito Verificador --* }
          sm := 0;
          peso := 2;
          for i := 13 downto 1 do
            begin
              sm := sm + (StrToInt(CGC[i]) * peso);
              peso := peso + 1;
              if (peso = 10) then peso := 2;
            end;
          r := sm mod 11;
          if ((r = 0) or (r = 1)) then dig14 := '0'
          else str((11-r):1, dig14);

          { Verifica se os digitos calculados conferem com os digitos informados. }
          if ((dig13 = CGC[13]) and (dig14 = CGC[14])) then validaCGC := true
          else
            begin
              Result := false;
              Aviso('INFO','Informação','Dados invalidos! Verifique o CNPJ informado.');
            end;
        end;
      except
        begin
          Result := false;
          Aviso('INFO','Informação','Dados invalidos! Verifique o CNPJ informado.');
        end;
      end;
    end;

  if Length(CGC) = 11 then //CPF
    begin
      // length - retorna o tamanho da string (CPF é um número formado por 11 dígitos)
      if ((CGC = '00000000000') or (CGC = '11111111111') or
          (CGC = '22222222222') or (CGC = '33333333333') or
          (CGC = '44444444444') or (CGC = '55555555555') or
          (CGC = '66666666666') or (CGC = '77777777777') or
          (CGC = '88888888888') or (CGC = '99999999999') or
          (length(CGC) <> 11))
      then
        begin
          Aviso('INFO','Informação','Dados invalidos! Verifique a numeração informada.');
          Result := False;
          Exit;
        end;

      // try - protege o código para eventuais erros de conversão de tipo na função StrToInt
      try
        begin
          { *-- Cálculo do 1o. Digito Verificador --* }
          s := 0;
          peso := 10;
          for i := 1 to 9 do
            begin
            // StrToInt converte o i-ésimo caractere do CPF em um número
              s := s + (StrToInt(CGC[i]) * peso);
              peso := peso - 1;
            end;
          r := 11 - (s mod 11);
          if ((r = 10) or (r = 11)) then dig10 := '0'
          else str(r:1, dig10); // converte um número no respectivo caractere numérico

          { *-- Cálculo do 2o. Digito Verificador --* }
          s := 0;
          peso := 11;
          for i := 1 to 10 do
            begin
              s := s + (StrToInt(CGC[i]) * peso);
              peso := peso - 1;
            end;
          r := 11 - (s mod 11);
          if ((r = 10) or (r = 11)) then dig11 := '0'
          else str(r:1, dig11);

          { Verifica se os digitos calculados conferem com os digitos informados. }
          if ((dig10 = CGC[10]) and (dig11 = CGC[11])) then validaCGC := true
          else
            begin
              Result := false;
              Aviso('INFO','Informação','Dados invalidos! Verifique o CPF informado.');
            end;
        end;
      except
        begin
          Result := false;
          Aviso('INFO','Informação','Dados invalidos! Verifique o CPF informado.');
        end;
      end;
    end;
end;

function imprimeCGC(CGC: string): string;
begin
  if Length(CGC) = 14 then // CNPJ
    begin
      { máscara do CNPJ: 99.999.999.9999-99 }
      Result := copy(CGC, 1, 2) + '.' + copy(CGC, 3, 3) + '.' + copy(CGC, 6, 3) + '.' + copy(CGC, 9, 4) + '-' + copy(CGC, 13, 2);
    end;
  if Length(CGC) = 11 then //CPF
    begin
      Result := copy(CGC, 1, 3) + '.' + copy(CGC, 4, 3) + '.' + copy(CGC, 7, 3) + '-' + copy(CGC, 10, 2);
    end;
end;

function Pergunta(vType,vTitulo,vMensagem,vOpcao:String):Integer;
var msgIC, msgBT: Integer;
begin
  if vOpcao = 'SN' then
    msgBT := MB_YESNO
  else if vOpcao = 'SNC' then
    msgBT := MB_YESNOCANCEL
  else
    msgBT := MB_OK;
  // Verifica possibilidades
  case AnsiIndexStr(UpperCase(vType), ['ERRO','INFO','ALER','STOP','HAND','WHAT','STER','WARN']) of
        0:msgIC := MB_ICONERROR;
        1:msgIC := MB_ICONINFORMATION;
        2:msgIC := MB_ICONEXCLAMATION;
        3:msgIC := MB_ICONSTOP;
        4:msgIC := MB_ICONHAND;
        5:msgIC := MB_ICONQUESTION;
        6:msgIC := MB_ICONASTERISK;
        7:msgIC := MB_ICONWARNING;
  end;
    Result := Application.MessageBox(StrToPWideChar(vMensagem),StrToPWideChar(vTitulo),msgIC + msgBT);
end;

procedure Descompactar(const ASrc, ADest: string);
var
  B: array[1..2048] of byte;
  R: Integer;
  vSrc: TStream;          // source file stream
  vDest: TStream;         // destination file stream
  vDecompressor: TStream; // compression stream
begin
  if not FileExists(ASrc) then
    raise Exception.Create('Arquivo de origem não existe');

  vSrc := TFileStream.Create(ASrc, fmOpenRead);
  try
    vDecompressor := TDecompressionStream.Create(vSrc);
    try
      vDest := TFileStream.Create(ADest, fmCreate);
      try
        repeat
          R := vDecompressor.Read(B, SizeOf(B));
          if R > 0 then
            vDest.Write(B, R);
        until R < SizeOf(B);
      finally
        vDest.Free;
      end;
    finally
      vDecompressor.Free;
    end;
  finally
    vSrc.Free;
  end;
end;

procedure CriaDM(InstanceClass: TComponentClass; var Reference);
var
  Instance: TComponent;
begin
  // Verifica se o Formulario ja foi Instanciado
  try
    Application.CreateForm(InstanceClass, Reference);
  except
    Aviso('ERRO','Informação','Não foi possivel carregar o container. Entre em contato com o suporte.');
  end;
end;

procedure Aviso(vType,vTitulo,vMensagem:String);
var msgIC: Integer;
begin
  // Verifica possibilidades
  case AnsiIndexStr(UpperCase(vType), ['ERRO','INFO','ALER','STOP','HAND','WHAT','STER','WARN']) of
        0:msgIC := MB_ICONERROR;
        1:msgIC := MB_ICONINFORMATION;
        2:msgIC := MB_ICONEXCLAMATION;
        3:msgIC := MB_ICONSTOP;
        4:msgIC := MB_ICONHAND;
        5:msgIC := MB_ICONQUESTION;
        6:msgIC := MB_ICONASTERISK;
        7:msgIC := MB_ICONWARNING;
  end;
    Application.MessageBox(StrToPWideChar(vMensagem),StrToPWideChar(vTitulo), msgIC + MB_OK);
end;

procedure AbreFormulario(InstanceClass: TComponentClass; var Reference);
var
  Instance: TComponent;
begin
  // Verifica se o Formulario ja foi Instanciado
  try
    Application.CreateForm(InstanceClass, Reference);
    TForm(Reference).ShowModal;
  finally
    TForm(Reference).Release;
  end;
end;

procedure CriaFormulario(InstanceClass: TComponentClass; TID: Integer; TModo:String; var Reference);
var
  Instance: TComponent;
  NewSetting: TFormMode;
begin
  // Verifica se o Formulario ja foi Instanciado
  //  Opções de modo:
  //    >> LISTA     :Exibição da lista simples.
  //    >> CONSULTA  :Retorna valores de seleção ao Find.
  try
    NewSetting.Modo := TModo;
    NewSetting.ID   := TID;
    Application.CreateForm(InstanceClass, Reference);
    TFMaster(Reference).Settings := NewSetting;
    TFMaster(Reference).ShowModal;
  finally
    TFMaster(Reference).Release;
  end;
end;

{ TLAConfig }

procedure TLAConfig.CarregarConfigServer(Config: TLAConfig);
begin
  try
    begin
      ASDBServer := Config.ASDBServer;
      ASDBPort := Config.ASDBPort;
      ASDBDataBase := Config.ASDBDataBase;
      ASDBMasterUser := Config.ASDBMasterUser;
      ASDBMasterPass := Config.ASDBMasterPass;
      ASAutServer := Config.ASAutServer;
      ASAutPort := Config.ASAutPort;
      ASSystemPrinter := Config.ASSystemPrinter;
      ASSystemLogEnable := Config.ASSystemLogEnable;
    end;
  except
    Aviso('ERRO','Erro ao ler a configuração!','Não foi possivel ler as configurações do Sistema.'+#13+'Por favor entre em contato com o Suporte.');
  end;
end;

procedure TLAConfig.CarregarIni;
var INI: TIniFile;
begin
  try
    begin
      try
        INI := TIniFile.Create(ASSystemPath + '\config\dbconfig.srm');
        ASDBServer := INI.ReadString('SYSTEM', 'ASDBServer','');
        ASDBPort := INI.ReadString('SYSTEM', 'ASDBPort','5432');
        ASDBDataBase := INI.ReadString('SYSTEM', 'ASDBDataBase','');
        ASDBMasterUser := INI.ReadString('SYSTEM', 'ASDBMasterUser','');
        ASDBMasterPass := INI.ReadString('SYSTEM', 'ASDBMasterPass','');
        ASAutServer := INI.ReadString('SYSTEM', 'ASAutServer','');
        ASAutPort := INI.ReadString('SYSTEM', 'ASAutPort','');
        ASSystemPrinter := INI.ReadString('SYSTEM', 'ASSystemPrinter','');
        ASSystemLogEnable := INI.ReadBool('SYSTEM', 'ASSystemLogEnable',True);
      finally
        INI.Free;
      end;
    end;
  except
    Aviso('ERRO','Erro ao ler a configuração!','Não foi possivel ler as configurações do Sistema.'#13'Por favor entre em contato com o Suporte.');
  end;
end;

procedure TLAConfig.GeraIni;
var INI: TIniFile;
    Path: String;
begin
  try
    begin
      try
        Path := ASSystemPath + '\config';
        if not directoryexists(Path) then
          forcedirectories(Path);
        INI := TIniFile.Create(ASSystemPath + '\config\dbconfig.srm');
        INI.WriteString('SYSTEM', 'ASDBServer', ASDBServer);
        INI.WriteString('SYSTEM', 'ASDBPort', ASDBPort);
        INI.WriteString('SYSTEM', 'ASDBDataBase', ASDBDataBase);
        INI.WriteString('SYSTEM', 'ASDBMasterUser', ASDBMasterUser);
        INI.WriteString('SYSTEM', 'ASDBMasterPass', ASDBMasterPass);
        INI.WriteString('SYSTEM', 'ASAutServer', ASAutServer);
        INI.WriteString('SYSTEM', 'ASAutPort', ASAutPort);
        INI.WriteString('SYSTEM', 'ASSystemPrinter', ASSystemPrinter);
        INI.WriteBool('SYSTEM', 'ASSystemLogEnable', ASSystemLogEnable);
      finally
        INI.Free;
      end;
    end;
  except
    Aviso('ERRO','Erro ao gravar configuração!','Não foi possivel gravar as configurações do Sistema.'#13'Por favor entre em contato com o Suporte.');
  end;
end;

procedure TLAConfig.OpenConnection(Connection: TObject);
begin
  if Connection is TUniConnection then
    begin
      try
        with TUniConnection(Connection) do
          begin
            Server    := ASDBServer;
            Port      := StrToInt(ASDBPort);
            Username  := ASDBMasterUser;
            Password  := ASDBMasterPass;
            Database  := ASDBDataBase;
          end;
        TUniConnection(Connection).Open;
        ASSystemConf := True;
      except
        Aviso('ERRO','Falha na conexão','Ocorreu uma falha na conexão com o servidor.'+#13+'Verifique a configuração, se persistir entre em contato com o Suporte !');
        ASSystemConf := False;
      end;
    end;
end;

end.
