unit unAplicacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, 
  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxClasses, dxRibbonBackstageView, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinsdxRibbonPainter, dxRibbonCustomizationForm,
  dxSkinsdxBarPainter, cxContainer, cxEdit, dxSkinsForm, dxStatusBar,
  dxRibbonStatusBar, cxLabel, dxGallery, dxGalleryControl,
  dxRibbonBackstageViewGalleryControl, Data.DB, dxGDIPlusClasses, cxDBLabel,
  Vcl.ExtCtrls, cxImage, cxStyles, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, cxLocalization, unSystem,
  unParametros, unConnection, unNetwork;

type
  TAplicacao = class(TdxRibbonForm)
    BarManager: TdxBarManager;
    BarAcessoRapido: TdxBar;
    Ribbon: TdxRibbon;
    MTabInicio: TdxRibbonTab;
    dxRibbonBackstageView1: TdxRibbonBackstageView;
    SkinController: TdxSkinController;
    Localizer: TcxLocalizer;
    tmrSystem: TTimer;
    ActionManager: TActionManager;
    actSair: TAction;
    actAjuda: TAction;
    actTeste: TAction;
    actPessoaCargos: TAction;
    actPessoaCategorias: TAction;
    actPessoaGrupos: TAction;
    actPessoaDepartamentos: TAction;
    actPessoaClientes: TAction;
    actPessoaColaboradores: TAction;
    actPessoaFornecedores: TAction;
    actPessoaRepresentantes: TAction;
    actPessoaTransportadoras: TAction;
    actCRMGrupo: TAction;
    actCRMUsuario: TAction;
    actCRMPermissoesGrupo: TAction;
    actCRMPermissoesUsuario: TAction;
    actProdutoDepositos: TAction;
    actProdutoTanques: TAction;
    actProdutoCategorias: TAction;
    actProdutoGrupos: TAction;
    actProdutoMarcas: TAction;
    actProdutoModelos: TAction;
    actProdutoProdutos: TAction;
    actProdutoServicos: TAction;
    actConfigEmpresa: TAction;
    actFrota: TAction;
    actImoveis: TAction;
    actTipoFrota: TAction;
    actTipoImoveis: TAction;
    actPedidoCompras: TAction;
    actCEP: TAction;
    actManutencaoProgramada: TAction;
    actConfigHost: TAction;
    actFiscalCEST: TAction;
    actFiscalCFOP: TAction;
    actFiscalCSOSN: TAction;
    actFiscalICMS: TAction;
    actFiscalIPI: TAction;
    actFiscalPISCOFINS: TAction;
    actFiscalISSQN: TAction;
    actFiscalCNAE: TAction;
    actAutoBombas: TAction;
    actAbastecimentosPendentes: TAction;
    actAbastecimentosBaixados: TAction;
    StyleRepository: TcxStyleRepository;
    StyleSelecionado: TcxStyle;
    StylePrioridadeBaixa: TcxStyle;
    StylePrioridadeMedia: TcxStyle;
    StylePrioridadeAlta: TcxStyle;
    StylePrioridadeEmergencial: TcxStyle;
    StyleNeutro: TcxStyle;
    StyleConcluido: TcxStyle;
    StyleCancelado: TcxStyle;
    StyleTitulo: TcxStyle;
    pnlRazao: TPanel;
    lblRazao: TcxDBLabel;
    lblCNPJ: TcxDBLabel;
    imgSublogo: TcxImage;
    StatusBar: TdxRibbonStatusBar;
    BarSistema: TdxBar;
    MnAjuda: TdxBarLargeButton;
    MnSair: TdxBarLargeButton;
    MTabCadastros: TdxRibbonTab;
    MTabFiscal: TdxRibbonTab;
    MTabMovimentacao: TdxRibbonTab;
    MTabConfiguracoes: TdxRibbonTab;
    BarConfiguracoesSistema: TdxBar;
    MiConfiguracoes: TdxBarSubItem;
    MiSeguranca: TdxBarSubItem;
    MnEstacaoTrabalho: TdxBarLargeButton;
    MnManutencaoProgramada: TdxBarLargeButton;
    MnEmpresa: TdxBarLargeButton;
    BarSeparatorAplicacao: TdxBarSeparator;
    BarSeparatorParametrosSistema: TdxBarSeparator;
    BarSeparatorCadGerencial: TdxBarSeparator;
    MiAcessos: TdxBarSubItem;
    BarSeparatorDesktop: TdxBarSeparator;
    MnPermissaoGrupoUsuarios: TdxBarLargeButton;
    MnPermissaoUsuarios: TdxBarLargeButton;
    imgLogo: TcxImage;
    BarCadastrosBasicos: TdxBar;
    BarCadastrosSeguranca: TdxBar;
    MiCadSeguranca: TdxBarSubItem;
    MiCadPessoas: TdxBarSubItem;
    MiCadProdutos: TdxBarSubItem;
    MiCadBens: TdxBarSubItem;
    MnCadCEP: TdxBarLargeButton;
    BarSeparatorCadOrganizacao: TdxBarSeparator;
    BarSeparatorCadRegistros: TdxBarSeparator;
    BarSeparatorCadAcessos: TdxBarSeparator;
    MnPessoasDepartamentos: TdxBarLargeButton;
    MnPessoasCargos: TdxBarLargeButton;
    MnPessoasCategorias: TdxBarLargeButton;
    MnPessoasGrupos: TdxBarLargeButton;
    MnPessoasClientes: TdxBarLargeButton;
    MnPessoasColaboradores: TdxBarLargeButton;
    MnPessoasFornecedores: TdxBarLargeButton;
    MnPessoasRepresentantes: TdxBarLargeButton;
    MnPessoasTransportadoras: TdxBarLargeButton;
    MiCRM: TdxBarSubItem;
    MnCadGrupoUsuarios: TdxBarLargeButton;
    MnCadUsuarios: TdxBarLargeButton;
    MnProdutosDeposito: TdxBarLargeButton;
    MnProdutosTanques: TdxBarLargeButton;
    MnProdutosProdutos: TdxBarLargeButton;
    MnProdutosServicos: TdxBarLargeButton;
    MnProdutosCategoria: TdxBarLargeButton;
    MnProdutosGrupos: TdxBarLargeButton;
    MnProdutosMarcas: TdxBarLargeButton;
    MnProdutosModelos: TdxBarLargeButton;
    MnFrotasFrotas: TdxBarLargeButton;
    MnFrotasImoveis: TdxBarLargeButton;
    MnFrotasTipoFrota: TdxBarLargeButton;
    MnFrotasTipoImoveis: TdxBarLargeButton;
    BarMovimentacaoProdutos: TdxBar;
    MiMovimentacaoProdutosEntradas: TdxBarSubItem;
    MiMovimentacaoProdutosSaidas: TdxBarSubItem;
    BarSeparatorAnalitico: TdxBarSeparator;
    MnMovimentacaoPedidoCompras: TdxBarLargeButton;
    MnMovimentacaoPedidoVendas: TdxBarLargeButton;
    actPedidoVendas: TAction;
    MTabRelatorios: TdxRibbonTab;
    MiFuncoes: TdxBarSubItem;
    BarSeparatorCadastros: TdxBarSeparator;
    MiFuncoesPessoas: TdxBarSubItem;
    MiFuncoesProdutos: TdxBarSubItem;
    MiFuncoesImoveis: TdxBarSubItem;
    MnMovimentacaoEstoque: TdxBarLargeButton;
    actEstoque: TAction;
    MiMovimentacaoProdutoRelatorios: TdxBarSubItem;
    MnMovimentacaoProdutoPosicao: TdxBarLargeButton;
    actRELPosicaoEstoque: TAction;
    MTabFinanceiro: TdxRibbonTab;
    BarFinanceiro: TdxBar;
    MnCaixaAdministrativo: TdxBarLargeButton;
    MiFaturamento: TdxBarSubItem;
    BarAlertas: TdxBar;
    MnProdutosAlerta: TdxBarLargeButton;
    actAlertaProdutoEstoqueMinimo: TAction;
    MnCreditosVencidos: TdxBarLargeButton;
    MnDebitosVencidos: TdxBarLargeButton;
    MnVendas: TdxBarLargeButton;
    MnCompras: TdxBarLargeButton;
    actVendas: TAction;
    actCaixaAdm: TAction;
    MnContasPagar: TdxBarLargeButton;
    MnContasReceber: TdxBarLargeButton;
    actFinanceiroContasPagar: TAction;
    actFinanceiroContasReceber: TAction;
    MiCaixa: TdxBarSubItem;
    MnFinanceiroSaldos: TdxBarLargeButton;
    MnFinanceiroConferencia: TdxBarLargeButton;
    actFinanceiroCaixaAdmConferencia: TAction;
    dsEmpresas: TDataSource;
    BarSeparatorReceitas: TdxBarSeparator;
    BarSeparatorDespesas: TdxBarSeparator;
    MnFinanceiroDividaFixa: TdxBarLargeButton;
    MiAjustes: TdxBarSubItem;
    MnRegrasPrecos: TdxBarLargeButton;
    actRegrasPreco: TAction;
    MTabSefaz: TdxRibbonTab;
    BarDocumentos: TdxBar;
    MnCTe: TdxBarLargeButton;
    actCTe: TAction;
    Mi1: TdxBarSubItem;
    MnOtimzarDB: TdxBarLargeButton;
    actSistemaOtimizarBanco: TAction;
    MiExportacao: TdxBarSubItem;
    MnExportarCTe: TdxBarLargeButton;
    MiRelCadastros: TdxBarSubItem;
    MnRelProdutos: TdxBarLargeButton;
    MnRelServicos: TdxBarLargeButton;
    MnRelFrota: TdxBarLargeButton;
    MiRelPessoas: TdxBarSubItem;
    MnRelPesClientes: TdxBarLargeButton;
    MnRelPesColaboradores: TdxBarLargeButton;
    MnRelPesFornecedores: TdxBarLargeButton;
    MnRelPesRepresentantes: TdxBarLargeButton;
    MnRelPesTransportadoras: TdxBarLargeButton;
    BarRelatorios: TdxBar;
    MiDOCe: TdxBarSubItem;
    MnRelDOCCTe: TdxBarLargeButton;
    actExportarCTe: TAction;
    MnMDFe: TdxBarLargeButton;
    MnGNRe: TdxBarLargeButton;
    actRELCTe: TAction;
    Mi2: TdxBarSubItem;
    Mn1: TdxBarLargeButton;
    Mn2: TdxBarLargeButton;
    Mi3: TdxBarSubItem;
    Mn3: TdxBarLargeButton;
    Mn4: TdxBarLargeButton;
    Mn5: TdxBarLargeButton;
    actParamentrosCTe: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure actAjudaExecute(Sender: TObject);
    procedure actAbastecimentosBaixadosExecute(Sender: TObject);
    procedure actPessoaCargosExecute(Sender: TObject);
    procedure actPessoaCategoriasExecute(Sender: TObject);
    procedure actPessoaGruposExecute(Sender: TObject);
    procedure actPessoaDepartamentosExecute(Sender: TObject);
    procedure actPessoaClientesExecute(Sender: TObject);
    procedure actPessoaColaboradoresExecute(Sender: TObject);
    procedure actPessoaFornecedoresExecute(Sender: TObject);
    procedure actPessoaRepresentantesExecute(Sender: TObject);
    procedure actPessoaTransportadorasExecute(Sender: TObject);
    procedure actCRMGrupoExecute(Sender: TObject);
    procedure actCRMPermissoesGrupoExecute(Sender: TObject);
    procedure actProdutoDepositosExecute(Sender: TObject);
    procedure actProdutoTanquesExecute(Sender: TObject);
    procedure actProdutoCategoriasExecute(Sender: TObject);
    procedure actProdutoGruposExecute(Sender: TObject);
    procedure actProdutoMarcasExecute(Sender: TObject);
    procedure actProdutoModelosExecute(Sender: TObject);
    procedure actProdutoProdutosExecute(Sender: TObject);
    procedure actProdutoServicosExecute(Sender: TObject);
    procedure actConfigEmpresaExecute(Sender: TObject);
    procedure actFrotaExecute(Sender: TObject);
    procedure actTipoFrotaExecute(Sender: TObject);
    procedure actPedidoComprasExecute(Sender: TObject);
    procedure actManutencaoProgramadaExecute(Sender: TObject);
    procedure actConfigHostExecute(Sender: TObject);
    procedure actFiscalCESTExecute(Sender: TObject);
    procedure actFiscalCFOPExecute(Sender: TObject);
    procedure actFiscalCSOSNExecute(Sender: TObject);
    procedure actFiscalICMSExecute(Sender: TObject);
    procedure actFiscalIPIExecute(Sender: TObject);
    procedure actFiscalPISCOFINSExecute(Sender: TObject);
    procedure actFiscalCNAEExecute(Sender: TObject);
    procedure actAutoBombasExecute(Sender: TObject);
    procedure actAbastecimentosPendentesExecute(Sender: TObject);
    procedure actCEPExecute(Sender: TObject);
    procedure actPedidoVendasExecute(Sender: TObject);
    procedure actEstoqueExecute(Sender: TObject);
    procedure actRELPosicaoEstoqueExecute(Sender: TObject);
    procedure actAlertaProdutoEstoqueMinimoExecute(Sender: TObject);
    procedure actVendasExecute(Sender: TObject);
    procedure actCaixaAdmExecute(Sender: TObject);
    procedure actFinanceiroContasPagarExecute(Sender: TObject);
    procedure actFinanceiroContasReceberExecute(Sender: TObject);
    procedure actFinanceiroCaixaAdmConferenciaExecute(Sender: TObject);
    procedure MnFinanceiroDividaFixaClick(Sender: TObject);
    procedure actRegrasPrecoExecute(Sender: TObject);
    procedure actCTeExecute(Sender: TObject);
    procedure actSistemaOtimizarBancoExecute(Sender: TObject);
    procedure actExportarCTeExecute(Sender: TObject);
    procedure actRELCTeExecute(Sender: TObject);
    procedure actParamentrosCTeExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SystemOut: Boolean;
    Settings :TFormMode;
    procedure CheckSystem;
    procedure EstoqueDiario;
    procedure ProdutosAlerta;
    procedure FinanceiroAlerta;
    procedure AutoEngine;
  end;

