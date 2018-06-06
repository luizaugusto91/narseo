unit unCadConfigEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.FileCtrl,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCad, Vcl.ImgList, cxGraphics, Data.DB,
  MemDS, DBAccess, Uni, Vcl.StdCtrls, Vcl.ExtCtrls, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxPC, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxSpinEdit, cxDBEdit, cxCheckBox, cxGroupBox, cxRadioGroup,
  cxBlobEdit, cxDropDownEdit, cxCalendar, cxMemo, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxImageComboBox, dxGDIPlusClasses, cxImage, unSystem;

type
  TfrmCadConfigEmpresa = class(TfrmCad)
    PageControl: TcxPageControl;
    TabGeral: TcxTabSheet;
    qPessoa: TUniQuery;
    dsPessoa: TUniDataSource;
    qPessoacodigo: TIntegerField;
    qPessoaempresa: TIntegerField;
    qPessoadatacadastro: TDateField;
    qPessoanome: TStringField;
    qPessoafantasia: TStringField;
    qPessoanomereduzido: TStringField;
    qPessoatipopessoa: TIntegerField;
    qPessoacnpj: TStringField;
    qPessoaie: TStringField;
    qPessoaim: TStringField;
    qPessoadatanascimento: TDateField;
    qPessoasexo: TStringField;
    qPessoaendereco: TStringField;
    qPessoaendereco_numero: TStringField;
    qPessoacomplemento: TStringField;
    qPessoareferencia: TStringField;
    qPessoabairro: TStringField;
    qPessoacep: TStringField;
    qPessoacidade: TIntegerField;
    qPessoauf: TStringField;
    qPessoapais: TIntegerField;
    qPessoatel1: TStringField;
    qPessoatel2: TStringField;
    qPessoatel3: TStringField;
    qPessoaemail: TStringField;
    qPessoasite: TStringField;
    qPessoainativo: TBooleanField;
    qPessoaoldid: TStringField;
    tabRegras: TcxTabSheet;
    tabAssinatura: TcxTabSheet;
    dsAssinatura: TUniDataSource;
    qHostConfig: TUniQuery;
    qAssinatura: TUniQuery;
    dsHostConfig: TUniDataSource;
    qAssinaturacodigo: TIntegerField;
    qAssinaturaempresa: TIntegerField;
    qAssinaturacertificado_datavencimento: TDateField;
    qAssinaturacertificado_senha: TStringField;
    qAssinaturacertificado_chave: TStringField;
    qAssinaturaarq_pastasseparadas: TBooleanField;
    qAssinaturaarq_criarpastasmensalmente: TBooleanField;
    qAssinaturaarq_path_nfe: TStringField;
    qAssinaturaarq_path_cancelamento: TStringField;
    qAssinaturaarq_path_cce: TStringField;
    qAssinaturaarq_path_cfe: TStringField;
    qAssinaturaarq_path_inutilizacao: TStringField;
    qAssinaturaarq_path_dpec: TStringField;
    qAssinaturaarq_path_eventos: TStringField;
    qAssinaturaweb_ufdestino: TStringField;
    qAssinaturaweb_ajustarautomaticamente: TBooleanField;
    qAssinaturaweb_ajuste_aguardar: TIntegerField;
    qAssinaturaweb_ajuste_tentativas: TIntegerField;
    qAssinaturaweb_ajuste_intervalo: TIntegerField;
    qAssinaturaweb_proxy_host: TStringField;
    qAssinaturaweb_proxy_port: TStringField;
    qAssinaturaweb_proxy_usuario: TStringField;
    qAssinaturaweb_proxy_senha: TStringField;
    qAssinaturaemail_smtp: TStringField;
    qAssinaturaemail_conexaosegura: TBooleanField;
    qAssinaturaemail_porta: TStringField;
    qAssinaturaemail_usuario: TStringField;
    qAssinaturaemail_senha: TStringField;
    qAssinaturaemail_assunto: TStringField;
    qAssinaturaemail_mensagem: TStringField;
    qAssinaturadanfe_logo: TBlobField;
    qAssinaturadanfe_retrato: TIntegerField;
    PageControlAssinatura: TcxPageControl;
    tabAssGeral: TcxTabSheet;
    tabAssHost: TcxTabSheet;
    PageControlCert: TcxPageControl;
    tabCert: TcxTabSheet;
    tabPath: TcxTabSheet;
    tabWeb: TcxTabSheet;
    tabEmail: TcxTabSheet;
    grp2: TGroupBox;
    grp3: TGroupBox;
    grp4: TGroupBox;
    grp5: TGroupBox;
    Label1: TLabel;
    edtcertificado_datavencimento1: TcxDBDateEdit;
    Label2: TLabel;
    edtcertificado_senha: TcxDBTextEdit;
    Label3: TLabel;
    edtcertificado_chave1: TcxDBTextEdit;
    Label4: TLabel;
    edtblobdanfe_logo: TcxDBBlobEdit;
    rgDanfeRetrato: TcxDBRadioGroup;
    qAssinaturaarq_separarmodelo: TBooleanField;
    cbarq_pastasseparadas: TcxDBCheckBox;
    cbarq_criarpastasmensalmente: TcxDBCheckBox;
    cbarq_separarmodelo: TcxDBCheckBox;
    Label5: TLabel;
    edtarq_path_nfe: TcxDBTextEdit;
    Label6: TLabel;
    edtarq_path_cancelamento: TcxDBTextEdit;
    Label7: TLabel;
    edtarq_path_cce: TcxDBTextEdit;
    Label8: TLabel;
    edtarq_path_cfe: TcxDBTextEdit;
    Label9: TLabel;
    edtarq_path_inutilizacao: TcxDBTextEdit;
    Label10: TLabel;
    edtarq_path_dpec: TcxDBTextEdit;
    btnSearchNFe: TButton;
    btnSearchNFeC: TButton;
    btnSearchCCe: TButton;
    btnSearchCFe: TButton;
    btnSearchInutilizacao: TButton;
    btnSearchDPEC: TButton;
    cxDBCheckBox1: TcxDBCheckBox;
    Label11: TLabel;
    cxDBSpinEdit1: TcxDBSpinEdit;
    Label12: TLabel;
    cxDBSpinEdit2: TcxDBSpinEdit;
    Label13: TLabel;
    cxDBSpinEdit3: TcxDBSpinEdit;
    grpProxy: TGroupBox;
    Label14: TLabel;
    cxDBTextEdit9: TcxDBTextEdit;
    Label15: TLabel;
    cxDBTextEdit10: TcxDBTextEdit;
    Label16: TLabel;
    cxDBTextEdit11: TcxDBTextEdit;
    Label17: TLabel;
    cxDBTextEdit12: TcxDBTextEdit;
    Label18: TLabel;
    cxDBTextEdit13: TcxDBTextEdit;
    cxDBCheckBox2: TcxDBCheckBox;
    Label19: TLabel;
    cxDBTextEdit14: TcxDBTextEdit;
    Label20: TLabel;
    cxDBTextEdit15: TcxDBTextEdit;
    Label21: TLabel;
    cxDBTextEdit16: TcxDBTextEdit;
    Label22: TLabel;
    cxDBTextEdit17: TcxDBTextEdit;
    Label23: TLabel;
    mmMensagem: TcxDBMemo;
    btnEmailConex: TButton;
    qHostConfigcodigo: TIntegerField;
    qHostConfigempresa: TIntegerField;
    qHostConfigestacao_serial: TStringField;
    qHostConfigestacao_terminal: TStringField;
    qHostConfigestacao_usuario: TStringField;
    qHostConfigcertificado_path: TStringField;
    qHostConfigcertificado_datavencimento: TDateField;
    qHostConfigcertificado_senha: TStringField;
    qHostConfigcertificado_chave: TStringField;
    qHostConfigsefaz_ambiente: TIntegerField;
    qHostConfigweb_proxy_host: TStringField;
    qHostConfigweb_proxy_port: TStringField;
    qHostConfigweb_proxy_usuario: TStringField;
    qHostConfigweb_proxy_senha: TStringField;
    PageControlEstacao: TcxPageControl;
    tabEstacao: TcxTabSheet;
    tabProxy: TcxTabSheet;
    grp1: TGroupBox;
    grp6: TGroupBox;
    Label24: TLabel;
    cxDBTextEdit18: TcxDBTextEdit;
    Label25: TLabel;
    cxDBTextEdit19: TcxDBTextEdit;
    Label28: TLabel;
    cxDBTextEdit20: TcxDBTextEdit;
    Label29: TLabel;
    cxDBTextEdit21: TcxDBTextEdit;
    Label30: TLabel;
    edtestacao_serial: TcxDBTextEdit;
    Label31: TLabel;
    edtcertificado_path: TcxDBTextEdit;
    Label32: TLabel;
    edtcertificado_datavencimento: TcxDBDateEdit;
    btnSearchCertificado: TButton;
    Label33: TLabel;
    edtcertificado_chave: TcxDBTextEdit;
    cxDBRadioGroup1: TcxDBRadioGroup;
    btnGetKey: TButton;
    btnGetSerial: TButton;
    OpenDialog: TOpenDialog;
    PageControlTransacao: TcxPageControl;
    tabAutomacao: TcxTabSheet;
    tabProcessamento: TcxTabSheet;
    grpBombas: TGroupBox;
    grpServicosSefaz: TGroupBox;
    qServices: TUniQuery;
    dsServices: TUniDataSource;
    qServicescodigo: TIntegerField;
    qServicesempresa: TIntegerField;
    qServicesauto_service: TBooleanField;
    qServicesauto_server: TStringField;
    qServicesauto_synctime: TIntegerField;
    qServicesauto_autolog: TBooleanField;
    qServicese_proc: TBooleanField;
    qServicese_synctime: TIntegerField;
    qServicese_autolog: TBooleanField;
    cbAutoService: TcxDBCheckBox;
    Label34: TLabel;
    edtAutoServer: TcxDBTextEdit;
    Label35: TLabel;
    edtAutoSync: TcxDBSpinEdit;
    cbAutoLog: TcxDBCheckBox;
    cxDBCheckBox5: TcxDBCheckBox;
    Label36: TLabel;
    cxDBSpinEdit5: TcxDBSpinEdit;
    cxDBCheckBox6: TcxDBCheckBox;
    cbInativo: TcxDBCheckBox;
    cbMatriz: TcxDBCheckBox;
    edtCNPJ: TcxDBTextEdit;
    edtCodigo: TcxDBSpinEdit;
    edtFantasia: TcxDBTextEdit;
    edtIE: TcxDBTextEdit;
    edtIM: TcxDBTextEdit;
    edtNome: TcxDBTextEdit;
    edtNomeReduzido: TcxDBTextEdit;
    edtPessoa: TcxDBSpinEdit;
    lblCNPJ: TLabel;
    lblCodigo: TLabel;
    lblFantasia: TLabel;
    lblIE: TLabel;
    lblIM: TLabel;
    lblNome: TLabel;
    lblNomeReduzido: TLabel;
    lblPessoa: TLabel;
    lblCDMatriz: TLabel;
    edtcd_matriz: TcxDBSpinEdit;
    cbbCDMatriz: TcxDBLookupComboBox;
    PageControlGeral: TcxPageControl;
    TabContato: TcxTabSheet;
    TabFiscal: TcxTabSheet;
    grpEndereco: TGroupBox;
    lblBairro: TLabel;
    lblCelular: TLabel;
    lblCEP: TLabel;
    lblCidade: TLabel;
    lblComplemento: TLabel;
    lblEmail: TLabel;
    lblEndereco_Numero: TLabel;
    lblLogradouro: TLabel;
    lblPais: TLabel;
    lblReferencia: TLabel;
    lblSite: TLabel;
    lblTel1: TLabel;
    lblTel3: TLabel;
    lblUF: TLabel;
    btnBuscarCEP: TButton;
    cbbCidade: TcxDBLookupComboBox;
    cbbPais: TcxDBLookupComboBox;
    edtBairro: TcxDBTextEdit;
    edtCEP: TcxDBTextEdit;
    edtCidade: TcxDBSpinEdit;
    edtComplemento: TcxDBTextEdit;
    edtEmail: TcxDBTextEdit;
    edtEndereco_numero: TcxDBTextEdit;
    edtLogradouro: TcxDBTextEdit;
    edtPais: TcxDBSpinEdit;
    edtReferencia: TcxDBTextEdit;
    edtSite: TcxDBTextEdit;
    edtTel1: TcxDBTextEdit;
    edtTel2: TcxDBTextEdit;
    edtTel3: TcxDBTextEdit;
    edtUF: TcxDBTextEdit;
    qFiscal: TUniQuery;
    dsFiscal: TUniDataSource;
    grpFiscal: TGroupBox;
    qFiscalcodigo: TIntegerField;
    qFiscalempresa: TIntegerField;
    qFiscalramo: TIntegerField;
    qFiscalregime_tributario: TIntegerField;
    qFiscalregime_apuracao: TIntegerField;
    qFiscalregime_escrituracao: TIntegerField;
    qFiscalnatureza_empresa: TIntegerField;
    qFiscaltipo_tributario: TIntegerField;
    qFiscalcontador: TIntegerField;
    qFiscalcrc: TStringField;
    qFiscalescritorio: TIntegerField;
    qFiscalcontribuinte_ipi: TBooleanField;
    qFiscalaliquota_pis: TFloatField;
    qFiscalaliquota_cofins: TFloatField;
    qFiscalaliquota_combatepobreza: TFloatField;
    qFiscaldestacar_icms: TBooleanField;
    grpRegime: TGroupBox;
    lblRamo: TLabel;
    Label37: TLabel;
    cbbregime_tributario: TcxDBImageComboBox;
    Label38: TLabel;
    cbbregime_apuracao: TcxDBImageComboBox;
    Label39: TLabel;
    cbbregime_escrituracao: TcxDBImageComboBox;
    Label40: TLabel;
    cbbnatureza_empresa: TcxDBImageComboBox;
    Label41: TLabel;
    cbbtipo_tributario: TcxDBImageComboBox;
    cbbdestacar_icms: TcxDBCheckBox;
    qConsultacodigo: TIntegerField;
    qConsultapessoa: TIntegerField;
    qConsultaserial: TStringField;
    qConsultachave: TStringField;
    qConsultadata_inicio: TDateField;
    qConsultadata_fim: TDateField;
    qConsultamatriz: TBooleanField;
    qConsultacd_matriz: TIntegerField;
    qConsultainativo: TBooleanField;
    cbbRamo: TcxDBImageComboBox;
    qPessoaOutros: TUniQuery;
    dsPessoaOutros: TUniDataSource;
    TabFiscal2: TcxTabSheet;
    grpFiscal2: TGroupBox;
    grpImpostos: TGroupBox;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    cbbcontribuinte_ipi: TcxDBCheckBox;
    edtaliquota_pis: TcxDBSpinEdit;
    edtaliquota_cofins: TcxDBSpinEdit;
    edtaliquota_combatepobreza: TcxDBSpinEdit;
    grpContabilidade: TGroupBox;
    lblContador: TLabel;
    lblCRC: TLabel;
    lblEscritorio: TLabel;
    edtcontador: TcxDBSpinEdit;
    edtcrc: TcxDBTextEdit;
    edtescritorio: TcxDBSpinEdit;
    cbbContador: TcxDBLookupComboBox;
    cbbEscritorio: TcxDBLookupComboBox;
    GroupBox1: TGroupBox;
    Label45: TLabel;
    cbbCNAE: TcxDBLookupComboBox;
    qCNAE: TUniQuery;
    dsCNAE: TUniDataSource;
    qFiscalcnae: TStringField;
    edtcnae: TcxDBTextEdit;
    qMatriz: TUniQuery;
    dsMatriz: TUniDataSource;
    TabRegrasNegocio: TcxTabSheet;
    GroupBox2: TGroupBox;
    grprnCompras: TGroupBox;
    grprnVendas: TGroupBox;
    qRN: TUniQuery;
    dsRN: TUniDataSource;
    qRNcodigo: TIntegerField;
    qRNempresa: TIntegerField;
    qRNcompras_centro_custos: TStringField;
    qRNcompras_tipo_conta: TIntegerField;
    qRNcompras_tipo_pagamento: TIntegerField;
    qRNvendas_centro_custos: TStringField;
    qRNvendas_tipo_conta: TIntegerField;
    qRNvendas_tipo_pagamento: TIntegerField;
    lblcomprascentrocustos: TLabel;
    edtcompras_centro_custos: TcxDBTextEdit;
    lblcomprastipoConta: TLabel;
    edtcompras_tipo_conta: TcxDBSpinEdit;
    lblcomprastipoPagamento: TLabel;
    edtcompras_tipo_pagamento: TcxDBSpinEdit;
    lblvendascentrocustos: TLabel;
    edtvendas_centro_custos: TcxDBTextEdit;
    lblvendastipoconta: TLabel;
    edtvendas_tipo_conta: TcxDBSpinEdit;
    lblvendastipopagamento: TLabel;
    edtvendas_tipo_pagamento: TcxDBSpinEdit;
    cbbComprasCentrocustos: TcxDBLookupComboBox;
    cbbVendasCentrocustos: TcxDBLookupComboBox;
    cbbComprasTipoconta: TcxDBLookupComboBox;
    cbbVendasTipoconta: TcxDBLookupComboBox;
    cbbComprasTipopagamento: TcxDBLookupComboBox;
    cbbVendasTipopagamento: TcxDBLookupComboBox;
    TabDocumentos: TcxTabSheet;
    grp7: TGroupBox;
    qDocumentos: TUniQuery;
    dsDocumentos: TUniDataSource;
    FieldDocumentoscodigo: TIntegerField;
    FieldDocumentosempresa: TIntegerField;
    FieldDocumentoscfe: TBooleanField;
    FieldDocumentoscte: TBooleanField;
    FieldDocumentosnfe: TBooleanField;
    FieldDocumentosnfce: TBooleanField;
    cbbcfe: TcxDBCheckBox;
    cbbcte: TcxDBCheckBox;
    cbbnfe: TcxDBCheckBox;
    cbbnfce: TcxDBCheckBox;
    procedure FormShow(Sender: TObject);
    procedure btnGetKeyClick(Sender: TObject);
    procedure btnSearchNFeClick(Sender: TObject);
    procedure btnSearchCertificadoClick(Sender: TObject);
    procedure btnSearchNFeCClick(Sender: TObject);
    procedure btnSearchCCeClick(Sender: TObject);
    procedure btnSearchCFeClick(Sender: TObject);
    procedure btnSearchInutilizacaoClick(Sender: TObject);
    procedure btnSearchDPECClick(Sender: TObject);
    procedure btnGetSerialClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure cbMatrizExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure PathSearch(Sender: TField);
  public
    { Public declarations }
  end;

