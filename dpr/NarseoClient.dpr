program NarseoClient;

uses
  Vcl.Forms,
  SysUtils,
  unSystem in '..\lib\unSystem.pas',
  unAplicacao in '..\pas\unAplicacao.pas' {Aplicacao},
  unConnection in '..\pas\conexao\unConnection.pas' {Connection: TDataModule},
  unParametros in '..\pas\parametros\unParametros.pas' {Parametros: TDataModule},
  unSystemConfig in '..\pas\parametros\unSystemConfig.pas' {frmSystemConfig},
  unSystemLogin in '..\pas\seguranca\unSystemLogin.pas' {frmSystemLogin},
  unSystemSplash in '..\pas\essenciais\unSystemSplash.pas' {frmSystemSplash},
  unMaster in '..\pas\essenciais\unMaster.pas' {FMaster},
  unSystemHelp in '..\pas\essenciais\unSystemHelp.pas' {frmSystemHelp},
  unCad in '..\pas\essenciais\unCad.pas' {frmCad},
  unGrid in '..\pas\essenciais\unGrid.pas' {frmGrid},
  unGridDepartamentoPessoas in '..\pas\pessoas\unGridDepartamentoPessoas.pas' {frmGridDepartamentoPessoas},
  unCadDepartamentoPessoas in '..\pas\pessoas\unCadDepartamentoPessoas.pas' {frmCadDepartamentoPessoas},
  unGridPermissoesGrupo in '..\pas\seguranca\unGridPermissoesGrupo.pas' {frmGridPermissoesGrupo},
  unGridGrupoUsuarios in '..\pas\seguranca\unGridGrupoUsuarios.pas' {frmGridGrupoUsuarios},
  unQuery in '..\pas\essenciais\unQuery.pas' {frmQuery},
  unSave in '..\pas\essenciais\unSave.pas' {frmSave},
  unSQL in '..\lib\unSQL.pas',
  unGridCargoPessoas in '..\pas\pessoas\unGridCargoPessoas.pas' {frmGridCargoPessoas},
  unCadCargoPessoas in '..\pas\pessoas\unCadCargoPessoas.pas' {frmCadCargoPessoas},
  unCadGrupoUsuarios in '..\pas\seguranca\unCadGrupoUsuarios.pas' {frmCadGrupoUsuarios},
  unConfigGrupoUsuario in '..\pas\seguranca\unConfigGrupoUsuario.pas' {frmConfigGrupoUsuario},
  unGridCategoriaPessoas in '..\pas\pessoas\unGridCategoriaPessoas.pas' {frmGridCategoriaPessoas},
  unCadCategoriaPessoas in '..\pas\pessoas\unCadCategoriaPessoas.pas' {frmCadCategoriaPessoas},
  unCadGrupoPessoas in '..\pas\pessoas\unCadGrupoPessoas.pas' {frmCadGrupoPessoas},
  unGridGrupoPessoas in '..\pas\pessoas\unGridGrupoPessoas.pas' {frmGridGrupoPessoas},
  unEndereco in '..\lib\unEndereco.pas',
  unCadPessoa in '..\pas\pessoas\unCadPessoa.pas' {frmCadPessoa},
  unCadPessoaCliente in '..\pas\pessoas\unCadPessoaCliente.pas' {frmCadPessoaCliente},
  unGridPessoaCliente in '..\pas\pessoas\unGridPessoaCliente.pas' {frmGridPessoaCliente},
  unFields in '..\lib\unFields.pas',
  unCadPessoaFuncionario in '..\pas\pessoas\unCadPessoaFuncionario.pas' {frmCadPessoaFuncionario},
  unGridPessoaFuncionario in '..\pas\pessoas\unGridPessoaFuncionario.pas' {frmGridPessoaFuncionario},
  unCadModeloProdutos in '..\pas\produtos\unCadModeloProdutos.pas' {frmCadModeloProdutos},
  unCadMarcaProdutos in '..\pas\produtos\unCadMarcaProdutos.pas' {frmCadMarcaProdutos},
  unCadCategoriaProdutos in '..\pas\produtos\unCadCategoriaProdutos.pas' {frmCadCategoriaProdutos},
  unCadGrupoProdutos in '..\pas\produtos\unCadGrupoProdutos.pas' {frmCadGrupoProdutos},
  unCadDepositos in '..\pas\produtos\unCadDepositos.pas' {frmCadDepositos},
  unCadTanques in '..\pas\produtos\unCadTanques.pas' {frmCadTanques},
  unGridDepositos in '..\pas\produtos\unGridDepositos.pas' {frmGridDepositos},
  unGridTanques in '..\pas\produtos\unGridTanques.pas' {frmGridTanques},
  unGridCategoriaProdutos in '..\pas\produtos\unGridCategoriaProdutos.pas' {frmGridCategoriaProdutos},
  unGridGrupoProdutos in '..\pas\produtos\unGridGrupoProdutos.pas' {frmGridGrupoProdutos},
  unGridMarcaProdutos in '..\pas\produtos\unGridMarcaProdutos.pas' {frmGridMarcaProdutos},
  unGridModeloProdutos in '..\pas\produtos\unGridModeloProdutos.pas' {frmGridModeloProdutos},
  unCadProdutos in '..\pas\produtos\unCadProdutos.pas' {frmCadProdutos},
  unGridProdutos in '..\pas\produtos\unGridProdutos.pas' {frmGridProdutos},
  unDMProdutoConsultas in '..\pas\produtos\unDMProdutoConsultas.pas' {dmProdutoConsultas: TDataModule},
  unCadPessoaTransportadora in '..\pas\pessoas\unCadPessoaTransportadora.pas' {frmCadPessoaTransportadora},
  unCadPessoaFornecedor in '..\pas\pessoas\unCadPessoaFornecedor.pas' {frmCadPessoaFornecedor},
  unGridPessoaTransportadora in '..\pas\pessoas\unGridPessoaTransportadora.pas' {frmGridPessoaTransportadora},
  unGridPessoaFornecedor in '..\pas\pessoas\unGridPessoaFornecedor.pas' {frmGridPessoaFornecedor},
  unCadFornecedorProduto in '..\pas\pessoas\unCadFornecedorProduto.pas' {frmCadFornecedorProduto},
  unCadProdutoFornecedor in '..\pas\produtos\unCadProdutoFornecedor.pas' {frmCadProdutoFornecedor},
  unCadProdutoCodigoBarras in '..\pas\produtos\unCadProdutoCodigoBarras.pas' {frmCadProdutoCodigobarras},
  unGridConfigEmpresa in '..\pas\parametros\unGridConfigEmpresa.pas' {frmGridConfigEmpresa},
  unCadConfigEmpresa in '..\pas\parametros\unCadConfigEmpresa.pas' {frmCadConfigEmpresa},
  unCadPessoaRepresentante in '..\pas\pessoas\unCadPessoaRepresentante.pas' {frmCadPessoaRepresentante},
  unGridPessoaRepresentante in '..\pas\pessoas\unGridPessoaRepresentante.pas' {frmGridPessoaRepresentante},
  unCadServicos in '..\pas\produtos\unCadServicos.pas' {frmCadServicos},
  unGridServicos in '..\pas\produtos\unGridServicos.pas' {frmGridServicos},
  unCadTipoFrota in '..\pas\ativos\unCadTipoFrota.pas' {frmCadTipoFrota},
  unGridTipoFrota in '..\pas\ativos\unGridTipoFrota.pas' {frmGridTipoFrota},
  unCadFrota in '..\pas\ativos\unCadFrota.pas' {frmCadFrota},
  unGridFrota in '..\pas\ativos\unGridFrota.pas' {frmGridFrota},
  unGridPedidoCompras in '..\pas\produtos\unGridPedidoCompras.pas' {frmGridPedidoCompras},
  unNew in '..\pas\essenciais\unNew.pas' {frmNew},
  unNewPedidoCompras in '..\pas\produtos\unNewPedidoCompras.pas' {frmNewPedidoCompras},
  unCadPedidoCompras in '..\pas\produtos\unCadPedidoCompras.pas' {frmCadPedidoCompras},
  unCadPedidoCompraProdutos in '..\pas\produtos\unCadPedidoCompraProdutos.pas' {frmCadPedidoCompraProdutos},
  unNetwork in '..\lib\unNetwork.pas',
  unCEP in '..\pas\localidades\unCEP.pas' {frmCEP},
  unCadSystemBreak in '..\pas\parametros\unCadSystemBreak.pas' {frmCadSystemBreak},
  unGridSystemBreak in '..\pas\parametros\unGridSystemBreak.pas' {frmGridSystemBreak},
  unSystemBreak in '..\pas\parametros\unSystemBreak.pas' {frmSystemBreak},
  unSEFAZ in '..\pas\sefaz\unSEFAZ.pas' {Sefaz: TDataModule},
  unCadConfigHost in '..\pas\parametros\unCadConfigHost.pas' {frmCadConfigHost},
  Vcl.Themes,
  Vcl.Styles,
  unGridCEST in '..\pas\fiscal\unGridCEST.pas' {frmGridCEST},
  unGridCSOSN in '..\pas\fiscal\unGridCSOSN.pas' {frmGridCSOSN},
  unGridICMS in '..\pas\fiscal\unGridICMS.pas' {frmGridICMS},
  unGridIPI in '..\pas\fiscal\unGridIPI.pas' {frmGridIPI},
  unGridPISCONFINS in '..\pas\fiscal\unGridPISCONFINS.pas' {frmGridPISCONFINS},
  unGridCFOP in '..\pas\fiscal\unGridCFOP.pas' {frmGridCFOP},
  unGridCNAE in '..\pas\fiscal\unGridCNAE.pas' {frmGridCNAE},
  unEGrid in '..\pas\essenciais\unEGrid.pas' {frmEGrid},
  unGridBombas in '..\pas\automacao\unGridBombas.pas' {frmGridBombas},
  unCadBombas in '..\pas\automacao\unCadBombas.pas' {frmCadBombas},
  unGridAutoAbastecimentosPendentes in '..\pas\automacao\unGridAutoAbastecimentosPendentes.pas' {frmGridAutoAbastecimentosPendentes},
  unCadAutoAbastecimentosPendentes in '..\pas\automacao\unCadAutoAbastecimentosPendentes.pas' {frmCadAutoAbastecimentosPendentes},
  unExe in '..\pas\essenciais\unExe.pas' {frmExe},
  unExeAutoAbastecimentosPendentes in '..\pas\automacao\unExeAutoAbastecimentosPendentes.pas' {frmExeAutoAbastecimentosPendentes},
  unGridAutoAbastecimentosBaixados in '..\pas\automacao\unGridAutoAbastecimentosBaixados.pas' {frmGridAutoAbastecimentosBaixados},
  unNewPedidoVendas in '..\pas\produtos\unNewPedidoVendas.pas' {frmNewPedidoVendas},
  unCadPedidoVendas in '..\pas\produtos\unCadPedidoVendas.pas' {frmCadPedidoVendas},
  unGridPedidoVendas in '..\pas\produtos\unGridPedidoVendas.pas' {frmGridPedidoVendas},
  unReport in '..\pas\essenciais\unReport.pas' {Report: TDataModule},
  unCadPedidoVendaProdutos in '..\pas\produtos\unCadPedidoVendaProdutos.pas' {frmCadPedidoVendaProdutos},
  unGridEstoque in '..\pas\produtos\unGridEstoque.pas' {frmGridEstoque},
  unCadEstoqueMovimentoManual in '..\pas\produtos\unCadEstoqueMovimentoManual.pas' {frmCadEstoqueMovimentoManual},
  unRelatorios in '..\pas\relatorios\unRelatorios.pas' {frmRelatorio},
  unRelatorioPosicaoEstoque in '..\pas\relatorios\unRelatorioPosicaoEstoque.pas' {frmRelatorioPosicaoEstoque},
  unGridEstoqueMinimo in '..\pas\alertas\unGridEstoqueMinimo.pas' {frmGridEstoqueMinimo},
  unGridVendas in '..\pas\produtos\unGridVendas.pas' {frmGridVendas},
  unCadVendas in '..\pas\produtos\unCadVendas.pas' {frmCadVendas},
  unNewVendas in '..\pas\produtos\unNewVendas.pas' {frmNewVendas},
  unCaixaAdm in '..\pas\financeiro\unCaixaAdm.pas' {frmCaixaAdm},
  unCadAberturaCaixa in '..\pas\financeiro\unCadAberturaCaixa.pas' {frmCadAberturaCaixa},
  unGridContasReceber in '..\pas\financeiro\unGridContasReceber.pas' {frmGridContasReceber},
  unGridContasPagar in '..\pas\financeiro\unGridContasPagar.pas' {frmGridContasPagar},
  unCadContasPagar in '..\pas\financeiro\unCadContasPagar.pas' {frmCadContasPagar},
  unCadContasReceber in '..\pas\financeiro\unCadContasReceber.pas' {frmCadContasReceber},
  unCadVendaProdutos in '..\pas\produtos\unCadVendaProdutos.pas' {frmCadVendaProdutos},
  unFinanceiroVendas in '..\pas\financeiro\unFinanceiroVendas.pas' {frmFinanceiroVendas},
  unDMConfigEmpresa in '..\pas\parametros\unDMConfigEmpresa.pas' {dmConfigEmpresa: TDataModule},
  unDMCaixaAdm in '..\pas\financeiro\unDMCaixaAdm.pas' {dmCaixaAdm: TDataModule},
  unBaixa in '..\pas\essenciais\unBaixa.pas' {frmBaixa},
  unBaixaContasReceber in '..\pas\financeiro\unBaixaContasReceber.pas' {frmBaixaContasReceber},
  unBaixaContasPagar in '..\pas\financeiro\unBaixaContasPagar.pas' {frmBaixaContasPagar},
  unCadSuprimentos in '..\pas\financeiro\unCadSuprimentos.pas' {frmCadSuprimentos},
  unCadSangrias in '..\pas\financeiro\unCadSangrias.pas' {frmCadSangrias},
  unDMBasico in '..\pas\essenciais\unDMBasico.pas' {dmBasico: TDataModule},
  unDMPessoaClientes in '..\pas\pessoas\unDMPessoaClientes.pas' {dmPessoaClientes: TDataModule},
  unGridCaixaAdmConferencia in '..\pas\financeiro\unGridCaixaAdmConferencia.pas' {frmGridCaixaAdmConferencia},
  unCadPessoaSaldos in '..\pas\pessoas\unCadPessoaSaldos.pas' {frmCadPessoaSaldos},
  unCadPessoaContasBancarias in '..\pas\pessoas\unCadPessoaContasBancarias.pas' {frmCadPessoaContasBancarias},
  unGridDespesasFixas in '..\pas\financeiro\unGridDespesasFixas.pas' {frmGridDespesasFixas},
  unCadDespesasFixas in '..\pas\financeiro\unCadDespesasFixas.pas' {frmCadDespesasFixas},
  unView in '..\pas\essenciais\unView.pas' {frmView},
  unViewContasPagarPagamentos in '..\pas\financeiro\unViewContasPagarPagamentos.pas' {frmViewContasPagarPagamentos},
  unSystemInstall in '..\pas\parametros\unSystemInstall.pas' {frmSystemInstall},
  unGridRegrasPrecos in '..\pas\financeiro\unGridRegrasPrecos.pas' {frmGridRegrasPrecos},
  unNewRegrasPrecos in '..\pas\financeiro\unNewRegrasPrecos.pas' {frmNewRegrasPrecos},
  unCadRegrasPrecos in '..\pas\financeiro\unCadRegrasPrecos.pas' {frmCadRegrasPrecos},
  unCadRegrasPrecosProdutos in '..\pas\financeiro\unCadRegrasPrecosProdutos.pas' {frmCadRegrasPrecosProdutos},
  unEGridCTe in '..\pas\cte\unEGridCTe.pas' {frmEGridCTe},
  unConnectionDeveloper in '..\pas\conexao\unConnectionDeveloper.pas' {Developer: TDataModule},
  unProcess in '..\pas\essenciais\unProcess.pas' {frmProcess},
  unCadCTE in '..\pas\cte\unCadCTE.pas' {frmCadCTE},
  unNewCTE in '..\pas\cte\unNewCTE.pas' {frmNewCTE},
  unDMCTe in '..\pas\cte\unDMCTe.pas' {dmCTe: TDataModule},
  unExport in '..\pas\essenciais\unExport.pas' {frmExport},
  unExportCTe in '..\pas\cte\unExportCTe.pas' {frmExportCTe},
  unRelatorioCTe in '..\pas\cte\unRelatorioCTe.pas' {frmRelatorioCTe},
  unAgregate in '..\pas\essenciais\unAgregate.pas' {frmAgregate},
  unAgregateFaturamento in '..\pas\financeiro\unAgregateFaturamento.pas' {frmAgregateFaturamento};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Narseo';
  Application.CreateForm(TAplicacao, Aplicacao);
  Application.CreateForm(TParametros, Parametros);
  Application.CreateForm(TSefaz, Sefaz);
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
        Application.CreateForm(TfrmSystemSplash,frmSystemSplash);
        frmSystemSplash.Showmodal;
        frmSystemSplash.Free;
      end;

  end;
  Application.Run;

end.
