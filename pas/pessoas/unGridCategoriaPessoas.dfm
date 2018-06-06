inherited frmGridCategoriaPessoas: TfrmGridCategoriaPessoas
  Tag = 2103
  Caption = 'Categoria de Pessoas'
  ClientWidth = 1000
  ExplicitWidth = 1016
  ExplicitHeight = 539
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Width = 1000
    Visible = False
    ExplicitTop = 442
    ExplicitWidth = 1000
    inherited btnNovo: TButton
      Left = 615
      ExplicitLeft = 615
    end
    inherited btnVisualizar: TButton
      Left = 711
      ExplicitLeft = 711
    end
    inherited btnEditar: TButton
      Left = 807
      ExplicitLeft = 807
    end
    inherited btnExcluir: TButton
      Left = 903
      ExplicitLeft = 903
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
    ExplicitWidth = 986
    ExplicitHeight = 312
    inherited pnlFuncoes: TPanel
      Left = 646
      Height = 285
      Margins.Bottom = 7
      ExplicitLeft = 646
      ExplicitHeight = 285
    end
    inherited Grid: TcxGrid
      Left = 9
      Width = 637
      Height = 285
      Margins.Left = 7
      Margins.Bottom = 7
      ExplicitLeft = 9
      ExplicitWidth = 637
      ExplicitHeight = 285
      inherited View: TcxGridDBTableView
        OnDblClick = ViewDblClick
        object ColViewID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'codigo'
          Width = 60
        end
        object ColViewDescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'categoria'
          Width = 300
        end
        object ColViewBloqueado: TcxGridDBColumn
          Caption = 'Bloqueado'
          DataBinding.FieldName = 'bloqueado'
          Width = 70
        end
      end
    end
    inherited pnlFiltros: TPanel
      Left = 677
      Height = 285
      Margins.Right = 7
      Margins.Bottom = 7
      ExplicitLeft = 677
      ExplicitHeight = 285
      inherited GridFiltros: TcxGrid
        Height = 285
        Margins.Left = 7
        Margins.Bottom = 7
        ExplicitHeight = 285
      end
    end
  end
  inherited Ribbon: TdxRibbon
    Width = 1000
    ExplicitWidth = 1000
    inherited MTabRegistros: TdxRibbonTab
      Index = 0
    end
  end
  inherited stb: TStatusBar
    Width = 1000
    ExplicitTop = 481
    ExplicitWidth = 1000
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited qConsulta: TUniQuery
    SQL.Strings = (
      'SELECT  pc.codigo, '
      #9'pc.empresa, '
      #9'pc.categoria, '
      #9'pc.bloqueado'
      '  FROM  pessoa_categorias pc'
      ' order by pc.categoria;')
  end
  inherited qInfo: TUniQuery
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
        Value = 'pessoa_categorias'
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
