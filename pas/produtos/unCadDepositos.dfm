inherited frmCadDepositos: TfrmCadDepositos
  Caption = 'Dep'#243'sitos de Produtos'
  ClientHeight = 356
  ClientWidth = 440
  ExplicitWidth = 446
  ExplicitHeight = 385
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 321
    Width = 440
    ExplicitTop = 321
    ExplicitWidth = 440
    inherited btnCancelar: TButton
      Left = 164
      ExplicitLeft = 164
    end
    inherited btnSalvar: TButton
      Left = 256
      ExplicitLeft = 256
    end
    inherited btnFechar: TButton
      Left = 348
      ExplicitLeft = 348
    end
  end
  inherited grpContent: TGroupBox
    Width = 430
    Height = 132
    ExplicitWidth = 430
    ExplicitHeight = 132
    object Label1: TLabel
      Left = 9
      Top = 21
      Width = 41
      Height = 15
      Caption = 'C'#243'digo:'
      FocusControl = cxDBSpinEdit1
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
      FocusControl = cxDBTextEdit1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 9
      Top = 79
      Width = 85
      Height = 15
      Caption = 'Departamento:'
      FocusControl = cxDBSpinEdit2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbbDepartamento: TcxDBLookupComboBox
      Left = 167
      Top = 76
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
      TabOrder = 0
      OnEnter = grpContentEnter
      Width = 254
    end
    object cxDBCheckBox1: TcxDBCheckBox
      Left = 9
      Top = 102
      Caption = 'Permitir estoque negativo.'
      DataBinding.DataField = 'estoque_negativo'
      DataBinding.DataSource = ds
      Style.TextStyle = [fsBold]
      TabOrder = 1
      OnEnter = grpContentEnter
      Width = 192
    end
    object cxDBSpinEdit1: TcxDBSpinEdit
      Left = 56
      Top = 18
      DataBinding.DataField = 'codigo'
      DataBinding.DataSource = ds
      Enabled = False
      Properties.SpinButtons.Visible = False
      TabOrder = 2
      Width = 61
    end
    object cxDBSpinEdit2: TcxDBSpinEdit
      Left = 100
      Top = 76
      DataBinding.DataField = 'departamento'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 3
      OnEnter = grpContentEnter
      Width = 61
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 72
      Top = 47
      DataBinding.DataField = 'nome'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      TabOrder = 4
      OnEnter = grpContentEnter
      Width = 349
    end
  end
  object grpGrupos: TGroupBox [2]
    AlignWithMargins = True
    Left = 5
    Top = 187
    Width = 430
    Height = 134
    Margins.Left = 5
    Margins.Right = 5
    Margins.Bottom = 0
    Align = alBottom
    Caption = ' Grupo de Produtos '
    TabOrder = 3
    object Grid: TcxGrid
      AlignWithMargins = True
      Left = 5
      Top = 20
      Width = 395
      Height = 109
      Align = alClient
      TabOrder = 0
      object View: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsGrupos
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        Styles.Header = StyleTitle
        object ColViewID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'codigo'
          Width = 70
        end
        object ColViewDescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'descricao'
          Width = 300
        end
      end
      object Master: TcxGridLevel
        GridView = View
      end
    end
    object pnlTool: TPanel
      Left = 403
      Top = 17
      Width = 25
      Height = 115
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alRight
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object btnAdd: TButton
        Left = 0
        Top = 3
        Width = 22
        Height = 21
        HotImageIndex = 4
        ImageIndex = 3
        ImageMargins.Left = 1
        Images = ImageList16
        TabOrder = 0
      end
      object btnRemove: TButton
        Left = 0
        Top = 29
        Width = 22
        Height = 22
        ImageIndex = 4
        ImageMargins.Left = 1
        Images = ImageList16
        TabOrder = 1
      end
      object btnReload: TButton
        Left = 0
        Top = 56
        Width = 22
        Height = 22
        ImageIndex = 5
        ImageMargins.Left = 1
        Images = ImageList16
        TabOrder = 2
      end
    end
  end
  inherited pnlHelp: TPanel
    Width = 431
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
    Left = 288
    Top = 0
  end
  inherited qConsulta: TUniQuery
    SQL.Strings = (
      'SELECT '#9'codigo, '
      #9'nome, '
      #9'departamento, '
      #9'liquido, '
      #9'produto, '
      #9'capacidade, '
      #9'estoque_negativo, '
      #9'unidade_medida'
      '  FROM deposito'
      ' where liquido = false and codigo = :codigo;')
    Left = 248
    Top = 0
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 188
  end
  object qGrupos: TUniQuery
    Tag = 7100
    SQLInsert.Strings = (
      'INSERT INTO deposito'
      
        '  (nome, departamento, liquido, produto, capacidade, estoque_neg' +
        'ativo, unidade_medida, novo)'
      'VALUES'
      
        '  (:nome, :departamento, :liquido, :produto, :capacidade, :estoq' +
        'ue_negativo, :unidade_medida, :novo)')
    SQLDelete.Strings = (
      'DELETE FROM deposito'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE deposito'
      'SET'
      
        '  nome = :nome, departamento = :departamento, liquido = :liquido' +
        ', produto = :produto, capacidade = :capacidade, estoque_negativo' +
        ' = :estoque_negativo, unidade_medida = :unidade_medida, novo = :' +
        'novo'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM deposito'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT nome, departamento, liquido, produto, capacidade, estoque' +
        '_negativo, unidade_medida, novo FROM deposito'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM deposito'
      ''
      ') t')
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT '#9'dg.codigo, '
      #9'dg.deposito, '
      #9'dg.grupo,'
      #9'gp.descricao'
      '  FROM deposito_grupo_produto dg'
      '  left join produto_grupos gp on gp.codigo = dg.grupo'
      ' where dg.deposito = :codigo;')
    MasterSource = ds
    MasterFields = 'codigo'
    DetailFields = 'deposito'
    Left = 232
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = nil
      end>
    object qGruposcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qGruposdeposito: TIntegerField
      FieldName = 'deposito'
      Required = True
    end
    object qGruposgrupo: TIntegerField
      FieldName = 'grupo'
      Required = True
    end
    object qGruposdescricao: TStringField
      FieldName = 'descricao'
      ReadOnly = True
      Size = 50
    end
  end
  object dsGrupos: TDataSource
    DataSet = qGrupos
    Left = 264
    Top = 72
  end
  object StyleRepository: TcxStyleRepository
    Left = 342
    Top = 3
    PixelsPerInch = 96
    object StyleSelecionado: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object StyleNeutro: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
    end
    object StyleTitle: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
    end
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
    Left = 320
    Top = 104
  end
  object dsDepartamentos: TUniDataSource
    DataSet = qDepartamentos
    Left = 360
    Top = 104
  end
end
