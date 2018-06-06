inherited frmCadGrupoProdutos: TfrmCadGrupoProdutos
  Caption = 'Grupo de Produtos'
  ClientHeight = 464
  ClientWidth = 490
  ExplicitWidth = 496
  ExplicitHeight = 493
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 429
    Width = 490
    ExplicitTop = 429
    ExplicitWidth = 490
    inherited btnCancelar: TButton
      Left = 213
      ExplicitLeft = 213
    end
    inherited btnSalvar: TButton
      Left = 306
      ExplicitLeft = 306
    end
    inherited btnFechar: TButton
      Left = 399
      ExplicitLeft = 399
    end
  end
  inherited grpContent: TGroupBox
    Width = 480
    Height = 378
    ExplicitWidth = 480
    ExplicitHeight = 378
    object Label1: TLabel
      Left = 10
      Top = 24
      Width = 41
      Height = 15
      Caption = 'C'#243'digo:'
      FocusControl = edtcodigo
    end
    object Label2: TLabel
      Left = 111
      Top = 24
      Width = 58
      Height = 15
      Caption = 'Descri'#231#227'o:'
      FocusControl = edtdescricao1
    end
    object Label3: TLabel
      Left = 10
      Top = 53
      Width = 29
      Height = 15
      Caption = 'FLAG:'
      FocusControl = edtflag
    end
    object Label4: TLabel
      Left = 160
      Top = 53
      Width = 57
      Height = 15
      Caption = 'Comiss'#227'o:'
      FocusControl = edtcomissao1
    end
    object Label5: TLabel
      Left = 302
      Top = 53
      Width = 97
      Height = 15
      Caption = 'Margem de Lucro:'
      FocusControl = edtmargem_lucro
    end
    object lblMinimo: TLabel
      Left = 26
      Top = 157
      Width = 46
      Height = 15
      Caption = 'Minimo:'
      FocusControl = edtEstoqueMinimo
    end
    object lblTipo: TLabel
      Left = 87
      Top = 53
      Width = 27
      Height = 15
      Caption = 'Tipo:'
      FocusControl = edtTipo
    end
    object chbAvisaEstoqueMinimo: TcxDBCheckBox
      Left = 10
      Top = 128
      Caption = 'Avisar estoque Minimo?'
      DataBinding.DataField = 'aviso_estoque_minimo'
      DataBinding.DataSource = ds
      TabOrder = 10
      OnEnter = grpContentEnter
      Width = 191
    end
    object chbDepositoEstoqueNegativo: TcxDBCheckBox
      Left = 10
      Top = 104
      Caption = 'Deposito permite estoque negativo?'
      DataBinding.DataField = 'estoque_negativo_deposito'
      DataBinding.DataSource = ds
      TabOrder = 8
      OnEnter = grpContentEnter
      Width = 223
    end
    object chbEstoqueNegativo: TcxDBCheckBox
      Left = 10
      Top = 79
      Caption = 'Permitir estoque negativo?'
      DataBinding.DataField = 'estoque_negativo'
      DataBinding.DataSource = ds
      TabOrder = 6
      OnEnter = grpContentEnter
      Width = 191
    end
    object chbGeraPontoQtde: TcxDBCheckBox
      Left = 239
      Top = 128
      Caption = 'Gerar pontos de Quantidade?'
      DataBinding.DataField = 'gerar_ponto_qtde'
      DataBinding.DataSource = ds
      TabOrder = 11
      OnEnter = grpContentEnter
      Width = 215
    end
    object chbGeraPontoValor: TcxDBCheckBox
      Left = 239
      Top = 104
      Caption = 'Gerar pontos de Valor?'
      DataBinding.DataField = 'gerar_ponto_valor'
      DataBinding.DataSource = ds
      TabOrder = 9
      OnEnter = grpContentEnter
      Width = 215
    end
    object chbReajustaPreco: TcxDBCheckBox
      Left = 239
      Top = 79
      Caption = 'Reajustar pre'#231'o Automaticamente?'
      DataBinding.DataField = 'reajusta_preco_auto'
      DataBinding.DataSource = ds
      TabOrder = 7
      OnEnter = grpContentEnter
      Width = 215
    end
    object chbTrocarPonto: TcxDBCheckBox
      Left = 239
      Top = 149
      Caption = 'Permite trocar Pontos?'
      DataBinding.DataField = 'trocar_ponto'
      DataBinding.DataSource = ds
      TabOrder = 13
      OnEnter = grpContentEnter
      Width = 215
    end
    object edtcomissao1: TcxDBCalcEdit
      Left = 223
      Top = 50
      DataBinding.DataField = 'comissao'
      DataBinding.DataSource = ds
      Properties.Nullstring = '0'
      TabOrder = 4
      OnEnter = grpContentEnter
      Width = 73
    end
    object edtmargem_lucro: TcxDBCalcEdit
      Left = 405
      Top = 50
      DataBinding.DataField = 'margem_lucro'
      DataBinding.DataSource = ds
      Properties.Nullstring = '0'
      TabOrder = 5
      OnEnter = grpContentEnter
      Width = 66
    end
    object edtcodigo: TcxDBSpinEdit
      Left = 57
      Top = 21
      DataBinding.DataField = 'codigo'
      DataBinding.DataSource = ds
      Properties.ReadOnly = True
      Properties.SpinButtons.Visible = False
      Style.Color = clBtnFace
      TabOrder = 0
      Width = 48
    end
    object edtdescricao1: TcxDBTextEdit
      Left = 175
      Top = 21
      DataBinding.DataField = 'descricao'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      OnEnter = grpContentEnter
      Width = 296
    end
    object edtflag: TcxDBTextEdit
      Left = 45
      Top = 50
      DataBinding.DataField = 'flag'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      Properties.Nullstring = 'A'
      TabOrder = 2
      OnEnter = grpContentEnter
      Width = 36
    end
    object edtEstoqueMinimo: TcxDBSpinEdit
      Left = 78
      Top = 154
      DataBinding.DataField = 'minimo'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 12
      OnEnter = grpContentEnter
      Width = 83
    end
    object edtTipo: TcxDBTextEdit
      Left = 120
      Top = 50
      DataBinding.DataField = 'tipo_comissao'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      Properties.Nullstring = 'P'
      TabOrder = 3
      OnEnter = grpContentEnter
      Width = 34
    end
    object grpSubGrupo: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 177
      Width = 470
      Height = 196
      Align = alBottom
      Caption = ' Sub-grupos '
      TabOrder = 14
      object pnlbottonSub: TPanel
        Left = 2
        Top = 160
        Width = 466
        Height = 34
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        Visible = False
        object lblDescricao: TLabel
          Left = 3
          Top = 9
          Width = 58
          Height = 15
          Caption = 'Descri'#231#227'o:'
        end
        object lblComissao: TLabel
          Left = 292
          Top = 9
          Width = 57
          Height = 15
          Caption = 'Comiss'#227'o:'
        end
        object btnCancel: TButton
          Left = 416
          Top = 7
          Width = 22
          Height = 22
          ImageIndex = 1
          Images = ImageList16
          TabOrder = 0
          OnClick = btnCancelClick
        end
        object btnConfirm: TButton
          Left = 441
          Top = 7
          Width = 22
          Height = 22
          ImageIndex = 0
          Images = ImageList16
          TabOrder = 1
          OnClick = btnConfirmClick
        end
        object edtDescricao: TcxDBTextEdit
          Left = 67
          Top = 6
          DataBinding.DataField = 'descricao'
          DataBinding.DataSource = dsSub
          Properties.CharCase = ecUpperCase
          TabOrder = 2
          OnEnter = grpContentEnter
          Width = 219
        end
        object edtComissao: TcxDBSpinEdit
          Left = 355
          Top = 6
          DataBinding.DataField = 'comissao'
          DataBinding.DataSource = dsSub
          Properties.Nullstring = '0'
          Properties.SpinButtons.Visible = False
          TabOrder = 3
          OnEnter = grpContentEnter
          Width = 55
        end
      end
      object Grid: TcxGrid
        AlignWithMargins = True
        Left = 5
        Top = 20
        Width = 435
        Height = 137
        Align = alClient
        TabOrder = 1
        object View: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsSub
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object ColViewID: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'codigo'
            Width = 60
          end
          object ColViewDescricao: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'descricao'
            Width = 300
          end
          object ColViewComissao: TcxGridDBColumn
            Caption = 'Comiss'#227'o'
            DataBinding.FieldName = 'comissao'
            Width = 80
          end
        end
        object Master: TcxGridLevel
          GridView = View
        end
      end
      object pnlTool: TPanel
        Left = 443
        Top = 17
        Width = 25
        Height = 143
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 2
        object btnAdd: TButton
          Left = 0
          Top = 3
          Width = 22
          Height = 21
          ImageIndex = 3
          Images = ImageList16
          TabOrder = 0
          OnClick = btnAddClick
        end
        object btnRemove: TButton
          Left = 0
          Top = 29
          Width = 22
          Height = 22
          ImageIndex = 4
          Images = ImageList16
          TabOrder = 1
          OnClick = btnRemoveClick
        end
        object btnReload: TButton
          Left = 0
          Top = 56
          Width = 22
          Height = 22
          ImageIndex = 5
          Images = ImageList16
          TabOrder = 2
          OnClick = btnReloadClick
        end
      end
    end
  end
  inherited pnlHelp: TPanel
    Width = 481
    ExplicitWidth = 481
    inherited mmoHelp: TMemo
      Width = 434
    end
  end
  inherited ds: TUniDataSource
    Left = 320
    Top = 0
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO produto_grupos'
      
        '  (descricao, flag, estoque_negativo, aviso_estoque_minimo, mini' +
        'mo, estoque_negativo_deposito, gerar_ponto_valor, gerar_ponto_qt' +
        'de, trocar_ponto, reajusta_preco_auto, comissao, tipo_comissao, ' +
        'margem_lucro)'
      'VALUES'
      
        '  (:descricao, :flag, :estoque_negativo, :aviso_estoque_minimo, ' +
        ':minimo, :estoque_negativo_deposito, :gerar_ponto_valor, :gerar_' +
        'ponto_qtde, :trocar_ponto, :reajusta_preco_auto, :comissao, :tip' +
        'o_comissao, :margem_lucro)')
    SQLDelete.Strings = (
      'DELETE FROM produto_grupos'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE produto_grupos'
      'SET'
      
        '  descricao = :descricao, flag = :flag, estoque_negativo = :esto' +
        'que_negativo, aviso_estoque_minimo = :aviso_estoque_minimo, mini' +
        'mo = :minimo, estoque_negativo_deposito = :estoque_negativo_depo' +
        'sito, gerar_ponto_valor = :gerar_ponto_valor, gerar_ponto_qtde =' +
        ' :gerar_ponto_qtde, trocar_ponto = :trocar_ponto, reajusta_preco' +
        '_auto = :reajusta_preco_auto, comissao = :comissao, tipo_comissa' +
        'o = :tipo_comissao, margem_lucro = :margem_lucro'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM produto_grupos'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT descricao, flag, estoque_negativo, aviso_estoque_minimo, ' +
        'minimo, estoque_negativo_deposito, gerar_ponto_valor, gerar_pont' +
        'o_qtde, trocar_ponto, reajusta_preco_auto, comissao, tipo_comiss' +
        'ao, margem_lucro FROM produto_grupos'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM produto_grupos'
      ''
      ') t')
    SQL.Strings = (
      'SELECT '#9'gp.codigo, '
      #9'gp.descricao, '
      #9'gp.flag, '
      #9'gp.estoque_negativo, '
      #9'gp.aviso_estoque_minimo, '
      #9'gp.minimo, '
      #9'gp.estoque_negativo_deposito, '
      #9'gp.gerar_ponto_valor, '
      #9'gp.gerar_ponto_qtde, '
      #9'gp.trocar_ponto, '
      #9'gp.reajusta_preco_auto, '
      #9'gp.comissao, '
      #9'gp.tipo_comissao, '
      #9'gp.margem_lucro'
      '  FROM produto_grupos gp'
      ' WHERE gp.codigo = :codigo;')
    Left = 288
    Top = 0
    object qConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qConsultadescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object qConsultaflag: TStringField
      FieldName = 'flag'
      FixedChar = True
      Size = 1
    end
    object qConsultaestoque_negativo: TBooleanField
      FieldName = 'estoque_negativo'
    end
    object qConsultaaviso_estoque_minimo: TBooleanField
      FieldName = 'aviso_estoque_minimo'
    end
    object qConsultaminimo: TIntegerField
      FieldName = 'minimo'
    end
    object qConsultaestoque_negativo_deposito: TBooleanField
      FieldName = 'estoque_negativo_deposito'
    end
    object qConsultagerar_ponto_valor: TBooleanField
      FieldName = 'gerar_ponto_valor'
    end
    object qConsultagerar_ponto_qtde: TBooleanField
      FieldName = 'gerar_ponto_qtde'
    end
    object qConsultatrocar_ponto: TBooleanField
      FieldName = 'trocar_ponto'
    end
    object qConsultareajusta_preco_auto: TBooleanField
      FieldName = 'reajusta_preco_auto'
    end
    object qConsultacomissao: TFloatField
      FieldName = 'comissao'
    end
    object qConsultatipo_comissao: TStringField
      FieldName = 'tipo_comissao'
      FixedChar = True
      Size = 1
    end
    object qConsultamargem_lucro: TFloatField
      FieldName = 'margem_lucro'
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 244
  end
  object qSubGrupo: TUniQuery
    Tag = 7100
    SQLInsert.Strings = (
      'INSERT INTO produto_subgrupos'
      '  (codgrupo, descricao, flag, comissao, tipo_comissao)'
      'VALUES'
      '  (:codgrupo, :descricao, :flag, :comissao, :tipo_comissao)')
    SQLDelete.Strings = (
      'DELETE FROM produto_subgrupos'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE produto_subgrupos'
      'SET'
      
        '  codgrupo = :codgrupo, descricao = :descricao, flag = :flag, co' +
        'missao = :comissao, tipo_comissao = :tipo_comissao'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM produto_subgrupos'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT codgrupo, descricao, flag, comissao, tipo_comissao FROM p' +
        'roduto_subgrupos'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM produto_subgrupos'
      ''
      ') t')
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT '#9'gps.codigo, '
      #9'gps.codgrupo, '
      #9'gps.descricao, '
      #9'gps.flag, '
      #9'gps.comissao, '
      #9'gps.tipo_comissao'
      '  FROM produto_subgrupos gps'
      ' WHERE gps.codgrupo = :codigo;')
    MasterSource = ds
    Left = 80
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = 0
      end>
    object qSubGrupocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qSubGrupocodgrupo: TIntegerField
      FieldName = 'codgrupo'
    end
    object qSubGrupodescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object qSubGrupoflag: TStringField
      FieldName = 'flag'
      FixedChar = True
      Size = 1
    end
    object qSubGrupocomissao: TFloatField
      FieldName = 'comissao'
    end
    object qSubGrupotipo_comissao: TStringField
      FieldName = 'tipo_comissao'
      FixedChar = True
      Size = 1
    end
  end
  object dsSub: TUniDataSource
    DataSet = qSubGrupo
    Left = 112
    Top = 232
  end
end
