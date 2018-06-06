inherited frmGridBombas: TfrmGridBombas
  Tag = 2301
  Caption = 'Cadastro de Bombas'
  ClientHeight = 450
  ClientWidth = 900
  ExplicitWidth = 916
  ExplicitHeight = 489
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 391
    Width = 900
    Visible = False
    ExplicitTop = 291
    ExplicitWidth = 900
    inherited btnNovo: TButton
      Left = 515
      ExplicitLeft = 515
    end
    inherited btnVisualizar: TButton
      Left = 611
      ExplicitLeft = 611
    end
    inherited btnEditar: TButton
      Left = 707
      ExplicitLeft = 707
    end
    inherited btnExcluir: TButton
      Left = 803
      ExplicitLeft = 803
    end
  end
  inherited grpLista: TGroupBox
    Left = 7
    Top = 129
    Width = 886
    Height = 262
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    ExplicitLeft = 7
    ExplicitTop = 129
    ExplicitWidth = 886
    ExplicitHeight = 162
    inherited pnlFuncoes: TPanel
      Left = 546
      Height = 235
      Margins.Bottom = 7
      ExplicitLeft = 546
      ExplicitHeight = 135
    end
    inherited Grid: TcxGrid
      Left = 9
      Width = 537
      Height = 235
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
          Width = 60
        end
        object ColViewDescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'descricao'
          Width = 160
        end
        object ColViewInativo: TcxGridDBColumn
          Caption = 'Inativo'
          DataBinding.FieldName = 'inativo'
          Width = 60
        end
      end
    end
    inherited pnlFiltros: TPanel
      Left = 577
      Height = 235
      Margins.Right = 7
      Margins.Bottom = 7
      ExplicitLeft = 577
      ExplicitHeight = 135
      inherited GridFiltros: TcxGrid
        Height = 235
        Margins.Left = 7
        Margins.Bottom = 7
        ExplicitHeight = 135
      end
    end
  end
  inherited Ribbon: TdxRibbon
    Width = 900
    ExplicitWidth = 900
    inherited MTabRegistros: TdxRibbonTab
      Index = 0
    end
  end
  inherited stb: TStatusBar
    Top = 431
    Width = 900
    ExplicitTop = 331
    ExplicitWidth = 900
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited qConsulta: TUniQuery
    SQL.Strings = (
      'SELECT '#9'bb.codigo, '
      #9'bb.descricao, '
      #9'bb.inativo, '
      #9'bb.fabricante, '
      #9'bb.modelo,'
      #9'bb.nr_serie'
      '  FROM '#9'bombas bb'
      ' ORDER BY bb.Descricao;')
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
