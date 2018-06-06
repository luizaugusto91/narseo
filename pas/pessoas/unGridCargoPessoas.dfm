inherited frmGridCargoPessoas: TfrmGridCargoPessoas
  Tag = 2102
  Caption = 'Cargos'
  ClientWidth = 1000
  ExplicitWidth = 1016
  ExplicitHeight = 539
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Width = 1000
    Visible = False
    ExplicitTop = 363
    ExplicitWidth = 1038
    inherited btnNovo: TButton
      Left = 615
      ExplicitLeft = 653
    end
    inherited btnVisualizar: TButton
      Left = 711
      ExplicitLeft = 749
    end
    inherited btnEditar: TButton
      Left = 807
      ExplicitLeft = 845
    end
    inherited btnExcluir: TButton
      Left = 903
      ExplicitLeft = 941
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
    ExplicitWidth = 1024
    ExplicitHeight = 234
    inherited pnlFuncoes: TPanel
      Left = 646
      Height = 285
      Margins.Bottom = 7
      ExplicitLeft = 684
      ExplicitHeight = 207
    end
    inherited Grid: TcxGrid
      Left = 9
      Width = 637
      Height = 285
      Margins.Left = 7
      Margins.Bottom = 7
      ExplicitLeft = 9
      ExplicitWidth = 675
      ExplicitHeight = 207
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
      end
    end
    inherited pnlFiltros: TPanel
      Left = 677
      Height = 285
      Margins.Right = 7
      Margins.Bottom = 7
      ExplicitLeft = 715
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
    Width = 1000
    ExplicitWidth = 1038
    inherited MTabRegistros: TdxRibbonTab
      Index = 0
    end
  end
  inherited stb: TStatusBar
    Width = 1000
    ExplicitTop = 403
    ExplicitWidth = 1038
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited qConsulta: TUniQuery
    SQL.Strings = (
      'SELECT cg.codigo, '
      #9'cg.descricao, '
      #9'cg.salario_base, '
      #9'cg.carga_horaria, '
      #9'cg.valor_hora_extra, '
      #9'cg.seguro_vida, '
      #9'cg.vale_transporte, '
      #9'cg.cesta_basica, '
      #9'cg.ticket, '
      #9'cg.carga_horaria_semana'
      '   FROM'#9'cargos cg'
      '  ORDER BY cg.descricao;')
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
        Value = 'cargos'
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
