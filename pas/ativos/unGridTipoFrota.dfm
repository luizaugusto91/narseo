inherited frmGridTipoFrota: TfrmGridTipoFrota
  Tag = 2213
  Caption = 'Tipo de Frota'
  ExplicitWidth = 1116
  ExplicitHeight = 539
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Visible = False
    ExplicitTop = 291
    ExplicitWidth = 900
    inherited btnNovo: TButton
      Left = 715
      ExplicitLeft = 515
    end
    inherited btnVisualizar: TButton
      Left = 811
      ExplicitLeft = 611
    end
    inherited btnEditar: TButton
      Left = 907
      ExplicitLeft = 707
    end
    inherited btnExcluir: TButton
      Left = 1003
      ExplicitLeft = 803
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
    ExplicitWidth = 886
    ExplicitHeight = 162
    inherited pnlFuncoes: TPanel
      Left = 746
      Height = 285
      Margins.Bottom = 7
      ExplicitLeft = 546
      ExplicitHeight = 135
    end
    inherited Grid: TcxGrid
      Left = 9
      Width = 737
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
          Width = 60
        end
        object ColViewDescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'descricao'
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
      Left = 777
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
    ExplicitWidth = 900
    inherited MTabRegistros: TdxRibbonTab
      Index = 0
    end
  end
  inherited stb: TStatusBar
    ExplicitTop = 331
    ExplicitWidth = 900
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited qConsulta: TUniQuery
    SQL.Strings = (
      'SELECT '#9'tf.codigo, '
      #9'tf.descricao, '
      #9'tf.bloqueado'
      '  FROM tipo_frota tf'
      ' order by tf.descricao;')
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
        Value = 'tipo_frota'
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
