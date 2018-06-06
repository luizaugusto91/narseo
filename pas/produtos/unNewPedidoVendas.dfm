inherited frmNewPedidoVendas: TfrmNewPedidoVendas
  Caption = 'Novo Pedido de vendas'
  ClientWidth = 570
  ExplicitWidth = 586
  ExplicitHeight = 272
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotton: TPanel
    Width = 570
    ExplicitWidth = 570
    inherited btnCancelar: TButton
      Left = 386
      ExplicitLeft = 386
    end
    inherited btnAvancar: TButton
      Left = 479
      ExplicitLeft = 479
    end
  end
  inherited grpContent: TGroupBox
    Width = 560
    ExplicitWidth = 560
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
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 111
      Top = 24
      Width = 42
      Height = 15
      Caption = 'Cliente:'
      FocusControl = edtCliente
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 10
      Top = 50
      Width = 86
      Height = 15
      Caption = 'Representante:'
      FocusControl = edtrepresentante
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 10
      Top = 80
      Width = 90
      Height = 15
      Caption = 'Data da compra:'
      FocusControl = edtdata_compra
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 233
      Top = 80
      Width = 113
      Height = 15
      Caption = 'Previs'#227'o de Entrega:'
      FocusControl = edtprevisao_entrega
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
    object edtCliente: TcxDBSpinEdit
      Left = 159
      Top = 21
      DataBinding.DataField = 'cliente'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 1
      OnEnter = grpContentEnter
      OnKeyPress = edtClienteKeyPress
      Width = 50
    end
    object cbbCliente: TcxDBLookupComboBox
      Left = 215
      Top = 21
      DataBinding.DataField = 'cliente'
      DataBinding.DataSource = ds
      Properties.KeyFieldNames = 'codigo'
      Properties.ListColumns = <
        item
          Caption = 'Fantasia'
          Width = 300
          FieldName = 'fantasia'
        end>
      Properties.ListSource = dsCliente
      TabOrder = 2
      OnEnter = grpContentEnter
      Width = 337
    end
    object edtrepresentante: TcxDBSpinEdit
      Left = 102
      Top = 48
      DataBinding.DataField = 'representante'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 3
      OnEnter = grpContentEnter
      OnKeyPress = edtrepresentanteKeyPress
      Width = 50
    end
    object cbbRepresentante: TcxDBLookupComboBox
      Left = 158
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
      Width = 394
    end
    object edtdata_compra: TcxDBDateEdit
      Left = 106
      Top = 77
      DataBinding.DataField = 'data_compra'
      DataBinding.DataSource = ds
      TabOrder = 5
      OnEnter = grpContentEnter
      Width = 121
    end
    object edtprevisao_entrega: TcxDBDateEdit
      Left = 352
      Top = 77
      DataBinding.DataField = 'previsao_entrega'
      DataBinding.DataSource = ds
      TabOrder = 6
      OnEnter = grpContentEnter
      Width = 121
    end
    object grpObservacao: TGroupBox
      AlignWithMargins = True
      Left = 8
      Top = 100
      Width = 544
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
        Width = 534
      end
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited qConsulta: TUniQuery
    SQL.Strings = (
      'SELECT codigo,'
      '        empresa,'
      '        cliente,'
      '        representante,'
      '        data_pedido,'
      '        previsao_entrega,'
      '        data_compra,'
      '        data_entrada,'
      '        status, observacao'
      '   FROM pedido_vendas'
      '  LIMIT 1;')
    object qConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qConsultaempresa: TIntegerField
      FieldName = 'empresa'
    end
    object qConsultacliente: TIntegerField
      FieldName = 'cliente'
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
    Left = 120
    Top = 125
  end
  object dsRepresentante: TUniDataSource
    DataSet = qRepresentante
    Left = 160
    Top = 125
  end
  object qCliente: TUniQuery
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
      '  FROM pessoas where inativo = false and cliente = true')
    Left = 336
    Top = 125
  end
  object dsCliente: TUniDataSource
    DataSet = qCliente
    Left = 376
    Top = 125
  end
end
