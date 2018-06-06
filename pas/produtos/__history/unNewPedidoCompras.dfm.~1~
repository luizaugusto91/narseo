inherited frmNewPedidoCompras: TfrmNewPedidoCompras
  Caption = 'Novo Pedido de compras'
  ExplicitWidth = 537
  ExplicitHeight = 272
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotton: TPanel
    TabOrder = 1
    inherited btnAvancar: TButton
      ExplicitLeft = 430
    end
  end
  inherited grpContent: TGroupBox
    TabOrder = 0
    ExplicitWidth = 511
    ExplicitHeight = 195
    object lblCodigo: TLabel
      Left = 10
      Top = 24
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
      FocusControl = edtCodigo
    end
    object Label1: TLabel
      Left = 107
      Top = 24
      Width = 59
      Height = 13
      Caption = 'Fornecedor:'
      FocusControl = edtfornecedor
    end
    object Label2: TLabel
      Left = 10
      Top = 51
      Width = 76
      Height = 13
      Caption = 'Representante:'
      FocusControl = edtrepresentante
    end
    object Label3: TLabel
      Left = 225
      Top = 78
      Width = 101
      Height = 13
      Caption = 'Previs'#227'o de Entrega:'
      FocusControl = edtprevisao_entrega
    end
    object Label4: TLabel
      Left = 10
      Top = 78
      Width = 80
      Height = 13
      Caption = 'Data da compra:'
      FocusControl = edtdata_compra
    end
    object edtCodigo: TcxDBSpinEdit
      Left = 53
      Top = 21
      DataBinding.DataField = 'codigo'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      Style.Color = clBtnFace
      TabOrder = 0
      Width = 48
    end
    object edtfornecedor: TcxDBSpinEdit
      Left = 172
      Top = 21
      DataBinding.DataField = 'fornecedor'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 1
      OnEnter = grpContentEnter
      Width = 50
    end
    object edtrepresentante: TcxDBSpinEdit
      Left = 92
      Top = 48
      DataBinding.DataField = 'representante'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 3
      OnEnter = grpContentEnter
      Width = 50
    end
    object edtprevisao_entrega: TcxDBDateEdit
      Left = 332
      Top = 75
      DataBinding.DataField = 'previsao_entrega'
      DataBinding.DataSource = ds
      TabOrder = 6
      OnEnter = grpContentEnter
      Width = 121
    end
    object edtdata_compra: TcxDBDateEdit
      Left = 96
      Top = 75
      DataBinding.DataField = 'data_compra'
      DataBinding.DataSource = ds
      TabOrder = 5
      OnEnter = grpContentEnter
      Width = 121
    end
    object grpObservacao: TGroupBox
      AlignWithMargins = True
      Left = 8
      Top = 100
      Width = 495
      Height = 87
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alBottom
      Caption = ' Observa'#231#245'es '
      TabOrder = 7
      object mmoobservacao: TcxDBMemo
        AlignWithMargins = True
        Left = 5
        Top = 18
        Align = alClient
        DataBinding.DataField = 'observacao'
        DataBinding.DataSource = ds
        Properties.CharCase = ecUpperCase
        TabOrder = 0
        OnEnter = grpContentEnter
        Height = 64
        Width = 485
      end
    end
    object cbbFornecedor: TcxDBLookupComboBox
      Left = 228
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
      Width = 270
    end
    object cbbRepresentante: TcxDBLookupComboBox
      Left = 148
      Top = 48
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
      TabOrder = 4
      OnEnter = grpContentEnter
      Width = 350
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO pedido_compras'
      
        '  (codigo, fornecedor, representante, previsao_entrega, data_com' +
        'pra, observacao)'
      'VALUES'
      
        '  (:codigo, :fornecedor, :representante, :previsao_entrega, :dat' +
        'a_compra, :observacao)')
    SQLDelete.Strings = (
      'DELETE FROM pedido_compras'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE pedido_compras'
      'SET'
      
        '  codigo = :codigo, fornecedor = :fornecedor, representante = :r' +
        'epresentante, previsao_entrega = :previsao_entrega, data_compra ' +
        '= :data_compra, observacao = :observacao'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM pedido_compras'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT codigo, fornecedor, representante, previsao_entrega, data' +
        '_compra, observacao FROM pedido_compras'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM pedido_compras'
      ''
      ') t')
    SQL.Strings = (
      ' SELECT codigo,'
      '        empresa,'
      '        fornecedor,'
      '        representante,'
      '        data_pedido,'
      '        previsao_entrega,'
      '        data_compra,'
      '        data_entrada,'
      '        status, observacao'
      '   FROM pedido_compras'
      '  LIMIT 1;')
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
  end
  object qFornecedor: TUniQuery [5]
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
    Left = 336
    Top = 125
  end
  object dsFornecedor: TUniDataSource [6]
    DataSet = qFornecedor
    Left = 376
    Top = 125
  end
  object qRepresentante: TUniQuery [7]
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
    Left = 120
    Top = 125
  end
  object dsRepresentante: TUniDataSource [8]
    DataSet = qRepresentante
    Left = 160
    Top = 125
  end
  inherited qSQL: TUniQuery
    ParamData = <
      item
        DataType = ftString
        Name = 'sequencial'
        ParamType = ptInput
        Value = 'pedido_compras_codigo_seq'
      end>
  end
end
