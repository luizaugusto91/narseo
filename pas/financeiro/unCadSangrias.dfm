inherited frmCadSangrias: TfrmCadSangrias
  Caption = 'Caixa: Sangria'
  ClientHeight = 276
  ClientWidth = 634
  ExplicitWidth = 640
  ExplicitHeight = 305
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 241
    Width = 634
    Color = clScrollBar
    ParentBackground = False
    ExplicitTop = 241
    ExplicitWidth = 634
    inherited btnCancelar: TButton
      Left = 357
      ExplicitLeft = 357
    end
    inherited btnSalvar: TButton
      Left = 450
      ExplicitLeft = 450
    end
    inherited btnFechar: TButton
      Left = 543
      ExplicitLeft = 543
    end
  end
  inherited grpContent: TGroupBox
    Width = 624
    Height = 184
    Margins.Bottom = 5
    ExplicitWidth = 624
    ExplicitHeight = 184
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
    object lblMotivo: TLabel
      Left = 9
      Top = 52
      Width = 41
      Height = 15
      Caption = 'Motivo:'
      FocusControl = edtmotivo
    end
    object lblValor: TLabel
      Left = 482
      Top = 52
      Width = 29
      Height = 15
      Caption = 'Valor:'
      FocusControl = edtValor
    end
    object lblOperador: TLabel
      Left = 110
      Top = 23
      Width = 53
      Height = 15
      Caption = 'Operador:'
      FocusControl = edtoperador_sistema
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
    object edtmotivo: TcxDBTextEdit
      Left = 56
      Top = 49
      DataBinding.DataField = 'motivo'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      Width = 420
    end
    object edtValor: TcxDBCurrencyEdit
      Left = 517
      Top = 49
      DataBinding.DataField = 'valor'
      DataBinding.DataSource = ds
      TabOrder = 2
      Width = 100
    end
    object edtoperador_sistema: TcxDBSpinEdit
      Left = 169
      Top = 20
      DataBinding.DataField = 'operador_sistema'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 3
      Width = 50
    end
    object grpObservacoes: TGroupBox
      AlignWithMargins = True
      Left = 7
      Top = 72
      Width = 610
      Height = 105
      Margins.Left = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alBottom
      Caption = ' Observa'#231#245'es '
      TabOrder = 4
      object mmoobservacao: TcxDBMemo
        AlignWithMargins = True
        Left = 5
        Top = 20
        Align = alClient
        DataBinding.DataField = 'observacao'
        DataBinding.DataSource = ds
        Properties.CharCase = ecUpperCase
        TabOrder = 0
        Height = 80
        Width = 600
      end
    end
    object cbbOperador: TcxDBLookupComboBox
      Left = 225
      Top = 20
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
      TabOrder = 5
      OnExit = grpContentExit
      Width = 392
    end
  end
  inherited pnlHelp: TPanel
    Width = 625
    ExplicitWidth = 625
    inherited mmoHelp: TMemo
      Width = 578
      ExplicitWidth = 578
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
        ', tipo, operador_caixa, tipo_pagamento, observacao)'
      'VALUES'
      
        '  (:caixa, :turno, :data_movimento, :operador_sistema, :motivo, ' +
        ':valor, :tipo, :operador_caixa, :tipo_pagamento, :observacao)')
    SQLDelete.Strings = (
      'DELETE FROM caixa_movimento'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE caixa_movimento'
      'SET'
      
        '  caixa = :caixa, turno = :turno, data_movimento = :data_movimen' +
        'to, operador_sistema = :operador_sistema, motivo = :motivo, valo' +
        'r = :valor, data_hora = :data_hora, tipo = :tipo, operador_caixa' +
        ' = :operador_caixa, tipo_pagamento = :tipo_pagamento, observacao' +
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
        'alor, data_hora, tipo, operador_caixa, tipo_pagamento, observaca' +
        'o FROM caixa_movimento'
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
      ' WHERE codigo = :codigo;')
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
end
