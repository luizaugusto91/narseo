unit unSEFAZ;

interface

uses
  Vcl.Forms, System.SysUtils, System.Classes, ACBrSAT, ACBrBase, ACBrDFe, ACBrNFe, ACBrUtil,
  ACBrNFeDANFEClass, ACBrNFeDANFeRLClass, ACBrMail, unSystem, unParametros,
  pcnConversao, pcteConversaoCTe, pcnAuxiliar, ACBrNFeDANFEFRDM, ACBrNFeDANFEFR, ACBrDFeSSL,
  ACBrSATExtratoClass, ACBrSATExtratoESCPOS, ACBrMDFeDAMDFEFR, ACBrMDFeDAMDFeClass,
  ACBrMDFeDAMDFeRLClass, ACBrMDFe, ACBrCTeDACTeRLClass, ACBrCTeDACTEClass,
  ACBrCTeDACTEFR, ACBrCTe, ACBrSATExtratoReportClass, ACBrSATExtratoFortesFr;

type
  TSefaz = class(TDataModule)
    ACBrNFe: TACBrNFe;
    ACBrSAT: TACBrSAT;
    ACBrNFeDANFeRL: TACBrNFeDANFeRL;
    ACBrMail: TACBrMail;
    ACBrCTe: TACBrCTe;
    ACBrCTeDACTeRL: TACBrCTeDACTeRL;
    ACBrMDFe: TACBrMDFe;
    ACBrMDFeDAMDFeRL: TACBrMDFeDAMDFeRL;
    ACBrSATExtratoESCPOS: TACBrSATExtratoESCPOS;
    ACBrSATExtratoFortes: TACBrSATExtratoFortes;
    procedure ACBrCTeStatusChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function checkSEFAZCTe:Boolean;
    procedure ReloadConfig;
    procedure ConfigSeFaz;
    procedure ConfigEmpresa;
  end;

var
  Sefaz: TSefaz;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
uses unAplicacao, unConnection, ACBrNFeConfiguracoes,
  ACBrCTeConfiguracoes, ACBrMDFeConfiguracoes, unProcess;

{ TdmSEFAZ }

procedure TSefaz.ACBrCTeStatusChange(Sender: TObject);
begin
  Application.CreateForm(TfrmProcess, frmProcess);
  case ACBrCTe.Status of
    {stCTeIdle : begin
             if ( frmStatus <> nil ) then frmStatus.Hide;
    end;}
    stCTeStatusServico: frmProcess.ProcessStart('','SEFAZ','Verificando Status do servico...');
    stCTeRecepcao:  		frmProcess.ProcessStart('','SEFAZ','Enviando dados do CTe...');
    stCTeRetRecepcao:		frmProcess.ProcessStart('','SEFAZ','Recebendo dados do CTe...');
    stCTeConsulta:      frmProcess.ProcessStart('','SEFAZ','Consultando CTe...');
    stCTeCancelamento:  frmProcess.ProcessStart('','SEFAZ','Enviando cancelamento de CTe...');
    stCTeInutilizacao:  frmProcess.ProcessStart('','SEFAZ','Enviando pedido de Inutilização...');
    stCTeRecibo:        frmProcess.ProcessStart('','SEFAZ','Consultando Recibo de Lote...');
    stCTeCadastro:      frmProcess.ProcessStart('','SEFAZ','Consultando Cadastro...');
    {
    stCTeEnvDPEC : begin
                if ( frmStatus = nil )
                 then frmStatus := TfrmStatus.Create(Application);
                frmStatus.lblStatus.Caption := 'Enviando DPEC...';
                frmStatus.Show;
                frmStatus.BringToFront;
               end;
    }
    stCTeEmail:         frmProcess.ProcessStart('','SEFAZ','Enviando Email...');
  end;
 frmProcess.ProcessFinish;
 frmProcess.Release;
 Application.ProcessMessages;
 Sleep(10000);
end;

function TSefaz.checkSEFAZCTe: Boolean;
var
  StatusOK, TentarNovamente :Boolean;
