inherited frmBaixaContasReceber: TfrmBaixaContasReceber
  Caption = 'Baixa: Contas a receber'
  ClientHeight = 309
  ClientWidth = 617
  ExplicitWidth = 623
  ExplicitHeight = 338
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 274
    Width = 617
    Color = clSilver
    ExplicitTop = 274
    ExplicitWidth = 617
    inherited btnCancelar: TButton
      Left = 340
      ExplicitLeft = 340
    end
    inherited btnBaixar: TButton
      Left = 433
      ExplicitLeft = 433
    end
    inherited btnFechar: TButton
      Left = 526
      ExplicitLeft = 526
    end
  end
  inherited grpContent: TGroupBox
    Width = 607
    Height = 217
    ExplicitWidth = 607
    ExplicitHeight = 217
    object lblCodigo: TLabel
      Left = 9
      Top = 23
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
    object Label9: TLabel
      Left = 110
      Top = 23
      Width = 34
      Height = 15
      Caption = 'Conta:'
      FocusControl = edtconta
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 216
      Top = 23
      Width = 28
      Height = 15
      Caption = 'Data:'
      FocusControl = edtdata_movimento
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 9
      Top = 52
      Width = 53
      Height = 15
      Caption = 'Operador:'
      FocusControl = edtoperador_sistema
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 9
      Top = 81
      Width = 30
      Height = 15
      Caption = 'Valor:'
      FocusControl = edtvalor
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 386
      Top = 23
      Width = 75
      Height = 15
      Caption = 'Data da Baixa:'
      FocusControl = edtdata_hora
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 310
      Top = 52
      Width = 31
      Height = 15
      Caption = 'Caixa:'
      FocusControl = edtoperador_caixa
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 172
      Top = 81
      Width = 64
      Height = 15
      Caption = 'Pagamento:'
      FocusControl = edttipo_pagamento
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCodigo: TcxDBSpinEdit
      Left = 56
      Top = 20
      DataBinding.DataField = 'codigo'
      DataBinding.DataSource = ds
      Enabled = False
      Properties.SpinButtons.Visible = False
      Style.Color = clBtnFace
      TabOrder = 0
      Width = 48
    end
    object edtconta: TcxDBSpinEdit
      Left = 150
      Top = 20
      DataBinding.DataField = 'conta'
      DataBinding.DataSource = ds
      Enabled = False
      Properties.ReadOnly = True
      Properties.SpinButtons.Visible = False
      Style.Color = clBtnFace
      TabOrder = 1
      Width = 60
    end
    object edtdata_movimento: TcxDBDateEdit
      Left = 250
      Top = 20
      DataBinding.DataField = 'data_movimento'
      DataBinding.DataSource = ds
      TabOrder = 2
      OnExit = grpContentExit
      Width = 130
    end
    object edtoperador_sistema: TcxDBSpinEdit
      Left = 68
      Top = 49
      DataBinding.DataField = 'operador_sistema'
      DataBinding.DataSource = ds
      Properties.ReadOnly = True
      Properties.SpinButtons.Visible = False
      TabOrder = 3
      OnExit = grpContentExit
      Width = 40
    end
    object edtvalor: TcxDBCurrencyEdit
      Left = 45
      Top = 78
      DataBinding.DataField = 'valor'
      DataBinding.DataSource = ds
      TabOrder = 4
      OnEnter = edtvalorEnter
      OnExit = grpContentExit
      Width = 121
    end
    object edtdata_hora: TcxDBDateEdit
      Left = 467
      Top = 20
      DataBinding.DataField = 'data_hora'
      DataBinding.DataSource = ds
      TabOrder = 5
      OnExit = grpContentExit
      Width = 130
    end
    object edtoperador_caixa: TcxDBSpinEdit
      Left = 347
      Top = 49
      DataBinding.DataField = 'operador_caixa'
      DataBinding.DataSource = ds
      Properties.ReadOnly = True
      Properties.SpinButtons.Visible = False
      TabOrder = 6
      OnExit = grpContentExit
      Width = 40
    end
    object edttipo_pagamento: TcxDBSpinEdit
      Left = 242
      Top = 78
      DataBinding.DataField = 'tipo_pagamento'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 7
      OnExit = grpContentExit
      Width = 40
    end
    object cbbOperador: TcxDBLookupComboBox
      Left = 114
      Top = 49
      DataBinding.DataField = 'operador_sistema'
      DataBinding.DataSource = ds
      Properties.KeyFieldNames = 'codigo'
      Properties.ListColumns = <
        item
          Caption = 'Fantasia'
          Width = 300
          FieldName = 'fantasia'
        end>
      Properties.ListSource = dsPessoas
      Properties.ReadOnly = True
      TabOrder = 8
      OnExit = grpContentExit
      Width = 190
    end
    object cbbCaixa: TcxDBLookupComboBox
      Left = 393
      Top = 49
      DataBinding.DataField = 'operador_caixa'
      DataBinding.DataSource = ds
      Properties.KeyFieldNames = 'codigo'
      Properties.ListColumns = <
        item
          Caption = 'Fantasia'
          Width = 300
          FieldName = 'fantasia'
        end>
      Properties.ListSource = dsPessoas
      Properties.ReadOnly = True
      TabOrder = 9
      OnExit = grpContentExit
      Width = 204
    end
    object grpObservacao: TGroupBox
      Left = 9
      Top = 107
      Width = 588
      Height = 105
      Caption = ' Observa'#231#245'es '
      TabOrder = 10
      object mmoobservacao: TcxDBMemo
        AlignWithMargins = True
        Left = 5
        Top = 20
        Align = alClient
        DataBinding.DataField = 'observacao'
        DataBinding.DataSource = ds
        TabOrder = 0
        Height = 80
        Width = 578
      end
    end
    object cbbTipoPagamento: TcxDBLookupComboBox
      Left = 288
      Top = 78
      DataBinding.DataField = 'tipo_pagamento'
      DataBinding.DataSource = ds
      Properties.KeyFieldNames = 'codigo'
      Properties.ListColumns = <
        item
          Caption = 'Descri'#231#227'o'
          Width = 300
          FieldName = 'descricao'
        end>
      Properties.ListSource = dsTipoPagamento
      Properties.ReadOnly = False
      TabOrder = 11
      OnExit = grpContentExit
      Width = 309
    end
  end
  inherited pnlHelp: TPanel
    Width = 608
    ExplicitWidth = 608
    inherited mmoHelp: TMemo
      Width = 561
      ExplicitWidth = 561
    end
  end
  inherited ds: TUniDataSource
    Left = 312
    Top = 0
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO caixa_movimento'
      
        '  (caixa, turno, data_movimento, operador_sistema, motivo, valor' +
        ', cupom, data_hora, tipo, operador_caixa, tipo_pagamento, conta,' +
        ' observacao)'
      'VALUES'
      
        '  (:caixa, :turno, :data_movimento, :operador_sistema, :motivo, ' +
        ':valor, :cupom, :data_hora, :tipo, :operador_caixa, :tipo_pagame' +
        'nto, :conta, :observacao)')
    SQLDelete.Strings = (
      'DELETE FROM caixa_movimento'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE caixa_movimento'
      'SET'
      
        '  data_movimento = :data_movimento, operador_sistema = :operador' +
        '_sistema, motivo = :motivo, valor = :valor, cupom = :cupom, data' +
        '_hora = :data_hora, tipo = :tipo, operador_caixa = :operador_cai' +
        'xa, tipo_pagamento = :tipo_pagamento, conta = :conta, observacao' +
        ' = :observacao'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM caixa_movimento'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT caixa, turno, data_movimento, operador_sistema, motivo, v' +
        'alor, cupom, data_hora, tipo, operador_caixa, tipo_pagamento, co' +
        'nta, observacao FROM caixa_movimento'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM caixa_movimento'
      ''
      ') t')
    SQL.Strings = (
      
        'SELECT codigo, caixa, turno, data_movimento, operador_sistema, m' +
        'otivo, '
      
        '       valor, cupom, data_hora, tipo, operador_caixa, tipo_pagam' +
        'ento, '
      '       conta, observacao'
      '  FROM caixa_movimento'
      ' where codigo = :codigo;')
    Left = 272
    Top = 0
    object qConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qConsultacaixa: TIntegerField
      FieldName = 'caixa'
    end
    object qConsultaturno: TIntegerField
      FieldName = 'turno'
    end
    object qConsultadata_movimento: TDateField
      FieldName = 'data_movimento'
      Required = True
    end
    object qConsultaoperador_sistema: TIntegerField
      FieldName = 'operador_sistema'
    end
    object qConsultamotivo: TStringField
      FieldName = 'motivo'
      FixedChar = True
      Size = 30
    end
    object qConsultavalor: TCurrencyField
      FieldName = 'valor'
      Required = True
    end
    object qConsultacupom: TIntegerField
      FieldName = 'cupom'
    end
    object qConsultadata_hora: TDateTimeField
      FieldName = 'data_hora'
    end
    object qConsultatipo: TStringField
      FieldName = 'tipo'
      FixedChar = True
      Size = 1
    end
    object qConsultaoperador_caixa: TIntegerField
      FieldName = 'operador_caixa'
    end
    object qConsultatipo_pagamento: TIntegerField
      FieldName = 'tipo_pagamento'
      Required = True
    end
    object qConsultaconta: TIntegerField
      FieldName = 'conta'
    end
    object qConsultaobservacao: TStringField
      FieldName = 'observacao'
      Size = 600
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 228
  end
  object qPessoas: TUniQuery
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
      '  FROM pessoas')
    Left = 448
    Top = 1
  end
  object dsPessoas: TUniDataSource
    DataSet = qPessoas
    Left = 488
    Top = 1
  end
  object qTipoPagamento: TUniQuery
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
      
        'SELECT codigo, descricao, segunda_via, comissionada, mov_cont_re' +
        'ceber, '
      
        '       tef, cheque, mov_cont_bancaria, registra_venda, cartao, p' +
        'erc_operadora, '
      
        '       controlar_cheque, nro_parcela_max, requer_autorizacao, cr' +
        'edito, '
      '       debito_dias, inativo'
      '  FROM tipo_pagamentos WHERE pagamento = TRUE;')
    Left = 160
    Top = 193
  end
  object dsTipoPagamento: TUniDataSource
    DataSet = qTipoPagamento
    Left = 200
    Top = 193
  end
  object qContas: TUniQuery
    Connection = Connection.Conn
    Transaction = Connection.UniTransaction
    UpdateTransaction = Connection.UniTransaction
    SQL.Strings = (
      'SELECT codigo, '
      #9'empresa, '
      #9'data_registro, '
      #9'data_movimento, '
      #9'usuario, '
      #9'cd_tipo_conta, '
      #9'tipo_conta, '
      #9'documento, '
      #9'descricao, '
      #9'venda, '
      #9'valor, '
      #9'parcela, '
      #9'total_parcelas, '
      #9'cd_tipo_pagamento, '
      #9'tipo_pagamento, '
      #9'centro_custo, '
      #9'vencimento, '
      #9'valor_corrigido, '
      #9'juros_valor, '
      #9'desconto_valor, '
      #9'data_recebimento, '
      #9'cd_pessoa, '
      #9'pessoa, '
      #9'status, '
      #9'quitada, '
      #9'multa, '
      #9'nfe'
      '   FROM vw_contas_receber'
      '  WHERE codigo = :codigo;')
    Left = 366
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        Value = nil
      end>
  end
  object qCedente: TUniQuery
    Connection = Connection.Conn
    Transaction = Connection.UniTransaction
    UpdateTransaction = Connection.UniTransaction
    SQL.Strings = (
      
        'select coalesce(sum(valor),0::money) as valor from pessoa_saldo ' +
        'WHERE liquidado = false and tipo_receita = 0 and pessoa = :codig' +
        'o')
    Left = 446
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = nil
      end>
  end
  object qSaldo: TUniQuery
    Connection = Connection.Conn
    SQL.Strings = (
      'select set_saldo_baixa(:pessoa, :baixa);')
    Left = 504
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pessoa'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'baixa'
        ParamType = ptInput
        Value = nil
      end>
  end
  object qSQL: TUniQuery
    Connection = Connection.Conn
    SQL.Strings = (
      
        'SELECT currval('#39'caixa_movimento_codigo_seq'#39'::regclass) as codigo' +
        ';')
    Left = 304
    Top = 184
  end
end
