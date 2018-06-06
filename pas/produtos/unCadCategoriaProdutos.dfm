inherited frmCadCategoriaProdutos: TfrmCadCategoriaProdutos
  Caption = 'Categorias de Produtos'
  ClientHeight = 197
  ExplicitWidth = 506
  ExplicitHeight = 226
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 162
    ExplicitTop = 162
  end
  inherited grpContent: TGroupBox
    Height = 110
    ExplicitHeight = 110
    object Label1: TLabel
      Left = 10
      Top = 24
      Width = 41
      Height = 15
      Caption = 'C'#243'digo:'
      FocusControl = edtcodigo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 111
      Top = 24
      Width = 57
      Height = 15
      Caption = 'Descri'#231#227'o:'
      FocusControl = edtcategoria
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 266
      Top = 53
      Width = 22
      Height = 15
      Caption = 'IVA:'
      FocusControl = edtiva
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 10
      Top = 53
      Width = 123
      Height = 15
      Caption = 'Margem de Desconto:'
      FocusControl = edtmargem_desconto
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtiva: TcxDBCalcEdit
      Left = 294
      Top = 50
      DataBinding.DataField = 'iva'
      DataBinding.DataSource = ds
      TabOrder = 3
      OnEnter = grpContentEnter
      Width = 82
    end
    object edtmargem_desconto: TcxDBCalcEdit
      Left = 139
      Top = 50
      DataBinding.DataField = 'margem_desconto'
      DataBinding.DataSource = ds
      TabOrder = 2
      OnEnter = grpContentEnter
      Width = 121
    end
    object cbbbloqueado: TcxDBCheckBox
      Left = 10
      Top = 79
      Caption = 'Categoria Bloqueada?'
      DataBinding.DataField = 'bloqueado'
      DataBinding.DataSource = ds
      Style.TextStyle = [fsBold]
      TabOrder = 4
      OnEnter = grpContentEnter
      Width = 159
    end
    object edtcodigo: TcxDBSpinEdit
      Left = 57
      Top = 21
      DataBinding.DataField = 'codigo'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      Style.Color = clBtnFace
      TabOrder = 0
      Width = 48
    end
    object edtcategoria: TcxDBTextEdit
      Left = 174
      Top = 21
      DataBinding.DataField = 'categoria'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      OnEnter = grpContentEnter
      Width = 301
    end
  end
  inherited ds: TUniDataSource
    Left = 336
    Top = 0
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO produto_categorias'
      '  (categoria, bloqueado, iva, margem_desconto)'
      'VALUES'
      '  (:categoria, :bloqueado, :iva, :margem_desconto)')
    SQLDelete.Strings = (
      'DELETE FROM produto_categorias'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE produto_categorias'
      'SET'
      
        '  categoria = :categoria, bloqueado = :bloqueado, iva = :iva, ma' +
        'rgem_desconto = :margem_desconto'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM produto_categorias'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT categoria, bloqueado, iva, margem_desconto FROM produto_c' +
        'ategorias'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM produto_categorias'
      ''
      ') t')
    SQL.Strings = (
      'SELECT '#9'pc.codigo, '
      #9'pc.categoria, '
      #9'pc.bloqueado, '
      #9'pc.iva, '
      #9'pc.margem_desconto'
      '  FROM produto_categorias pc'
      ' WHERE codigo = :codigo;')
    Left = 296
    Top = 0
    object qConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qConsultacategoria: TStringField
      FieldName = 'categoria'
      Size = 100
    end
    object qConsultabloqueado: TBooleanField
      FieldName = 'bloqueado'
    end
    object qConsultaiva: TFloatField
      FieldName = 'iva'
    end
    object qConsultamargem_desconto: TFloatField
      FieldName = 'margem_desconto'
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 252
  end
end