var
  Aplicacao: TAplicacao;

implementation

{$R *.dfm}

uses unSystemBreak, unSystemHelp, unGridBombas, unGridConfigEmpresa,
  unCadConfigHost, unGridGrupoUsuarios, unGridPermissoesGrupo, unGridCEST,
  unGridCFOP, unGridCNAE, unGridCSOSN, unGridICMS, unGridIPI, unGridPISCONFINS,
  unGridFrota, unGridSystemBreak, unGridPedidoCompras, unGridCargoPessoas,
  unGridCategoriaPessoas, unGridPessoaCliente, unGridPessoaFuncionario,
  unGridDepartamentoPessoas, unGridPessoaFornecedor, unGridGrupoPessoas,
  unGridPessoaRepresentante, unGridPessoaTransportadora,
  unGridCategoriaProdutos, unGridDepositos, unGridGrupoProdutos,
  unGridMarcaProdutos, unGridModeloProdutos, unGridProdutos, unGridServicos,
  unGridTanques, unGridTipoFrota, unGridAutoAbastecimentosBaixados,
  unGridAutoAbastecimentosPendentes, unCEP, unGridPedidoVendas, unGridEstoque,
  unRelatorioPosicaoEstoque, unGridEstoqueMinimo, unGridVendas, unCaixaAdm,
  unGridContasPagar, unGridContasReceber, unCadAberturaCaixa, unDMCaixaAdm,
  unGridCaixaAdmConferencia, unGridDespesasFixas, unSystemInstall,
  unGridRegrasPrecos, unEGridCTe, unProcess, unExportCTe, unRelatorioCTe, unCadCTeParametros;


