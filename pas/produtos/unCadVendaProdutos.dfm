inherited frmCadVendaProdutos: TfrmCadVendaProdutos
  Caption = 'Pedido de vendas -> Produtos'
  ClientHeight = 230
  ClientWidth = 665
  ExplicitWidth = 671
  ExplicitHeight = 259
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 195
    Width = 665
    ExplicitTop = 195
    ExplicitWidth = 665
    inherited btnCancelar: TButton
      Left = 388
      ExplicitLeft = 388
    end
    inherited btnSalvar: TButton
      Left = 481
      ExplicitLeft = 481
    end
    inherited btnFechar: TButton
      Left = 574
      ExplicitLeft = 574
    end
  end
  inherited grpContent: TGroupBox
    Width = 655
    Height = 143
    ExplicitWidth = 655
    ExplicitHeight = 143
    object lblCodigo: TLabel
      Left = 10
      Top = 24
      Width = 41
      Height = 15
      Caption = 'C'#243'digo:'
      FocusControl = edtCodigo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 111
      Top = 24
      Width = 46
      Height = 15
      Caption = 'Produto:'
      FocusControl = edtproduto
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 10
      Top = 53
      Width = 74
      Height = 15
      Caption = 'Valor unit'#225'rio:'
      FocusControl = edtvalor_unitario
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 483
      Top = 53
      Width = 65
      Height = 15
      Caption = 'Quantidade:'
      FocusControl = edtquantidade
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 365
      Top = 82
      Width = 59
      Height = 15
      Caption = 'Valor Total:'
      FocusControl = edtvalor_total
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 10
      Top = 111
      Width = 115
      Height = 15
      Caption = 'Quantidade entregue:'
      FocusControl = edtentregue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 176
      Top = 53
      Width = 64
      Height = 15
      Caption = 'Acrescimos:'
      FocusControl = edtacrescimo_unitario
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 332
      Top = 53
      Width = 59
      Height = 15
      Caption = 'Descontos:'
      FocusControl = edtdesconto_unitario
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbldesconto_total: TLabel
      Left = 190
      Top = 82
      Width = 83
      Height = 15
      Caption = 'Desconto Total:'
      FocusControl = edtdesconto_total
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblacrescimo_total: TLabel
      Left = 10
      Top = 82
      Width = 88
      Height = 15
      Caption = 'Acrescimo Total:'
      FocusControl = edtacrescimo_total
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblvalor_entregue: TLabel
      Left = 237
      Top = 111
      Width = 156
      Height = 15
      Caption = 'Valor total de itens entregues:'
      FocusControl = edtvalor_entregue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCodigo: TcxDBSpinEdit
      Left = 57
      Top = 21
      DataBinding.DataField = 'codigo'
      DataBinding.DataSource = ds
      Enabled = False
      Properties.SpinButtons.Visible = False
      Style.Color = clBtnFace
      TabOrder = 0
      Width = 48
    end
    object edtproduto: TcxDBSpinEdit
      Left = 163
      Top = 21
      DataBinding.DataField = 'produto'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 1
      OnEnter = grpContentEnter
      OnExit = edtprodutoExit
      OnKeyPress = edtprodutoKeyPress
      Width = 50
    end
    object edtvalor_unitario: TcxDBCurrencyEdit
      Left = 90
      Top = 50
      DataBinding.DataField = 'valor_unitario'
      DataBinding.DataSource = ds
      TabOrder = 3
      OnEnter = grpContentEnter
      Width = 80
    end
    object edtquantidade: TcxDBSpinEdit
      Left = 554
      Top = 50
      DataBinding.DataField = 'quantidade'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 6
      OnEnter = grpContentEnter
      OnExit = edtquantidadeExit
      Width = 89
    end
    object edtvalor_total: TcxDBCurrencyEdit
      Left = 430
      Top = 79
      DataBinding.DataField = 'valor_total'
      DataBinding.DataSource = ds
      TabOrder = 9
      OnEnter = grpContentEnter
      OnExit = grpContentExit
      Width = 100
    end
    object edtentregue: TcxDBSpinEdit
      Left = 131
      Top = 108
      DataBinding.DataField = 'entregue'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 11
      OnEnter = grpContentEnter
      OnExit = edtentregueExit
      Width = 100
    end
    object cbbProduto: TcxDBLookupComboBox
      Left = 219
      Top = 21
      DataBinding.DataField = 'produto'
      DataBinding.DataSource = ds
      Properties.KeyFieldNames = 'codigo'
      Properties.ListColumns = <
        item
          Caption = 'Descri'#231#227'o'
          Width = 300
          FieldName = 'nome'
        end>
      Properties.ListSource = dsProduto
      TabOrder = 2
      OnEnter = grpContentEnter
      OnExit = edtprodutoExit
      Width = 424
    end
    object edtacrescimo_unitario: TcxDBCurrencyEdit
      Left = 246
      Top = 50
      DataBinding.DataField = 'acrescimo_unitario'
      DataBinding.DataSource = ds
      TabOrder = 4
      OnEnter = grpContentEnter
      OnExit = edtacrescimo_unitarioExit
      Width = 80
    end
    object edtdesconto_unitario: TcxDBCurrencyEdit
      Left = 397
      Top = 50
      DataBinding.DataField = 'desconto_unitario'
      DataBinding.DataSource = ds
      TabOrder = 5
      OnEnter = grpContentEnter
      OnExit = edtdesconto_unitarioExit
      Width = 80
    end
    object edtdesconto_total: TcxDBCurrencyEdit
      Left = 279
      Top = 79
      DataBinding.DataField = 'desconto_total'
      DataBinding.DataSource = ds
      TabOrder = 8
      OnExit = edtdesconto_totalExit
      Width = 80
    end
    object edtacrescimo_total: TcxDBCurrencyEdit
      Left = 104
      Top = 79
      DataBinding.DataField = 'acrescimo_total'
      DataBinding.DataSource = ds
      TabOrder = 7
      OnExit = edtacrescimo_totalExit
      Width = 80
    end
    object cbbCancelado: TcxDBCheckBox
      Left = 536
      Top = 79
      Caption = 'Cancelado'
      DataBinding.DataField = 'cancelado'
      DataBinding.DataSource = ds
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI Semibold'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 10
      Width = 106
    end
    object edtvalor_entregue: TcxDBCurrencyEdit
      Left = 399
      Top = 108
      DataBinding.DataField = 'valor_entregue'
      DataBinding.DataSource = ds
      TabOrder = 12
      OnExit = grpContentExit
      Width = 121
    end
  end
  inherited pnlHelp: TPanel
    Width = 656
    ExplicitWidth = 656
    inherited mmoHelp: TMemo
      Width = 609
      ExplicitWidth = 609
    end
  end
  inherited ds: TUniDataSource
    Left = 256
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO venda_itens'
      
        '  (venda, item_pedido, produto, valor_unitario, desconto_unitari' +
        'o, acrescimo_unitario, quantidade, desconto_total, acrescimo_tot' +
        'al, valor_total, entregue, cancelado, valor_entregue)'
      'VALUES'
      
        '  (:venda, :item_pedido, :produto, :valor_unitario, :desconto_un' +
        'itario, :acrescimo_unitario, :quantidade, :desconto_total, :acre' +
        'scimo_total, :valor_total, :entregue, :cancelado, :valor_entregu' +
        'e)')
    SQLDelete.Strings = (
      'DELETE FROM venda_itens'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE venda_itens'
      'SET'
      
        '  valor_unitario = :valor_unitario, desconto_unitario = :descont' +
        'o_unitario, acrescimo_unitario = :acrescimo_unitario, quantidade' +
        ' = :quantidade, desconto_total = :desconto_total, acrescimo_tota' +
        'l = :acrescimo_total, valor_total = :valor_total, entregue = :en' +
        'tregue, cancelado = :cancelado, valor_entregue = :valor_entregue'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM venda_itens'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT venda, item_pedido, produto, valor_unitario, desconto_uni' +
        'tario, acrescimo_unitario, quantidade, desconto_total, acrescimo' +
        '_total, valor_total, entregue, cancelado, valor_entregue FROM ve' +
        'nda_itens'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM venda_itens'
      ''
      ') t')
    SQL.Strings = (
      'SELECT codigo, '
      #9'venda, '
      #9'item_pedido, '
      #9'produto, '
      #9'valor_unitario, '
      #9'desconto_unitario, '
      #9'acrescimo_unitario, '
      #9'quantidade, '
      #9'desconto_total, '
      #9'acrescimo_total, '
      #9'valor_total, '
      #9'entregue, '
      #9'valor_entregue,'
      #9'cancelado'
      '   FROM venda_itens'
      '  WHERE codigo = :codigo;')
    Left = 216
    object qConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qConsultavenda: TIntegerField
      FieldName = 'venda'
      Required = True
    end
    object qConsultaitem_pedido: TIntegerField
      FieldName = 'item_pedido'
    end
    object qConsultaproduto: TIntegerField
      FieldName = 'produto'
      Required = True
    end
    object qConsultavalor_unitario: TCurrencyField
      FieldName = 'valor_unitario'
    end
    object qConsultadesconto_unitario: TCurrencyField
      FieldName = 'desconto_unitario'
    end
    object qConsultaacrescimo_unitario: TCurrencyField
      FieldName = 'acrescimo_unitario'
    end
    object qConsultaquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
    end
    object qConsultadesconto_total: TCurrencyField
      FieldName = 'desconto_total'
    end
    object qConsultaacrescimo_total: TCurrencyField
      FieldName = 'acrescimo_total'
    end
    object qConsultavalor_total: TCurrencyField
      FieldName = 'valor_total'
    end
    object qConsultaentregue: TFloatField
      FieldName = 'entregue'
    end
    object qConsultavalor_entregue: TCurrencyField
      FieldName = 'valor_entregue'
    end
    object qConsultacancelado: TBooleanField
      FieldName = 'cancelado'
      Required = True
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 172
  end
  object qProduto: TUniQuery
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
      'SELECT codigo,'
      #9'nome'
      '   FROM produtos'
      '  WHERE inativo = false '
      '    AND molde = FALSE '
      '    AND uso_consumo = FALSE '
      '    AND tipo = '#39'P'#39
      '  ORDER BY nome ASC;')
    Left = 520
    Top = 65533
  end
  object dsProduto: TUniDataSource
    DataSet = qProduto
    Left = 560
    Top = 65533
  end
  object qSQL: TUniQuery
    Connection = Connection.Conn
    SQL.Strings = (
      'select coalesce(pe.valor_vista, pe.valor_prazo) as valor,'
      #9'p.grupo,'
      #9'pe.estoque_minimo,'
      #9'pg.estoque_negativo,'
      #9'pg.aviso_estoque_minimo,'
      #9'e.total_disponivel'
      '   FROM produtos p'
      '   LEFT JOIN estoque e on e.produto = p.codigo'
      '   LEFT JOIN produto_empresas pe on pe.produto = p.codigo'
      '   LEFT join produto_grupos pg on pg.codigo = p.grupo'
      '  WHERE p.codigo = :produto AND pe.empresa = :empresa')
    Left = 336
    Top = 65535
    ParamData = <
      item
        DataType = ftInteger
        Name = 'produto'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'empresa'
        ParamType = ptInput
        Value = nil
      end>
  end
end
