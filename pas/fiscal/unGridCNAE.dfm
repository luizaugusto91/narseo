inherited frmGridCNAE: TfrmGridCNAE
  Caption = 'CNAE - Classifica'#231#227'o Nacional de Atividades Econ'#244'micas'
  ExplicitWidth = 1116
  ExplicitHeight = 539
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Visible = False
    ExplicitTop = 442
    inherited btnNovo: TButton
      ExplicitLeft = 616
    end
    inherited btnVisualizar: TButton
      ExplicitLeft = 712
    end
    inherited btnEditar: TButton
      ExplicitLeft = 808
    end
    inherited btnExcluir: TButton
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
        object Viewsecao: TcxGridDBColumn
          DataBinding.FieldName = 'secao'
          Visible = False
        end
        object Viewsecao_descricao: TcxGridDBColumn
          Caption = 'Se'#231#227'o'
          DataBinding.FieldName = 'secao_descricao'
          Visible = False
          GroupIndex = 0
          Width = 800
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
      'SELECT vw.codigo, '
      #9'vw.secao, '
      #9'vw.secao_descricao, '
      #9'vw.chave, '
      #9'vw.descricao'
      '   FROM vw_cnae vw;')
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
        Value = 'vw_cnae'
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
