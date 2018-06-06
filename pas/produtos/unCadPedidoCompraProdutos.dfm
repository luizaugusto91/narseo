inherited frmCadPedidoCompraProdutos: TfrmCadPedidoCompraProdutos
  Caption = 'Pedido de compras -> Produtos'
  ClientHeight = 223
  ClientWidth = 639
  ExplicitWidth = 645
  ExplicitHeight = 252
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 188
    Width = 639
    ExplicitTop = 188
    ExplicitWidth = 639
    inherited btnCancelar: TButton
      Left = 362
      ExplicitLeft = 362
    end
    inherited btnSalvar: TButton
      Left = 455
      ExplicitLeft = 455
    end
    inherited btnFechar: TButton
      Left = 548
      ExplicitLeft = 548
    end
  end
  inherited grpContent: TGroupBox
    Width = 629
    Height = 136
    ExplicitWidth = 629
    ExplicitHeight = 136
    object lblCodigo: TLabel
      Left = 10
      Top = 24
      Width = 42
      Height = 15
      Caption = 'C'#243'digo:'
      FocusControl = edtCodigo
    end
    object Label1: TLabel
      Left = 111
      Top = 24
      Width = 46
      Height = 15
      Caption = 'Produto:'
      FocusControl = edtproduto
    end
    object Label2: TLabel
      Left = 10
      Top = 53
      Width = 73
      Height = 15
      Caption = 'Valor unit'#225'rio:'
      FocusControl = edtvalor_unitario
    end
    object Label3: TLabel
      Left = 202
      Top = 53
      Width = 125
      Height = 15
      Caption = 'Quantidade de compra:'
      FocusControl = edtquantidade
    end
    object Label4: TLabel
      Left = 182
      Top = 82
      Width = 58
      Height = 15
      Caption = 'Valor Total:'
      FocusControl = edtvalor_total
    end
    object Label5: TLabel
      Left = 356
      Top = 82
      Width = 124
      Height = 15
      Caption = 'Quantidade de entrada:'
      FocusControl = edtentrada
    end
    object Label6: TLabel
      Left = 442
      Top = 53
      Width = 64
      Height = 15
      Caption = 'Acrescimos:'
      FocusControl = edtacrescimo
    end
    object Label7: TLabel
      Left = 10
      Top = 82
      Width = 58
      Height = 15
      Caption = 'Descontos:'
      FocusControl = edtdesconto
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
    object edtproduto: TcxDBSpinEdit
      Left = 164
      Top = 21
      DataBinding.DataField = 'produto'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 1
      OnEnter = grpContentEnter
      OnExit = edtprodutoExit
      Width = 50
    end
    object edtvalor_unitario: TcxDBCurrencyEdit
      Left = 96
      Top = 50
      DataBinding.DataField = 'valor_unitario'
      DataBinding.DataSource = ds
      TabOrder = 3
      OnEnter = grpContentEnter
      Width = 100
    end
    object edtquantidade: TcxDBSpinEdit
      Left = 336
      Top = 50
      DataBinding.DataField = 'quantidade'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 4
      OnEnter = grpContentEnter
      OnExit = edtquantidadeExit
      Width = 100
    end
    object edtvalor_total: TcxDBCurrencyEdit
      Left = 250
      Top = 79
      DataBinding.DataField = 'valor_total'
      DataBinding.DataSource = ds
      TabOrder = 7
      OnEnter = grpContentEnter
      Width = 100
    end
    object edtentrada: TcxDBSpinEdit
      Left = 491
      Top = 79
      DataBinding.DataField = 'entrada'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 8
      OnEnter = grpContentEnter
      Width = 100
    end
    object cbbcancelado: TcxDBCheckBox
      Left = 10
      Top = 108
      Caption = 'Item cancelado'
      DataBinding.DataField = 'cancelado'
      DataBinding.DataSource = ds
      TabOrder = 9
      Width = 121
    end
    object cbbProduto: TcxDBLookupComboBox
      Left = 220
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
      Width = 394
    end
    object edtacrescimo: TcxDBCurrencyEdit
      Left = 514
      Top = 50
      DataBinding.DataField = 'acrescimo'
      DataBinding.DataSource = ds
      TabOrder = 5
      OnEnter = grpContentEnter
      OnExit = edtacrescimoExit
      Width = 100
    end
    object edtdesconto: TcxDBCurrencyEdit
      Left = 76
      Top = 79
      DataBinding.DataField = 'desconto'
      DataBinding.DataSource = ds
      TabOrder = 6
      OnEnter = grpContentEnter
      OnExit = edtdescontoExit
      Width = 100
    end
  end
  inherited pnlHelp: TPanel
    Width = 630
    ExplicitWidth = 630
    inherited mmoHelp: TMemo
      Width = 583
      ExplicitWidth = 583
    end
  end
  inherited ds: TUniDataSource
    Left = 168
    Top = 128
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO pedido_compra_itens'
      
        '  (pedido, produto, valor_unitario, quantidade, desconto, acresc' +
        'imo, valor_total, entrada, cancelado)'
      'VALUES'
      
        '  (:pedido, :produto, :valor_unitario, :quantidade, :desconto, :' +
        'acrescimo, :valor_total, :entrada, :cancelado)')
    SQLDelete.Strings = (
      'DELETE FROM pedido_compra_itens'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE pedido_compra_itens'
      'SET'
      
        '  valor_unitario = :valor_unitario, quantidade = :quantidade, de' +
        'sconto = :desconto, acrescimo = :acrescimo, valor_total = :valor' +
        '_total, entrada = :entrada, cancelado = :cancelado'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM pedido_compra_itens'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT pedido, produto, valor_unitario, quantidade, desconto, ac' +
        'rescimo, valor_total, entrada, cancelado FROM pedido_compra_iten' +
        's'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM pedido_compra_itens'
      ''
      ') t')
    SQL.Strings = (
      'SELECT codigo, '
      #9'pedido, '
      #9'produto, '
      #9'valor_unitario, '
      #9'quantidade, '
      #9'valor_total,'
      #9'desconto,'
      #9'acrescimo,'
      #9'entrada, '
      #9'cancelado'
      '   FROM pedido_compra_itens'
      '  WHERE codigo = :codigo;')
    Left = 128
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = nil
      end>
    object qConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qConsultapedido: TIntegerField
      FieldName = 'pedido'
      Required = True
    end
    object qConsultaproduto: TIntegerField
      FieldName = 'produto'
      Required = True
    end
    object qConsultavalor_unitario: TCurrencyField
      FieldName = 'valor_unitario'
    end
    object qConsultaquantidade: TIntegerField
      FieldName = 'quantidade'
      Required = True
    end
    object qConsultavalor_total: TCurrencyField
      FieldName = 'valor_total'
    end
    object qConsultaentrada: TIntegerField
      FieldName = 'entrada'
    end
    object qConsultacancelado: TBooleanField
      FieldName = 'cancelado'
      Required = True
    end
    object qConsultadesconto: TCurrencyField
      FieldName = 'desconto'
    end
    object qConsultaacrescimo: TCurrencyField
      FieldName = 'acrescimo'
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 8388692
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
      '  WHERE inativo = false AND molde = FALSE AND tipo = '#39'P'#39)
    Left = 384
    Top = 65533
  end
  object dsProduto: TUniDataSource
    DataSet = qProduto
    Left = 424
    Top = 65533
  end
  object qSQL: TUniQuery
    Connection = Connection.Conn
    SQL.Strings = (
      'select coalesce(pf.preco_compra,pe.valor_compra) as valor'
      '   FROM produtos p'
      
        '   LEFT JOIN produto_fornecedores pf on pf.produto = p.codigo an' +
        'd pf.fornecedor = (select fornecedor from pedido_compras where c' +
        'odigo = :pedido)'
      '   LEFT JOIN produto_empresas pe on pe.produto = p.codigo'
      '  WHERE p.codigo = :produto')
    Left = 248
    Top = 119
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pedido'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'produto'
        ParamType = ptInput
        Value = nil
      end>
  end
end
