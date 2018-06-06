inherited frmCadTipoImovel: TfrmCadTipoImovel
  Caption = 'Tipo de Imovel'
  ClientHeight = 120
  ExplicitWidth = 476
  ExplicitHeight = 158
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 85
  end
  object grpDetalhes: TGroupBox [1]
    AlignWithMargins = True
    Left = 5
    Top = 3
    Width = 450
    Height = 82
    Margins.Left = 5
    Margins.Right = 5
    Margins.Bottom = 0
    Align = alClient
    Caption = ' Detalhes '
    TabOrder = 1
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
      Width = 258
    end
    object chbBloqueado: TcxDBCheckBox
      Left = 10
      Top = 50
      Caption = 'Bloqueado?'
      DataBinding.DataField = 'bloqueado'
      DataBinding.DataSource = ds
      TabOrder = 2
      Width = 121
    end
  end
  inherited ds: TUniDataSource
    Left = 376
    Top = 0
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO tipo_imovel'
      '  (descricao, bloqueado)'
      'VALUES'
      '  (:descricao, :bloqueado)')
    SQLDelete.Strings = (
      'DELETE FROM tipo_imovel'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE tipo_imovel'
      'SET'
      '  descricao = :descricao, bloqueado = :bloqueado'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM tipo_imovel'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      'SELECT descricao, bloqueado FROM tipo_imovel'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM tipo_imovel'
      ''
      ') t')
    SQL.Strings = (
      'SELECT '#9'ti.codigo, '
      #9'ti.descricao, '
      #9'ti.bloqueado'
      '  FROM tipo_imovel ti'
      'where ti.codigo = :codigo;')
    Left = 336
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = 0
      end>
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
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 292
  end
end
