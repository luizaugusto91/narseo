unit unAplicacaoold;

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
  dxSkinXmas2008Blue, dxSkinsdxBarPainter, Vcl.RibbonLunaStyleActnCtrls,
  Vcl.Ribbon, dxSkinsForm, Vcl.ImgList, Vcl.PlatformDefaultStyleActnCtrls,
  System.Actions, Vcl.ActnList, Vcl.ActnMan, Vcl.RibbonObsidianStyleActnCtrls,
  Vcl.ToolWin, Vcl.ActnCtrls, dxStatusBar, dxRibbonStatusBar,
  dxSkinsdxRibbonPainter, dxRibbonCustomizationForm, dxSkinscxPCPainter,
  dxBarBuiltInMenu, cxContainer, cxEdit, Data.DB, cxLocalization, cxStyles,
  cxLabel, cxDBLabel, Vcl.ExtCtrls, dxGDIPlusClasses, cxImage, cxPC,
  unSystem, unNetwork;

type
  TAplicacao = class(TdxRibbonForm)
    Ribbon: TdxRibbon;
    RbTabCadastros: TdxRibbonTab;
    PageControl: TcxPageControl;
    StatusBar: TdxRibbonStatusBar;
    imgLogo: TcxImage;
    pnlRazao: TPanel;
    lblRazao: TcxDBLabel;
    lblCNPJ: TcxDBLabel;
    imgSublogo: TcxImage;
    SkinController: TdxSkinController;
    BarManager: TdxBarManager;
    BarSistema: TdxBar;
    BarCadastros: TdxBar;
    BarSeparator2: TdxBarSeparator;
    BtnSubItemSuporte: TdxBarSubItem;
    BarSeparator3: TdxBarSeparator;
    BarSeparator4: TdxBarSeparator;
    LButtonNaturezaOperacao: TdxBarLargeButton;
    BarSeparator5: TdxBarSeparator;
    BtnSubItemExportacao: TdxBarSubItem;
    BtnSubItemOperacoes: TdxBarSubItem;
    BarSeparatorNotas: TdxBarSeparator;
    LButtonHelp: TdxBarLargeButton;
    BtnSubItemFinanceiro: TdxBarSubItem;
    BarSeparator7: TdxBarSeparator;
    LButtonMotivoMovimentacao: TdxBarLargeButton;
    BarSeparator8: TdxBarSeparator;
    LButtonPlanoContas: TdxBarLargeButton;
    LButtonCentroCustos: TdxBarLargeButton;
    BtnSubItemProdutosServicos: TdxBarSubItem;
    BarSeparator9: TdxBarSeparator;
    LButtonDeposito: TdxBarLargeButton;
    LButtonTanque: TdxBarLargeButton;
    BarSeparator10: TdxBarSeparator;
    BarSeparatorRegistros: TdxBarSeparator;
    LButtonProdGrupos: TdxBarLargeButton;
    LButtonProdCategorias: TdxBarLargeButton;
    BarSeparator11: TdxBarSeparator;
    LButtonChamados: TdxBarLargeButton;
    LButtonNewAgendamento: TdxBarLargeButton;
    LButtonConsultarAgendamentos: TdxBarLargeButton;
    LButtonProdMarcas: TdxBarLargeButton;
    LButtonProdModelo: TdxBarLargeButton;
    BtnSubItemPessoas: TdxBarSubItem;
    BarSeparator12: TdxBarSeparator;
    BarSeparator13: TdxBarSeparator;
    BarSeparator14: TdxBarSeparator;
    LButtonPessoaDep: TdxBarLargeButton;
    LButtonPessoaCargos: TdxBarLargeButton;
    LButtonPessoaGrupo: TdxBarLargeButton;
    LButtonPessoaCat: TdxBarLargeButton;
    LButtonPessoaClientes: TdxBarLargeButton;
    LButtonPessoaFornec: TdxBarLargeButton;
    LButtonPessoaColab: TdxBarLargeButton;
    LButtonPessoaTransp: TdxBarLargeButton;
    LButtonPessoaRepres: TdxBarLargeButton;
    LButtonProdProdutos: TdxBarLargeButton;
    LButtonProdServicos: TdxBarLargeButton;
    LButtonLocalidades: TdxBarLargeButton;
    BtnSubItemLocalidades: TdxBarSubItem;
    BarSeparator15: TdxBarSeparator;
    LButtonEstados: TdxBarLargeButton;
    LButtonMunicipios: TdxBarLargeButton;
    LButtonSetores: TdxBarLargeButton;
    LButtonBairros: TdxBarLargeButton;
    BarSeparator16: TdxBarSeparator;
    LButtonRotas: TdxBarLargeButton;
    LButtonPesquisa: TdxBarLargeButton;
    BtnSubItemImoveisFrota: TdxBarSubItem;
    BarSeparator17: TdxBarSeparator;
    LButtonTipoFrota: TdxBarLargeButton;
    LButtonTipoImoveis: TdxBarLargeButton;
    BarSeparatorOrganizacao: TdxBarSeparator;
    LButtonImoveis: TdxBarLargeButton;
    LButtonFrota: TdxBarLargeButton;
    BarSeparatorRegras: TdxBarSeparator;
    LButtonRegrasFrota: TdxBarLargeButton;
    LButtonRegrasImovies: TdxBarLargeButton;
    BtnSubItemAutomacao: TdxBarSubItem;
    LButtonControladores: TdxBarLargeButton;
    BarSeparator18: TdxBarSeparator;
    LButtonRastreadores: TdxBarLargeButton;
    LButtonPneumaticos: TdxBarLargeButton;
    LButtonBombas: TdxBarLargeButton;
    BarSeparatorIdentificacao: TdxBarSeparator;
    LButtonCartoesIZID: TdxBarLargeButton;
    LButtonCrachas: TdxBarLargeButton;
    LButtonToken: TdxBarLargeButton;
    LButtonPontoEletronico: TdxBarLargeButton;
    LButtonMigracao: TdxBarLargeButton;
    BarSeparator19: TdxBarSeparator;
    LButtonBancos: TdxBarLargeButton;
    LButtonTag: TdxBarLargeButton;
    BarSeparator20: TdxBarSeparator;
    BarSeparator21: TdxBarSeparator;
    BarSeparator22: TdxBarSeparator;
    BtnSubItemConfiguracoes: TdxBarSubItem;
    BarSeparator23: TdxBarSeparator;
    LButtonEstacao: TdxBarLargeButton;
    LButtonEmpresa: TdxBarLargeButton;
    BarSeparator24: TdxBarSeparator;
    barbtnSeguranca: TdxBarSubItem;
    LButtonPermissoes: TdxBarLargeButton;
    barbtnSegCRM: TdxBarSubItem;
    BarSeparator25: TdxBarSeparator;
    BarSeparator26: TdxBarSeparator;
    LButtonSegPermiGrupos: TdxBarLargeButton;
    LButtonSegPermiUsuarios: TdxBarLargeButton;
    barbtnSegWEB: TdxBarSubItem;
    LButtonSegWebGrupos: TdxBarLargeButton;
    LButtonSegWebUsuarios: TdxBarLargeButton;
    BarSeparator27: TdxBarSeparator;
    BtnSubItemParametros: TdxBarSubItem;
    BarSeparator28: TdxBarSeparator;
    BtnSubItemAcessos: TdxBarSubItem;
    LButtonGrupoUsuarios: TdxBarLargeButton;
    LButtonUsuarios: TdxBarLargeButton;
    LButtonWeb: TdxBarLargeButton;
    BarSeparatorDesktop: TdxBarSeparator;
    BarSeparator29: TdxBarSeparator;
    BarSeparator30: TdxBarSeparator;
    BarSeparator31: TdxBarSeparator;
    BarSeparator32: TdxBarSeparator;
    BarSeparator33: TdxBarSeparator;
    BtnSubItemMonitoramento: TdxBarSubItem;
    BarSeparator34: TdxBarSeparator;
    LButtonPosicao: TdxBarLargeButton;
    LButtonGeral: TdxBarLargeButton;
    BtnSubItemFaturamento: TdxBarSubItem;
    BarSeparator35: TdxBarSeparator;
    LButtonConsultar: TdxBarLargeButton;
    LButtonFatContasReceber: TdxBarLargeButton;
    BarSeparator36: TdxBarSeparator;
    BarSeparator37: TdxBarSeparator;
    LButtonFatContasPagar: TdxBarLargeButton;
    LButtonCaixa: TdxBarLargeButton;
    LButtonContratos: TdxBarLargeButton;
    LButtonNewChamado: TdxBarLargeButton;
    LButtonConsultarChamados: TdxBarLargeButton;
    LButtonImprimir: TdxBarLargeButton;
    BarSeparator1: TdxBarSeparator;
    LButtonSair: TdxBarLargeButton;
    ImageList32: TcxImageList;
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
    ImageList16: TcxImageList;
    Localizer: TcxLocalizer;
    dsEmpresas: TDataSource;
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
    BarParametros: TdxBar;
    RTabConfiguracoes: TdxRibbonTab;
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
    BarDefinicoes: TdxBar;
    actConfigEmpresa: TAction;
    actFrota: TAction;
    actImoveis: TAction;
    actTipoFrota: TAction;
    actTipoImoveis: TAction;
    RTabMovimentacao: TdxRibbonTab;
    BarProdutos: TdxBar;
    BarServicos: TdxBar;
    BtnSubItemPEntradas: TdxBarSubItem;
    BtnSubItemPSaidas: TdxBarSubItem;
    LButtonOrcamentos: TdxBarLargeButton;
    LButtonPedidoCompras: TdxBarLargeButton;
    actPedidoCompras: TAction;
    BarSeparator38: TdxBarSeparator;
    BarSeparatorFuncoes: TdxBarSeparator;
    LButtonIniciarProduto: TdxBarLargeButton;
    LButtonCEP: TdxBarLargeButton;
    actCEP: TAction;
    tmrSystem: TTimer;
    LButtonManutencaoProg: TdxBarLargeButton;
    actManutencaoProgramada: TAction;
    actConfigHost: TAction;
    RTabTransportadora: TdxRibbonTab;
    RTabFiscal: TdxRibbonTab;
    BarFiscal: TdxBar;
    BtnSubItemCodFiscal: TdxBarSubItem;
    BarSeparatorProdutos: TdxBarSeparator;
    BarSeparatorServicos: TdxBarSeparator;
    LButtonCSTCEST: TdxBarLargeButton;
    LButtonCSTICMS: TdxBarLargeButton;
    LButtonCSTCSOSN: TdxBarLargeButton;
    LButtonCSTIPI: TdxBarLargeButton;
    LButtonCSTPISCOFINS: TdxBarLargeButton;
    LButtonCSTISSQN: TdxBarLargeButton;
    LButtonCSTCFOP: TdxBarLargeButton;
    actFiscalCEST: TAction;
    actFiscalCSOSN: TAction;
    actFiscalCFOP: TAction;
    actFiscalICMS: TAction;
    actFiscalIPI: TAction;
    actFiscalPISCOFINS: TAction;
    actFiscalISSQN: TAction;
    BarSeparatorEmpresas: TdxBarSeparator;
    LButtonFiscalCNAE: TdxBarLargeButton;
    actFiscalCNAE: TAction;
    BarLogistica: TdxBar;
    BtnSubItemLogDocumentos: TdxBarSubItem;
    BarSeparator39: TdxBarSeparator;
    BtnSubItemCTe: TdxBarSubItem;
    BtnSubItemMDFe: TdxBarSubItem;
    LButtonNovoCTe: TdxBarLargeButton;
    LButtonNovoMDFe: TdxBarLargeButton;
    LButtonConsultarCTe: TdxBarLargeButton;
    LButtonConsultarMDFe: TdxBarLargeButton;
    LButtonAutomacaoBombas: TdxBarLargeButton;
    BarSeparatorAutomacao: TdxBarSeparator;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarSubItem1: TdxBarSubItem;
    actAutoBombas: TAction;
    BarAutomacaoLogistica: TdxBar;
    dxBarLargeButton2: TdxBarLargeButton;
    BtnSubItemLOGAutomacao: TdxBarSubItem;
    BarSeparator6: TdxBarSeparator;
    LButtonAbastecimentos: TdxBarLargeButton;
    BtnSubItemLOGAutomacaoRelatorios: TdxBarSubItem;
    BarSeparator40: TdxBarSeparator;
    LButtonLOGRELConsumo: TdxBarLargeButton;
    LButtonLOGRELManutencoes: TdxBarLargeButton;
    LButtonLOGRELFrota: TdxBarLargeButton;
    BarSeparatorVeiculo: TdxBarSeparator;
    LButtonLOGRELGeral: TdxBarLargeButton;
    LButtonLOGRELConsumoDetalhado: TdxBarLargeButton;
    LButtonLOGRELManutencaoDetalhado: TdxBarLargeButton;
    actAbastecimentosPendentes: TAction;
    actAbastecimentosBaixados: TAction;
    BtnSubItemAbastecimentos: TdxBarSubItem;
    LButtonAbastecimentosPendentes: TdxBarLargeButton;
    LButtonAbastecimentosBaixados: TdxBarLargeButton;
    procedure actSairExecute(Sender: TObject);
    procedure actAjudaExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actPessoaDepartamentosExecute(Sender: TObject);
    procedure actCRMGrupoExecute(Sender: TObject);
    procedure actPessoaCargosExecute(Sender: TObject);
    procedure actCRMPermissoesGrupoExecute(Sender: TObject);
    procedure actPessoaCategoriasExecute(Sender: TObject);
    procedure actPessoaGruposExecute(Sender: TObject);
    procedure actPessoaClientesExecute(Sender: TObject);
    procedure actPessoaColaboradoresExecute(Sender: TObject);
    procedure actProdutoDepositosExecute(Sender: TObject);
    procedure actProdutoTanquesExecute(Sender: TObject);
    procedure actProdutoCategoriasExecute(Sender: TObject);
    procedure actProdutoGruposExecute(Sender: TObject);
    procedure actProdutoMarcasExecute(Sender: TObject);
    procedure actProdutoModelosExecute(Sender: TObject);
    procedure actProdutoProdutosExecute(Sender: TObject);
    procedure actPessoaFornecedoresExecute(Sender: TObject);
    procedure actPessoaTransportadorasExecute(Sender: TObject);
    procedure actConfigEmpresaExecute(Sender: TObject);
    procedure actPessoaRepresentantesExecute(Sender: TObject);
    procedure actProdutoServicosExecute(Sender: TObject);
    procedure actTipoFrotaExecute(Sender: TObject);
    procedure actFrotaExecute(Sender: TObject);
    procedure actPedidoComprasExecute(Sender: TObject);
    procedure actCEPExecute(Sender: TObject);
    procedure actManutencaoProgramadaExecute(Sender: TObject);
    procedure tmrSystemTimer(Sender: TObject);
    procedure actConfigHostExecute(Sender: TObject);
    procedure actFiscalCESTExecute(Sender: TObject);
    procedure actFiscalCFOPExecute(Sender: TObject);
    procedure actFiscalCSOSNExecute(Sender: TObject);
    procedure actFiscalICMSExecute(Sender: TObject);
    procedure actFiscalIPIExecute(Sender: TObject);
    procedure actFiscalPISCOFINSExecute(Sender: TObject);
    procedure actFiscalCNAEExecute(Sender: TObject);
    procedure LButtonConsultarCTeClick(Sender: TObject);
    procedure actAutoBombasExecute(Sender: TObject);
    procedure actAbastecimentosPendentesExecute(Sender: TObject);
    procedure actAbastecimentosBaixadosExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SystemOut: Boolean;
    Settings :TFormMode;
  end;

