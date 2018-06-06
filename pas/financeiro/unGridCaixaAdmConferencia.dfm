inherited frmGridCaixaAdmConferencia: TfrmGridCaixaAdmConferencia
  Caption = 'Conferencia de Caixa'
  ClientHeight = 550
  ClientWidth = 1300
  ExplicitWidth = 1316
  ExplicitHeight = 589
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 491
    Width = 1300
    Visible = False
    ExplicitTop = 391
    ExplicitWidth = 1300
    inherited btnNovo: TButton
      Left = 916
      Caption = 'Manual'
      ExplicitLeft = 916
    end
    inherited btnVisualizar: TButton
      Left = 1012
      ExplicitLeft = 1012
    end
    inherited btnEditar: TButton
      Left = 1108
      Caption = 'Conferir'
      ExplicitLeft = 1108
    end
    inherited btnExcluir: TButton
      Left = 1204
      Enabled = False
      ExplicitLeft = 1204
    end
  end
  inherited grpLista: TGroupBox
    Width = 1288
    Height = 363
    ExplicitWidth = 1288
    ExplicitHeight = 263
    inherited pnlFuncoes: TPanel
      Left = 949
      Height = 337
      ExplicitLeft = 949
      ExplicitHeight = 237
    end
    inherited Grid: TcxGrid
      Width = 941
      Height = 337
      ExplicitWidth = 941
      ExplicitHeight = 237
      inherited View: TcxGridDBTableView
        OptionsView.ColumnAutoWidth = False
        object Viewcodigo: TcxGridDBColumn
          Caption = '#ID'
          DataBinding.FieldName = 'codigo'
          Width = 50
        end
        object Viewdata_caixa: TcxGridDBColumn
          Caption = 'Data'
          DataBinding.FieldName = 'data_caixa'
          Width = 80
        end
        object Viewturno: TcxGridDBColumn
          Caption = 'Turno'
          DataBinding.FieldName = 'turno'
          Width = 50
        end
        object Viewempresa: TcxGridDBColumn
          DataBinding.FieldName = 'empresa'
          Visible = False
        end
        object Viewcd_operador_sistema: TcxGridDBColumn
          DataBinding.FieldName = 'cd_operador_sistema'
          Visible = False
        end
        object Viewoperador_sistema: TcxGridDBColumn
          Caption = 'Operador'
          DataBinding.FieldName = 'operador_sistema'
          Width = 300
        end
        object Viewabertura: TcxGridDBColumn
          Caption = 'Abertura'
          DataBinding.FieldName = 'abertura'
        end
        object Viewtroco_inicial: TcxGridDBColumn
          Caption = 'Troco Inicial'
          DataBinding.FieldName = 'troco_inicial'
          Width = 80
        end
        object Viewfechamento: TcxGridDBColumn
          Caption = 'Fechamento'
          DataBinding.FieldName = 'fechamento'
        end
        object Viewtroco_final: TcxGridDBColumn
          Caption = 'Troco Final'
          DataBinding.FieldName = 'troco_final'
          Width = 80
        end
        object Viewcd_pessoa_conferente: TcxGridDBColumn
          DataBinding.FieldName = 'cd_pessoa_conferente'
          Visible = False
        end
        object Viewpessoa_conferente: TcxGridDBColumn
          Caption = 'Conferente'
          DataBinding.FieldName = 'pessoa_conferente'
          Width = 300
        end
        object Viewconferencia: TcxGridDBColumn
          Caption = 'Conferencia'
          DataBinding.FieldName = 'conferencia'
        end
        object Viewconferido: TcxGridDBColumn
          Caption = 'Conferido'
          DataBinding.FieldName = 'conferido'
          Width = 60
        end
        object Viewrecebimentos: TcxGridDBColumn
          Caption = 'Recebimentos'
          DataBinding.FieldName = 'recebimentos'
          Width = 80
        end
        object Viewdespesas: TcxGridDBColumn
          Caption = 'Despesas'
          DataBinding.FieldName = 'despesas'
          Width = 80
        end
        object Viewsangria: TcxGridDBColumn
          Caption = 'Sangria'
          DataBinding.FieldName = 'sangria'
          Width = 80
        end
        object Viewreforco: TcxGridDBColumn
          Caption = 'Refor'#231'o'
          DataBinding.FieldName = 'reforco'
          Width = 80
        end
        object Viewcd_operador_caixa: TcxGridDBColumn
          DataBinding.FieldName = 'cd_operador_caixa'
          Visible = False
        end
        object Viewoperador_caixa: TcxGridDBColumn
          Caption = 'Caixa'
          DataBinding.FieldName = 'operador_caixa'
          Width = 300
        end
        object Viewobs: TcxGridDBColumn
          DataBinding.FieldName = 'obs'
          Visible = False
        end
        object Viewmanual: TcxGridDBColumn
          Caption = 'Manual'
          DataBinding.FieldName = 'manual'
          Width = 60
        end
        object ColumnViewfechado: TcxGridDBColumn
          Caption = 'Fechado'
          DataBinding.FieldName = 'fechado'
          Width = 60
        end
      end
    end
    inherited pnlFiltros: TPanel
      Left = 980
      Height = 337
      ExplicitLeft = 980
      ExplicitHeight = 237
      inherited GridFiltros: TcxGrid
        Height = 337
        ExplicitHeight = 237
      end
    end
  end
  inherited Ribbon: TdxRibbon
    Width = 1300
    ExplicitWidth = 1300
    inherited MTabRegistros: TdxRibbonTab
      Index = 0
    end
  end
  inherited stb: TStatusBar
    Top = 531
    Width = 1300
    ExplicitTop = 431
    ExplicitWidth = 1300
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited qConsulta: TUniQuery
    SQL.Strings = (
      'SELECT c.codigo, '
      #9'c.data_caixa, '
      #9'c.turno, '
      #9'c.empresa, '
      #9'c.operador_sistema as cd_operador_sistema, '
      #9'pos.fantasia as operador_sistema,'
      #9'c.abertura, '
      #9'c.fechamento, '
      #9'c.conferencia, '
      #9'c.pessoa_conferente as cd_pessoa_conferente, '
      #9'pc.fantasia as pessoa_conferente,'
      #9'c.troco_inicial, '
      #9'c.troco_final, '
      #9'c.conferido, '
      #9'c.sangria, '
      #9'c.reforco, '
      #9'c.despesas, '
      #9'c.recebimentos, '
      #9'c.operador_caixa as cd_operador_caixa, '
      #9'poc.fantasia as operador_caixa,'
      #9'c.manual,'
      #9'c.fechado,'
      #9'c.obs'
      '   FROM caixa c'
      '   left join pessoas pos on pos.codigo = c.operador_sistema'
      '   left join pessoas pc on pos.codigo = c.pessoa_conferente '
      '   left join pessoas poc on pos.codigo = c.operador_caixa')
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
    object StyleConferido: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clGreen
    end
    object StyleManual: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clGray
    end
  end
  inherited pmFuncoes: TPopupMenu
    OnPopup = pmFuncoesPopup
    object Fecharcaixa1: TMenuItem
      Caption = 'Fechar caixa'
      ImageIndex = 11
      OnClick = Fecharcaixa1Click
    end
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
      DockedLeft = 238
      FloatClientWidth = 76
      FloatClientHeight = 21
    end
    inherited BarSistem: TdxBar
      DockedLeft = 316
      FloatClientWidth = 51
      FloatClientHeight = 108
    end
    inherited MnNovo: TdxBarLargeButton
      Caption = 'Manual'
      Hint = 'Manual'
    end
    inherited MnEditar: TdxBarLargeButton
      Caption = 'Conferir'
      Hint = 'Conferir'
    end
  end
end
