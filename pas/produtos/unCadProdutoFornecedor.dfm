inherited frmCadProdutoFornecedor: TfrmCadProdutoFornecedor
  Caption = 'Produto -> Fornecedores'
  ClientHeight = 186
  ClientWidth = 527
  ExplicitWidth = 533
  ExplicitHeight = 215
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 151
    Width = 527
    ExplicitTop = 151
    ExplicitWidth = 527
    inherited btnCancelar: TButton
      Left = 250
      ExplicitLeft = 250
    end
    inherited btnSalvar: TButton
      Left = 343
      ExplicitLeft = 343
    end
    inherited btnFechar: TButton
      Left = 436
      ExplicitLeft = 436
    end
  end
  inherited grpContent: TGroupBox
    Width = 517
    Height = 148
    ExplicitWidth = 517
    ExplicitHeight = 148
    object Label1: TLabel
      Left = 16
      Top = 26
      Width = 65
      Height = 15
      Caption = 'Fornecedor:'
      FocusControl = edtfornecedor
    end
    object Label2: TLabel
      Left = 16
      Top = 55
      Width = 81
      Height = 15
      Caption = 'Representante:'
      FocusControl = edtrepresentante
    end
    object Label3: TLabel
      Left = 16
      Top = 84
      Width = 129
      Height = 15
      Caption = 'Data da ultima compra:'
      FocusControl = edtultima_compra
    end
    object Label4: TLabel
      Left = 278
      Top = 84
      Width = 95
      Height = 15
      Caption = 'Pre'#231'o de compra:'
      FocusControl = edtpreco_compra
    end
    object Label5: TLabel
      Left = 16
      Top = 113
      Width = 98
      Height = 15
      Caption = 'Tempo de entrega:'
      FocusControl = edttempo_entrega
    end
    object Label6: TLabel
      Left = 206
      Top = 113
      Width = 173
      Height = 15
      Caption = 'Quantidade minima de compra:'
      FocusControl = edtminimo_compra
    end
    object edtfornecedor: TcxDBSpinEdit
      Left = 103
      Top = 23
      DataBinding.DataField = 'fornecedor'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 0
      OnEnter = grpContentEnter
      Width = 50
    end
    object edtrepresentante: TcxDBSpinEdit
      Left = 103
      Top = 52
      DataBinding.DataField = 'representante'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 2
      OnEnter = grpContentEnter
      Width = 50
    end
    object edtultima_compra: TcxDBDateEdit
      Left = 151
      Top = 81
      DataBinding.DataField = 'ultima_compra'
      DataBinding.DataSource = ds
      TabOrder = 4
      OnEnter = grpContentEnter
      Width = 121
    end
    object edtpreco_compra: TcxDBCurrencyEdit
      Left = 380
      Top = 81
      DataBinding.DataField = 'preco_compra'
      DataBinding.DataSource = ds
      TabOrder = 5
      OnEnter = grpContentEnter
      Width = 121
    end
    object edttempo_entrega: TcxDBSpinEdit
      Left = 120
      Top = 110
      DataBinding.DataField = 'tempo_entrega'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 6
      OnEnter = grpContentEnter
      Width = 80
    end
    object edtminimo_compra: TcxDBSpinEdit
      Left = 385
      Top = 110
      DataBinding.DataField = 'minimo_compra'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 7
      OnEnter = grpContentEnter
      Width = 80
    end
    object cbbFornecedor: TcxDBLookupComboBox
      Left = 159
      Top = 23
      DataBinding.DataField = 'fornecedor'
      DataBinding.DataSource = ds
      Properties.KeyFieldNames = 'codigo'
      Properties.ListColumns = <
        item
          Caption = 'CNPJ'
          Width = 80
          FieldName = 'cnpj'
        end
        item
          Caption = 'Nome'
          Width = 200
          FieldName = 'nome'
        end
        item
          Caption = 'Fantasia'
          Width = 200
          FieldName = 'fantasia'
        end>
      Properties.ListFieldIndex = 2
      Properties.ListSource = dsFornecedor
      TabOrder = 1
      OnEnter = grpContentEnter
      Width = 342
    end
    object cbbRepresentante: TcxDBLookupComboBox
      Left = 159
      Top = 52
      DataBinding.DataField = 'representante'
      DataBinding.DataSource = ds
      Properties.KeyFieldNames = 'codigo'
      Properties.ListColumns = <
        item
          Caption = 'CNPJ'
          Width = 80
          FieldName = 'cnpj'
        end
        item
          Caption = 'Nome'
          Width = 200
          FieldName = 'nome'
        end
        item
          Caption = 'Fantasia'
          Width = 200
          FieldName = 'fantasia'
        end>
      Properties.ListFieldIndex = 2
      Properties.ListSource = dsRepresentante
      TabOrder = 3
      OnEnter = grpContentEnter
      Width = 342
    end
  end
  inherited ds: TUniDataSource
    Left = 408
    Top = 0
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO produto_fornecedores'
      
        '  (produto, fornecedor, representante, ultima_compra, preco_comp' +
        'ra, tempo_entrega, minimo_compra)'
      'VALUES'
      
        '  (:produto, :fornecedor, :representante, :ultima_compra, :preco' +
        '_compra, :tempo_entrega, :minimo_compra)')
    SQLDelete.Strings = (
      'DELETE FROM produto_fornecedores'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE produto_fornecedores'
      'SET'
      
        '  produto = :produto, fornecedor = :fornecedor, representante = ' +
        ':representante, ultima_compra = :ultima_compra, preco_compra = :' +
        'preco_compra, tempo_entrega = :tempo_entrega, minimo_compra = :m' +
        'inimo_compra'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM produto_fornecedores'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT produto, fornecedor, representante, ultima_compra, preco_' +
        'compra, tempo_entrega, minimo_compra FROM produto_fornecedores'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM produto_fornecedores'
      ''
      ') t')
    SQL.Strings = (
      'SELECT pdf.codigo, '
      #9'pdf.produto, '
      #9'pdf.fornecedor, '
      #9'pdf.representante, '
      #9'pdf.ultima_compra, '
      #9'pdf.preco_compra, '
      '        pdf.tempo_entrega,'
      '        pdf.minimo_compra'
      '   FROM produto_fornecedores pdf'
      '  WHERE pdf.produto = :codigo ;')
    AfterOpen = qConsultaAfterOpen
    Left = 368
    Top = 0
    object qConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qConsultaproduto: TIntegerField
      FieldName = 'produto'
      Required = True
    end
    object qConsultafornecedor: TIntegerField
      FieldName = 'fornecedor'
      Required = True
    end
    object qConsultarepresentante: TIntegerField
      FieldName = 'representante'
    end
    object qConsultaultima_compra: TDateField
      FieldName = 'ultima_compra'
    end
    object qConsultapreco_compra: TCurrencyField
      FieldName = 'preco_compra'
    end
    object qConsultatempo_entrega: TIntegerField
      FieldName = 'tempo_entrega'
    end
    object qConsultaminimo_compra: TIntegerField
      FieldName = 'minimo_compra'
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 324
  end
  object qFornecedor: TUniQuery
    Tag = 7000
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT f.codigo, '
      #9'f.nome, '
      #9'f.fantasia, '
      #9'f.cnpj'
      '   FROM pessoas f'
      
        '  WHERE f.fornecedor and f.codigo not in (select fornecedor from' +
        ' produto_fornecedores where produto = :codigo);')
    Left = 72
    Top = 142
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = nil
      end>
  end
  object dsFornecedor: TUniDataSource
    DataSet = qFornecedor
    Left = 104
    Top = 142
  end
  object qRepresentante: TUniQuery
    Tag = 7000
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT codigo, nome, fantasia, cnpj'
      '  FROM pessoas'
      '  WHERE representante;')
    Left = 144
    Top = 142
  end
  object dsRepresentante: TUniDataSource
    DataSet = qRepresentante
    Left = 176
    Top = 142
  end
end
