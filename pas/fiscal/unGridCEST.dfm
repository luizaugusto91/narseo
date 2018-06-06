inherited frmGridCEST: TfrmGridCEST
  Caption = 'CEST - C'#243'digo Especificador de Situa'#231#227'o Tribut'#225'ria'
  ExplicitWidth = 1116
  ExplicitHeight = 539
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Enabled = False
    Visible = False
    ExplicitTop = 341
    inherited btnNovo: TButton
      Enabled = False
    end
    inherited btnVisualizar: TButton
      Enabled = False
    end
    inherited btnEditar: TButton
      Enabled = False
    end
    inherited btnExcluir: TButton
      Enabled = False
    end
  end
  inherited grpLista: TGroupBox
    ExplicitHeight = 213
    inherited pnlFuncoes: TPanel
      ExplicitHeight = 187
    end
    inherited Grid: TcxGrid
      ExplicitHeight = 187
      inherited View: TcxGridDBTableView
        object Viewcodigo: TcxGridDBColumn
          Caption = '#ID'
          DataBinding.FieldName = 'codigo'
          Width = 48
        end
        object Viewcest: TcxGridDBColumn
          Caption = 'CEST'
          DataBinding.FieldName = 'cest'
          Width = 71
        end
        object Viewncmsh: TcxGridDBColumn
          Caption = 'NCM'
          DataBinding.FieldName = 'ncmsh'
          Width = 74
        end
        object Viewdescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'descricao'
          Width = 417
        end
      end
    end
    inherited pnlFiltros: TPanel
      ExplicitHeight = 187
      inherited GridFiltros: TcxGrid
        ExplicitHeight = 187
      end
    end
  end
  inherited Ribbon: TdxRibbon
    inherited MTabRegistros: TdxRibbonTab
      Index = 0
    end
  end
  inherited stb: TStatusBar
    ExplicitTop = 381
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited qConsulta: TUniQuery
    SQL.Strings = (
      'SELECT codigo, cest, ncmsh, descricao'
      '  FROM cst_cest;')
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
      Visible = ivNever
    end
    inherited MnVisualizar: TdxBarLargeButton
      Visible = ivNever
    end
    inherited MnEditar: TdxBarLargeButton
      Visible = ivNever
    end
    inherited MnExcluir: TdxBarLargeButton
      Visible = ivNever
    end
  end
end
