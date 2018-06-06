inherited frmCadRegrasPrecosProdutos: TfrmCadRegrasPrecosProdutos
  Caption = 'Regras de Pre'#231'os -> Produtos'
  ClientHeight = 217
  ClientWidth = 672
  ExplicitWidth = 678
  ExplicitHeight = 246
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 182
    Width = 672
    inherited btnCancelar: TButton
      Left = 395
    end
    inherited btnSalvar: TButton
      Left = 488
    end
    inherited btnFechar: TButton
      Left = 581
    end
  end
  inherited grpContent: TGroupBox
    Width = 662
    Height = 130
    ExplicitLeft = 0
    ExplicitTop = 49
    ExplicitWidth = 662
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
    object lbl1: TLabel
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
    object lbl2: TLabel
      Left = 79
      Top = 64
      Width = 174
      Height = 15
      Caption = 'Markup para vendas a vista (%):'
      FocusControl = edtmarkup_vista
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl3: TLabel
      Left = 379
      Top = 64
      Width = 69
      Height = 15
      Caption = 'Valor a vista:'
      FocusControl = edtvalor_vista
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 74
      Top = 93
      Width = 179
      Height = 15
      Caption = 'Markup para vendas a prazo (%):'
      FocusControl = edtmarkup_prazo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl5: TLabel
      Left = 374
      Top = 93
      Width = 74
      Height = 15
      Caption = 'Valor a prazo:'
      FocusControl = edtvalor_prazo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
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
      Width = 50
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
      OnExit = cbbProdutoExit
      Width = 422
    end
    object edtmarkup_vista: TcxDBCalcEdit
      Left = 259
      Top = 61
      DataBinding.DataField = 'markup_vista'
      DataBinding.DataSource = ds
      TabOrder = 3
      Width = 100
    end
    object edtvalor_vista: TcxDBCurrencyEdit
      Left = 454
      Top = 61
      DataBinding.DataField = 'valor_vista'
      DataBinding.DataSource = ds
      TabOrder = 4
      Width = 100
    end
    object edtmarkup_prazo: TcxDBCalcEdit
      Left = 454
      Top = 90
      DataBinding.DataField = 'markup_prazo'
      DataBinding.DataSource = ds
      TabOrder = 5
      Width = 100
    end
    object edtvalor_prazo: TcxDBCurrencyEdit
      Left = 259
      Top = 90
      DataBinding.DataField = 'valor_prazo'
      DataBinding.DataSource = ds
      TabOrder = 6
      Width = 100
    end
  end
  inherited pnlHelp: TPanel
    Width = 663
    inherited mmoHelp: TMemo
      Width = 616
    end
  end
  inherited ds: TUniDataSource
    Left = 496
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO produto_precos'
      
        '  (regra, produto, markup_vista, valor_vista, markup_prazo, valo' +
        'r_prazo)'
      'VALUES'
      
        '  (:regra, :produto, :markup_vista, :valor_vista, :markup_prazo,' +
        ' :valor_prazo)')
    SQLDelete.Strings = (
      'DELETE FROM produto_precos'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE produto_precos'
      'SET'
      
        '  markup_vista = :markup_vista, valor_vista = :valor_vista, mark' +
        'up_prazo = :markup_prazo, valor_prazo = :valor_prazo'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM produto_precos'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT regra, produto, markup_vista, valor_vista, markup_prazo, ' +
        'valor_prazo FROM produto_precos'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM produto_precos'
      ''
      ') t')
    SQL.Strings = (
      
        'SELECT codigo, regra, produto, markup_vista, valor_vista, markup' +
        '_prazo, '
      '       valor_prazo'
      '  FROM produto_precos'
      ' WHERE codigo = :codigo;')
    Left = 456
    object FieldConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object FieldConsultaregra: TIntegerField
      FieldName = 'regra'
      Required = True
    end
    object FieldConsultaproduto: TIntegerField
      FieldName = 'produto'
      Required = True
    end
    object FieldConsultamarkup_vista: TFloatField
      FieldName = 'markup_vista'
    end
    object FieldConsultavalor_vista: TCurrencyField
      FieldName = 'valor_vista'
    end
    object FieldConsultamarkup_prazo: TFloatField
      FieldName = 'markup_prazo'
    end
    object FieldConsultavalor_prazo: TCurrencyField
      FieldName = 'valor_prazo'
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 412
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
    Left = 544
    Top = 5
  end
  object dsProduto: TUniDataSource
    DataSet = qProduto
    Left = 584
    Top = 5
  end
  object qSQL: TUniQuery
    Connection = Connection.Conn
    SQL.Strings = (
      'select pe.markup_vista, '
      #9'pe.valor_vista, '
      #9'pe.markup_prazo, '
      #9'pe.valor_prazo'
      '   FROM produtos p'
      '   LEFT JOIN produto_empresas pe on pe.produto = p.codigo'
      '  WHERE p.codigo = :produto AND pe.empresa = :empresa')
    Left = 600
    Top = 111
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
