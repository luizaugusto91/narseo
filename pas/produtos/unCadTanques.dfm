inherited frmCadTanques: TfrmCadTanques
  Caption = 'Tanques de Produtos'
  ClientHeight = 473
  ClientWidth = 440
  ExplicitWidth = 446
  ExplicitHeight = 502
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 438
    Width = 440
    TabOrder = 3
    ExplicitTop = 438
    ExplicitWidth = 440
    inherited btnCancelar: TButton
      Left = 163
      ExplicitLeft = 163
    end
    inherited btnSalvar: TButton
      Left = 256
      ExplicitLeft = 256
    end
    inherited btnFechar: TButton
      Left = 349
      ExplicitLeft = 349
    end
  end
  object grpDetalhes: TGroupBox [1]
    AlignWithMargins = True
    Left = 5
    Top = 54
    Width = 430
    Height = 156
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Align = alTop
    Caption = ' Detalhes '
    TabOrder = 1
    ExplicitTop = 5
    object Label1: TLabel
      Left = 9
      Top = 21
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
    object Label2: TLabel
      Left = 9
      Top = 50
      Width = 57
      Height = 15
      Caption = 'Descri'#231#227'o:'
      FocusControl = edtDescricao
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 9
      Top = 108
      Width = 85
      Height = 15
      Caption = 'Departamento:'
      FocusControl = edtdepartamento
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 218
      Top = 79
      Width = 65
      Height = 15
      Caption = 'Capacidade:'
      FocusControl = edtcapacidade
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 9
      Top = 79
      Width = 110
      Height = 15
      Caption = 'Unidade de Medida:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCodigo: TcxDBSpinEdit
      Left = 56
      Top = 18
      DataBinding.DataField = 'codigo'
      DataBinding.DataSource = ds
      Enabled = False
      Properties.SpinButtons.Visible = False
      TabOrder = 0
      Width = 61
    end
    object edtDescricao: TcxDBTextEdit
      Left = 72
      Top = 47
      DataBinding.DataField = 'nome'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      OnEnter = grpContentEnter
      Width = 345
    end
    object edtdepartamento: TcxDBSpinEdit
      Left = 100
      Top = 105
      DataBinding.DataField = 'departamento'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 4
      OnEnter = grpContentEnter
      Width = 57
    end
    object cbbestoque_negativo: TcxDBCheckBox
      Left = 9
      Top = 129
      Caption = 'Permitir estoque negativo.'
      DataBinding.DataField = 'estoque_negativo'
      DataBinding.DataSource = ds
      Style.TextStyle = [fsBold]
      TabOrder = 6
      OnEnter = grpContentEnter
      Width = 192
    end
    object cbbDepartamento: TcxDBLookupComboBox
      Left = 163
      Top = 105
      DataBinding.DataField = 'departamento'
      DataBinding.DataSource = ds
      Properties.KeyFieldNames = 'codigo'
      Properties.ListColumns = <
        item
          Caption = 'Descri'#231#227'o'
          Width = 260
          FieldName = 'nome'
        end>
      Properties.ListSource = dsDepartamentos
      TabOrder = 5
      OnEnter = grpContentEnter
      Width = 254
    end
    object edtcapacidade: TcxDBSpinEdit
      Left = 289
      Top = 76
      DataBinding.DataField = 'capacidade'
      DataBinding.DataSource = ds
      TabOrder = 3
      OnEnter = grpContentEnter
      Width = 128
    end
    object cbbUnidade: TcxDBLookupComboBox
      Left = 125
      Top = 76
      DataBinding.DataField = 'unidade_medida'
      DataBinding.DataSource = ds
      Properties.KeyFieldNames = 'unidade'
      Properties.ListColumns = <
        item
          FieldName = 'unidade'
        end>
      Properties.ListSource = dsUnidade
      TabOrder = 2
      OnEnter = grpContentEnter
      Width = 87
    end
  end
  inherited grpContent: TGroupBox
    Top = 216
    Width = 430
    Height = 222
    ExplicitTop = 216
    ExplicitWidth = 430
    ExplicitHeight = 222
    object GaugeControl: TdxGaugeControl
      AlignWithMargins = True
      Left = 5
      Top = 20
      Width = 420
      Height = 194
      Margins.Bottom = 6
      Align = alClient
      BorderStyle = cxcbsNone
      Transparent = True
      object GaugeCircularScaleGaugeControlCircularScale: TdxGaugeCircularScale
        MaxValue = 10000.000000000000000000
        StyleName = 'White'
      end
    end
  end
  inherited pnlHelp: TPanel
    Width = 431
    ExplicitLeft = 0
    ExplicitWidth = 431
    inherited mmoHelp: TMemo
      Width = 384
      Lines.Strings = (
        'Bem vindo a ajuda do sistema!'
        'Passe o mouse por cima do componente para obter mais '
        'informa'#231#245'es. ')
      ExplicitWidth = 384
    end
  end
  inherited ds: TUniDataSource
    OnDataChange = dsDataChange
    Left = 304
    Top = 0
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO deposito'
      
        '  (nome, departamento, liquido, produto, capacidade, estoque_neg' +
        'ativo, unidade_medida, quantidade)'
      'VALUES'
      
        '  (:nome, :departamento, :liquido, :produto, :capacidade, :estoq' +
        'ue_negativo, :unidade_medida, :quantidade)')
    SQLDelete.Strings = (
      'DELETE FROM deposito'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE deposito'
      'SET'
      
        '  nome = :nome, departamento = :departamento, liquido = :liquido' +
        ', produto = :produto, capacidade = :capacidade, estoque_negativo' +
        ' = :estoque_negativo, unidade_medida = :unidade_medida, quantida' +
        'de = :quantidade'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM deposito'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT nome, departamento, liquido, produto, capacidade, estoque' +
        '_negativo, unidade_medida, quantidade FROM deposito'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM deposito'
      ''
      ') t')
    SQL.Strings = (
      'SELECT '#9'codigo, '
      #9'nome, '
      #9'departamento, '
      #9'liquido, '
      #9'produto, '
      #9'capacidade, '
      #9'estoque_negativo, '
      #9'unidade_medida,'
      #9'quantidade'
      '  FROM deposito'
      ' where liquido = true and codigo = :codigo;')
    BeforePost = qConsultaBeforePost
    Left = 264
    Top = 0
    object qConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qConsultanome: TStringField
      FieldName = 'nome'
      Size = 45
    end
    object qConsultadepartamento: TIntegerField
      FieldName = 'departamento'
    end
    object qConsultaliquido: TBooleanField
      FieldName = 'liquido'
    end
    object qConsultaproduto: TLargeintField
      FieldName = 'produto'
    end
    object qConsultacapacidade: TIntegerField
      FieldName = 'capacidade'
    end
    object qConsultaestoque_negativo: TBooleanField
      FieldName = 'estoque_negativo'
    end
    object qConsultaunidade_medida: TStringField
      FieldName = 'unidade_medida'
      Size = 45
    end
    object qConsultaquantidade: TFloatField
      FieldName = 'quantidade'
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 220
  end
  object qDepartamentos: TUniQuery
    Tag = 7100
    Connection = Connection.Conn
    SQL.Strings = (
      
        'SELECT codigo, nome, descricao, turno_inicio, turno_fim, respons' +
        'avel, '
      '       desativado'
      '  FROM departamentos'
      ' WHERE desativado = false;')
    Left = 360
  end
  object dsDepartamentos: TUniDataSource
    DataSet = qDepartamentos
    Left = 392
  end
  object qUnidade: TUniQuery
    Tag = 7100
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT codigo, descricao, unidade, venda_decimal'
      '  FROM produto_unidade;')
    Left = 344
    Top = 168
  end
  object dsUnidade: TUniDataSource
    DataSet = qUnidade
    Left = 376
    Top = 168
  end
end
