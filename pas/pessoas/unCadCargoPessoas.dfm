inherited frmCadCargoPessoas: TfrmCadCargoPessoas
  Caption = 'Cargos'
  ClientHeight = 274
  ExplicitWidth = 506
  ExplicitHeight = 303
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 239
    ExplicitTop = 235
  end
  inherited grpContent: TGroupBox
    Height = 187
    ExplicitHeight = 183
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
    object lblDescricao: TLabel
      Left = 111
      Top = 24
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
      Left = 174
      Top = 21
      DataBinding.DataField = 'descricao'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      Width = 311
    end
    object grpConfiguracoes: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 49
      Width = 480
      Height = 133
      Align = alBottom
      Caption = ' Configura'#231#245'es Padrao '
      TabOrder = 2
      ExplicitTop = 45
      object lblCargaH: TLabel
        Left = 10
        Top = 25
        Width = 78
        Height = 15
        Caption = 'Carga Horaria:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCargaHSemana: TLabel
        Left = 200
        Top = 25
        Width = 84
        Height = 15
        Caption = 'Carga Semanal:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSalario: TLabel
        Left = 19
        Top = 54
        Width = 69
        Height = 15
        Caption = 'Salario Base:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblHExtra: TLabel
        Left = 206
        Top = 54
        Width = 78
        Height = 15
        Caption = 'Valor H. Extra:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object chbValeTransporte: TcxDBCheckBox
        Left = 10
        Top = 80
        Caption = 'Vale Transporte?'
        DataBinding.DataField = 'vale_transporte'
        DataBinding.DataSource = ds
        Style.TextStyle = [fsBold]
        TabOrder = 4
        Width = 178
      end
      object chbTicket: TcxDBCheckBox
        Left = 10
        Top = 104
        Caption = 'Ticket?'
        DataBinding.DataField = 'ticket'
        DataBinding.DataSource = ds
        Style.TextStyle = [fsBold]
        TabOrder = 6
        Width = 178
      end
      object chbCestaBasica: TcxDBCheckBox
        Left = 194
        Top = 80
        Caption = 'Cesta B'#225'sica?'
        DataBinding.DataField = 'cesta_basica'
        DataBinding.DataSource = ds
        Style.TextStyle = [fsBold]
        TabOrder = 5
        Width = 121
      end
      object chbSeguroVida: TcxDBCheckBox
        Left = 194
        Top = 104
        Caption = 'Seguro de vida?'
        DataBinding.DataField = 'seguro_vida'
        DataBinding.DataSource = ds
        Style.TextStyle = [fsBold]
        TabOrder = 7
        Width = 121
      end
      object edtSalario: TcxDBCurrencyEdit
        Left = 94
        Top = 51
        DataBinding.DataField = 'salario_base'
        DataBinding.DataSource = ds
        TabOrder = 2
        Width = 100
      end
      object edtHExtra: TcxDBCurrencyEdit
        Left = 290
        Top = 51
        DataBinding.DataField = 'valor_hora_extra'
        DataBinding.DataSource = ds
        TabOrder = 3
        Width = 100
      end
      object edtCargaHoraria: TcxDBTimeEdit
        Left = 94
        Top = 22
        DataBinding.DataField = 'carga_horaria'
        DataBinding.DataSource = ds
        Properties.SpinButtons.Visible = False
        TabOrder = 0
        Width = 100
      end
      object edtCargaHSemana: TcxDBTextEdit
        Left = 290
        Top = 22
        DataBinding.DataField = 'carga_horaria_semana'
        DataBinding.DataSource = ds
        TabOrder = 1
        Width = 100
      end
    end
  end
  inherited ds: TUniDataSource
    Left = 352
    Top = 0
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO cargos'
      
        '  (descricao, salario_base, valor_hora_extra, seguro_vida, vale_' +
        'transporte, cesta_basica, ticket, carga_horaria, carga_horaria_s' +
        'emana)'
      'VALUES'
      
        '  (:descricao, :salario_base, :valor_hora_extra, :seguro_vida, :' +
        'vale_transporte, :cesta_basica, :ticket, :carga_horaria, :carga_' +
        'horaria_semana)')
    SQLDelete.Strings = (
      'DELETE FROM cargos'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE cargos'
      'SET'
      
        '  descricao = :descricao, salario_base = :salario_base, valor_ho' +
        'ra_extra = :valor_hora_extra, seguro_vida = :seguro_vida, vale_t' +
        'ransporte = :vale_transporte, cesta_basica = :cesta_basica, tick' +
        'et = :ticket, carga_horaria = :carga_horaria, carga_horaria_sema' +
        'na = :carga_horaria_semana'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM cargos'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT descricao, salario_base, valor_hora_extra, seguro_vida, v' +
        'ale_transporte, cesta_basica, ticket, carga_horaria, carga_horar' +
        'ia_semana FROM cargos'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM cargos'
      ''
      ') t')
    SQL.Strings = (
      'SELECT '#9'cg.codigo, '
      #9'cg.descricao, '
      #9'cg.salario_base, '
      #9'cg.carga_horaria, '
      #9'cg.valor_hora_extra, '
      #9'cg.seguro_vida, '
      #9'cg.vale_transporte, '
      #9'cg.cesta_basica, '
      #9'cg.ticket, '
      #9'cg.carga_horaria_semana'
      '  FROM '#9'cargos cg'
      ' WHERE cg.codigo = :codigo;')
    Left = 312
    Top = 0
    object qConsultadescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object qConsultasalario_base: TFloatField
      FieldName = 'salario_base'
    end
    object qConsultavalor_hora_extra: TFloatField
      FieldName = 'valor_hora_extra'
    end
    object qConsultaseguro_vida: TBooleanField
      FieldName = 'seguro_vida'
    end
    object qConsultavale_transporte: TBooleanField
      FieldName = 'vale_transporte'
    end
    object qConsultacesta_basica: TBooleanField
      FieldName = 'cesta_basica'
    end
    object qConsultaticket: TBooleanField
      FieldName = 'ticket'
    end
    object qConsultacarga_horaria: TStringField
      FieldName = 'carga_horaria'
      Size = 10
    end
    object FieldConsultacarga_horaria_semana: TStringField
      FieldName = 'carga_horaria_semana'
      Size = 10
    end
    object FieldConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 268
  end
end
