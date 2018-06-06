inherited frmCadMarcaProdutos: TfrmCadMarcaProdutos
  Caption = 'Marca de Produtos'
  ClientHeight = 140
  ClientWidth = 450
  ExplicitWidth = 456
  ExplicitHeight = 169
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 105
    Width = 450
    ExplicitTop = 105
    ExplicitWidth = 450
    inherited btnCancelar: TButton
      Left = 173
      ExplicitLeft = 173
    end
    inherited btnSalvar: TButton
      Left = 266
      ExplicitLeft = 266
    end
    inherited btnFechar: TButton
      Left = 359
      ExplicitLeft = 359
    end
  end
  inherited grpContent: TGroupBox
    Width = 440
    Height = 53
    ExplicitWidth = 440
    ExplicitHeight = 53
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
      OnEnter = grpContentEnter
      Width = 259
    end
  end
  inherited pnlHelp: TPanel
    Width = 441
    ExplicitWidth = 441
    inherited mmoHelp: TMemo
      Width = 394
      Lines.Strings = (
        'Bem vindo a ajuda do sistema!'
        'Passe o mouse por cima do componente para obter mais '
        'informa'#231#245'es. ')
      ExplicitWidth = 394
    end
  end
  inherited ds: TUniDataSource
    Left = 392
    Top = 65528
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO produto_marcas'
      '  (descricao)'
      'VALUES'
      '  (:descricao)')
    SQLDelete.Strings = (
      'DELETE FROM produto_marcas'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE produto_marcas'
      'SET'
      '  descricao = :descricao'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM produto_marcas'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      'SELECT descricao FROM produto_marcas'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM produto_marcas'
      ''
      ') t')
    SQL.Strings = (
      'SELECT '#9'pm.codigo, '
      #9'pm.descricao'
      '  FROM '#9'produto_marcas pm'
      ' WHERE  codigo = :codigo;')
    Left = 352
    Top = 65528
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
    DesignInfo = -523988
  end
end
