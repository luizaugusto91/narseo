inherited frmGridGrupoProdutos: TfrmGridGrupoProdutos
  Tag = 2204
  Caption = 'Grupo de Produtos'
  ClientWidth = 1000
  ExplicitWidth = 1016
  ExplicitHeight = 539
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Width = 1000
    Visible = False
    ExplicitTop = 291
    ExplicitWidth = 900
    inherited btnNovo: TButton
      Left = 615
      ExplicitLeft = 515
    end
    inherited btnVisualizar: TButton
      Left = 711
      ExplicitLeft = 611
    end
    inherited btnEditar: TButton
      Left = 807
      ExplicitLeft = 707
    end
    inherited btnExcluir: TButton
      Left = 903
      Enabled = False
      ExplicitLeft = 803
    end
  end
  inherited grpLista: TGroupBox
    Left = 7
    Top = 129
    Width = 986
    Height = 312
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    ExplicitLeft = 7
    ExplicitTop = 129
    ExplicitWidth = 886
    ExplicitHeight = 162
    inherited pnlFuncoes: TPanel
      Left = 646
      Height = 285
      Margins.Bottom = 7
      ExplicitLeft = 546
      ExplicitHeight = 135
    end
    inherited Grid: TcxGrid
      Left = 9
      Width = 637
      Height = 285
      Margins.Left = 7
      Margins.Bottom = 7
      ExplicitLeft = 9
      ExplicitWidth = 537
      ExplicitHeight = 135
      inherited View: TcxGridDBTableView
        OnDblClick = ViewDblClick
        object ColViewID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'codigo'
          Width = 70
        end
        object ColViewDescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'descricao'
          Width = 300
        end
        object ColViewFlag: TcxGridDBColumn
          Caption = 'FLAG'
          DataBinding.FieldName = 'flag'
          Width = 40
        end
      end
    end
    inherited pnlFiltros: TPanel
      Left = 677
      Height = 285
      Margins.Right = 7
      Margins.Bottom = 7
      ExplicitLeft = 577
      ExplicitHeight = 135
      inherited GridFiltros: TcxGrid
        Height = 285
        Margins.Left = 7
        Margins.Bottom = 7
        ExplicitHeight = 135
      end
    end
  end
  inherited Ribbon: TdxRibbon
    Width = 1000
    ExplicitWidth = 900
    inherited MTabRegistros: TdxRibbonTab
      Index = 0
    end
  end
  inherited stb: TStatusBar
    Width = 1000
    ExplicitTop = 331
    ExplicitWidth = 900
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 440
  end
  inherited qConsulta: TUniQuery
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
      '  FROM produto_grupos gp;')
    Left = 134
    Top = 80
  end
  inherited ds: TUniDataSource
    Left = 134
    Top = 128
  end
  inherited qInfo: TUniQuery
    Left = 134
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'colunas'
        ParamType = ptInput
        Value = #39#39
      end
      item
        DataType = ftString
        Name = 'tabela'
        ParamType = ptInput
        Value = 'produto_grupos'
      end>
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited BarManager: TdxBarManager
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarOpcoes: TdxBar
      FloatClientWidth = 65
      FloatClientHeight = 216
    end
    inherited BarOutros: TdxBar
      FloatClientWidth = 76
      FloatClientHeight = 21
    end
    inherited BarSistem: TdxBar
      FloatClientWidth = 51
      FloatClientHeight = 108
    end
    inherited MnNovo: TdxBarLargeButton
      OnClick = MnNovoClick
    end
    inherited MnVisualizar: TdxBarLargeButton
      OnClick = MnVisualizarClick
    end
    inherited MnEditar: TdxBarLargeButton
      OnClick = MnEditarClick
    end
    inherited MnExcluir: TdxBarLargeButton
      OnClick = MnExcluirClick
    end
  end
end
