inherited frmRelatorioCTe: TfrmRelatorioCTe
  Caption = 'Relat'#243'rio de Conhecimentos de Transporte Eletr'#244'nico'
  ClientHeight = 199
  ClientWidth = 442
  ExplicitWidth = 458
  ExplicitHeight = 238
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 164
    Width = 442
    ExplicitTop = 164
    ExplicitWidth = 442
    inherited btnImprimir: TButton
      Left = 258
      OnClick = btnImprimirClick
      ExplicitLeft = 258
    end
    inherited btnFechar: TButton
      Left = 351
      ExplicitLeft = 351
    end
  end
  inherited pnlHelp: TPanel
    Width = 433
    ExplicitWidth = 433
    inherited mmoHelp: TMemo
      Width = 386
      Lines.Strings = (
        'Bem vindo a ajuda do sistema!'
        'Passe o mouse por cima do componente para obter mais '
        'informa'#231#245'es. ')
      ExplicitWidth = 386
    end
  end
  object rgRelatorio: TcxRadioGroup [2]
    AlignWithMargins = True
    Left = 5
    Top = 108
    Margins.Left = 5
    Margins.Right = 5
    Align = alTop
    Caption = ' Filtros do relat'#243'rio '
    Properties.Columns = 4
    Properties.Items = <
      item
        Caption = 'Todos'
      end
      item
        Caption = 'Emidos'
        Value = 'E'
      end
      item
        Caption = 'Cancelos'
        Value = 'C'
      end
      item
        Caption = 'Inutilizados'
        Value = 'I'
      end>
    ItemIndex = 0
    TabOrder = 2
    Height = 45
    Width = 432
  end
  object grpPeriodo: TcxGroupBox [3]
    AlignWithMargins = True
    Left = 5
    Top = 52
    Margins.Left = 5
    Margins.Right = 5
    Align = alTop
    Caption = ' Periodo '
    TabOrder = 3
    Height = 50
    Width = 432
    object lblDTInicio: TLabel
      Left = 18
      Top = 21
      Width = 33
      Height = 15
      Caption = 'Inicio:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDTFinal: TLabel
      Left = 223
      Top = 21
      Width = 28
      Height = 15
      Caption = 'Final:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtDTInicio: TDateTimePicker
      Left = 57
      Top = 18
      Width = 160
      Height = 23
      Date = 0.048123379630851560
      Time = 0.048123379630851560
      TabOrder = 0
    end
    object edtDTFinal: TDateTimePicker
      Left = 258
      Top = 18
      Width = 159
      Height = 23
      Date = 0.048123379630851560
      Time = 0.048123379630851560
      TabOrder = 1
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 292
  end
  inherited qConsulta: TUniQuery
    SQL.Strings = (
      'select ct.codigo,'
      #9'ct.data_registro::date,'
      #9'ct.conhecimento,'
      #9'ct.status,'
      #9'ct.nota,'
      #9'ct.valor_frete,'
      #9'ct.remetente,'
      #9'pr.fantasia as remetente_nome,'
      #9'ct.destinatario,'
      #9'pd.fantasia as destinatario_nome,'
      #9'cr.valor,'
      #9'cr.descricao,'
      #9'cr.documento'
      '   from cte ct'
      '   left join contas_receber cr on cr.codigo_origem = ct.codigo'
      '   left join pessoas pd on pd.codigo = ct.destinatario'
      '   left join pessoas pr on pr.codigo = ct.remetente'
      '   WHERE 1 = 1')
    Left = 344
    Top = 0
    ParamData = <>
  end
  inherited ds: TUniDataSource
    Left = 400
    Top = 0
  end
  object RepCTe: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42936.685900810200000000
    ReportOptions.LastChange = 43132.621257511570000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 101
    Top = 4
    Datasets = <
      item
        DataSet = FRDataSetCTe
        DataSetName = 'CTe'
      end
      item
        DataSet = FRDataSetEmpresa
        DataSetName = 'Empresa'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      HGuides.Strings = (
        '18,89765'
        '245,66945')
      VGuides.Strings = (
        '7,55906'
        '529,1342'
        '1039,37075')
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 56.692950000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object frxDBDataset1empresa: TfrxMemoView
          Left = 7.559060000000000000
          Width = 427.086890000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[Empresa."cnpj"] - [Empresa."nome"]')
          ParentFont = False
        end
        object frxDBDataset1fantasia: TfrxMemoView
          Left = 442.205010000000000000
          Width = 408.189240000000000000
          Height = 18.897650000000000000
          DataField = 'fantasia'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[Empresa."fantasia"]')
          ParentFont = False
        end
        object frxDBDataset1endereco: TfrxMemoView
          Left = 7.559060000000000000
          Top = 18.897650000000000000
          Width = 445.984540000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'Endere'#231'o: [Empresa."endereco"] - [Empresa."endereco_numero"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object frxDBDataset1cidade: TfrxMemoView
          Left = 529.134200000000000000
          Top = 18.897650000000000000
          Width = 510.236550000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'Cidade: [Empresa."cidade"] - Bairro: [Empresa."bairro"]')
          ParentFont = False
        end
        object frxDBDataset1uf: TfrxMemoView
          Left = 7.559060000000000000
          Top = 37.795300000000000000
          Width = 351.496290000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'UF: [Empresa."uf"] - CEP: [Empresa."cep"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 865.512370000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Emiss'#227'o: [Date] - [Time]')
          ParentFont = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
      end
      object Rodape: TfrxPageFooter
        FillType = ftBrush
        Height = 15.118120000000000000
        Top = 366.614410000000000000
        Width = 1046.929810000000000000
        object Page: TfrxMemoView
          Left = 453.543600000000000000
          Width = 151.181200000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'P'#225'gina [Page] de [TotalPages#]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo2: TfrxMemoView
          Left = 774.803650000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'www.jovemti.com.br/narseo')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 7.559060000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'Jovem ti - Gest'#227'o em Tecnologia')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 98.267780000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 7.559060000000000000
          Width = 1031.811690000000000000
          Height = 26.456710000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'RELAT'#211'RIO CONHECIMENTOS DE TRANSPORTE ELETRONICOS')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Itens: TfrxDetailData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 245.669450000000000000
        Width = 1046.929810000000000000
        DataSet = FRDataSetCTe
        DataSetName = 'CTe'
        RowCount = 0
        object CTeconhecimento: TfrxMemoView
          Left = 7.559060000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'conhecimento'
          DataSet = FRDataSetCTe
          DataSetName = 'CTe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[CTe."conhecimento"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object CTedata_registro: TfrxMemoView
          Left = 60.472480000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataField = 'data_registro'
          DataSet = FRDataSetCTe
          DataSetName = 'CTe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[CTe."data_registro"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object CTeremetente_nome: TfrxMemoView
          Left = 154.960730000000000000
          Width = 374.173470000000000000
          Height = 18.897650000000000000
          DataField = 'remetente_nome'
          DataSet = FRDataSetCTe
          DataSetName = 'CTe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[CTe."remetente_nome"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object CTedestinatario_nome: TfrxMemoView
          Left = 533.472790000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          DataField = 'destinatario_nome'
          DataSet = FRDataSetCTe
          DataSetName = 'CTe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[CTe."destinatario_nome"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object CTedocumento: TfrxMemoView
          Left = 876.850960000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'documento'
          DataSet = FRDataSetCTe
          DataSetName = 'CTe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[CTe."documento"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object CTevalor: TfrxMemoView
          Left = 967.559680000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'valor'
          DataSet = FRDataSetCTe
          DataSetName = 'CTe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[CTe."valor"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Master: TfrxMasterData
        FillType = ftBrush
        Height = 37.795300000000000000
        Top = 185.196970000000000000
        Width = 1046.929810000000000000
        DataSet = FRDataSetCTe
        DataSetName = 'CTe'
        RowCount = 0
        object Memo5: TfrxMemoView
          Left = 7.559060000000000000
          Width = 1031.811690000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'calibri'
          Font.Style = [fsBold]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            
              'Lista de CT-e emitidas no per'#237'odo de [MIN(<CTe."data_registro">,' +
              'Itens)] at'#233' [MAX(<CTe."data_registro">,Itens)].')
          ParentFont = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
        object Memo6: TfrxMemoView
          Left = 7.559060000000000000
          Top = 18.897650000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'CT-e')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 60.472480000000000000
          Top = 18.897650000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Data')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 154.960730000000000000
          Top = 18.897650000000000000
          Width = 374.173470000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Remetente')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 533.134200000000000000
          Top = 18.897650000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Destinat'#225'rio')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 967.559680000000000000
          Top = 18.897650000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 876.850960000000000000
          Top = 18.897650000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Documento')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer: TfrxFooter
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 287.244280000000000000
        Width = 1046.929810000000000000
        object Memo12: TfrxMemoView
          Left = 7.559060000000000000
          Width = 521.575140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Total de CT-e emitidas no periodo: [COUNT(Itens)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Left = 7.559060000000000000
          Width = 1031.811690000000000000
          Color = clBlack
          Diagonal = True
        end
      end
    end
  end
  object FRDataSetCTe: TfrxDBDataset
    UserName = 'CTe'
    CloseDataSource = False
    DataSet = qConsulta
    BCDToCurrency = False
    Left = 157
    Top = 4
  end
  object FRDataSetEmpresa: TfrxDBDataset
    UserName = 'Empresa'
    CloseDataSource = False
    DataSet = Report.qEmpresa
    BCDToCurrency = False
    Left = 150
    Top = 158
  end
end