var
  frmCadConfigEmpresa: TfrmCadConfigEmpresa;

implementation
{$R *.dfm}
uses unConnection, unAplicacao, unSEFAZ, unParametros, unDMConfigEmpresa;

const
  SELDIRHELP = 1000;

procedure TfrmCadConfigEmpresa.btnGetKeyClick(Sender: TObject);
begin
  inherited;
  try
    qAssinaturacertificado_chave.AsString := Sefaz.ACBrNFe.SSL.SelecionarCertificado;
    qAssinaturacertificado_datavencimento.AsDateTime := Sefaz.ACBrNFe.SSL.CertDataVenc;
    qHostConfigcertificado_chave.AsString := Sefaz.ACBrNFe.SSL.SelecionarCertificado;
    qHostConfigcertificado_datavencimento.AsDateTime := Sefaz.ACBrNFe.SSL.CertDataVenc;
  except
    //
  end;
end;

procedure TfrmCadConfigEmpresa.btnGetSerialClick(Sender: TObject);
begin
  inherited;
  try
    qHostConfigestacao_serial.AsString := keyTerminal;
  except

  end;
end;

procedure TfrmCadConfigEmpresa.btnSalvarClick(Sender: TObject);
begin
  if Settings.Modo = 'ALTERACAO' then
    begin
      qFiscal.Post;
      qAssinatura.Post;
      qHostConfig.Post;
    end;
  inherited;
