inherited frmCadPedidoCompras: TfrmCadPedidoCompras
  Caption = 'Pedido de Compas'
  ClientHeight = 544
  ClientWidth = 915
  ExplicitWidth = 921
  ExplicitHeight = 573
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 509
    Width = 915
    ExplicitTop = 509
    ExplicitWidth = 915
    inherited btnCancelar: TButton
      Left = 638
      ExplicitLeft = 638
    end
    inherited btnSalvar: TButton
      Left = 731
      ExplicitLeft = 731
    end
    inherited btnFechar: TButton
      Left = 824
      ExplicitLeft = 824
    end
  end
  inherited grpContent: TGroupBox
    Width = 905
    Height = 458
    ExplicitWidth = 905
    ExplicitHeight = 458
    object lblCodigo: TLabel
      Left = 10
      Top = 24
      Width = 41
      Height = 15
      Caption = 'C'#243'digo:'
      FocusControl = edtCodigo
    end
    object Label1: TLabel
      Left = 111
      Top = 24
      Width = 65
      Height = 15
      Caption = 'Fornecedor:'
      FocusControl = edtfornecedor
    end
    object Label2: TLabel
      Left = 10
      Top = 53
      Width = 81
      Height = 15
      Caption = 'Representante:'
      FocusControl = edtrepresentante
    end
    object Label4: TLabel
      Left = 492
      Top = 53
      Width = 91
      Height = 15
      Caption = 'Data da compra:'
      FocusControl = edtdata_compra
    end
    object Label3: TLabel
      Left = 10
      Top = 82
      Width = 111
      Height = 15
      Caption = 'Previs'#227'o de Entrega:'
      FocusControl = edtprevisao_entrega
    end
    object Label5: TLabel
      Left = 623
      Top = 24
      Width = 87
      Height = 15
      Caption = 'Data do pedido:'
      FocusControl = edtdata_pedido
    end
    object Label6: TLabel
      Left = 233
      Top = 82
      Width = 92
      Height = 15
      Caption = 'Data da entrada:'
      FocusControl = edtdata_entrada
    end
    object Label7: TLabel
      Left = 437
      Top = 82
      Width = 95
      Height = 15
      Caption = 'Status do pedido:'
    end
    object Label8: TLabel
      Left = 698
      Top = 53
      Width = 88
      Height = 15
      Caption = 'Total do pedido:'
      FocusControl = edttotal_pedido
    end
    object edtCodigo: TcxDBSpinEdit
      Left = 57
      Top = 21
      DataBinding.DataField = 'codigo'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      Style.Color = clBtnFace
      TabOrder = 0
      Width = 48
    end
    object edtfornecedor: TcxDBSpinEdit
      Left = 182
      Top = 21
      DataBinding.DataField = 'fornecedor'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 1
      OnEnter = grpContentEnter
      Width = 50
    end
    object cbbFornecedor: TcxDBLookupComboBox
      Left = 238
      Top = 21
      DataBinding.DataField = 'fornecedor'
      DataBinding.DataSource = ds
      Properties.KeyFieldNames = 'codigo'
      Properties.ListColumns = <
        item
          Caption = 'Fantasia'
          Width = 300
          FieldName = 'fantasia'
        end>
      Properties.ListSource = dsFornecedor
      TabOrder = 2
      Width = 379
    end
    object edtrepresentante: TcxDBSpinEdit
      Left = 97
      Top = 50
      DataBinding.DataField = 'representante'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 4
      OnEnter = grpContentEnter
      Width = 50
    end
    object cbbRepresentante: TcxDBLookupComboBox
      Left = 153
      Top = 50
      DataBinding.DataField = 'representante'
      DataBinding.DataSource = ds
      Properties.KeyFieldNames = 'codigo'
      Properties.ListColumns = <
        item
          Caption = 'Nome'
          Width = 300
          FieldName = 'nome'
        end>
      Properties.ListSource = dsRepresentante
      TabOrder = 5
      OnEnter = grpContentEnter
      Width = 333
    end
    object edtdata_compra: TcxDBDateEdit
      Left = 589
      Top = 50
      DataBinding.DataField = 'data_compra'
      DataBinding.DataSource = ds
      TabOrder = 6
      OnEnter = grpContentEnter
      Width = 100
    end
    object edtprevisao_entrega: TcxDBDateEdit
      Left = 127
      Top = 79
      DataBinding.DataField = 'previsao_entrega'
      DataBinding.DataSource = ds
      TabOrder = 8
      OnEnter = grpContentEnter
      Width = 100
    end
    object grpObservacao: TGroupBox
      AlignWithMargins = True
      Left = 8
      Top = 363
      Width = 889
      Height = 87
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alBottom
      Caption = ' Observa'#231#245'es '
      TabOrder = 12
      object mmoobservacao: TcxDBMemo
        AlignWithMargins = True
        Left = 5
        Top = 20
        Align = alClient
        DataBinding.DataField = 'observacao'
        DataBinding.DataSource = ds
        Properties.CharCase = ecUpperCase
        TabOrder = 0
        OnEnter = grpContentEnter
        Height = 62
        Width = 879
      end
    end
    object edtdata_pedido: TcxDBDateEdit
      Left = 716
      Top = 21
      DataBinding.DataField = 'data_pedido'
      DataBinding.DataSource = ds
      TabOrder = 3
      Width = 176
    end
    object edtdata_entrada: TcxDBDateEdit
      Left = 331
      Top = 79
      DataBinding.DataField = 'data_entrada'
      DataBinding.DataSource = ds
      TabOrder = 9
      Width = 100
    end
    object cbbstatus: TcxDBImageComboBox
      Left = 538
      Top = 79
      DataBinding.DataField = 'status'
      DataBinding.DataSource = ds
      Properties.Alignment.Horz = taLeftJustify
      Properties.Items = <
        item
          Description = '-'
          ImageIndex = 0
        end
        item
          Description = 'PENDENTE'
          Value = 'P'
        end
        item
          Description = 'CANCELADO'
          Value = 'C'
        end
        item
          Description = 'ADQUIRIDO'
          Value = 'A'
        end
        item
          Description = 'ADQUIRIDO PARCIALMENTE'
          Value = 'AP'
        end>
      TabOrder = 10
      Width = 354
    end
    object grpProdutos: TGroupBox
      AlignWithMargins = True
      Left = 8
      Top = 104
      Width = 889
      Height = 250
      Margins.Left = 6
      Margins.Right = 6
      Align = alBottom
      Caption = ' Produtos relacionados '
      TabOrder = 11
      object Grid: TcxGrid
        AlignWithMargins = True
        Left = 8
        Top = 20
        Width = 839
        Height = 222
        Margins.Left = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object View: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsItens
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Indicator = True
          Styles.Header = StyleHeader
          object ColumnID: TcxGridDBColumn
            Caption = '#ID'
            DataBinding.FieldName = 'codigo'
            Width = 50
          end
          object ColumnProduto: TcxGridDBColumn
            Caption = 'Produto'
            DataBinding.FieldName = 'produto'
            Width = 300
          end
          object ColumnQuantidade: TcxGridDBColumn
            Caption = 'Quantidade'
            DataBinding.FieldName = 'quantidade'
            Width = 80
          end
          object ColumnTotal: TcxGridDBColumn
            Caption = 'Total'
            DataBinding.FieldName = 'valor_total'
            Width = 80
          end
          object ColumnEntregue: TcxGridDBColumn
            Caption = 'Entregue'
            DataBinding.FieldName = 'entrada'
            Width = 80
          end
          object ColumnCancelado: TcxGridDBColumn
            Caption = 'Cancelado'
            DataBinding.FieldName = 'cancelado'
            Width = 60
          end
        end
        object Master: TcxGridLevel
          GridView = View
        end
      end
      object pnlACT: TPanel
        Left = 853
        Top = 17
        Width = 34
        Height = 231
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          34
          231)
        object btnADD: TButton
          Left = 0
          Top = 3
          Width = 27
          Height = 27
          Anchors = [akTop, akRight]
          HotImageIndex = 3
          ImageIndex = 3
          ImageMargins.Left = 2
          Images = ImageList16
          TabOrder = 0
          OnClick = btnADDClick
        end
        object btnEDT: TButton
          Left = 0
          Top = 36
          Width = 27
          Height = 27
          Anchors = [akTop, akRight]
          HotImageIndex = 9
          ImageIndex = 9
          ImageMargins.Left = 2
          Images = ImageList16
          TabOrder = 1
          OnClick = btnEDTClick
        end
        object btnRMV: TButton
          Left = 0
          Top = 69
          Width = 27
          Height = 27
          Anchors = [akTop, akRight]
          HotImageIndex = 4
          ImageIndex = 4
          ImageMargins.Left = 2
          Images = ImageList16
          TabOrder = 2
          OnClick = btnRMVClick
        end
      end
    end
    object edttotal_pedido: TcxDBCurrencyEdit
      Left = 792
      Top = 50
      DataBinding.DataField = 'total_pedido'
      DataBinding.DataSource = ds
      Properties.ReadOnly = True
      TabOrder = 7
      Width = 100
    end
  end
  inherited pnlHelp: TPanel
    Width = 906
    ExplicitWidth = 906
    inherited mmoHelp: TMemo
      Width = 859
    end
  end
  inherited ds: TUniDataSource
    Left = 192
    Top = 464
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO pedido_compras'
      
        '  (empresa, fornecedor, representante, data_pedido, previsao_ent' +
        'rega, data_compra, data_entrada, status, observacao, total_pedid' +
        'o)'
      'VALUES'
      
        '  (:empresa, :fornecedor, :representante, :data_pedido, :previsa' +
        'o_entrega, :data_compra, :data_entrada, :status, :observacao, :t' +
        'otal_pedido)')
    SQLDelete.Strings = (
      'DELETE FROM pedido_compras'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE pedido_compras'
      'SET'
      
        '  empresa = :empresa, fornecedor = :fornecedor, representante = ' +
        ':representante, data_pedido = :data_pedido, previsao_entrega = :' +
        'previsao_entrega, data_compra = :data_compra, data_entrada = :da' +
        'ta_entrada, status = :status, observacao = :observacao, total_pe' +
        'dido = :total_pedido'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM pedido_compras'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT empresa, fornecedor, representante, data_pedido, previsao' +
        '_entrega, data_compra, data_entrada, status, observacao, total_p' +
        'edido FROM pedido_compras'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM pedido_compras'
      ''
      ') t')
    SQL.Strings = (
      'SELECT codigo,'
      '        empresa,'
      '        fornecedor,'
      '        representante,'
      '        data_pedido,'
      '        previsao_entrega,'
      '        data_compra,'
      '        data_entrada,'
      '        status,'
      '        observacao,'
      '        total_pedido'
      '   FROM pedido_compras'
      '  WHERE codigo = :codigo;')
    Left = 152
    Top = 464
    object qConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qConsultaempresa: TIntegerField
      FieldName = 'empresa'
    end
    object qConsultafornecedor: TIntegerField
      FieldName = 'fornecedor'
      Required = True
    end
    object qConsultarepresentante: TIntegerField
      FieldName = 'representante'
    end
    object qConsultadata_pedido: TDateTimeField
      FieldName = 'data_pedido'
      Required = True
    end
    object qConsultaprevisao_entrega: TDateField
      FieldName = 'previsao_entrega'
    end
    object qConsultadata_compra: TDateField
      FieldName = 'data_compra'
    end
    object qConsultadata_entrada: TDateField
      FieldName = 'data_entrada'
    end
    object qConsultastatus: TStringField
      FieldName = 'status'
      Size = 2
    end
    object qConsultaobservacao: TMemoField
      FieldName = 'observacao'
      BlobType = ftMemo
    end
    object qConsultatotal_pedido: TCurrencyField
      FieldName = 'total_pedido'
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 30408812
  end
  object qRepresentante: TUniQuery
    Tag = 7000
    SQLInsert.Strings = (
      'INSERT INTO pedido_compras'
      
        '  (empresa, fornecedor, representante, data_pedido, previsao_ent' +
        'rega, data_compra, data_entrada, status)'
      'VALUES'
      
        '  (:empresa, :fornecedor, :representante, :data_pedido, :previsa' +
        'o_entrega, :data_compra, :data_entrada, :status)')
    SQLDelete.Strings = (
      'DELETE FROM pedido_compras'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE pedido_compras'
      'SET'
      
        '  empresa = :empresa, fornecedor = :fornecedor, representante = ' +
        ':representante, data_pedido = :data_pedido, previsao_entrega = :' +
        'previsao_entrega, data_compra = :data_compra, data_entrada = :da' +
        'ta_entrada, status = :status'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM pedido_compras'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT empresa, fornecedor, representante, data_pedido, previsao' +
        '_entrega, data_compra, data_entrada, status FROM pedido_compras'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM pedido_compras'
      ''
      ') t')
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT codigo, nome, fantasia, cnpj'
      '  FROM pessoas where inativo = false and representante = true')
    Left = 152
    Top = 197
  end
  object dsRepresentante: TUniDataSource
    DataSet = qRepresentante
    Left = 192
    Top = 197
  end
  object qFornecedor: TUniQuery
    Tag = 7000
    SQLInsert.Strings = (
      'INSERT INTO pedido_compras'
      
        '  (empresa, fornecedor, representante, data_pedido, previsao_ent' +
        'rega, data_compra, data_entrada, status)'
      'VALUES'
      
        '  (:empresa, :fornecedor, :representante, :data_pedido, :previsa' +
        'o_entrega, :data_compra, :data_entrada, :status)')
    SQLDelete.Strings = (
      'DELETE FROM pedido_compras'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE pedido_compras'
      'SET'
      
        '  empresa = :empresa, fornecedor = :fornecedor, representante = ' +
        ':representante, data_pedido = :data_pedido, previsao_entrega = :' +
        'previsao_entrega, data_compra = :data_compra, data_entrada = :da' +
        'ta_entrada, status = :status'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM pedido_compras'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT empresa, fornecedor, representante, data_pedido, previsao' +
        '_entrega, data_compra, data_entrada, status FROM pedido_compras'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM pedido_compras'
      ''
      ') t')
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT codigo, nome, fantasia, cnpj'
      '  FROM pessoas where inativo = false and fornecedor = true')
    Left = 368
    Top = 197
  end
  object dsFornecedor: TUniDataSource
    DataSet = qFornecedor
    Left = 408
    Top = 197
  end
  object StyleRepository: TcxStyleRepository
    Left = 174
    Top = 247
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
      Font.Style = [fsBold]
    end
    object StyleItemAtivo: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
  end
  object qItens: TUniQuery
    Tag = 7100
    SQLDelete.Strings = (
      'DELETE FROM pedido_compra_itens'
      'WHERE'
      '  codigo = :Old_codigo')
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT pci.codigo, '
      #9'pci.pedido, '
      #9'pd.nome as produto, '
      #9'pci.valor_unitario, '
      #9'pci.quantidade, '
      #9'pci.valor_total, '
      #9'pci.entrada, '
      #9'pci.cancelado'
      '   FROM pedido_compra_itens pci'
      '   LEFT JOIN produtos pd on pd.codigo = pci.produto'
      '  WHERE pci.pedido = :codigo;')
    MasterSource = ds
    MasterFields = 'codigo'
    DetailFields = 'pedido'
    AfterRefresh = qItensAfterRefresh
    Left = 496
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = 0
      end>
  end
  object dsItens: TUniDataSource
    DataSet = qItens
    Left = 536
    Top = 232
  end
  object qSQL: TUniQuery
    Connection = Connection.Conn
    SQL.Strings = (
      'select calc_pedido_compras(:pedido);')
    Left = 264
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pedido'
        ParamType = ptInput
        Value = nil
      end>
  end
end