procedure TAplicacao.actAbastecimentosBaixadosExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridAutoAbastecimentosBaixados, Self.Tag,'FAIL',frmGridAutoAbastecimentosBaixados);
end;

procedure TAplicacao.actAbastecimentosPendentesExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridAutoAbastecimentosPendentes, Self.Tag,'FAIL',frmGridAutoAbastecimentosPendentes);
end;

procedure TAplicacao.actAjudaExecute(Sender: TObject);
begin
  CriaFormulario(TfrmSystemHelp, Self.Tag,'FAIL',frmSystemHelp);
end;

procedure TAplicacao.actAlertaProdutoEstoqueMinimoExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridEstoqueMinimo,0,'LISTA',frmGridEstoqueMinimo);
end;

procedure TAplicacao.actAutoBombasExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridBombas,0,'LISTA',frmGridBombas);
end;

procedure TAplicacao.actCaixaAdmExecute(Sender: TObject);
var
  Caixa: Integer;
begin
  if (dmCaixaAdm.CaixaCheck = False) then
    begin
      try
        begin
          try
            Application.CreateForm(TfrmCadAberturaCaixa, frmCadAberturaCaixa);
            frmCadAberturaCaixa.Settings.Modo := 'NEW';
            frmCadAberturaCaixa.Settings.ID := Connection.qEmpresas.FieldByName('codigo').AsInteger;
            frmCadAberturaCaixa.ShowModal;
          finally
            frmCadAberturaCaixa.Release;
          end;
        end;
      except
        Aviso('ERRO','Erro critico de execução.','Houve um erro ao abrir o formulario.'+#13+'Contate o suporte.');
      end;
    end
  else
    begin
      Caixa := dmCaixaAdm.GetCaixa;
      CriaFormulario(TfrmCaixaAdm,Caixa,'LISTA',frmCaixaAdm);
    end;
end;

procedure TAplicacao.actCEPExecute(Sender: TObject);
begin
  AbreFormulario(TfrmCEP,frmCEP);
end;

procedure TAplicacao.actConfigEmpresaExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridConfigEmpresa,0,'LISTA',frmGridConfigEmpresa);
end;

