program NarseoCaixa;

uses
  SysUtils,
  Vcl.Forms,
  unCaixa in '..\pas\caixa\unCaixa.pas' {Caixa},
  unEndereco in '..\lib\unEndereco.pas',
  unFields in '..\lib\unFields.pas',
  unNetwork in '..\lib\unNetwork.pas',
  unSQL in '..\lib\unSQL.pas',
  unMaster in '..\pas\essenciais\unMaster.pas' {FMaster},
  unSystem in '..\lib\unSystem.pas',
  unParametros in '..\pas\parametros\unParametros.pas' {Parametros: TDataModule},
  unSystemConfig in '..\pas\parametros\unSystemConfig.pas' {frmSystemConfig},
  unSystemInstall in '..\pas\parametros\unSystemInstall.pas' {frmSystemInstall},
  unConnection in '..\pas\conexao\unConnection.pas' {Connection: TDataModule},
  unCEP in '..\pas\localidades\unCEP.pas' {frmCEP},
  unSystemLogin in '..\pas\seguranca\unSystemLogin.pas' {frmSystemLogin},
  unSystemBreak in '..\pas\parametros\unSystemBreak.pas' {frmSystemBreak},
  unSystemSplashCaixa in '..\pas\essenciais\unSystemSplashCaixa.pas' {frmSystemSplashCaixa},
  save in '..\pas\outros\save.pas' {frmSave},
  unDMCaixa in '..\pas\caixa\unDMCaixa.pas' {dmCaixa: TDataModule},
  unCadPessoa in '..\pas\pessoas\unCadPessoa.pas' {frmCadPessoa},
  unCadPessoaCliente in '..\pas\pessoas\unCadPessoaCliente.pas' {frmCadPessoaCliente},
  unCadPessoaFuncionario in '..\pas\pessoas\unCadPessoaFuncionario.pas' {frmCadPessoaFuncionario},
  unCadPessoaRepresentante in '..\pas\pessoas\unCadPessoaRepresentante.pas' {frmCadPessoaRepresentante},
  unGridPessoaFuncionario in '..\pas\pessoas\unGridPessoaFuncionario.pas',
  unGridPessoaRepresentante in '..\pas\pessoas\unGridPessoaRepresentante.pas',
  unCad in '..\pas\essenciais\unCad.pas' {frmCad},
  unGrid in '..\pas\essenciais\unGrid.pas' {frmGrid},
  unDMPessoaClientes in '..\pas\pessoas\unDMPessoaClientes.pas',
  unDMBasico in '..\pas\essenciais\unDMBasico.pas' {dmBasico: TDataModule},
  unCadPessoaContasBancarias in '..\pas\pessoas\unCadPessoaContasBancarias.pas' {frmCadPessoaContasBancarias},
  unCadPessoaSaldos in '..\pas\pessoas\unCadPessoaSaldos.pas' {frmCadPessoaSaldos},
  unReport in '..\pas\essenciais\unReport.pas' {Report: TDataModule},
  unQuery in '..\pas\essenciais\unQuery.pas' {frmQuery},
  unView in '..\pas\essenciais\unView.pas' {frmView},
  unSystemHelp in '..\pas\essenciais\unSystemHelp.pas' {frmSystemHelp},
  unGridPessoaCliente in '..\pas\pessoas\unGridPessoaCliente.pas' {frmGridPessoaCliente},
  unNewVendasCaixa in '..\pas\caixa\unNewVendasCaixa.pas' {frmNewVendasCaixa},
  unNew in '..\pas\essenciais\unNew.pas' {frmNew},
  unConnectionDeveloper in '..\pas\conexao\unConnectionDeveloper.pas' {Developer: TDataModule},
  unProcess in '..\pas\essenciais\unProcess.pas' {frmProcess};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'NARSEO - Frente de Caixa';
  Application.CreateForm(TCaixa, Caixa);
  Application.CreateForm(TParametros, Parametros);
  // Inicia processo de Inicialização do Sistema.
  begin
    // Grava o caminho do Sistema e Parametros
    Parametros.SystemConfig.ASSystemPath:= ExtractFileDir(Application.ExeName);

    // Cria a Conexão com o Banco
    Application.CreateForm(TConnection, Connection);

    // Verifica se o Arquivo de Configurãção Existe.
    if Connection.Integridade = False then
      begin
        Aviso('ERRO','Problema de Integridade','Existem arquivos faltando ou corrompidos.'+#13+'Por favor, utilize a manutenção do sistema para restaurar!');
        Application.Terminate;
      end
    else
      begin
        if Connection.ConectZero = False then
          begin
            // Abre o assistente de configuração do servidor
            Parametros.SystemConfig.ASSystemConf := False;
            AbreFormulario(TfrmSystemConfig,frmSystemConfig);
            // Verificar se é uma nova instalação
            if Connection.SystemCheck = False then
              begin
                if Pergunta('INFO','Configuração','Esta parece ser uma nova instalação do sistema. '+#13+'Deseja realizar o cadastro inicial para utilizar o sistema?','SN') = 6 then
                  begin
                    AbreFormulario(TfrmSystemInstall,frmSystemInstall);
                  end
                else
                  Application.Terminate;
              end;
          end
        else
          begin
            // Carrega o arquivo de configuração.
            Parametros.SystemConfig.CarregarConfigServer(Connection.ZeroConfig);
            Parametros.SystemConfig.OpenConnection(Connection.Conn);
          end;
        if Connection.SystemCheck = False then
          begin
            if Pergunta('INFO','Configuração','Esta parece ser uma nova instalação do sistema. '+#13+'Deseja realizar o cadastro inicial para utilizar o sistema?','SN') = 6 then
              begin
                Parametros.SystemConfig.ASSystemConf := False;
                AbreFormulario(TfrmSystemInstall,frmSystemInstall);
              end
            else
              Application.Terminate;
          end;
      end;

    // Verifica se o sistema esta configurado
    if Parametros.SystemConfig.ASSystemConf = False then
      Application.Terminate;

    // Verifica se existe alguma interrupção programada
    if Connection.SystemTerminate(Connection.SystemBreak) = True then
      begin
        CriaFormulario(TfrmSystemBreak,Connection.SystemBreak,'OUT',frmSystemBreak)
      end
    else
      begin
        Application.CreateForm(TfrmSystemLogin,frmSystemLogin);
        frmSystemLogin.ShowModal;
        frmSystemLogin.Free;
      end;
    // Abre a janela de Login
    if Parametros.SystemConfig.ASSystemAuth = True then
      begin
        Application.CreateForm(TfrmSystemSplashCaixa,frmSystemSplashCaixa);
        frmSystemSplashCaixa.Showmodal;
        frmSystemSplashCaixa.Free;
      end;
  end;
  Application.Run;
end.
