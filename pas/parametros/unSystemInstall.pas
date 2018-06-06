unit unSystemInstall;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, IniFiles,
  unSystem, unParametros, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxGDIPlusClasses, cxImage, dxSkinscxPCPainter, dxBarBuiltInMenu, cxPC,
  cxDBEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxSpinEdit, Vcl.ImgList,
  Data.DB, DBAccess, Uni, MemDS, Datasnap.DBClient, unEndereco, System.StrUtils;

type
  TfrmSystemInstall = class(TForm)
    pnlTop: TPanel;
    Panel2: TPanel;
    btnFinalizar: TButton;
    btnProximo: TButton;
    lblCopy: TLabel;
    pnlEsquerdo: TPanel;
    pnlDireito: TPanel;
    imgTagLogo: TcxImage;
    PageControl: TcxPageControl;
    Tab0: TcxTabSheet;
    Tab1: TcxTabSheet;
    grpConfig: TGroupBox;
    img1: TcxImage;
    imgLogo: TcxImage;
    lbl1: TLabel;
    btnAnterior: TButton;
    btnCancelar: TButton;
    grp1: TGroupBox;
    lbl2: TLabel;
    ImageList16: TcxImageList;
    qPessoa: TUniQuery;
    ds: TUniDataSource;
    qPais: TUniQuery;
    dsPais: TUniDataSource;
    qCidade: TUniQuery;
    dsCidade: TUniDataSource;
    grpCadastro: TGroupBox;
    lblTipoPessoa: TLabel;
    cbbTipoPessoa: TcxDBImageComboBox;
    lblCNPJ: TLabel;
    edtCNPJ: TcxDBTextEdit;
    lblNome: TLabel;
    edtNome: TcxDBTextEdit;
    lblIE: TLabel;
    edtIE: TcxDBTextEdit;
    lblFantasia: TLabel;
    edtFantasia: TcxDBTextEdit;
    lblIM: TLabel;
    edtIM: TcxDBTextEdit;
    lblNomeReduzido: TLabel;
    edtNomeReduzido: TcxDBTextEdit;
    lblCEP: TLabel;
    edtCEP: TcxDBTextEdit;
    btnBuscarCEP: TButton;
    lblLogradouro: TLabel;
    edtLogradouro: TcxDBTextEdit;
    lblEndereco_Numero: TLabel;
    edtEndereco_numero: TcxDBTextEdit;
    edtReferencia: TcxDBTextEdit;
    lblReferencia: TLabel;
    edtComplemento: TcxDBTextEdit;
    lblComplemento: TLabel;
    lblBairro: TLabel;
    edtBairro: TcxDBTextEdit;
    lblPais: TLabel;
    edtPais: TcxDBSpinEdit;
    cbbPais: TcxDBLookupComboBox;
    cbbUF: TcxDBImageComboBox;
    lblUF: TLabel;
    cbbCidade: TcxDBLookupComboBox;
    edtCidade: TcxDBSpinEdit;
    lblCidade: TLabel;
    lblEmail: TLabel;
    edtEmail: TcxDBTextEdit;
    lblSite: TLabel;
    edtSite: TcxDBTextEdit;
    lblTel1: TLabel;
    edtTel1: TcxDBTextEdit;
    lblCelular: TLabel;
    edtTel2: TcxDBTextEdit;
    lblTel3: TLabel;
    edtTel3: TcxDBTextEdit;
    lbl3: TLabel;
    cds: TClientDataSet;
    Fieldcdsnome: TStringField;
    Fieldcdsfantasia: TStringField;
    Fieldcdsnomereduzido: TStringField;
    Fieldcdstipopessoa: TIntegerField;
    Fieldcdscnpj: TStringField;
    Fieldcdsie: TStringField;
    Fieldcdsim: TStringField;
    Fieldcdsendereco: TStringField;
    Fieldcdsendereco_numero: TStringField;
    Fieldcdscomplemento: TStringField;
    Fieldcdsreferencia: TStringField;
    Fieldcdsbairro: TStringField;
    Fieldcdscep: TStringField;
    Fieldcdscidade: TIntegerField;
    Fieldcdsuf: TStringField;
    Fieldcdspais: TIntegerField;
    Fieldcdstel1: TStringField;
    Fieldcdstel2: TStringField;
    Fieldcdstel3: TStringField;
    Fieldcdsemail: TStringField;
    Fieldcdssite: TStringField;
    qSQL: TUniQuery;
    Fieldcdskey_terminal: TStringField;
    Tab2: TcxTabSheet;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    btnShow: TButton;
    Tab3: TcxTabSheet;
    lbl4: TLabel;
    chk1: TCheckBox;
    chk2: TCheckBox;
    chk3: TCheckBox;
    chk5: TCheckBox;
    chk6: TCheckBox;
    chk7: TCheckBox;
    chk8: TCheckBox;
    chk4: TCheckBox;
    Tab4: TcxTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    edtChave: TcxDBTextEdit;
    Tab5: TcxTabSheet;
    Fieldcdskey_registro: TStringField;
    btnIniciar: TButton;
    Fieldcdslogin: TStringField;
    Fieldcdssenha: TStringField;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    edtContraSenha: TEdit;
    FieldPessoacodigo: TIntegerField;
    FieldPessoaempresa: TIntegerField;
    FieldPessoadatacadastro: TDateField;
    FieldPessoanome: TStringField;
    FieldPessoafantasia: TStringField;
    FieldPessoanomereduzido: TStringField;
    FieldPessoatipopessoa: TIntegerField;
    FieldPessoacnpj: TStringField;
    FieldPessoaie: TStringField;
    FieldPessoaim: TStringField;
    FieldPessoadatanascimento: TDateField;
    FieldPessoasexo: TStringField;
    FieldPessoaendereco: TStringField;
    FieldPessoaendereco_numero: TStringField;
    FieldPessoacomplemento: TStringField;
    FieldPessoareferencia: TStringField;
    FieldPessoabairro: TStringField;
    FieldPessoacep: TStringField;
    FieldPessoacidade: TIntegerField;
    FieldPessoauf: TStringField;
    FieldPessoapais: TIntegerField;
    FieldPessoatel1: TStringField;
    FieldPessoatel2: TStringField;
    FieldPessoatel3: TStringField;
    FieldPessoaemail: TStringField;
    FieldPessoasite: TStringField;
    qPessoaobs: TMemoField;
    FieldPessoaalerta: TStringField;
    FieldPessoacliente: TBooleanField;
    FieldPessoacolaborador: TBooleanField;
    FieldPessoafornecedor: TBooleanField;
    FieldPessoarepresentante: TBooleanField;
    FieldPessoatransportadora: TBooleanField;
    FieldPessoainativo: TBooleanField;
    qEmpresa: TUniQuery;
    FieldEmpresacodigo: TIntegerField;
    FieldEmpresapessoa: TIntegerField;
    FieldEmpresaserial: TStringField;
    FieldEmpresachave: TStringField;
    FieldEmpresadata_inicio: TDateField;
    FieldEmpresadata_fim: TDateField;
    FieldEmpresamatriz: TBooleanField;
    FieldEmpresacd_matriz: TIntegerField;
    FieldEmpresainativo: TBooleanField;
    FieldPessoaperpetuo: TBooleanField;
    FieldPessoaoldid: TStringField;
    FieldEmpresadatacadastro: TDateField;
    qUsuarios: TUniQuery;
    lbl11: TLabel;
    img2: TcxImage;
    procedure btnProximoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnBuscarCEPClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cbbTipoPessoaExit(Sender: TObject);
    procedure edtContraSenhaExit(Sender: TObject);
    procedure btnIniciarClick(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
  private
    { Private declarations }
    procedure OpenQuery;
    function reg_client:Integer;
  public
    { Public declarations }
  end;

var
  frmSystemInstall: TfrmSystemInstall;
  Estagio: Integer;
  Endereco: TEndereco;
  XML: string;
  keysystem: string;

implementation

{$R *.dfm}
uses unConnection, unCEP, unConnectionDeveloper, unProcess;

procedure TfrmSystemInstall.btnShowClick(Sender: TObject);
begin
  if edtSenha.PasswordChar = #0 then
    begin
      edtSenha.PasswordChar := '*';
      edtContraSenha.PasswordChar := '*';
      btnShow.ImageIndex := 7;
      btnShow.HotImageIndex := 6;
    end
  else
    begin
      edtSenha.PasswordChar := #0;
      edtContraSenha.PasswordChar := #0;
      btnShow.ImageIndex := 6;
      btnShow.HotImageIndex := 7;
    end;
end;

procedure TfrmSystemInstall.btnBuscarCEPClick(Sender: TObject);
begin
  // Consulta CEP
  if ds.State in [dsEdit,dsInsert] then
    begin
      CriaFormulario(TfrmCEP,0,'CONSULTA',frmCEP);
      if Parametros.PEndereco.Valido = True then
        begin
          if (Application.MessageBox('Tem certeza que deseja utilizar o CEP pesquisado?','Confirmação de atualização',MB_ICONQUESTION + MB_YESNO) =  ID_YES) then
            begin
              // Inicia Substituição de campos que não esta nulos
              Endereco := Parametros.PEndereco;
              // >> CEP
              if Endereco.Cep <> '' then
                begin
                  Fieldcdsnome.AsString := Endereco.Cep;
                end;
              // >> Endereço
              if Endereco.Tipologradouro <> '' then
                begin
                  Fieldcdsendereco.AsString := Endereco.Tipologradouro + ' ' + Endereco.Logradouro;
                end
              else
                begin
                  if Endereco.Logradouro <> '' then
                    Fieldcdsendereco.AsString := Endereco.Logradouro;
                end;
              // >> Complemento
              if Endereco.Complemento <> '' then
                begin
                  Fieldcdscomplemento.AsString := Endereco.Complemento;
                end;
              // >> Bairro
              if Endereco.Bairro <> '' then
                begin
                  Fieldcdsbairro.AsString := Endereco.Bairro;
                end;
              // >> UF
              if Endereco.Estado <> '' then
                begin
                  Fieldcdsuf.AsString := Endereco.Estado;
                  qCidade.Filtered := False;
                  qCidade.Filter := 'uf = '+QuotedStr(Endereco.Estado);
                  qCidade.Filtered := True;
                end;
              // >> Municipio
              if Endereco.Cidade <> '' then
                begin
                  qSQL.Close;
                  qSQL.SQL.Clear;
                  qSQL.SQL.Text := ' SELECT	cd.codigo ' +
                                   '   FROM cidades cd ' +
                                   '  WHERE retira_acentuacao(cidade) ILIKE retira_acentuacao(' + QuotedStr('%'+Endereco.Cidade+'%') +') '+
                                   '    AND uf = ' + QuotedStr(Endereco.Estado) + ' ;';
                  qSQL.Open;
                  if qSQL.RecordCount = 1 then
                    Fieldcdscidade.AsInteger := qSQL.FieldByName('codigo').AsInteger;
                end;
            end
          else
            Aviso('INFO','Info','Operação cancelada!');
        end
    end
  else
    AbreFormulario(TfrmCEP,frmCEP);
end;

procedure TfrmSystemInstall.btnCancelarClick(Sender: TObject);
begin
  if Pergunta('WHAT','Cancelar instalação','Tem certeza que deseja cancelar a instalação do sistema?'+#13+'O sistema estara indisponivel ate a conclusao da instalação.','SN') = ID_YES then
    Application.Terminate;
end;

procedure TfrmSystemInstall.btnFinalizarClick(Sender: TObject);
begin
  Parametros.SystemConfig.ASSystemConf := True;
  Application.Terminate;
end;

procedure TfrmSystemInstall.btnIniciarClick(Sender: TObject);
var
  ID: Integer; // Chave do registro do cliente no servidor
  KEY, SERIAL, CHAVE:String;
  DATAINICIO: string;
begin
  // Procedimentos de Registro de um novo usuario
  // > Verificar se o cliente ja esta registrado.
  Application.ProcessMessages;
  if Length(keysystem) = 0 then
    begin
      with Developer do
        begin
          qclient_check.ParamByName('cgc').AsString := Fieldcdscnpj.AsString;
          qclient_check.Open;
          ID := qclient_check.FieldByName('client_check').AsInteger;
          qclient_check.Close;
          if ID = 0 then
            begin
              // Registra o novo cliente
              qRegistro.Open;
              qRegistro.Insert;
              FieldRegistrotipopessoa.AsInteger := Fieldcdstipopessoa.AsInteger;
              FieldRegistronome.AsString :=	Fieldcdsnome.AsString;
              FieldRegistrofantasia.AsString :=	Fieldcdsfantasia.AsString;
              FieldRegistroapelido.AsString := Fieldcdsnomereduzido.AsString;
              FieldRegistrocnpj.AsString :=	Fieldcdscnpj.AsString;
              FieldRegistroie.AsString :=	Fieldcdsie.AsString;
              FieldRegistroim.AsString :=	Fieldcdsim.AsString;
              FieldRegistroendereco.AsString :=	Fieldcdsendereco.AsString;
              FieldRegistroendereco_numero.AsString := Fieldcdsendereco_numero.AsString;
              FieldRegistrocomplemento.AsString := Fieldcdscomplemento.AsString;
              FieldRegistroreferencia.AsString :=	Fieldcdsreferencia.AsString;
              FieldRegistrobairro.AsString :=	Fieldcdsbairro.AsString;
              FieldRegistrocep.AsString := Fieldcdscep.AsString;
              FieldRegistrocidade.AsInteger := Fieldcdscidade.AsInteger;
              FieldRegistrouf.AsString :=	Fieldcdsuf.AsString;
              FieldRegistropais.AsInteger := Fieldcdspais.AsInteger;
              FieldRegistrotelefone.AsString :=	Fieldcdstel1.AsString;
              FieldRegistrocelular.AsString := Fieldcdstel2.AsString;
              FieldRegistroempresa.AsString := Fieldcdstel3.AsString;
              FieldRegistroemail.AsString :=	Fieldcdsemail.AsString;
              FieldRegistrosite.AsString := Fieldcdssite.AsString;
              qRegistro.Post;
              qclient_check.Open;
              ID := qclient_check.FieldByName('client_check').AsInteger;
              qclient_check.Close;
              qRegistro.Close;
            end
          else
            begin
              qGetKey.ParamByName('codigo').AsInteger := ID;
              qGetKey.Open;
              CHAVE := HexToStr(qGetKey.FieldByName('get_client_hash').AsString);
              if CHAVE = '' then
                begin
                  Aviso('ERRO','Falha na validação','Não foi possivel obter a chave de ativação do sistema. Por favor, entre em contato com o suporte.');
                  btnIniciar.Enabled := False;
                  Application.Terminate;
                end
              else
                begin
                  ID := StrToInt(SplitString(CHAVE, '=')[0]);
                  KEY := SplitString(CHAVE, '=')[1];
                end;
              qGetKey.Close;
            end;
          // > Verifica se o terminal esta registrado.
          qterminais.ParamByName('pessoa').AsInteger := ID;
          qterminais.ParamByName('terminal').AsString := cds.FieldByName('key_terminal').AsString;
          qterminais.Open;
          if qterminais.RecordCount = 0 then
            begin
              qGetClient.ParamByName('codigo').AsInteger := ID;
              qGetClient.Open;
              SERIAL := qGetClient.FieldByName('hash').AsString + StrToHex('@') + KeyTerminal;
              qterminais.Insert;
              Fieldqterminais_data_inicial.AsDateTime:= Now;
              Fieldqterminais_client_hash.AsString := SERIAL;
              Fieldqterminais_terminal_hash.AsString := KeyTerminal;
              Fieldqterminais_server_hash.AsString := CHAVE;
              Fieldqterminaisinativo.AsBoolean := False;
              Fieldqterminaispessoa.AsInteger := ID;
              qterminais.Post;
              qGetClient.Close;
            end
          else
            begin
              SERIAL := Fieldqterminais_client_hash.AsString;
            end;
          qterminais.Close;
        end;
    end
  else
    begin
      CHAVE := HexToStr(keysystem);
      ID := StrToInt(SplitString(CHAVE, '=')[0]);
      KEY := SplitString(CHAVE, '=')[1];
      with Developer do
        begin
          qGetClient.ParamByName('codigo').AsInteger := ID;
          qGetClient.Open;
          qterminais.ParamByName('pessoa').AsInteger := ID;
          qterminais.ParamByName('terminal').AsString := cds.FieldByName('key_terminal').AsString;
          qterminais.Open;
        end;
    end;
  // ETAPA 1 -> Download do arquivo com configurações basicas ( Tabelas, tabelas_campos, formularios, grupo_usuarios)
  chk1.Checked := True;
  Application.ProcessMessages;
  // ETAPA 2 ->
  qPessoa.Open;
    if qPessoa.RecordCount > 0 then
      begin
        qPessoa.First;
        while qPessoa.Eof = False do
          begin
            qPessoa.Delete;
            qPessoa.Next;
          end;
      end;
  if Length(keysystem) = 0 then
    begin
      qPessoa.Insert;
      FieldPessoacodigo.AsInteger := 1;
      FieldPessoatipopessoa.AsInteger := Fieldcdstipopessoa.AsInteger;
      FieldPessoanome.AsString :=	Fieldcdsnome.AsString;
      FieldPessoafantasia.AsString :=	Fieldcdsfantasia.AsString;
      FieldPessoanomereduzido.AsString := Fieldcdsnomereduzido.AsString;
      FieldPessoacnpj.AsString :=	Fieldcdscnpj.AsString;
      FieldPessoaie.AsString :=	Fieldcdsie.AsString;
      FieldPessoaim.AsString :=	Fieldcdsim.AsString;
      FieldPessoaendereco.AsString :=	Fieldcdsendereco.AsString;
      FieldPessoaendereco_numero.AsString := Fieldcdsendereco_numero.AsString;
      FieldPessoacomplemento.AsString := Fieldcdscomplemento.AsString;
      FieldPessoareferencia.AsString :=	Fieldcdsreferencia.AsString;
      FieldPessoabairro.AsString :=	Fieldcdsbairro.AsString;
      FieldPessoacep.AsString := Fieldcdscep.AsString;
      FieldPessoacidade.AsInteger := Fieldcdscidade.AsInteger;
      FieldPessoauf.AsString :=	Fieldcdsuf.AsString;
      FieldPessoapais.AsInteger := Fieldcdspais.AsInteger;
      FieldPessoatel1.AsString :=	Fieldcdstel1.AsString;
      FieldPessoatel2.AsString := Fieldcdstel2.AsString;
      FieldPessoatel3.AsString := Fieldcdstel3.AsString;
      FieldPessoaemail.AsString := Fieldcdsemail.AsString;
      FieldPessoasite.AsString := Fieldcdssite.AsString;
      qPessoa.Post;
    end
  else
    begin
      qPessoa.Insert;
      with Developer do
        begin
          FieldPessoacodigo.AsInteger := 1;
          FieldPessoatipopessoa.AsInteger := FieldRegistrotipopessoa.AsInteger;
          FieldPessoanome.AsString :=	FieldRegistronome.AsString;
          FieldPessoafantasia.AsString :=	FieldRegistrofantasia.AsString;
          FieldPessoanomereduzido.AsString := FieldRegistroapelido.AsString;
          FieldPessoacnpj.AsString :=	FieldRegistrocnpj.AsString;
          FieldPessoaie.AsString :=	FieldRegistroie.AsString;
          FieldPessoaim.AsString :=	FieldRegistroim.AsString;
          FieldPessoaendereco.AsString :=	FieldRegistroendereco.AsString;
          FieldPessoaendereco_numero.AsString := FieldRegistroendereco_numero.AsString;
          FieldPessoacomplemento.AsString := FieldRegistrocomplemento.AsString;
          FieldPessoareferencia.AsString :=	FieldRegistroreferencia.AsString;
          FieldPessoabairro.AsString :=	FieldRegistrobairro.AsString;
          FieldPessoacep.AsString := FieldRegistrocep.AsString;
          FieldPessoacidade.AsInteger := FieldRegistrocidade.AsInteger;
          FieldPessoauf.AsString :=	FieldRegistrouf.AsString;
          FieldPessoapais.AsInteger := FieldRegistropais.AsInteger;
          FieldPessoatel1.AsString :=	FieldRegistrotelefone.AsString;
          FieldPessoatel2.AsString := FieldRegistrocelular.AsString;
          FieldPessoatel3.AsString := FieldRegistroempresa.AsString;
          FieldPessoaemail.AsString := FieldRegistroemail.AsString;
          FieldPessoasite.AsString := FieldRegistrosite.AsString;
          FieldPessoaperpetuo.AsBoolean := True;
          FieldPessoaoldid.AsInteger := ID;
        end;
      qPessoa.Post;
    end;
  qPessoa.Close;
  // Define o novo valor para sequencia de cadastro de pessoas
  with Connection do
    begin
      qSQL.Close;
      qSQL.SQL.Clear;
      qSQL.SQL.Text := 'SELECT setval('''+'pessoas_codigo_seq'+'''::regclass, 100);';
      qSQL.Execute;
      qSQL.SQL.Clear;
    end;
  // -----------
  Developer.qGetClient.Close;
  chk2.Checked := True;
  Application.ProcessMessages;
  // ETAPA 3 ->
  if Length(KEY) = 24 then
    DATAINICIO := Copy(KEY, 15, 24)
  else
    DATAINICIO := Copy(KEY, 12, 21);
  qEmpresa.Open;
  qEmpresa.Insert;
  FieldEmpresacodigo.AsInteger := 1;
  FieldEmpresapessoa.AsInteger := 1;
  FieldEmpresaserial.AsString := SERIAL;
  FieldEmpresachave.AsString := CHAVE;
  FieldEmpresadata_inicio.AsDateTime := StrToDate(DATAINICIO);
  FieldEmpresadata_fim.AsDateTime := Developer.qTerminais.FieldByName('data_final').AsDateTime;
  FieldEmpresamatriz.AsBoolean := True;
  FieldEmpresainativo.AsBoolean := False;
  FieldEmpresadatacadastro.AsDateTime := Now;
  qEmpresa.Post;
  qEmpresa.Close;
  Developer.qterminais.Close;
  chk3.Checked := True;
  Application.ProcessMessages;
  // ETAPA 4 -> REGISTRO DE USUARIO E PERMISSÔES DE ACESSO
  qUsuarios.Open;
  qUsuarios.Insert;
  qUsuarios.FieldByName('pessoa').AsInteger := 1;
  qUsuarios.FieldByName('grupo').AsInteger := 1;
  qUsuarios.FieldByName('login').AsString := 'ADMIN';
  qUsuarios.FieldByName('senha').AsString := 'admin';
  qUsuarios.FieldByName('ativo').AsBoolean := True;
  qUsuarios.Post;
  qUsuarios.Insert;
  qUsuarios.FieldByName('pessoa').AsInteger := 1;
  qUsuarios.FieldByName('grupo').AsInteger := 1;
  qUsuarios.FieldByName('login').AsString := edtUsuario.Text;
  qUsuarios.FieldByName('senha').AsString := edtSenha.Text;
  qUsuarios.FieldByName('ativo').AsBoolean := True;
  qUsuarios.Post;
  qUsuarios.Close;
  chk4.Checked := True;
  Application.ProcessMessages;
  // ETAPA 5 ->
  chk5.Checked := True;
  Application.ProcessMessages;
  // ETAPA 6 ->
  chk6.Checked := True;
  Application.ProcessMessages;
  // ETAPA 7 -> Realiza as otimizações do banco!
  Application.CreateForm(TfrmProcess, frmProcess);
  frmProcess.ProcessStart('','Otimizando Banco','Realizando Otimização do Banco de Dados.');
  Application.ProcessMessages;
  with Connection do
    begin
      qSQL.Close;
      qSQL.SQL.Clear;
      qSQL.SQL.Text := 'VACUUM FULL FREEZE ANALYSE;';
      qSQL.Execute;
      qSQL.SQL.Clear;
    end;
  frmProcess.NextMessage('Reindexando tabelas.');
  Application.ProcessMessages;
  with Connection do
    begin
      qSQL.Close;
      qSQL.SQL.Clear;
      qSQL.SQL.Text := 'REINDEX DATABASE ' + Parametros.SystemConfig.ASDBDataBase + ';';
      qSQL.Execute;
      qSQL.SQL.Clear;
    end;
  frmProcess.NextMessage('Finalizando conexões.');
  Application.ProcessMessages;
  frmProcess.ProcessFinish;
  frmProcess.Release;
  chk7.Checked := True;
  Application.ProcessMessages;
  // ETAPA 8 ->
  chk8.Checked := True;
  Application.ProcessMessages;
  // Processo finalizado
  btnProximo.Enabled := True;
  btnIniciar.Enabled := False;
  keysystem := CHAVE;
end;

procedure TfrmSystemInstall.btnProximoClick(Sender: TObject);
begin
  try
    case Estagio of
    0:begin
        Application.CreateForm(TDeveloper, Developer);
        try
          Developer.Conn.Open;
        except
          Aviso('ERRO','Falha na conexão','Não foi possivel conectar ao servidor da mantenedora. Por favor, tente novamente mais tarde.');
          Application.Terminate;
        end;
        if Pergunta('INFO','Chave de ativação','Você possui alguma chave de ativação que deseja utilizar?','SN') = ID_YES then
          begin
            keysystem := InputBox('Chave de ativação','Informe a chave de ativação: ', keysystem);
            // Verifica se a chave informada esta registrada no servidor.
            Developer.qCheckKey.ParamByName('chave').AsString := keysystem;
            Developer.qCheckKey.Open;
            if Developer.qCheckKey.FieldByName('client_checkkey').AsInteger <> 0 then
              Estagio := 2
            else
              begin
                Estagio := Estagio + 1;
                Aviso('ERRO','Chave invalida','A Chave informada, não foi encontrada em nosso registros.');
                keysystem := '';
                // Carrega os registros de cidades fornecidos pelo sistema de consulta.
                if cds.RecordCount > 0 then
                  cds.Edit
                else
                  cds.Insert;
                Fieldcdspais.AsInteger := 1058;
              end;
            Developer.qCheckKey.Close;
          end
        else
          begin
            btnCancelar.Enabled := True;
            btnAnterior.Enabled := True;
            btnProximo.Enabled := True;
            btnFinalizar.Enabled := False;
            Estagio := Estagio + 1;
            // Carrega os registros de cidades fornecidos pelo sistema de consulta.
            if cds.RecordCount > 0 then
              cds.Edit
            else
              cds.Insert;
            Fieldcdspais.AsInteger := 1058;
          end;
        PageControl.ActivePageIndex := Estagio;
      end;
    1:begin
        try
          Fieldcdskey_terminal.AsString := KeyTerminal;
          Fieldcdskey_registro.AsString := StrToHex(Fieldcdscnpj.AsString);
          cds.Post;
          Estagio := Estagio + 1;
        except
          Exit;
        end;
        btnCancelar.Enabled := True;
        btnAnterior.Enabled := False;
        btnProximo.Enabled := True;
        btnFinalizar.Enabled := False;
        PageControl.ActivePageIndex := Estagio;
      end;
    2:begin
        if (edtUsuario.Text <> '') and (edtSenha.Text <> '') and (edtContraSenha.Text <> '') and (edtSenha.Text = edtContraSenha.Text) then
          begin
            cds.Edit;
            Fieldcdslogin.AsString := edtUsuario.Text;
            Fieldcdssenha.AsString := edtSenha.Text;
            cds.Post;
          end
        else
          begin
            Aviso('STOP','Informação','É necessario informar o novo usuário do sistema para prosseguir!');
            Exit;
          end;
        btnCancelar.Enabled := True;
        btnAnterior.Enabled := True;
        btnProximo.Enabled := False;
        btnFinalizar.Enabled := False;
        Estagio := Estagio + 1;
        PageControl.ActivePageIndex := Estagio;
      end;
    3:begin
        btnCancelar.Enabled := True;
        btnAnterior.Enabled := True;
        btnProximo.Enabled := True;
        btnFinalizar.Enabled := False;
        Estagio := Estagio + 1;
        PageControl.ActivePageIndex := Estagio;
        edtChave.Text := keysystem;
      end;
    4:begin
        btnCancelar.Enabled := False;
        btnAnterior.Enabled := False;
        btnProximo.Enabled := False;
        btnFinalizar.Enabled := True;
        Estagio := Estagio + 1;
        PageControl.ActivePageIndex := Estagio;
      end;
    5:begin
        btnCancelar.Enabled := False;
        btnAnterior.Enabled := False;
        btnProximo.Enabled := False;
        btnFinalizar.Enabled := True;
      end;
    end;
  except
  end;
end;

procedure TfrmSystemInstall.cbbTipoPessoaExit(Sender: TObject);
begin
  if Fieldcdstipopessoa.AsInteger = 0 then
    begin
      Fieldcdscnpj.EditMask := '000\.000\.000\-00;0;_';
      lblCNPJ.Caption := 'CPF:';
      lblCNPJ.Visible := True;
      lblNome.Caption := 'Nome:';
      lblNome.Visible := True;
      lblIE.Caption := 'RG:';
      lblIE.Visible := True;
      lblFantasia.Caption := 'Abreviatura';
      lblFantasia.Visible := True;
      lblIM.Caption := 'OID:';
      lblIM.Visible := True;
      lblNomeReduzido.Caption := 'Apelido:';
      lblNomeReduzido.Visible := True;
    end
  else
    begin
      Fieldcdscnpj.EditMask := '00\.000\.000\/0000\-00;0;_';
      lblCNPJ.Caption := 'CNPJ:';
      lblCNPJ.Visible := True;
      lblNome.Caption := 'Razão Social:';
      lblNome.Visible := True;
      lblIE.Caption := 'IE:';
      lblIE.Visible := True;
      lblFantasia.Caption := 'Fantasia';
      lblFantasia.Visible := True;
      lblIM.Caption := 'IM:';
      lblIM.Visible := True;
      lblNomeReduzido.Caption := 'Abreviatura:';
      lblNomeReduzido.Visible := True;
    end;
end;

procedure TfrmSystemInstall.edtContraSenhaExit(Sender: TObject);
begin
  if edtContraSenha.Text <> edtSenha.Text then
    begin
      edtContraSenha.Clear;
      ShowMessage('As senhas não conferem.')
    end;
end;

procedure TfrmSystemInstall.FormCreate(Sender: TObject);
begin
  Estagio := 0;
  PageControl.ActivePageIndex := Estagio;
  if cds.Active = True then
      begin
        cds.EmptyDataSet;
        cds.Close;
      end;
  XML := Parametros.SystemConfig.ASSystemPath + '\config\RegSystem.xml';
  if FileExists(XML) then
    begin
      cds.LoadFromFile(XML);
      cds.Open;
    end
  else
    begin
      cds.FileName := XML;
      cds.CreateDataSet;
    end;
end;

procedure TfrmSystemInstall.FormShow(Sender: TObject);
begin
  OpenQuery;
  PageControl.HideTabs := True;
  PageControl.TabOrder := Estagio;
end;

procedure TfrmSystemInstall.OpenQuery;
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

function TfrmSystemInstall.reg_client: Integer;
begin
  // Registra um novo cliente no servidor externo.
end;

end.