procedure TAplicacao.actConfigHostExecute(Sender: TObject);
begin
  try
    begin
      try
        Application.CreateForm(TfrmCadConfigHost, frmCadConfigHost);
        frmCadConfigHost.Settings.Modo := 'ALTERACAO';
        frmCadConfigHost.Settings.ID := Connection.qEmpresas.FieldByName('codigo').AsInteger;
        frmCadConfigHost.ShowModal;
      finally
        frmCadConfigHost.Release;
      end;
    end;
  except
    Aviso('ERRO','Erro critico de execução.','Houve um erro ao abrir o formulario.'+#13+'Contate o suporte.');
  end;
end;

procedure TAplicacao.actCRMGrupoExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridGrupoUsuarios,0,'LISTA',frmGridGrupoUsuarios);
end;

procedure TAplicacao.actCRMPermissoesGrupoExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridPermissoesGrupo,0,'LISTA',frmGridPermissoesGrupo);
end;

procedure TAplicacao.actCTeExecute(Sender: TObject);
begin
  CriaFormulario(TfrmEGridCTe,0,'LISTA',frmEGridCTe);
end;

procedure TAplicacao.actEstoqueExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridEstoque,0,'LISTA',frmGridEstoque);
end;

procedure TAplicacao.actExportarCTeExecute(Sender: TObject);
begin
  CriaFormulario(TfrmExportCTe,0,'LISTA',frmExportCTe);
