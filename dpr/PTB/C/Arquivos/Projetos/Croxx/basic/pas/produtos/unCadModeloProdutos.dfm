inherited frmCadModeloProdutos: TfrmCadModeloProdutos
  Caption = 'Modelo de Produtos'
  ClientHeight = 140
  ExplicitHeight = 169
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 105
    ExplicitTop = 61
  end
  inherited grpContent: TGroupBox
    Height = 58
    ExplicitHeight = 14
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
      OnEnter = grpContentEnter
      Width = 266
    end
  end
  inherited ds: TUniDataSource
    Left = 368
    Top = 0
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO produto_modelos'
      '  (descricao)'
      'VALUES'
      '  (:descricao)')
    SQLDelete.Strings = (
      'DELETE FROM produto_modelos'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE produto_modelos'
      'SET'
      '  descricao = :descricao'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM produto_modelos'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      'SELECT descricao FROM produto_modelos'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM produto_modelos'
      ''
      ') t')
    SQL.Strings = (
      'SELECT '#9'pm.codigo, '
      #9'pm.descricao'
      '  FROM  produto_modelos pm'
      ' WHERE  codigo = :codigo;')
    Left = 328
    Top = 0
    object qConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qConsultadescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 284
  end
end
