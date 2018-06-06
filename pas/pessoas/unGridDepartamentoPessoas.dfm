inherited frmGridDepartamentoPessoas: TfrmGridDepartamentoPessoas
  Tag = 2101
  Caption = 'Departamentos'
  ExplicitWidth = 1116
  ExplicitHeight = 539
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Visible = False
    ExplicitTop = 363
    ExplicitWidth = 1154
    inherited btnNovo: TButton
      Left = 715
      ExplicitLeft = 769
    end
    inherited btnVisualizar: TButton
      Left = 811
      ExplicitLeft = 865
    end
    inherited btnEditar: TButton
      Left = 907
      ExplicitLeft = 961
    end
    inherited btnExcluir: TButton
      Left = 1003
      ExplicitLeft = 1057
    end
  end
  inherited grpLista: TGroupBox
    Left = 7
    Top = 129
    Width = 1086
    Height = 312
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    ExplicitLeft = 7
    ExplicitTop = 129
    ExplicitWidth = 1140
    ExplicitHeight = 234
    inherited pnlFuncoes: TPanel
      Left = 746
      Height = 285
      Margins.Bottom = 7
      ExplicitLeft = 800
      ExplicitHeight = 207
    end
    inherited Grid: TcxGrid
      Left = 9
      Width = 737
      Height = 285
      Margins.Left = 7
      Margins.Bottom = 7
      ExplicitLeft = 9
      ExplicitWidth = 791
      ExplicitHeight = 207
      inherited View: TcxGridDBTableView
        object ColViewID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'codigo'
          Width = 70
        end
        object ColViewNome: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'nome'
          Width = 160
        end
        object ColViewDescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'descricao'
          Width = 300
        end
      end
    end
    inherited pnlFiltros: TPanel
      Left = 777
      Height = 285
      Margins.Right = 7
      Margins.Bottom = 7
      ExplicitLeft = 831
      ExplicitHeight = 207
      inherited GridFiltros: TcxGrid
        Height = 285
        Margins.Left = 7
        Margins.Bottom = 7
        ExplicitHeight = 207
      end
    end
  end
  inherited Ribbon: TdxRibbon
    ExplicitWidth = 1154
    inherited MTabRegistros: TdxRibbonTab
      Index = 0
    end
  end
  inherited stb: TStatusBar
    ExplicitTop = 403
    ExplicitWidth = 1154
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited qConsulta: TUniQuery
    SQL.Strings = (
      'SELECT codigo, '
      #9'nome, '
      #9'descricao, '
      #9'turno_inicio, '
      #9'turno_fim, '
      #9'cd_responsavel, '
      #9'responsavel, '
      #9'desativado'
      '   FROM vw_departamentos ;')
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
        Value = 'vw_departamentos'
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
