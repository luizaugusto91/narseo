inherited frmCadAberturaCaixa: TfrmCadAberturaCaixa
  Caption = 'Abertura de Caixa'
  ClientHeight = 258
  ClientWidth = 612
  ExplicitWidth = 618
  ExplicitHeight = 287
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 223
    Width = 612
    ExplicitTop = 223
    ExplicitWidth = 612
    inherited btnCancelar: TButton
      Left = 335
      ExplicitLeft = 335
    end
    inherited btnSalvar: TButton
      Left = 428
      ExplicitLeft = 428
    end
    inherited btnFechar: TButton
      Left = 521
      ExplicitLeft = 521
    end
  end
  inherited grpContent: TGroupBox
    Width = 602
    Height = 171
    ExplicitWidth = 602
    ExplicitHeight = 171
    object lblData: TLabel
      Left = 16
      Top = 24
      Width = 29
      Height = 15
      Caption = 'Data:'
      FocusControl = edtdata_caixa
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblOperador: TLabel
      Left = 157
      Top = 24
      Width = 56
      Height = 15
      Caption = 'Operador:'
      FocusControl = edtoperador_caixa
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTrocoInicial: TLabel
      Left = 163
      Top = 53
      Width = 69
      Height = 15
      Caption = 'Troco Inicial:'
      FocusControl = edttroco_inicial
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTurno: TLabel
      Left = 16
      Top = 53
      Width = 35
      Height = 15
      Caption = 'Turno:'
      FocusControl = edtturno
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtdata_caixa: TcxDBDateEdit
      Left = 51
      Top = 21
      DataBinding.DataField = 'data_caixa'
      DataBinding.DataSource = ds
      TabOrder = 0
      OnExit = grpContentExit
      Width = 100
    end
    object edtoperador_caixa: TcxDBSpinEdit
      Left = 219
      Top = 21
      DataBinding.DataField = 'operador_caixa'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 1
      OnExit = grpContentExit
      OnKeyPress = edtoperador_caixaKeyPress
      Width = 60
    end
    object edttroco_inicial: TcxDBCalcEdit
      Left = 238
      Top = 50
      DataBinding.DataField = 'troco_inicial'
      DataBinding.DataSource = ds
      TabOrder = 4
      OnExit = grpContentExit
      Width = 120
    end
    object edtturno: TcxDBSpinEdit
      Left = 57
      Top = 50
      DataBinding.DataField = 'turno'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 3
      OnExit = grpContentExit
      Width = 100
    end
    object cbbOperador: TcxDBLookupComboBox
      Left = 285
      Top = 21
      DataBinding.DataField = 'operador_caixa'
      DataBinding.DataSource = ds
      Properties.KeyFieldNames = 'codigo'
      Properties.ListColumns = <
        item
          Caption = 'Nome'
          Width = 260
          FieldName = 'fantasia'
        end>
      Properties.ListSource = dsOperador
      TabOrder = 2
      OnExit = grpContentExit
      Width = 305
    end
    object grpObservacao: TGroupBox
      AlignWithMargins = True
      Left = 7
      Top = 78
      Width = 588
      Height = 86
      Margins.Left = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alBottom
      Caption = ' Observa'#231#245'es '
      TabOrder = 5
      object mmoObservacao: TcxDBMemo
        AlignWithMargins = True
        Left = 5
        Top = 20
        Align = alClient
        DataBinding.DataField = 'obs'
        DataBinding.DataSource = ds
        Style.BorderStyle = ebsNone
        TabOrder = 0
        Height = 61
        Width = 578
      end
    end
  end
  inherited pnlHelp: TPanel
    Width = 603
    ExplicitWidth = 603
    inherited mmoHelp: TMemo
      Width = 556
      ExplicitWidth = 556
    end
  end
  inherited ds: TUniDataSource
    Left = 512
    Top = 0
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO caixa'
      
        '  (data_caixa, turno, empresa, operador_sistema, troco_inicial, ' +
        'operador_caixa, obs)'
      'VALUES'
      
        '  (:data_caixa, :turno, :empresa, :operador_sistema, :troco_inic' +
        'ial, :operador_caixa, :obs)')
    SQLDelete.Strings = (
      'DELETE FROM caixa'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE caixa'
      'SET'
      
        '  data_caixa = :data_caixa, turno = :turno, empresa = :empresa, ' +
        'operador_sistema = :operador_sistema, abertura = :abertura, fech' +
        'amento = :fechamento, conferencia = :conferencia, pessoa_confere' +
        'nte = :pessoa_conferente, troco_inicial = :troco_inicial, troco_' +
        'final = :troco_final, conferido = :conferido, sangria = :sangria' +
        ', reforco = :reforco, despesas = :despesas, recebimentos = :rece' +
        'bimentos, operador_caixa = :operador_caixa, obs = :obs'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM caixa'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT data_caixa, turno, empresa, operador_sistema, abertura, f' +
        'echamento, conferencia, pessoa_conferente, troco_inicial, troco_' +
        'final, conferido, sangria, reforco, despesas, recebimentos, oper' +
        'ador_caixa, obs FROM caixa'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM caixa'
      ''
      ') t')
    SQL.Strings = (
      'SELECT codigo, '
      #9'data_caixa, '
      #9'turno, '
      #9'empresa, '
      #9'operador_sistema, '
      #9'abertura, '
      #9'fechamento, '
      #9'conferencia, '
      #9'pessoa_conferente, '
      #9'troco_inicial, '
      #9'troco_final, '
      #9'conferido, '
      #9'sangria, '
      #9'reforco, '
      #9'despesas, '
      #9'recebimentos, '
      #9'operador_caixa, '
      #9'obs'
      '   FROM caixa'
      '  WHERE codigo = :codigo;')
    Left = 472
    Top = 0
    object qConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qConsultadata_caixa: TDateField
      FieldName = 'data_caixa'
    end
    object qConsultaturno: TIntegerField
      FieldName = 'turno'
    end
    object qConsultaempresa: TIntegerField
      FieldName = 'empresa'
      Required = True
    end
    object qConsultaoperador_sistema: TIntegerField
      FieldName = 'operador_sistema'
      Required = True
    end
    object qConsultaabertura: TDateTimeField
      FieldName = 'abertura'
    end
    object qConsultatroco_inicial: TFloatField
      FieldName = 'troco_inicial'
    end
    object qConsultaoperador_caixa: TIntegerField
      FieldName = 'operador_caixa'
    end
    object qConsultaobs: TStringField
      FieldName = 'obs'
      Size = 600
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 428
  end
  object qOperador: TUniQuery
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
      '  FROM pessoas where inativo = false and colaborador = true')
    Left = 464
    Top = 157
  end
  object dsOperador: TUniDataSource
    DataSet = qOperador
    Left = 504
    Top = 157
  end
end