end;

procedure TfrmCadConfigEmpresa.btnSearchCCeClick(Sender: TObject);
begin
  inherited;
  try
    PathSearch(qAssinaturaarq_path_cce);
  except

  end;
end;

procedure TfrmCadConfigEmpresa.btnSearchCertificadoClick(Sender: TObject);
begin
  inherited;
  OpenDialog.Title := 'Selecione o Certificado';
  OpenDialog.DefaultExt := '*.pfx';
  OpenDialog.Filter := 'Arquivos PFX (*.pfx)|*.pfx|Todos os Arquivos (*.*)|*.*';
  OpenDialog.InitialDir := ExtractFileDir(application.ExeName);
  if OpenDialog.Execute then
  begin
    try
      qHostConfigcertificado_path.AsString := OpenDialog.FileName;
    finally

    end;
  end;
end;

procedure TfrmCadConfigEmpresa.btnSearchCFeClick(Sender: TObject);
begin
  inherited;
  try
    PathSearch(qAssinaturaarq_path_cfe);
  except

  end;
end;

procedure TfrmCadConfigEmpresa.btnSearchDPECClick(Sender: TObject);
begin
  inherited;
  try
    PathSearch(qAssinaturaarq_path_dpec);
  except

  end;
end;

procedure TfrmCadConfigEmpresa.btnSearchInutilizacaoClick(Sender: TObject);
begin
  inherited;
  try
    PathSearch(qAssinaturaarq_path_inutilizacao);
  except

  end;