end;

procedure TAplicacao.actFinanceiroCaixaAdmConferenciaExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridCaixaAdmConferencia,0,'LISTA',frmGridCaixaAdmConferencia);
end;

procedure TAplicacao.actFinanceiroContasPagarExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridContasPagar,0,'LISTA',frmGridContasPagar);
end;

procedure TAplicacao.actFinanceiroContasReceberExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridContasReceber,0,'LISTA',frmGridContasReceber);
end;

procedure TAplicacao.actFiscalCESTExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridCEST,0,'LISTA',frmGridCEST);
end;

procedure TAplicacao.actFiscalCFOPExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridCFOP,0,'LISTA',frmGridCFOP);
end;

procedure TAplicacao.actFiscalCNAEExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridCNAE,0,'LISTA',frmGridCNAE);
end;

procedure TAplicacao.actFiscalCSOSNExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridCSOSN,0,'LISTA',frmGridCSOSN);
end;

procedure TAplicacao.actFiscalICMSExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridICMS,0,'LISTA',frmGridICMS);
end;

procedure TAplicacao.actFiscalIPIExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridIPI,0,'LISTA',frmGridIPI);
end;

procedure TAplicacao.actFiscalPISCOFINSExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridPISCONFINS,0,'LISTA',frmGridPISCONFINS);
end;

