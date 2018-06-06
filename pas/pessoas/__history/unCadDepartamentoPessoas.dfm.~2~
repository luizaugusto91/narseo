inherited frmCadDepartamentoPessoas: TfrmCadDepartamentoPessoas
  Tag = 2101
  Caption = 'Departamentos'
  ClientHeight = 249
  ExplicitWidth = 506
  ExplicitHeight = 278
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 214
    ExplicitTop = 214
  end
  inherited grpContent: TGroupBox
    Height = 162
    ExplicitHeight = 162
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
    object lblNome: TLabel
      Left = 111
      Top = 24
      Width = 37
      Height = 15
      Caption = 'Nome:'
      FocusControl = edtNome
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDescricao: TLabel
      Left = 10
      Top = 53
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
    object lblResposavel: TLabel
      Left = 10
      Top = 82
      Width = 72
      Height = 15
      Caption = 'Responsavel:'
      FocusControl = cbbResponsavel
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
      Properties.SpinButtons.Visible = False
      Style.Color = clBtnFace
      TabOrder = 0
      Width = 48
    end
    object edtNome: TcxDBTextEdit
      Left = 154
      Top = 21
      DataBinding.DataField = 'nome'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      Width = 331
    end
    object edtDescricao: TcxDBTextEdit
      Left = 73
      Top = 50
      DataBinding.DataField = 'descricao'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      TabOrder = 2
      Width = 412
    end
    object edtResponsavel: TcxDBSpinEdit
      Left = 88
      Top = 79
      DataBinding.DataField = 'responsavel'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 3
      Width = 42
    end
    object cbbResponsavel: TcxDBLookupComboBox
      Left = 136
      Top = 79
      DataBinding.DataField = 'responsavel'
      DataBinding.DataSource = ds
      Properties.KeyFieldNames = 'codigo'
      Properties.ListColumns = <
        item
          Caption = 'Nome'
          Width = 300
          FieldName = 'nome'
        end
        item
          Caption = 'Apelido'
          Width = 300
          FieldName = 'fantasia'
        end>
      Properties.ListSource = dsResponsavel
      TabOrder = 4
      Width = 349
    end
    object grpConfiguracoes: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 103
      Width = 480
      Height = 54
      Align = alBottom
      Caption = ' Configura'#231#245'es do Turno '
      TabOrder = 5
      object lblCargaH: TLabel
        Left = 10
        Top = 25
        Width = 33
        Height = 15
        Caption = 'Inicio:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCargaHSemana: TLabel
        Left = 144
        Top = 25
        Width = 49
        Height = 15
        Caption = 'Termino:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtTurnoInicio: TcxDBTimeEdit
        Left = 49
        Top = 22
        DataBinding.DataField = 'turno_inicio'
        DataBinding.DataSource = ds
        Properties.SpinButtons.Visible = False
        TabOrder = 0
        Width = 89
      end
      object edtTurnoTermino: TcxDBTimeEdit
        Left = 199
        Top = 22
        DataBinding.DataField = 'turno_fim'
        DataBinding.DataSource = ds
        Properties.SpinButtons.Visible = False
        TabOrder = 1
        Width = 89
      end
      object chbInativo: TcxDBCheckBox
        Left = 294
        Top = 22
        Caption = 'Inativo?'
        DataBinding.DataField = 'desativado'
        DataBinding.DataSource = ds
        Style.TextStyle = [fsBold]
        TabOrder = 2
        Width = 121
      end
    end
  end
  inherited ds: TUniDataSource
    Left = 352
    Top = 0
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO departamentos'
      
        '  (nome, descricao, turno_inicio, turno_fim, responsavel, desati' +
        'vado)'
      'VALUES'
      
        '  (:nome, :descricao, :turno_inicio, :turno_fim, :responsavel, :' +
        'desativado)')
    SQLDelete.Strings = (
      'DELETE FROM departamentos'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE departamentos'
      'SET'
      
        '  nome = :nome, descricao = :descricao, turno_inicio = :turno_in' +
        'icio, turno_fim = :turno_fim, responsavel = :responsavel, desati' +
        'vado = :desativado'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM departamentos'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT nome, descricao, turno_inicio, turno_fim, responsavel, de' +
        'sativado FROM departamentos'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM departamentos'
      ''
      ') t')
    SQL.Strings = (
      'SELECT '#9'dp.codigo, '
      #9'dp.nome, '
      #9'dp.descricao, '
      #9'dp.turno_inicio, '
      #9'dp.turno_fim, '
      #9'dp.responsavel, '
      #9'dp.desativado'
      '  FROM '#9'departamentos dp'
      ' WHERE dp.codigo = :codigo;')
    Left = 312
    Top = 0
    object qConsultacodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
    end
    object qConsultanome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 100
    end
    object qConsultadescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 250
    end
    object qConsultaturno_inicio: TTimeField
      FieldName = 'turno_inicio'
    end
    object qConsultaturno_fim: TTimeField
      FieldName = 'turno_fim'
    end
    object qConsultaresponsavel: TIntegerField
      FieldName = 'responsavel'
    end
    object qConsultadesativado: TBooleanField
      FieldName = 'desativado'
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 268
  end
  object qResponsavel: TUniQuery
    Tag = 7100
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT codigo, nome, fantasia'
      '  FROM pessoas'
      ' WHERE colaborador = TRUE and inativo = FALSE ;')
    Left = 296
    Top = 48
  end
  object dsResponsavel: TUniDataSource
    DataSet = qResponsavel
    Left = 336
    Top = 48
  end
end
