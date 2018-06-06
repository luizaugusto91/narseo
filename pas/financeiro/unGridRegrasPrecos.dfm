inherited frmGridRegrasPrecos: TfrmGridRegrasPrecos
  Caption = 'Regras de Pre'#231'os'
  ClientWidth = 900
  ExplicitWidth = 916
  ExplicitHeight = 539
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Width = 900
    Visible = False
    ExplicitTop = 442
    inherited btnNovo: TButton
      Left = 516
    end
    inherited btnVisualizar: TButton
      Left = 612
    end
    inherited btnEditar: TButton
      Left = 708
    end
    inherited btnExcluir: TButton
      Left = 804
    end
  end
  inherited grpLista: TGroupBox
    Width = 888
    inherited pnlFuncoes: TPanel
      Left = 549
    end
    inherited Grid: TcxGrid
      Width = 541
      inherited View: TcxGridDBTableView
        object ColumnViewcodigo: TcxGridDBColumn
          Caption = '#ID'
          DataBinding.FieldName = 'codigo'
          Width = 60
        end
        object ColumnViewempresa: TcxGridDBColumn
          DataBinding.FieldName = 'empresa'
          Visible = False
        end
        object ColumnViewdescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'descricao'
          Width = 300
        end
        object ColumnViewobservacao: TcxGridDBColumn
          DataBinding.FieldName = 'observacao'
          Visible = False
        end
        object ColumnViewbloqueada: TcxGridDBColumn
          Caption = 'Bloqueada'
          DataBinding.FieldName = 'bloqueada'
          Width = 60
        end
      end
    end
    inherited pnlFiltros: TPanel
      Left = 580
    end
  end
  inherited Ribbon: TdxRibbon
    Width = 900
    inherited MTabRegistros: TdxRibbonTab
      Index = 0
    end
  end
  inherited stb: TStatusBar
    Width = 900
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited qConsulta: TUniQuery
    SQL.Strings = (
      'SELECT codigo, empresa, descricao, observacao, bloqueada'
      '  FROM produto_regras;')
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
      DockedDockControl = nil
      DockedDockingStyle = dsNone
      FloatClientWidth = 65
      FloatClientHeight = 216
    end
    inherited BarOutros: TdxBar
      DockedDockControl = nil
      DockedDockingStyle = dsNone
      FloatClientWidth = 76
      FloatClientHeight = 21
    end
    inherited BarSistem: TdxBar
      DockedDockControl = nil
      DockedDockingStyle = dsNone
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