procedure TAplicacao.actFrotaExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridFrota,0,'LISTA',frmGridFrota);
end;

procedure TAplicacao.actManutencaoProgramadaExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridSystemBreak,0,'LISTA',frmGridSystemBreak);
end;

procedure TAplicacao.actParamentrosCTeExecute(Sender: TObject);
begin
  try
    begin
      try
        Application.CreateForm(TfrmCadCTeParametros, frmCadCTeParametros);
        frmCadCTeParametros.Settings.Modo := 'ALTERACAO';
        frmCadCTeParametros.Settings.ID := Connection.qEmpresas.FieldByName('codigo').AsInteger;
        frmCadCTeParametros.ShowModal;
      finally
        frmCadCTeParametros.Release;
      end;
    end;
  except
    Aviso('ERRO','Erro critico de execução.','Houve um erro ao abrir o formulario.'+#13+'Contate o suporte.');
  end;
end;

procedure TAplicacao.actPedidoComprasExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridPedidoCompras,0,'LISTA',frmGridPedidoCompras);
end;

procedure TAplicacao.actPedidoVendasExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridPedidoVendas,0,'LISTA',frmGridPedidoVendas);
end;

procedure TAplicacao.actPessoaCargosExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridCargoPessoas,0,'LISTA',frmGridCargoPessoas);
end;

procedure TAplicacao.actPessoaCategoriasExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridCategoriaPessoas,0,'LISTA',frmGridCategoriaPessoas);
end;

procedure TAplicacao.actPessoaClientesExecute(Sender: TObject);
begin
  CriaFormulario(TFrmGridPessoaCliente,0,'LISTA',FrmGridPessoaCliente);
end;

procedure TAplicacao.actPessoaColaboradoresExecute(Sender: TObject);
begin
  CriaFormulario(TFrmGridPessoaFuncionario,0,'LISTA',FrmGridPessoaFuncionario);
end;

procedure TAplicacao.actPessoaDepartamentosExecute(Sender: TObject);
begin
  CriaFormulario(TFrmGridDepartamentoPessoas,0,'LISTA',FrmGridDepartamentoPessoas);
end;

procedure TAplicacao.actPessoaFornecedoresExecute(Sender: TObject);
begin
  CriaFormulario(TFrmGridPessoaFornecedor,0,'LISTA',FrmGridPessoaFornecedor);
end;

procedure TAplicacao.actPessoaGruposExecute(Sender: TObject);
begin
  AbreFormulario(TfrmGridGrupoPessoas,frmGridGrupoPessoas);
end;

procedure TAplicacao.actPessoaRepresentantesExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridPessoaRepresentante,0,'LISTA',frmGridPessoaRepresentante);
end;

procedure TAplicacao.actPessoaTransportadorasExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridPessoaTransportadora,0,'LISTA',frmGridPessoaTransportadora);
end;

