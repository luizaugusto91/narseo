inherited frmCadTipoFrota: TfrmCadTipoFrota
  Caption = 'Tipo de Frota'
  ClientHeight = 153
  ExplicitHeight = 182
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 118
    ExplicitTop = 118
  end
  inherited grpContent: TGroupBox
    Height = 115
    ExplicitLeft = 0
    ExplicitTop = 4
    ExplicitHeight = 115
    object lblCapacidade: TLabel
      Left = 10
      Top = 82
      Width = 164
      Height = 15
      Caption = 'Capacidade de Carregamento:'
      FocusControl = edtDescricao
    end
    object lblCodigo: TLabel
      Left = 10
      Top = 24
      Width = 41
      Height = 15
      Caption = 'C'#243'digo:'
      FocusControl = edtCodigo
    end
    object lblDescricao: TLabel
      Left = 111
      Top = 24
      Width = 58
      Height = 15
      Caption = 'Descri'#231#227'o:'
      FocusControl = edtDescricao
    end
    object lblUnidade: TLabel
      Left = 10
      Top = 53
      Width = 145
      Height = 15
      Caption = 'Unidade de Carregamento:'
      FocusControl = edtDescricao
    end
    object cbbUnidade: TcxDBLookupComboBox
      Left = 217
      Top = 50
      DataBinding.DataField = 'carregamento_unidade'
      DataBinding.DataSource = ds
      Properties.KeyFieldNames = 'unidade'
      Properties.ListColumns = <
        item
          Caption = 'Descri'#231#227'o'
          Width = 200
          FieldName = 'descricao'
        end
        item
          Caption = 'Sigla'
          Width = 40
          FieldName = 'unidade'
        end>
      Properties.ListSource = dsUnidade
      TabOrder = 3
      OnEnter = grpContentEnter
      Width = 216
    end
    object chbBloqueado: TcxDBCheckBox
      Left = 336
      Top = 79
      Caption = 'Bloqueado?'
      DataBinding.DataField = 'bloqueado'
      DataBinding.DataSource = ds
      TabOrder = 5
      OnEnter = grpContentEnter
      Width = 97
    end
    object edtCodigo: TcxDBSpinEdit
      Left = 57
      Top = 21
      DataBinding.DataField = 'codigo'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      Style.Color = clBtnFace
      TabOrder = 0
      Width = 48
    end
    object edtDescricao: TcxDBTextEdit
      Left = 175
      Top = 21
      DataBinding.DataField = 'descricao'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      OnEnter = grpContentEnter
      Width = 258
    end
    object edtUnCarregamento: TcxDBTextEdit
      Left = 161
      Top = 50
      DataBinding.DataField = 'carregamento_unidade'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      TabOrder = 2
      OnEnter = grpContentEnter
      Width = 50
    end
    object edtcarregamento_capacidade: TcxDBCalcEdit
      Left = 180
      Top = 79
      DataBinding.DataField = 'carregamento_capacidade'
      DataBinding.DataSource = ds
      TabOrder = 4
      OnEnter = grpContentEnter
      Width = 150
    end
  end
  inherited ds: TUniDataSource
    Left = 376
    Top = 0
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO tipo_frota'
      
        '  (descricao, bloqueado, carregamento_unidade, carregamento_capa' +
        'cidade)'
      'VALUES'
      
        '  (:descricao, :bloqueado, :carregamento_unidade, :carregamento_' +
        'capacidade)')
    SQLDelete.Strings = (
      'DELETE FROM tipo_frota'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE tipo_frota'
      'SET'
      
        '  descricao = :descricao, bloqueado = :bloqueado, carregamento_u' +
        'nidade = :carregamento_unidade, carregamento_capacidade = :carre' +
        'gamento_capacidade'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM tipo_frota'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT descricao, bloqueado, carregamento_unidade, carregamento_' +
        'capacidade FROM tipo_frota'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM tipo_frota'
      ''
      ') t')
    SQL.Strings = (
      'SELECT '#9'tf.codigo, '
      #9'tf.descricao, '
      #9'tf.bloqueado,'
      '  tf.carregamento_unidade,'
      '  tf.carregamento_capacidade'
      '  FROM tipo_frota tf'
      ' WHERE tf.codigo = :codigo;')
    Left = 336
    Top = 0
    object qConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qConsultadescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 160
    end
    object qConsultabloqueado: TBooleanField
      FieldName = 'bloqueado'
    end
    object qConsultacarregamento_unidade: TStringField
      FieldName = 'carregamento_unidade'
      FixedChar = True
      Size = 2
    end
    object qConsultacarregamento_capacidade: TFloatField
      FieldName = 'carregamento_capacidade'
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 292
  end
  object qUnidade: TUniQuery
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
      
        'SELECT codigo, descricao::character varying(120), unidade, venda' +
        '_decimal'
      '  FROM produto_unidade;')
    MasterSource = ds
    Left = 136
  end
  object dsUnidade: TUniDataSource
    DataSet = qUnidade
    Left = 168
  end
end