var
  Aplicacao: TAplicacao;

implementation

{$R *.dfm}

uses unParametros, unConnection, unSystemHelp, unGrid, unGridDepartamentoPessoas, unGridPermissoesGrupo,
  unGridGrupoUsuarios, unGridCargoPessoas, unGridCategoriaPessoas,
  unGridGrupoPessoas, unGridPessoaCliente, unGridPessoaFuncionario,
  unGridCategoriaProdutos, unGridDepositos, unGridTanques, unGridGrupoProdutos,
  unGridMarcaProdutos, unGridModeloProdutos, unGridProdutos,
  unGridPessoaFornecedor, unGridPessoaTransportadora, unGridConfigEmpresa,
  unGridPessoaRepresentante, unGridServicos, unGridFrota, unGridTipoFrota,
  unGridPedidoCompras, unCEP, unGridSystemBreak, unSystemBreak, unCadConfigHost, unGridCEST, unGridCFOP, unGridCSOSN, unGridICMS, unGridIPI, unGridPISCONFINS, unGridCNAE, unGridCTe,
  unGridBombas, unGridAutoAbastecimentosPendentes,
  unGridAutoAbastecimentosBaixados;

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

procedure TAplicacao.actAutoBombasExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridBombas,0,'LISTA',frmGridBombas);
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