procedure TAplicacao.actProdutoCategoriasExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridCategoriaProdutos,0,'LISTA',frmGridCategoriaProdutos);
end;

procedure TAplicacao.actProdutoDepositosExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridDepositos,0,'LISTA',frmGridDepositos);
end;

procedure TAplicacao.actProdutoGruposExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridGrupoProdutos,0,'LISTA',frmGridGrupoProdutos);
end;

procedure TAplicacao.actProdutoMarcasExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridMarcaProdutos,0,'LISTA',frmGridMarcaProdutos);
end;

procedure TAplicacao.actProdutoModelosExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridModeloProdutos,0,'LISTA',frmGridModeloProdutos);
end;

procedure TAplicacao.actProdutoProdutosExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridProdutos,0,'LISTA',frmGridProdutos);
end;

procedure TAplicacao.actProdutoServicosExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridServicos,0,'LISTA',frmGridServicos);
end;

procedure TAplicacao.actProdutoTanquesExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridTanques,0,'LISTA',frmGridTanques);
end;

procedure TAplicacao.actRegrasPrecoExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridRegrasPrecos,0,'',frmGridRegrasPrecos);
end;

procedure TAplicacao.actRELCTeExecute(Sender: TObject);
begin
  CriaFormulario(TfrmRelatorioCTe,0,'',frmRelatorioCTe);
end;

procedure TAplicacao.actRELPosicaoEstoqueExecute(Sender: TObject);
begin
  CriaFormulario(TfrmRelatorioPosicaoEstoque,0,'',frmRelatorioPosicaoEstoque);
end;

procedure TAplicacao.actSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TAplicacao.actSistemaOtimizarBancoExecute(Sender: TObject);
begin
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
end;

procedure TAplicacao.actTipoFrotaExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridTipoFrota,0,'',frmGridTipoFrota);
end;

procedure TAplicacao.actVendasExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridVendas,0,'',frmGridVendas);
end;

