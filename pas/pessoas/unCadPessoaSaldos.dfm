inherited frmCadPessoaSaldos: TfrmCadPessoaSaldos
  Caption = 'Associar saldos'
  ClientHeight = 334
  ClientWidth = 494
  ExplicitWidth = 500
  ExplicitHeight = 363
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 299
    Width = 494
    ExplicitTop = 299
    ExplicitWidth = 494
    inherited btnCancelar: TButton
      Left = 217
      ExplicitLeft = 217
    end
    inherited btnSalvar: TButton
      Left = 310
      ExplicitLeft = 310
    end
    inherited btnFechar: TButton
      Left = 403
      ExplicitLeft = 403
    end
  end
  inherited grpContent: TGroupBox
    Width = 484
    Height = 247
    ExplicitWidth = 484
    ExplicitHeight = 247
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
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTipReceita: TLabel
      Left = 111
      Top = 24
      Width = 41
      Height = 15
      Caption = 'Receita:'
      FocusControl = edttipo_receita
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValor: TLabel
      Left = 10
      Top = 53
      Width = 30
      Height = 15
      Caption = 'Valor:'
      FocusControl = edtvalor
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblOrigem: TLabel
      Left = 152
      Top = 53
      Width = 43
      Height = 15
      Caption = 'Origem:'
      FocusControl = edtorigem
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbldescricao: TLabel
      Left = 10
      Top = 82
      Width = 55
      Height = 15
      Caption = 'Descri'#231#227'o:'
      FocusControl = edtdescricao
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblmovimento: TLabel
      Left = 10
      Top = 111
      Width = 65
      Height = 15
      Caption = 'Movimento:'
      FocusControl = edtmovimento
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
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
    object edttipo_receita: TcxDBSpinEdit
      Left = 158
      Top = 21
      DataBinding.DataField = 'tipo_receita'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 1
      OnExit = grpContentExit
      Width = 50
    end
    object edtvalor: TcxDBCurrencyEdit
      Left = 46
      Top = 50
      DataBinding.DataField = 'valor'
      DataBinding.DataSource = ds
      TabOrder = 2
      OnExit = grpContentExit
      Width = 100
    end
    object edtorigem: TcxDBSpinEdit
      Left = 201
      Top = 50
      DataBinding.DataField = 'origem'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 3
      OnExit = grpContentExit
      Width = 60
    end
    object edtdescricao: TcxDBTextEdit
      Left = 70
      Top = 79
      DataBinding.DataField = 'descricao'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      TabOrder = 4
      OnExit = grpContentExit
      Width = 403
    end
    object edtmovimento: TcxDBSpinEdit
      Left = 81
      Top = 108
      DataBinding.DataField = 'movimento'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 5
      OnExit = grpContentExit
      Width = 60
    end
    object cbbparcial: TcxDBCheckBox
      Left = 147
      Top = 108
      Caption = 'Valor parcial'
      DataBinding.DataField = 'parcial'
      DataBinding.DataSource = ds
      ParentFont = False
      Properties.ValueGrayed = 'False'
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI Semibold'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 6
      Width = 121
    end
    object grpObservacao: TGroupBox
      Left = 10
      Top = 132
      Width = 463
      Height = 105
      Caption = ' Observa'#231#245'es '
      TabOrder = 7
      object mmoobservacao: TcxDBMemo
        AlignWithMargins = True
        Left = 5
        Top = 20
        Align = alClient
        DataBinding.DataField = 'observacao'
        DataBinding.DataSource = ds
        Properties.CharCase = ecUpperCase
        TabOrder = 0
        OnExit = grpContentExit
        Height = 80
        Width = 453
      end
    end
    object cbbtipo_conta: TcxDBImageComboBox
      Left = 214
      Top = 21
      DataBinding.DataField = 'tipo_receita'
      DataBinding.DataSource = ds
      Properties.Alignment.Horz = taLeftJustify
      Properties.Items = <
        item
          Description = 'DEBITO'
          Value = 1
        end
        item
          Description = 'CREDITO'
          ImageIndex = 0
          Value = 0
        end>
      Style.ButtonStyle = btsFlat
      Style.ButtonTransparency = ebtNone
      TabOrder = 8
      Width = 259
    end
  end
  inherited pnlHelp: TPanel
    Width = 485
    ExplicitWidth = 485
    inherited mmoHelp: TMemo
      Width = 438
      ExplicitWidth = 438
    end
  end
  inherited ds: TUniDataSource
    Left = 384
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO pessoa_saldo'
      
        '  (pessoa, tipo_receita, valor, parcial, origem, descricao, movi' +
        'mento, observacao)'
      'VALUES'
      
        '  (:pessoa, :tipo_receita, :valor, :parcial, :origem, :descricao' +
        ', :movimento, :observacao)')
    SQLDelete.Strings = (
      'DELETE FROM pessoa_saldo'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE pessoa_saldo'
      'SET'
      
        '  data_registro = :data_registro, tipo_receita = :tipo_receita, ' +
        'valor = :valor, parcial = :parcial, origem = :origem, descricao ' +
        '= :descricao, movimento = :movimento, observacao = :observacao'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM pessoa_saldo'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT pessoa, data_registro, tipo_receita, valor, parcial, orig' +
        'em, descricao, movimento, observacao FROM pessoa_saldo'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM pessoa_saldo'
      ''
      ') t')
    SQL.Strings = (
      'SELECT codigo, '
      #9'pessoa, '
      #9'data_registro, '
      #9'tipo_receita, '
      #9'valor, '
      #9'parcial, '
      #9'origem, '
      #9'descricao, '
      #9'movimento, '
      #9'observacao'
      '   FROM pessoa_saldo'
      '  WHERE codigo = :codigo;')
    Left = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = nil
      end>
    object qConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qConsultapessoa: TIntegerField
      FieldName = 'pessoa'
      Required = True
    end
    object qConsultadata_registro: TDateField
      FieldName = 'data_registro'
    end
    object qConsultatipo_receita: TIntegerField
      FieldName = 'tipo_receita'
      Required = True
    end
    object qConsultavalor: TCurrencyField
      FieldName = 'valor'
      Required = True
    end
    object qConsultaparcial: TBooleanField
      FieldName = 'parcial'
    end
    object qConsultaorigem: TIntegerField
      FieldName = 'origem'
    end
    object qConsultadescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 250
    end
    object qConsultamovimento: TIntegerField
      FieldName = 'movimento'
    end
    object qConsultaobservacao: TStringField
      FieldName = 'observacao'
      Size = 600
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 300
  end
end