end;

procedure TfrmCadConfigEmpresa.btnSearchNFeCClick(Sender: TObject);
begin
  inherited;
  try
    PathSearch(qAssinaturaarq_path_cancelamento);
  except

  end;
end;

procedure TfrmCadConfigEmpresa.btnSearchNFeClick(Sender: TObject);
begin
  inherited;
  try
    PathSearch(qAssinaturaarq_path_nfe);
  except

  end;
end;

procedure TfrmCadConfigEmpresa.cbMatrizExit(Sender: TObject);
begin
  inherited;
  if ds.dataset.FieldByName('matriz').AsBoolean = False then
    begin
      edtcd_matriz.Enabled := True;
      cbbCDMatriz.Enabled := True;
    end
  else
    begin
      ds.dataset.FieldByName('cd_matriz').AsInteger := 0;
      edtcd_matriz.Enabled := False;
      cbbCDMatriz.Enabled := False;
    end;
end;

procedure TfrmCadConfigEmpresa.FormCreate(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TdmConfigEmpresa, dmConfigEmpresa);
end;

procedure TfrmCadConfigEmpresa.FormShow(Sender: TObject);
begin
  inherited;
  qHostConfig.ParamByName('serial').AsString := Parametros.HostInfo.HISerial;
  qHostConfig.Refresh;
  if Settings.Modo = 'ALTERACAO' then
    begin
      qFiscal.Edit;
      qAssinatura.Edit;
      qHostConfig.Edit;
    end;
  // Habilita campos da Matriz
  if ds.dataset.FieldByName('matriz').AsBoolean = False then
    begin
      edtcd_matriz.Enabled := True;
      cbbCDMatriz.Enabled := True;
    end
  else
    begin
      edtcd_matriz.Enabled := False;
      cbbCDMatriz.Enabled := False;
    end;
end;

procedure TfrmCadConfigEmpresa.PathSearch(Sender: TField);
var
  Dir: string;
begin
  if Length(Sender.AsString) <= 0 then
    Dir := ExtractFileDir(application.ExeName)
  else
    Dir := Sender.AsString;
  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt],SELDIRHELP) then
    Sender.AsString := Dir;
end;

end.

