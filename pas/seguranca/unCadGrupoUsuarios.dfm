inherited frmCadGrupoUsuarios: TfrmCadGrupoUsuarios
  Caption = 'Grupo de Usu'#225'rios'
  ClientHeight = 407
  ExplicitHeight = 436
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 372
    ExplicitTop = 328
  end
  inherited grpContent: TGroupBox
    Height = 325
    ExplicitHeight = 281
    object lblCodigo: TLabel
      Left = 10
      Top = 24
      Width = 41
      Height = 15
      Caption = 'C'#243'digo:'
      FocusControl = edtCodigo
    end
    object lblNome: TLabel
      Left = 111
      Top = 24
      Width = 34
      Height = 15
      Caption = 'Nome:'
      FocusControl = edtNome
    end
    object lblSetor: TLabel
      Left = 10
      Top = 53
      Width = 81
      Height = 15
      Caption = 'Departamento:'
      FocusControl = edtSetor
    end
    object cbAtivo: TcxDBCheckBox
      Left = 368
      Top = 50
      Caption = 'Ativo'
      DataBinding.DataField = 'ativo'
      DataBinding.DataSource = ds
      TabOrder = 0
      Width = 65
    end
    object cbbSetor: TcxDBLookupComboBox
      Left = 151
      Top = 50
      DataBinding.DataField = 'departamento'
      DataBinding.DataSource = ds
      Properties.KeyFieldNames = 'codigo'
      Properties.ListColumns = <
        item
          Caption = 'Departamento'
          Width = 220
          FieldName = 'nome'
        end>
      Properties.ListSource = dsSetor
      TabOrder = 1
      Width = 211
    end
    object edtCodigo: TcxDBSpinEdit
      Left = 57
      Top = 21
      DataBinding.DataField = 'codigo'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      Style.Color = clBtnFace
      TabOrder = 2
      Width = 48
    end
    object edtNome: TcxDBTextEdit
      Left = 151
      Top = 21
      DataBinding.DataField = 'nome'
      DataBinding.DataSource = ds
      TabOrder = 3
      Width = 282
    end
    object edtSetor: TcxDBSpinEdit
      Left = 95
      Top = 50
      DataBinding.DataField = 'departamento'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 4
      Width = 50
    end
    object grpUsuarios: TGroupBox
      AlignWithMargins = True
      Left = 7
      Top = 82
      Width = 446
      Height = 236
      Margins.Left = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alBottom
      Caption = ' Usu'#225'rios vinculados '
      TabOrder = 5
      ExplicitTop = 38
      object Grid: TcxGrid
        AlignWithMargins = True
        Left = 5
        Top = 20
        Width = 436
        Height = 211
        Align = alClient
        TabOrder = 0
        object View: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsSub
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object ColumnID: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'codigo'
            Width = 50
          end
          object ColumnPessoa: TcxGridDBColumn
            Caption = 'Pessoa'
            DataBinding.FieldName = 'nome_pessoa'
            Width = 200
          end
          object ColumnAtivo: TcxGridDBColumn
            Caption = 'Ativo'
            DataBinding.FieldName = 'ativo'
            Width = 60
          end
        end
        object Master: TcxGridLevel
          GridView = View
        end
      end
    end
  end
  inherited ds: TUniDataSource
    Left = 296
    Top = 0
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO system_grupo_usuarios'
      '  (nome, setor, ativo)'
      'VALUES'
      '  (:nome, :setor, :ativo)')
    SQLDelete.Strings = (
      'DELETE FROM system_grupo_usuarios'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE system_grupo_usuarios'
      'SET'
      '  nome = :nome, setor = :setor, ativo = :ativo'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM system_grupo_usuarios'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      'SELECT nome, setor, ativo FROM system_grupo_usuarios'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM system_grupo_usuarios'
      ''
      ') t')
    SQL.Strings = (
      'SELECT codigo, nome, departamento, ativo'
      '  FROM system_grupo_usuarios'
      ' WHERE codigo = :codigo;')
    Left = 256
    Top = 0
    object qConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qConsultanome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 100
    end
    object qConsultaativo: TBooleanField
      FieldName = 'ativo'
      Required = True
    end
    object FieldConsultadepartamento: TIntegerField
      FieldName = 'departamento'
      Required = True
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 212
  end
  object qUsuariosGrupo: TUniQuery
    Tag = 7100
    SQLInsert.Strings = (
      'INSERT INTO grupo_produtos_subgrupos'
      '  (codgrupo, descricao, comissao)'
      'VALUES'
      '  (:codgrupo, :descricao, :comissao)')
    SQLDelete.Strings = (
      'DELETE FROM grupo_produtos_subgrupos'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE grupo_produtos_subgrupos'
      'SET'
      
        '  codgrupo = :codgrupo, descricao = :descricao, flag = :flag, co' +
        'missao = :comissao, tipo_comissao = :tipo_comissao'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM grupo_produtos_subgrupos'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT codgrupo, descricao, flag, comissao, tipo_comissao FROM g' +
        'rupo_produtos_subgrupos'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM grupo_produtos_subgrupos'
      ''
      ') t')
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT su.codigo, '
      #9'su.grupo, '
      #9'su.ativo, '
      #9'su.pessoa, '
      #9'ps.nome as nome_pessoa,'
      #9'su.empresa'
      '   FROM system_usuarios su'
      '   LEFT JOIN pessoas ps ON ps.codigo = su.pessoa'
      '  WHERE su.grupo = :codigo;')
    MasterSource = ds
    MasterFields = 'codigo'
    DetailFields = 'grupo'
    Left = 80
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = 0
      end>
  end
  object dsSub: TUniDataSource
    DataSet = qUsuariosGrupo
    Left = 80
    Top = 184
  end
  object qSetor: TUniQuery
    Tag = 7100
    SQLInsert.Strings = (
      'INSERT INTO grupo_produtos_subgrupos'
      '  (codgrupo, descricao, comissao)'
      'VALUES'
      '  (:codgrupo, :descricao, :comissao)')
    SQLDelete.Strings = (
      'DELETE FROM grupo_produtos_subgrupos'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE grupo_produtos_subgrupos'
      'SET'
      
        '  codgrupo = :codgrupo, descricao = :descricao, flag = :flag, co' +
        'missao = :comissao, tipo_comissao = :tipo_comissao'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM grupo_produtos_subgrupos'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT codgrupo, descricao, flag, comissao, tipo_comissao FROM g' +
        'rupo_produtos_subgrupos'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM grupo_produtos_subgrupos'
      ''
      ') t')
    Connection = Connection.Conn
    SQL.Strings = (
      
        'SELECT codigo, nome, descricao, turno_inicio, turno_fim, respons' +
        'avel, '
      '       desativado'
      '  FROM departamentos;')
    DetailFields = 'grupo'
    Left = 216
    Top = 136
  end
  object dsSetor: TUniDataSource
    DataSet = qSetor
    Left = 216
    Top = 184
  end
end