begin
  try
    ACBrCTe.WebServices.StatusServico.Executar;
  except
    on Erro: Exception do
      begin
        Aviso('WARN','Erro ao consultar o Status',Erro.Message);
        Result := False;
      end;
  end;
  StatusOK := (ACBrCTe.WebServices.StatusServico.XMotivo= 'Serviço em Operação') or (ACBrCTe.WebServices.StatusServico.XMotivo= 'Servico em Operacao');
  TentarNovamente := not StatusOK;
  if StatusOK = False then
    begin
      Aviso('WARN','Status do serviço',ACBrCTe.WebServices.StatusServico.XMotivo);
      Result := False;
    end
  else
    Result := True;
end;

procedure TSefaz.ConfigEmpresa;
var Ok:Boolean;
begin
  Ok:= True;
  // Carrega as configurações da empresa.
  //with ACBrNFe.Configuracoes. do
end;

procedure TSefaz.ConfigSeFaz;
var
  Ok:Boolean;
begin
  Ok:= True;
  // Define as configurações padrão.
  // > E-mail ------------------------------------------------------------------
  with ACBrNFe.MAIL do
    begin
      Host              := Connection.qAssinaturaemail_smtp.AsString;
      Port              := Connection.qAssinaturaemail_porta.AsString;
      SetSSL            := Connection.qAssinaturaemail_conexaosegura.AsBoolean;
      Username          := Connection.qAssinaturaemail_usuario.AsString;
      Password          := Connection.qAssinaturaemail_senha.AsString;
      Subject           := Connection.qAssinaturaemail_assunto.AsString;
      From              := '';
      FromName          := '';
    end;
  // NF-e >---------------------------------------------------------------------
  // >> Certificado
  with ACBrNFe.Configuracoes.Certificados do
    begin
      ArquivoPFX        := Connection.qHostConfigcertificado_path.AsString;
      NumeroSerie       := Connection.qHostConfigcertificado_chave.AsString;
      Senha             := Connection.qAssinaturacertificado_senha.AsString;
    end;
  // >> WebService
  with ACBrNFe.Configuracoes.WebServices do
    begin
      ProxyHost         := Connection.qHostConfigweb_proxy_host.AsString;
      ProxyPort         := Connection.qHostConfigweb_proxy_port.AsString;
      ProxyUser         := Connection.qHostConfigweb_proxy_usuario.AsString;
      ProxyPass         := Connection.qHostConfigweb_proxy_senha.AsString;
      AjustaAguardaConsultaRet := Connection.qAssinaturaweb_ajustarautomaticamente.AsBoolean;
      // Ambiente de Trabalho
      Ambiente          := StrToTpAmb(Ok,IntToStr(Connection.qHostConfigsefaz_ambiente.AsInteger));
      Tentativas        := Connection.qAssinaturaweb_ajuste_tentativas.AsInteger;
      AguardarConsultaRet := IntToCard(Connection.qAssinaturaweb_ajuste_aguardar.AsInteger);
      IntervaloTentativas := IntToCard(Connection.qAssinaturaweb_ajuste_intervalo.AsInteger);
    end;
  // >> DANFE
  with ACBrNFe.DANFE do
    begin
      // >> Configurações basicas para impressão!
      if Connection.qAssinaturadanfe_logo.IsNull = false then
        Logo := '';
      TipoDANFE := StrToTpImp(OK,IntToStr(Connection.qAssinaturadanfe_retrato.AsInteger + 1));
      Email := Connection.qPessoa.FieldByName('email').AsString;
      Fax := Connection.qPessoa.FieldByName('tel1').AsString
    end;
  // CT-e >---------------------------------------------------------------------
  // >> Certificado
  with ACBrCTe.Configuracoes.Certificados do
    begin
      ArquivoPFX        := Connection.qHostConfigcertificado_path.AsString;
      NumeroSerie       := Connection.qHostConfigcertificado_chave.AsString;
      Senha             := Connection.qAssinaturacertificado_senha.AsString;
    end;
  // >> Gerais
  {with ACBrCTe.Configuracoes.Geral do
    begin
      SSLLib := TSSLLib(1);// TSSLLib(cbSSLLib.ItemIndex);
      SSLCryptLib := TSSLCryptLib(1);
      SSLHttpLib := TSSLHttpLib(1);
      SSLXmlSignLib := TSSLXmlSignLib(3);
    end;}
  // >> WebService
  with ACBrCTe.Configuracoes.WebServices do
    begin
      ProxyHost         := Connection.qHostConfigweb_proxy_host.AsString;
      ProxyPort         := Connection.qHostConfigweb_proxy_port.AsString;
      ProxyUser         := Connection.qHostConfigweb_proxy_usuario.AsString;
      ProxyPass         := Connection.qHostConfigweb_proxy_senha.AsString;
      AjustaAguardaConsultaRet := Connection.qAssinaturaweb_ajustarautomaticamente.AsBoolean;
      // Ambiente de Trabalho
      Ambiente          := StrToTpAmb(Ok,IntToStr(Connection.qHostConfigsefaz_ambiente.AsInteger));
      //Tentativas        := Connection.qAssinaturaweb_ajuste_tentativas.AsInteger;
      //AguardarConsultaRet := IntToCard(Connection.qAssinaturaweb_ajuste_aguardar.AsInteger);
      //IntervaloTentativas := IntToCard(Connection.qAssinaturaweb_ajuste_intervalo.AsInteger);
    end;
  // >> Pastas e diretórios
  with ACBrCTe.Configuracoes.Arquivos do
    begin
      PathSchemas       := Parametros.SystemConfig.ASSystemPath + '\Schemas\CTe';
    end;
  // >> DANFE
  with ACBrCTe.DACTE do
    begin
      // >> Configurações basicas para impressão!
      if Connection.qAssinaturadanfe_logo.IsNull = false then
        Logo := '';
      TipoDACTE := StrToTpImp(OK,IntToStr(Connection.qAssinaturadanfe_retrato.AsInteger + 1));
      Email := Connection.qPessoa.FieldByName('email').AsString;
      Fax := Connection.qPessoa.FieldByName('tel1').AsString
    end;
  // MDF-e >--------------------------------------------------------------------
  // >> Certificado
  with ACBrMDFe.Configuracoes.Certificados do
    begin
      ArquivoPFX        := Connection.qHostConfigcertificado_path.AsString;
      NumeroSerie       := Connection.qHostConfigcertificado_chave.AsString;
      Senha             := Connection.qAssinaturacertificado_senha.AsString;
    end;
  // >> WebService
  with ACBrMDFe.Configuracoes.WebServices do
    begin
      ProxyHost         := Connection.qHostConfigweb_proxy_host.AsString;
      ProxyPort         := Connection.qHostConfigweb_proxy_port.AsString;
      ProxyUser         := Connection.qHostConfigweb_proxy_usuario.AsString;
      ProxyPass         := Connection.qHostConfigweb_proxy_senha.AsString;
      AjustaAguardaConsultaRet := Connection.qAssinaturaweb_ajustarautomaticamente.AsBoolean;
      // Ambiente de Trabalho
      Ambiente          := StrToTpAmb(Ok,IntToStr(Connection.qHostConfigsefaz_ambiente.AsInteger));
      Tentativas        := Connection.qAssinaturaweb_ajuste_tentativas.AsInteger;
      AguardarConsultaRet := IntToCard(Connection.qAssinaturaweb_ajuste_aguardar.AsInteger);
      IntervaloTentativas := IntToCard(Connection.qAssinaturaweb_ajuste_intervalo.AsInteger);
    end;
  // >> DANFE
  with ACBrMDFe.DAMDFE do
    begin
      // >> Configurações basicas para impressão!
      if Connection.qAssinaturadanfe_logo.IsNull = false then
        Logo := '';
      TipoDAMDFE := StrToTpImp(OK,IntToStr(Connection.qAssinaturadanfe_retrato.AsInteger + 1));
      Email := Connection.qPessoa.FieldByName('email').AsString;
      Fax := Connection.qPessoa.FieldByName('tel1').AsString
    end;
end;

procedure TSefaz.ReloadConfig;
begin
  Connection.qAssinatura.Refresh;
  Connection.qHostConfig.Refresh;
  ConfigSeFaz;
end;

end.
