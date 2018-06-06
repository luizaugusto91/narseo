inherited frmGridIPI: TfrmGridIPI
  Caption = 'IPI -Imposto sobre Produtos Industrializados'
  ExplicitWidth = 1116
  ExplicitHeight = 539
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Visible = False
    ExplicitTop = 341
    ExplicitWidth = 1000
    inherited btnNovo: TButton
      Enabled = False
      ExplicitLeft = 616
    end
    inherited btnVisualizar: TButton
      Enabled = False
      ExplicitLeft = 712
    end
    inherited btnEditar: TButton
      Enabled = False
      ExplicitLeft = 808
    end
    inherited btnExcluir: TButton
      Enabled = False
      ExplicitLeft = 904
    end
  end
  inherited grpLista: TGroupBox
    ExplicitWidth = 988
    ExplicitHeight = 213
    inherited pnlFuncoes: TPanel
      ExplicitLeft = 649
      ExplicitHeight = 187
    end
    inherited Grid: TcxGrid
      ExplicitWidth = 641
      ExplicitHeight = 187
      inherited View: TcxGridDBTableView
        object Viewcodigo: TcxGridDBColumn
          Caption = '#ID'
          DataBinding.FieldName = 'codigo'
          Width = 50
        end
        object Viewchave: TcxGridDBColumn
          Caption = 'Chave'
          DataBinding.FieldName = 'chave'
          Width = 80
        end
        object Viewdescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'descricao'
          Width = 800
        end
      end
    end
    inherited pnlFiltros: TPanel
      ExplicitLeft = 680
      ExplicitHeight = 187
      inherited GridFiltros: TcxGrid
        ExplicitHeight = 187
      end
    end
  end
  inherited Ribbon: TdxRibbon
    ExplicitWidth = 1000
    inherited MTabRegistros: TdxRibbonTab
      Index = 0
    end
  end
  inherited stb: TStatusBar
    ExplicitTop = 381
    ExplicitWidth = 1000
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited qConsulta: TUniQuery
    SQL.Strings = (
      'SELECT codigo, chave, descricao'
      '  FROM cst_ipi;')
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
