inherited frmCadCategoriaPessoas: TfrmCadCategoriaPessoas
  Caption = 'Categoria de Pessoas'
  ClientHeight = 164
  ExplicitHeight = 193
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 129
    ExplicitTop = 85
  end
  inherited grpContent: TGroupBox
    Height = 82
    ExplicitHeight = 38
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
    object chbBloqueado: TcxDBCheckBox
      Left = 10
      Top = 50
      Caption = 'Bloqueado?'
      DataBinding.DataField = 'bloqueado'
      DataBinding.DataSource = ds
      TabOrder = 1
      Width = 121
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
    object edtDescricao: TcxDBTextEdit
      Left = 175
      Top = 21
      DataBinding.DataField = 'categoria'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      TabOrder = 0
      Width = 258
    end
  end
  inherited ds: TUniDataSource
    Left = 344
    Top = 0
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO pessoa_categorias'
      '  (empresa, categoria, bloqueado)'
      'VALUES'
      '  (:empresa, :categoria, :bloqueado)')
    SQLDelete.Strings = (
      'DELETE FROM pessoa_categorias'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE pessoa_categorias'
      'SET'
      
        '  empresa = :empresa, categoria = :categoria, bloqueado = :bloqu' +
        'eado'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM pessoa_categorias'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      'SELECT empresa, categoria, bloqueado FROM pessoa_categorias'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM pessoa_categorias'
      ''
      ') t')
    SQL.Strings = (
      'SELECT  pc.codigo, '
      #9'pc.empresa, '
      #9'pc.categoria, '
      #9'pc.bloqueado'
      '  FROM  pessoa_categorias pc'
      ' WHERE  pc.codigo = :codigo;')
    Left = 304
    Top = 0
    object qConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qConsultaempresa: TIntegerField
      FieldName = 'empresa'
    end
    object qConsultacategoria: TStringField
      FieldName = 'categoria'
      Size = 100
    end
    object qConsultabloqueado: TBooleanField
      FieldName = 'bloqueado'
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 260
  end
end