procedure TAplicacao.AutoEngine;
begin
  Connection.qSQL.Close;
  Connection.qSQL.SQL.Clear;
  Connection.qSQL.SQL.Text := 'SELECT system_autoengine();';
  Connection.qSQL.Open;
  if Connection.qSQL.FieldByName('system_autoengine').AsBoolean = False then
    Aviso('INFO','Informação','Houve um erro ao executar a instrução AUTOENGINE. '+#13+'Favor entrar em contato com o suporte.');
  Connection.qSQL.Close;
  Connection.qSQL.SQL.Clear;
end;

procedure TAplicacao.CheckSystem;
begin
  // Rotinas essenciais. O Executavel apenas realiza a checagem,
  // pois a mesma e executada internamente no banco.
  AutoEngine;
  // Verifica rotinas basicas do sistema.
  EstoqueDiario;  // >> Verifica gravação do estoque diario.
  ProdutosAlerta; // >> Verifica se existem produtos com quantidade minima atingida.
  FinanceiroAlerta;//>> Verifica se existem contas as receber o pagar pendendes ou com vencimentos proximo!
end;

procedure TAplicacao.EstoqueDiario;
begin
  // Verifica se o estoque do dia foi gravado.
  Connection.qCheckSystem.Close;
  Connection.qCheckSystem.SQL.Clear;
  Connection.qCheckSystem.SQL.Text := 'SELECT count(codigo) FROM estoque_diario ed WHERE ed.data_estoque = CURRENT_DATE;';
  Connection.qCheckSystem.Open;
  if Connection.qCheckSystem.FieldByName('count').AsInteger = 0 then
    begin
      Connection.qCheckSystem.Close;
      Connection.qCheckSystem.SQL.Clear;
      Connection.qCheckSystem.SQL.Text := 'SELECT grava_estoque_diario();';
      Connection.qCheckSystem.Open;
      case Connection.qCheckSystem.FieldByName('grava_estoque_diario').AsInteger of
        0:begin
          Aviso('WARN','Informação','Não foi possivel registrar o volume de estoque diario.'+#13+'Entre em contato com o suporte.');
        end;
        1:begin
          Exit;
        end;
        2:begin
          Aviso('WARN','Informação','Existe um conflito entre a data do terminal com o horario do servidor.'+#13+'Entre em contato com o suporte.');
        end;
      end;
    end;
end;

procedure TAplicacao.FinanceiroAlerta;
begin
  // A implementar
end;

procedure TAplicacao.FormCreate(Sender: TObject);
begin
  DisableAero := True;
  // Traduz componentes
  // Deve-se utilizar o 'ExtractFilePath' pois o 'Parametros.SystemConfig.ASSystemPath' ainda não foi criado, verificar correção posteriormente [08/12/2016].
  if FileExists(ExtractFilePath(Application.ExeName)+'\config\trdCompDev.trl') then
    begin
      Localizer.LoadFromFile(ExtractFilePath(Application.ExeName)+'\config\trdCompDev.trl');
      Localizer.LanguageIndex := 1;
      Localizer.Active := true;
      Application.CreateForm(TdmCaixaAdm, dmCaixaAdm);
    end
  else
    begin
      Aviso('WARN','Arquivo pendente.','Não foi possivel encontrar um dos arquivos do sistema.'#13'ID: [FPTRL]'#13'Entre em contato com o suporte.');
    end;
  //PageControl.HideTabs := True;
end;

procedure TAplicacao.FormShow(Sender: TObject);
var
  IDBreak: Integer;
begin
  if Parametros.SystemConfig.ASSystemAuth = False then
    Application.Terminate
  else
    begin
      imgLogo.Align := alClient;
      imgLogo.Picture.LoadFromFile(Parametros.SystemConfig.ASSystemPath + '\sources\content\images\clientsplah.png');
      SystemOut := False;
      // Define as configurações na barra de status;
      StatusBar.Panels.Items[1].Text:= Parametros.SystemConfig.ASDBServer + ':' + Parametros.SystemConfig.ASDBPort;
      StatusBar.Panels.Items[3].Text:= AnsiUpperCase(Parametros.SystemConfig.ASDBDataBase);
      StatusBar.Panels.Items[5].Text:= ResolveHost;
      StatusBar.Panels.Items[7].Text:= AnsiUpperCase(Connection.qLogin.FieldByName('login').AsString);
      StatusBar.Panels.Items[11].Text:= 'BUILD: ' + Versao;
      if Connection.qHostConfigsefaz_ambiente.AsInteger = 1 then
        StatusBar.Panels.Items[9].Text:= 'PRODUCAO'
      else
        StatusBar.Panels.Items[9].Text:= 'HOMOLOGACAO';
      // Informa na configuração do form principal qual o ID do usuario logado.
      Settings.Modo := 'MAIN';
      Settings.ID := Connection.qLogin.FieldByName('codigo').AsInteger;
      // Verifica se existe interrupção registrada.
      IDBreak := Connection.SystemBreak;
      if IDBreak <> 0 then
        begin
          CriaFormulario(TfrmSystemBreak,IDBreak,'',frmSystemBreak);
        end;
    end;
  // Verificações do sistema.
  CheckSystem;
end;

procedure TAplicacao.MnFinanceiroDividaFixaClick(Sender: TObject);
begin
  CriaFormulario(TfrmGridDespesasFixas,0,'',frmGridDespesasFixas);
end;

procedure TAplicacao.ProdutosAlerta;
begin
  // Verifica se há produtos com estoque minimo.
  Connection.qCheckSystem.Close;
  Connection.qCheckSystem.SQL.Clear;
  Connection.qCheckSystem.SQL.Text := 'SELECT count(*) FROM produto_alerta;';
  Connection.qCheckSystem.Open;
  if Connection.qCheckSystem.FieldByName('count').AsInteger > 0 then
    begin
      MnProdutosAlerta.Enabled := True;
    end
  else
    begin
      MnProdutosAlerta.Enabled := False;
    end;
end;

end.