procedure TAplicacao.actPedidoComprasExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridPedidoCompras,0,'LISTA',frmGridPedidoCompras);
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

procedure TAplicacao.actSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TAplicacao.actTipoFrotaExecute(Sender: TObject);
begin
  CriaFormulario(TfrmGridTipoFrota,0,'',frmGridTipoFrota);
end;

procedure TAplicacao.FormCreate(Sender: TObject);
begin
  // Traduz componentes
  // Deve-se utilizar o 'ExtractFilePath' pois o 'Parametros.SystemConfig.ASSystemPath' ainda não foi criado, verificar correção posteriormente [08/12/2016].
  if FileExists(ExtractFilePath(Application.ExeName)+'\config\trdCompDev.trl') then
    begin
      Localizer.LoadFromFile(ExtractFilePath(Application.ExeName)+'\config\trdCompDev.trl');
      Localizer.LanguageIndex := 1;
      Localizer.Active := true;
    end
  else
    begin
      Aviso('WARN','Arquivo pendente.','Não foi possivel encontrar um dos arquivos do sistema.'#13'ID: [FPTRL]'#13'Entre em contato com o suporte.');
    end;
  PageControl.HideTabs := True;
end;

procedure TAplicacao.FormShow(Sender: TObject);
var
  IDBreak: Integer;
begin
  if Parametros.SystemConfig.ASSystemAuth = False then
    Application.Terminate
  else
    begin
      SystemOut := False;
      // Define as configurações na barra de status;
      StatusBar.Panels.Items[1].Text:= Parametros.SystemConfig.ASDBServer;
      StatusBar.Panels.Items[3].Text:= Parametros.SystemConfig.ASDBPort;
      StatusBar.Panels.Items[5].Text:= AnsiUpperCase(Parametros.SystemConfig.ASDBDataBase);
      StatusBar.Panels.Items[7].Text:= ResolveHost;
      StatusBar.Panels.Items[9].Text:= AnsiUpperCase(Connection.qLogin.FieldByName('login').AsString);
      StatusBar.Panels.Items[13].Text:= 'BUILD: ' + Versao;
      if Connection.qHostConfigsefaz_ambiente.AsInteger = 1 then
        StatusBar.Panels.Items[11].Text:= 'PRODUCAO'
      else
        StatusBar.Panels.Items[11].Text:= 'HOMOLOGACAO';
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
end;

procedure TAplicacao.LButtonConsultarCTeClick(Sender: TObject);
begin
  CriaFormulario(TfrmGridCTe,0,'LISTA',frmGridCTe);
end;

procedure TAplicacao.tmrSystemTimer(Sender: TObject);
var
  iBreak: Integer;
begin
  if SystemOut = True then
    begin
      CriaFormulario(TfrmSystemBreak,iBreak,'OUT',frmSystemBreak);
      Close;
    end
  else
    begin
      iBreak := Connection.SystemBreak;
      if Connection.SystemTerminate(iBreak) = True then
        begin
          SystemOut := True;
          tmrSystem.Interval := Connection.SystemTimeOut(iBreak);
        end;
    end;
end;

end.
