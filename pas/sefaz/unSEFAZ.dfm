object Sefaz: TSefaz
  OldCreateOrder = False
  Height = 387
  Width = 630
  object ACBrNFe: TACBrNFe
    MAIL = ACBrMail
    Configuracoes.Geral.SSLLib = libCapicomDelphiSoap
    Configuracoes.Geral.SSLCryptLib = cryCapicom
    Configuracoes.Geral.SSLHttpLib = httpIndy
    Configuracoes.Geral.SSLXmlSignLib = xsMsXmlCapicom
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.IncluirQRCodeXMLNFCe = False
    Configuracoes.Arquivos.SepararPorCNPJ = True
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.Arquivos.SepararPorMes = True
    Configuracoes.Arquivos.SalvarEvento = True
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    DANFE = ACBrNFeDANFeRL
    Left = 48
    Top = 16
  end
  object ACBrSAT: TACBrSAT
    MAIL = ACBrMail
    Extrato = ACBrSATExtratoFortes
    Config.infCFe_versaoDadosEnt = 0.060000000000000000
    Config.ide_numeroCaixa = 0
    Config.ide_tpAmb = taHomologacao
    Config.emit_cRegTrib = RTSimplesNacional
    Config.emit_cRegTribISSQN = RTISSMicroempresaMunicipal
    Config.emit_indRatISSQN = irSim
    Config.EhUTF8 = False
    Config.PaginaDeCodigo = 0
    Config.XmlSignLib = xsNone
    ConfigArquivos.PrefixoArqCFe = 'AD'
    ConfigArquivos.PrefixoArqCFeCanc = 'ADC'
    Rede.tipoInter = infETHE
    Rede.seg = segNONE
    Rede.tipoLan = lanDHCP
    Rede.proxy = 0
    Rede.proxy_porta = 0
    Left = 520
    Top = 16
  end
  object ACBrNFeDANFeRL: TACBrNFeDANFeRL
    ACBrNFe = ACBrNFe
    Sistema = 'Union - Gerenciamento Integrado'
    MostrarPreview = True
    MostrarStatus = True
    TipoDANFE = tiRetrato
    NumCopias = 1
    ImprimeNomeFantasia = False
    ImprimirDescPorc = False
    ImprimirTotalLiquido = True
    MargemInferior = 0.500000000000000000
    MargemSuperior = 0.500000000000000000
    MargemEsquerda = 0.500000000000000000
    MargemDireita = 0.500000000000000000
    CasasDecimais.Formato = tdetInteger
    CasasDecimais._qCom = 4
    CasasDecimais._vUnCom = 4
    CasasDecimais._Mask_qCom = '###,###,###,##0.00'
    CasasDecimais._Mask_vUnCom = '###,###,###,##0.00'
    ExibirResumoCanhoto = True
    FormularioContinuo = False
    TamanhoFonte_DemaisCampos = 10
    ProdutosPorPagina = 0
    ImprimirDetalhamentoEspecifico = True
    NFeCancelada = False
    ImprimirItens = True
    ViaConsumidor = True
    TamanhoLogoHeight = 0
    TamanhoLogoWidth = 0
    RecuoEndereco = 0
    RecuoEmpresa = 0
    LogoemCima = True
    TamanhoFonteEndereco = 0
    RecuoLogo = 0
    PosCanhoto = prRodape
    LarguraCodProd = 54
    ExibirEAN = False
    QuebraLinhaEmDetalhamentoEspecifico = True
    ExibeCampoFatura = False
    AlternaCoresProdutos = True
    ImprimirUnQtVlComercial = iuComercial
    ImprimirDadosDocReferenciados = True
    Left = 48
    Top = 64
  end
  object ACBrMail: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 48
    Top = 272
  end
  object ACBrCTe: TACBrCTe
    MAIL = ACBrMail
    OnStatusChange = ACBrCTeStatusChange
    Configuracoes.Geral.SSLLib = libCustom
    Configuracoes.Geral.SSLCryptLib = cryCapicom
    Configuracoes.Geral.SSLHttpLib = httpWinHttp
    Configuracoes.Geral.SSLXmlSignLib = xsMsXmlCapicom
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.VersaoDF = ve300
    Configuracoes.Arquivos.Salvar = False
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 1
    Configuracoes.WebServices.AjustaAguardaConsultaRet = True
    Configuracoes.WebServices.QuebradeLinha = '|'
    DACTE = ACBrCTeDACTeRL
    Left = 160
    Top = 16
  end
  object ACBrCTeDACTeRL: TACBrCTeDACTeRL
    ACBrCTE = ACBrCTe
    Sistema = '.:: NARSEO - Sistema Gerencial ::.'
    ImprimirHoraSaida = False
    MostrarPreview = True
    MostrarStatus = True
    TipoDACTE = tiSemGeracao
    TamanhoPapel = tpA4
    NumCopias = 1
    Site = 'www.jovemti.com.br/narseo'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    CTeCancelada = False
    ExibirResumoCanhoto = False
    EPECEnviado = False
    ImprimirDescPorc = False
    PrintDialog = True
    Left = 160
    Top = 64
  end
  object ACBrMDFe: TACBrMDFe
    MAIL = ACBrMail
    Configuracoes.Geral.SSLLib = libCapicomDelphiSoap
    Configuracoes.Geral.SSLCryptLib = cryCapicom
    Configuracoes.Geral.SSLHttpLib = httpIndy
    Configuracoes.Geral.SSLXmlSignLib = xsMsXmlCapicom
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    DAMDFE = ACBrMDFeDAMDFeRL
    Left = 280
    Top = 16
  end
  object ACBrMDFeDAMDFeRL: TACBrMDFeDAMDFeRL
    ACBrMDFe = ACBrMDFe
    ImprimirHoraSaida = False
    MostrarPreview = True
    MostrarStatus = True
    TipoDAMDFe = tiSemGeracao
    TamanhoPapel = tpA4
    NumCopias = 1
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    MDFeCancelada = False
    MDFeEncerrado = False
    PrintDialog = True
    Left = 280
    Top = 64
  end
  object ACBrSATExtratoESCPOS: TACBrSATExtratoESCPOS
    Mask_qCom = '0.0000'
    Mask_vUnCom = '0.000'
    SoftwareHouse = 'Projeto ACBr'
    Site = 'http://www.projetoacbr.com.br'
    MsgAppQRCode = 
      'Consulte o QR Code pelo aplicativo  "De olho na nota", dispon'#237've' +
      'l na AppStore (Apple) e PlayStore (Android)'
    Left = 520
    Top = 64
  end
  object ACBrSATExtratoFortes: TACBrSATExtratoFortes
    ACBrSAT = ACBrSAT
    Mask_qCom = '0.0000'
    Mask_vUnCom = '0.000'
    SoftwareHouse = 'Projeto ACBr'
    Site = 'http://www.projetoacbr.com.br'
    MsgAppQRCode = 
      'Consulte o QR Code pelo aplicativo  "De olho na nota", dispon'#237've' +
      'l na AppStore (Apple) e PlayStore (Android)'
    Left = 520
    Top = 112
  end
end
