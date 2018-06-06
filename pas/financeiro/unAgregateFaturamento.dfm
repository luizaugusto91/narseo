inherited frmAgregateFaturamento: TfrmAgregateFaturamento
  Caption = 'Financeiro: Gerar faturamento'
  ClientWidth = 950
  ExplicitWidth = 966
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlHelp: TPanel
    Width = 941
    ExplicitWidth = 941
    inherited mmoHelp: TMemo
      Width = 894
      ExplicitWidth = 894
    end
  end
  inherited pnlBotton: TPanel
    Width = 950
    ExplicitWidth = 950
    inherited btnCancelar: TButton
      Left = 766
      OnClick = btnCancelarClick
      ExplicitLeft = 766
    end
    inherited btnAvancar: TButton
      Left = 859
      OnClick = btnAvancarClick
      ExplicitLeft = 859
    end
  end
  inherited grpFiltro: TGroupBox
    Width = 940
    Height = 53
    Margins.Bottom = 3
    ExplicitWidth = 940
    ExplicitHeight = 53
    object lbl3: TLabel
      Left = 10
      Top = 24
      Width = 39
      Height = 15
      Caption = 'Cliente:'
      FocusControl = edtcliente
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 524
      Top = 24
      Width = 62
      Height = 15
      Caption = 'Data inicial:'
      FocusControl = edtdatainicio
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl5: TLabel
      Left = 688
      Top = 24
      Width = 56
      Height = 15
      Caption = 'Data Final:'
      FocusControl = edtdatafinal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtcliente: TcxDBSpinEdit
      Left = 55
      Top = 21
      DataBinding.DataField = 'cliente'
      DataBinding.DataSource = dsInternal
      Properties.SpinButtons.Visible = False
      TabOrder = 0
      Width = 60
    end
    object edtdatainicio: TcxDBDateEdit
      Left = 592
      Top = 21
      DataBinding.DataField = 'datainicio'
      DataBinding.DataSource = dsInternal
      TabOrder = 2
      Width = 90
    end
    object edtdatafinal: TcxDBDateEdit
      Left = 750
      Top = 21
      DataBinding.DataField = 'datafinal'
      DataBinding.DataSource = dsInternal
      TabOrder = 3
      Width = 90
    end
    object btnFiltrar: TButton
      Left = 846
      Top = 19
      Width = 87
      Height = 27
      Hint = 
        'Salva o registro em altera'#231#227'o. '#13#10'Campos obrigat'#243'rios ser'#227'o exibi' +
        'dos antes de gravar as altera'#231#245'es.'
      Anchors = [akTop, akRight]
      Caption = 'Filtrar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      HotImageIndex = 10
      ImageIndex = 10
      ImageMargins.Left = 10
      Images = ImageList16
      ParentFont = False
      TabOrder = 4
      OnClick = btnFiltrarClick
    end
    object cbbcliente: TcxDBLookupComboBox
      Left = 121
      Top = 21
      DataBinding.DataField = 'cliente'
      DataBinding.DataSource = dsInternal
      Properties.KeyFieldNames = 'pessoa'
      Properties.ListColumns = <
        item
          Caption = 'Cliente'
          Width = 260
          FieldName = 'fantasia'
        end>
      Properties.ListSource = dsClientes
      TabOrder = 1
      Width = 397
    end
  end
  inherited Grid: TcxGrid
    Top = 111
    Width = 940
    Height = 354
    PopupMenu = pmOpcoes
    ExplicitTop = 111
    ExplicitWidth = 940
    ExplicitHeight = 354
    inherited View: TcxGridDBTableView
      OnCellDblClick = ViewCellDblClick
      OptionsData.Editing = True
      Styles.Content = StyleItemAtivo
      Styles.Header = StyleHeader
      object ColumnViewselecionado: TcxGridDBColumn
        Caption = 'Gerar'
        DataBinding.FieldName = 'gerar'
        Width = 50
      end
      object ColumnViewcodigo: TcxGridDBColumn
        Caption = '#ID'
        DataBinding.FieldName = 'codigo'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 60
      end
      object ColumnViewdata_registro: TcxGridDBColumn
        Caption = 'Data do registro'
        DataBinding.FieldName = 'registro'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object ColumnViewvencimento: TcxGridDBColumn
        Caption = 'Vencimento'
        DataBinding.FieldName = 'vencimento'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object ColumnViewvalor: TcxGridDBColumn
        Caption = 'Valor'
        DataBinding.FieldName = 'valor'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object ColumnViewdocumento: TcxGridDBColumn
        Caption = 'Documento'
        DataBinding.FieldName = 'documento'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object ColumnViewdescricao: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'descricao'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 160
      end
      object ColumnViewstatus: TcxGridDBColumn
        Caption = 'Status'
        DataBinding.FieldName = 'status'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            Description = 'Aberto'
            ImageIndex = 0
            Value = 'A'
          end>
        Properties.ReadOnly = True
        Width = 80
      end
      object ColumnViewnfe: TcxGridDBColumn
        Caption = 'DOC-e'
        DataBinding.FieldName = 'doc'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 80
      end
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited qConsulta: TUniQuery
    Tag = 0
    SQL.Strings = (
      'select cr.codigo,'
      #9'cr.data_registro,'
      #9'cr.vencimento,'
      #9'cr.valor,'
      #9'cr.documento,'
      #9'cr.descricao,'
      #9'cr.status,'
      #9'cr.nfe'
      '   from contas_receber cr '
      '  WHERE cr.status = '#39'A'#39
      '    AND fatura = FALSE'
      '    AND cr.pessoa = :pessoa'
      '    AND vencimento::date BETWEEN :datainicial AND :datafinal')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pessoa'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'datainicial'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'datafinal'
        ParamType = ptInput
        Value = nil
      end>
    object FieldConsultacodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
    end
    object qConsultadata_registro: TDateTimeField
      FieldName = 'data_registro'
    end
    object FieldConsultavencimento: TDateField
      FieldName = 'vencimento'
    end
    object FieldConsultavalor: TCurrencyField
      FieldName = 'valor'
      Required = True
    end
    object FieldConsultadocumento: TStringField
      FieldName = 'documento'
      Size = 15
    end
    object FieldConsultadescricao: TStringField
      FieldName = 'descricao'
      Size = 70
    end
    object FieldConsultastatus: TStringField
      FieldName = 'status'
      Size = 10
    end
    object FieldConsultanfe: TIntegerField
      FieldName = 'nfe'
    end
  end
  inherited ds: TUniDataSource
    DataSet = cdsreg
  end
  inherited cds: TClientDataSet
    object Fieldcdscliente: TIntegerField
      FieldName = 'cliente'
    end
    object Fieldcdsdatainicio: TDateField
      FieldName = 'datainicio'
    end
    object Fieldcdsdatafinal: TDateField
      FieldName = 'datafinal'
    end
  end
  object dsInternal: TDataSource
    DataSet = cds
    Left = 208
    Top = 328
  end
  object qClientes: TUniQuery
    Tag = 7000
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT cr.pessoa, '
      #9'ps.fantasia'
      '   FROM contas_receber cr '
      '   LEFT JOIN pessoas ps ON ps.codigo = cr.pessoa'
      '  WHERE cr.status = '#39'A'#39
      '  GROUP BY cr.pessoa, ps.fantasia'
      '  ORDER BY ps.fantasia ASC;')
    Left = 262
    Top = 279
  end
  object dsClientes: TUniDataSource
    DataSet = qClientes
    Left = 320
    Top = 280
  end
  object StyleRepository: TcxStyleRepository
    Left = 390
    Top = 279
    PixelsPerInch = 96
    object StyleHeader: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
    end
    object StyleItemInativo: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
    end
    object StyleItemAtivo: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clNavy
    end
    object StyleAberto: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object StyleCancelado: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clSilver
    end
    object StyleQuitado: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clGreen
    end
    object StyleParcial: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clTeal
    end
  end
  object cdsreg: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterClose = cdsregAfterClose
    BeforePost = cdsregBeforePost
    BeforeRefresh = cdsregBeforeRefresh
    Left = 264
    Top = 328
    object Fieldcdsreggerar: TBooleanField
      FieldName = 'gerar'
    end
    object Fieldcdsregcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object Fieldcdsregregistro: TDateField
      FieldName = 'registro'
    end
    object Fieldcdsregvencimento: TDateField
      FieldName = 'vencimento'
    end
    object Fieldcdsregvalor: TCurrencyField
      FieldName = 'valor'
    end
    object Fieldcdsregdocumento: TStringField
      FieldName = 'documento'
      Size = 250
    end
    object Fieldcdsregdescricao: TStringField
      FieldName = 'descricao'
      Size = 250
    end
    object Fieldcdsregstatus: TStringField
      FieldName = 'status'
      Size = 2
    end
    object Fieldcdsregdoc: TIntegerField
      FieldName = 'doc'
    end
  end
  object pmOpcoes: TPopupMenu
    OnPopup = pmOpcoesPopup
    Left = 536
    Top = 328
    object mniSelecionartodos1: TMenuItem
      Caption = 'Selecionar todos'
      OnClick = mniSelecionartodos1Click
    end
    object mniN1: TMenuItem
      Caption = '-'
    end
    object mniDesmarcartodos1: TMenuItem
      Caption = 'Desmarcar todos'
      OnClick = mniDesmarcartodos1Click
    end
  end
  object qSQL: TUniQuery
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT gera_faturamento(:pessoa,:total) as codigo;')
    Left = 320
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pessoa'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftFloat
        Name = 'total'
        ParamType = ptInput
        Value = nil
      end>
  end
  object qContas: TUniQuery
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT gera_faturamento(:pessoa,:total) as codigo;')
    Left = 392
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pessoa'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftFloat
        Name = 'total'
        ParamType = ptInput
        Value = nil
      end>
  end
  object qFaturamento: TUniQuery
    Connection = Connection.Conn
    SQL.Strings = (
      'select cr.* '
      '   from contas_receber cr'
      '  where cr.conta_original = :fatura'
      '  ORDER by codigo asc')
    Left = 470
    Top = 279
    ParamData = <
      item
        DataType = ftInteger
        Name = 'fatura'
        ParamType = ptInput
        Value = nil
      end>
  end
  object qDados: TUniQuery
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT * '
      '   from pessoas'
      '  WHERE codigo = :codigo;')
    Left = 470
    Top = 327
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = nil
      end>
  end
  object RepFaturamento: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42936.685900810200000000
    ReportOptions.LastChange = 43137.654850231480000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 680
    Top = 216
    Datasets = <
      item
        DataSet = FRDataSetDados
        DataSetName = 'Dados'
      end
      item
        DataSet = FRDataSetEmpresa
        DataSetName = 'Empresa'
      end
      item
        DataSet = FRDataSetFatura
        DataSetName = 'Fatura'
      end
      item
        DataSet = FRDataSetContas
        DataSetName = 'Faturamento'
      end
      item
        DataSet = FRDataSetParametros
        DataSetName = 'Parametros'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      HGuides.Strings = (
        '18,89765')
      VGuides.Strings = (
        '7,55906'
        '710,55164'
        '359,05535'
        '207,87415'
        '642,5201')
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 139.842610000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frxDBDataset1empresa: TfrxMemoView
          Left = 7.559060000000000000
          Top = 37.795300000000000000
          Width = 445.984540000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[Empresa."cnpj"] - [Empresa."nome"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object frxDBDataset1fantasia: TfrxMemoView
          Left = 7.559060000000000000
          Top = 56.692950000000000000
          Width = 445.984540000000000000
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
          Top = 75.590600000000000000
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
          Left = 7.559060000000000000
          Top = 94.488250000000000000
          Width = 445.984540000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'Bairro: [Empresa."bairro"] - Cidade: [Empresa."cidade"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object frxDBDataset1uf: TfrxMemoView
          Left = 7.559060000000000000
          Top = 113.385900000000000000
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
          Left = 529.134200000000000000
          Top = 37.795300000000000000
          Width = 181.417440000000000000
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
        object Memo1: TfrxMemoView
          Left = 7.559060000000000000
          Width = 702.992580000000000000
          Height = 26.456710000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'DETALHAMENTO DE FATURAMENTO')
          ParentFont = False
        end
      end
      object Rodape: TfrxPageFooter
        FillType = ftBrush
        Height = 15.118120000000000000
        Top = 578.268090000000000000
        Width = 718.110700000000000000
        object Page: TfrxMemoView
          Left = 302.362400000000000000
          Width = 113.385900000000000000
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
          Left = 434.645950000000000000
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
          Left = 18.897650000000000000
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
      object CLiente: TfrxMasterData
        FillType = ftBrush
        Height = 204.094620000000000000
        Top = 219.212740000000000000
        Width = 718.110700000000000000
        DataSet = FRDataSetDados
        DataSetName = 'Dados'
        RowCount = 0
        object Dadosfantasia: TfrxMemoView
          Left = 207.874150000000000000
          Top = 37.795300000000000000
          Width = 502.677490000000000000
          Height = 18.897650000000000000
          DataSet = FRDataSetDados
          DataSetName = 'Dados'
          Memo.UTF8W = (
            'Fantasia: [Dados."fantasia"]')
        end
        object Memo5: TfrxMemoView
          Left = 7.559060000000000000
          Width = 702.992580000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI Semibold'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'DADOS DO CLIENTE')
          ParentFont = False
        end
        object Dadosnome: TfrxMemoView
          Left = 207.874150000000000000
          Top = 18.897650000000000000
          Width = 502.677490000000000000
          Height = 18.897650000000000000
          DataSet = FRDataSetDados
          DataSetName = 'Dados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'Nome/Ras'#227'o Social: [Dados."nome"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Dadoscnpj: TfrxMemoView
          Left = 7.559060000000000000
          Top = 18.897650000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          DataSet = FRDataSetDados
          DataSetName = 'Dados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'CPF/CNPJ: [Dados."cnpj"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 7.559060000000000000
          Top = 37.795300000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          DataSet = FRDataSetDados
          DataSetName = 'Dados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'RG/IE: [Dados."ie"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Dadosendereco: TfrxMemoView
          Left = 7.559060000000000000
          Top = 56.692950000000000000
          Width = 559.370440000000000000
          Height = 18.897650000000000000
          DataSet = FRDataSetDados
          DataSetName = 'Dados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'Endere'#231'o: [Dados."endereco"] - [Dados."endereco_numero"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Dadoscep: TfrxMemoView
          Left = 570.709030000000000000
          Top = 56.692950000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataSet = FRDataSetDados
          DataSetName = 'Dados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'CEP: [Dados."cep"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Dadosbairro: TfrxMemoView
          Left = 7.559060000000000000
          Top = 75.590600000000000000
          Width = 351.496290000000000000
          Height = 18.897650000000000000
          DataSet = FRDataSetDados
          DataSetName = 'Dados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'Bairro: [Dados."bairro"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Dadoscidade: TfrxMemoView
          Left = 359.055350000000000000
          Top = 75.590600000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          DataSet = FRDataSetDados
          DataSetName = 'Dados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'Cidade: [Dados."cidade"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 642.520100000000000000
          Top = 75.590600000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataSet = FRDataSetDados
          DataSetName = 'Dados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'UF: [Dados."uf"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Dadostel1: TfrxMemoView
          Left = 7.559060000000000000
          Top = 94.488250000000000000
          Width = 351.496290000000000000
          Height = 18.897650000000000000
          DataSet = FRDataSetDados
          DataSetName = 'Dados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'Fone: [Dados."tel1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Dadosemail: TfrxMemoView
          Left = 359.055350000000000000
          Top = 94.488250000000000000
          Width = 351.496290000000000000
          Height = 18.897650000000000000
          DataSet = FRDataSetDados
          DataSetName = 'Dados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'E-mail: [Dados."email"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 7.559060000000000000
          Top = 166.299320000000000000
          Width = 702.992580000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI Semibold'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            '[Fatura."descricao"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 7.559060000000000000
          Top = 185.196970000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 15000804
          HAlign = haCenter
          Memo.UTF8W = (
            'Codigo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 56.692950000000000000
          Top = 185.196970000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 15000804
          HAlign = haCenter
          Memo.UTF8W = (
            'Documento')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 188.976500000000000000
          Top = 185.196970000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 15000804
          HAlign = haCenter
          Memo.UTF8W = (
            'Vencimento')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 302.362400000000000000
          Top = 185.196970000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 15000804
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 396.850650000000000000
          Top = 185.196970000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 15000804
          HAlign = haCenter
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 642.520100000000000000
          Top = 185.196970000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 15000804
          HAlign = haCenter
          Memo.UTF8W = (
            'DOC-e')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 7.559060000000000000
          Top = 120.944960000000000000
          Width = 702.992580000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI Semibold'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'DETALHES DA NOVA FATURA')
          ParentFont = False
        end
        object Faturacodigo: TfrxMemoView
          Left = 7.559060000000000000
          Top = 139.842610000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataSet = FRDataSetFatura
          DataSetName = 'Fatura'
          Memo.UTF8W = (
            'ID: [Fatura."codigo"]')
        end
        object Faturavalor_original: TfrxMemoView
          Left = 117.165430000000000000
          Top = 139.842610000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          DataSet = FRDataSetFatura
          DataSetName = 'Fatura'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Memo.UTF8W = (
            'Valor: [Fatura."valor"]')
        end
        object Faturadocumento: TfrxMemoView
          Left = 268.346630000000000000
          Top = 139.842610000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          DataSet = FRDataSetFatura
          DataSetName = 'Fatura'
          Memo.UTF8W = (
            'Documento: [Fatura."documento"]')
        end
        object Faturavencimento: TfrxMemoView
          Left = 570.709030000000000000
          Top = 139.842610000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataSet = FRDataSetFatura
          DataSetName = 'Fatura'
          Memo.UTF8W = (
            'Vencimento: [Fatura."vencimento"]')
        end
      end
      object Faturas: TfrxDetailData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 445.984540000000000000
        Width = 718.110700000000000000
        DataSet = FRDataSetContas
        DataSetName = 'Faturamento'
        RowCount = 0
        object Faturamentocodigo: TfrxMemoView
          Left = 7.559060000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'codigo'
          DataSet = FRDataSetContas
          DataSetName = 'Faturamento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Faturamento."codigo"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Faturamentodocumento: TfrxMemoView
          Left = 56.692950000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DataField = 'documento'
          DataSet = FRDataSetContas
          DataSetName = 'Faturamento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Faturamento."documento"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Faturamentovencimento: TfrxMemoView
          Left = 188.976500000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'vencimento'
          DataSet = FRDataSetContas
          DataSetName = 'Faturamento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Faturamento."vencimento"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Faturamentovalor_original: TfrxMemoView
          Left = 302.362400000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'valor_original'
          DataSet = FRDataSetContas
          DataSetName = 'Faturamento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Faturamento."valor_original"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Faturamentodescricao: TfrxMemoView
          Left = 396.850650000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          DataField = 'descricao'
          DataSet = FRDataSetContas
          DataSetName = 'Faturamento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Faturamento."descricao"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Faturamentonfe: TfrxMemoView
          Left = 642.520100000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataField = 'nfe'
          DataSet = FRDataSetContas
          DataSetName = 'Faturamento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Faturamento."nfe"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 487.559370000000000000
        Width = 718.110700000000000000
        object Line1: TfrxLineView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 702.992580000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo15: TfrxMemoView
          Left = 7.559060000000000000
          Top = 7.559060000000000000
          Width = 351.496290000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Total de registros processados: [COUNT(Faturas)].')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 359.055350000000000000
          Top = 7.559060000000000000
          Width = 351.496290000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor total do Faturamento: [SUM(<Faturamento."valor">,Faturas)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object FRDataSetContas: TfrxDBDataset
    UserName = 'Faturamento'
    CloseDataSource = False
    DataSet = qFaturamento
    BCDToCurrency = False
    Left = 768
    Top = 264
  end
  object FRDataSetDados: TfrxDBDataset
    UserName = 'Dados'
    CloseDataSource = False
    DataSet = qDados
    BCDToCurrency = False
    Left = 768
    Top = 216
  end
  object FRDataSetParametros: TfrxDBDataset
    UserName = 'Parametros'
    CloseDataSource = False
    DataSet = cds
    BCDToCurrency = False
    Left = 680
    Top = 264
  end
  object FRDataSetEmpresa: TfrxDBDataset
    UserName = 'Empresa'
    CloseDataSource = False
    DataSet = qEmpresa
    BCDToCurrency = False
    Left = 678
    Top = 318
  end
  object qEmpresa: TUniQuery
    Tag = 7000
    SQLInsert.Strings = (
      'INSERT INTO pessoas'
      
        '  (empresa, datacadastro, nome, fantasia, nomereduzido, tipopess' +
        'oa, cnpj, ie, im, datanascimento, sexo, endereco, endereco_numer' +
        'o, complemento, referencia, bairro, cep, cidade, uf, pais, tel1,' +
        ' tel2, tel3, email, site, obs, alerta, cliente, colaborador, for' +
        'necedor, representante, transportadora, inativo)'
      'VALUES'
      
        '  (:empresa, :datacadastro, :nome, :fantasia, :nomereduzido, :ti' +
        'popessoa, :cnpj, :ie, :im, :datanascimento, :sexo, :endereco, :e' +
        'ndereco_numero, :complemento, :referencia, :bairro, :cep, :cidad' +
        'e, :uf, :pais, :tel1, :tel2, :tel3, :email, :site, :obs, :alerta' +
        ', :cliente, :colaborador, :fornecedor, :representante, :transpor' +
        'tadora, :inativo)')
    SQLDelete.Strings = (
      'DELETE FROM pessoas'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE pessoas'
      'SET'
      
        '  empresa = :empresa, datacadastro = :datacadastro, nome = :nome' +
        ', fantasia = :fantasia, nomereduzido = :nomereduzido, tipopessoa' +
        ' = :tipopessoa, cnpj = :cnpj, ie = :ie, im = :im, datanascimento' +
        ' = :datanascimento, sexo = :sexo, endereco = :endereco, endereco' +
        '_numero = :endereco_numero, complemento = :complemento, referenc' +
        'ia = :referencia, bairro = :bairro, cep = :cep, cidade = :cidade' +
        ', uf = :uf, pais = :pais, tel1 = :tel1, tel2 = :tel2, tel3 = :te' +
        'l3, email = :email, site = :site, obs = :obs, alerta = :alerta, ' +
        'cliente = :cliente, colaborador = :colaborador, fornecedor = :fo' +
        'rnecedor, representante = :representante, transportadora = :tran' +
        'sportadora, inativo = :inativo'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM pessoas'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT empresa, datacadastro, nome, fantasia, nomereduzido, tipo' +
        'pessoa, cnpj, ie, im, datanascimento, sexo, endereco, endereco_n' +
        'umero, complemento, referencia, bairro, cep, cidade, uf, pais, t' +
        'el1, tel2, tel3, email, site, obs, alerta, cliente, colaborador,' +
        ' fornecedor, representante, transportadora, inativo FROM pessoas'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM pessoas'
      ''
      ') t')
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT '#9'ps.codigo, '
      #9'ps.empresa, '
      #9'ps.datacadastro, '
      #9'ps.nome, '
      #9'ps.fantasia, '
      #9'ps.nomereduzido, '
      #9'ps.tipopessoa, '
      
        #9'regexp_replace(ps.cnpj,'#39'(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})'#39','#39'\' +
        '1.\2.\3/\4-\5'#39')::CHARACTER VARYING(20) as cnpj,'
      #9'ps.ie, '
      #9'ps.im, '
      #9'ps.datanascimento, '
      #9'ps.sexo, '
      #9'ps.endereco,'
      #9'ps.endereco_numero,'
      #9'ps.complemento,'
      #9'ps.referencia,'
      #9'ps.bairro,'
      #9'ps.cep,'
      #9'cd.cidade,'
      #9'ps.uf,'
      #9'ps.pais,'
      #9'ps.tel1,'
      #9'ps.tel2,'
      #9'ps.tel3,'
      #9'ps.email,'
      #9'ps.site,'
      #9'ps.obs,'
      #9'ps.alerta,'
      #9'ps.cliente,'
      #9'ps.colaborador,'
      #9'ps.fornecedor,'
      #9'ps.representante,'
      #9'ps.transportadora,'
      #9'ps.inativo'
      '  FROM pessoas ps'
      '  LEFT JOIN cidades cd on cd.codigo = ps.cidade'
      ' WHERE ps.codigo = :codigo;')
    Left = 536
    Top = 277
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = 1
      end>
    object FieldEmpresacodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
    end
    object FieldEmpresaempresa: TIntegerField
      FieldName = 'empresa'
    end
    object FieldEmpresanome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 250
    end
    object FieldEmpresafantasia: TStringField
      DisplayLabel = 'Fantasia'
      FieldName = 'fantasia'
      Required = True
      Size = 250
    end
    object FieldEmpresanomereduzido: TStringField
      DisplayLabel = 'Nome Reduzido'
      FieldName = 'nomereduzido'
      Size = 30
    end
    object FieldEmpresatipopessoa: TIntegerField
      DisplayLabel = 'Tipo de Pessoa'
      FieldName = 'tipopessoa'
      Required = True
    end
    object FieldEmpresacnpj: TStringField
      DisplayLabel = 'CNPJ/CPF'
      FieldName = 'cnpj'
      Required = True
    end
    object FieldEmpresaie: TStringField
      DisplayLabel = 'IE/RG'
      FieldName = 'ie'
      Required = True
      Size = 50
    end
    object FieldEmpresaim: TStringField
      FieldName = 'im'
      Size = 50
    end
    object FieldEmpresaendereco: TStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'endereco'
      Required = True
      Size = 250
    end
    object FieldEmpresaendereco_numero: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'endereco_numero'
      Required = True
      FixedChar = True
    end
    object FieldEmpresacomplemento: TStringField
      FieldName = 'complemento'
      Size = 100
    end
    object FieldEmpresareferencia: TStringField
      FieldName = 'referencia'
      Size = 150
    end
    object FieldEmpresabairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Required = True
      Size = 200
    end
    object FieldEmpresacep: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      Required = True
      EditMask = '00000\-999;0;_'
      Size = 15
    end
    object FieldEmpresauf: TStringField
      DisplayLabel = 'UF'
      FieldName = 'uf'
      Required = True
      Size = 2
    end
    object FieldEmpresatel1: TStringField
      FieldName = 'tel1'
      EditMask = '!\(99\) 0000-00000;0;_'
    end
    object FieldEmpresatel2: TStringField
      FieldName = 'tel2'
      EditMask = '!\(99\) 0000-00000;0;_'
    end
    object FieldEmpresatel3: TStringField
      FieldName = 'tel3'
      EditMask = '!\(99\) 0000-00000;0;_'
    end
    object FieldEmpresaemail: TStringField
      FieldName = 'email'
      Size = 60
    end
    object FieldEmpresasite: TStringField
      FieldName = 'site'
      Size = 60
    end
    object FieldEmpresacidade: TStringField
      FieldName = 'cidade'
      ReadOnly = True
      Required = True
      Size = 75
    end
  end
  object qFatura: TUniQuery
    Connection = Connection.Conn
    SQL.Strings = (
      'select cr.* '
      '   from contas_receber cr'
      '  where cr.codigo = :fatura')
    Left = 470
    Top = 383
    ParamData = <
      item
        DataType = ftInteger
        Name = 'fatura'
        ParamType = ptInput
        Value = nil
      end>
  end
  object FRDataSetFatura: TfrxDBDataset
    UserName = 'Fatura'
    CloseDataSource = False
    DataSet = qFatura
    BCDToCurrency = False
    Left = 768
    Top = 318
  end
end
