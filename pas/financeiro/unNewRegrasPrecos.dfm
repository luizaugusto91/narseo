inherited frmNewRegrasPrecos: TfrmNewRegrasPrecos
  Caption = 'Nova Regra de Pre'#231'os'
  ClientHeight = 180
  ExplicitWidth = 537
  ExplicitHeight = 219
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotton: TPanel
    Top = 145
  end
  inherited grpContent: TGroupBox
    Height = 142
    object lbl1: TLabel
      Left = 111
      Top = 24
      Width = 50
      Height = 13
      Caption = 'Descri'#231#227'o:'
      FocusControl = edtdescricao
    end
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
    object edtdescricao: TcxDBTextEdit
      Left = 167
      Top = 21
      DataBinding.DataField = 'descricao'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      TabOrder = 0
      Width = 330
    end
    object edtCodigo: TcxDBSpinEdit
      Left = 57
      Top = 21
      DataBinding.DataField = 'codigo'
      DataBinding.DataSource = ds
      Enabled = False
      Properties.SpinButtons.Visible = False
      Style.Color = clBtnFace
      TabOrder = 1
      Width = 48
    end
    object grpObservacao: TGroupBox
      AlignWithMargins = True
      Left = 8
      Top = 47
      Width = 495
      Height = 87
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alBottom
      Caption = ' Observa'#231#245'es '
      TabOrder = 2
      ExplicitTop = 101
      ExplicitWidth = 586
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
        ExplicitWidth = 576
        Height = 64
        Width = 485
      end
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = -196196
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO produto_regras'
      '  (codigo, empresa, descricao, observacao, bloqueada)'
      'VALUES'
      '  (:codigo, :empresa, :descricao, :observacao, :bloqueada)')
    SQLDelete.Strings = (
      'DELETE FROM produto_regras'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE produto_regras'
      'SET'
      
        '  codigo = :codigo, empresa = :empresa, descricao = :descricao, ' +
        'observacao = :observacao, bloqueada = :bloqueada'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM produto_regras'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT codigo, empresa, descricao, observacao, bloqueada FROM pr' +
        'oduto_regras'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM produto_regras'
      ''
      ') t')
    SQL.Strings = (
      'SELECT codigo, empresa, descricao, observacao, bloqueada'
      '  FROM produto_regras;')
    Left = 312
    Top = 65533
    object FieldConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object FieldConsultaempresa: TIntegerField
      FieldName = 'empresa'
    end
    object FieldConsultadescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object FieldConsultaobservacao: TStringField
      FieldName = 'observacao'
      Size = 250
    end
    object FieldConsultabloqueada: TBooleanField
      FieldName = 'bloqueada'
      Required = True
    end
  end
  inherited ds: TUniDataSource
    Left = 352
    Top = 65533
  end
  inherited qSQL: TUniQuery
    Left = 480
    Top = 0
  end
end
