inherited frmGridCTe: TfrmGridCTe
  Caption = 'CT-e - Carta de Transporte Eletronica'
  KeyPreview = True
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    ExplicitTop = 460
    ExplicitWidth = 900
    object Label1: TLabel [3]
      Left = 100
      Top = 12
      Width = 13
      Height = 15
      Caption = 'F6'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel [4]
      Left = 119
      Top = 12
      Width = 27
      Height = 15
      Caption = 'Log |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    inherited btnNovo: TButton
      ExplicitLeft = 516
    end
    inherited btnVisualizar: TButton
      ExplicitLeft = 612
    end
    inherited btnEditar: TButton
      ExplicitLeft = 708
    end
    inherited btnExcluir: TButton
      ExplicitLeft = 804
    end
  end
  inherited grpLista: TGroupBox
    ExplicitWidth = 888
    ExplicitHeight = 328
    inherited pnlFuncoes: TPanel
      ExplicitLeft = 849
      ExplicitHeight = 302
    end
    inherited Grid: TcxGrid
      ExplicitWidth = 841
      ExplicitHeight = 302
      inherited View: TcxGridDBTableView
        object ColumnID: TcxGridDBColumn
          Caption = '#ID'
          Width = 50
        end
        object ColumnRemetente: TcxGridDBColumn
          Caption = 'Remetente'
          Width = 300
        end
        object ColumnDestinatario: TcxGridDBColumn
          Caption = 'Destinat'#225'rio'
          Width = 300
        end
        object ColumnData: TcxGridDBColumn
          Caption = 'Data'
          Width = 80
        end
        object ColumnStatus: TcxGridDBColumn
          Caption = 'Status'
          Width = 80
        end
      end
    end
  end
  inherited Ribbon: TdxRibbon
    inherited RibbonTab1: TdxRibbonTab
      Index = 0
    end
    inherited RibbonTab2: TdxRibbonTab
      Index = 1
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited BarManager: TdxBarManager
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarGerenciamento: TdxBar
      FloatClientWidth = 66
      FloatClientHeight = 400
    end
    inherited barServidor: TdxBar
      DockedDockControl = nil
      DockedDockingStyle = dsNone
      DockedLeft = 107
      FloatClientWidth = 51
      FloatClientHeight = 54
    end
    inherited barFerramentas: TdxBar
      DockedDockControl = nil
      DockedDockingStyle = dsNone
      FloatClientWidth = 87
      FloatClientHeight = 108
    end
    inherited barbtnVisualizar: TdxBarLargeButton
      Enabled = False
    end
    inherited barbtnAlterar: TdxBarLargeButton
      Enabled = False
    end
    inherited barbtnEmitir: TdxBarLargeButton
      Enabled = False
    end
    inherited barbtnInutilizar: TdxBarLargeButton
      Enabled = False
    end
    inherited barbtnCancelar: TdxBarLargeButton
      Enabled = False
    end
    inherited barbtnStatus: TdxBarLargeButton
      Enabled = False
    end
    inherited barbtnImprimir: TdxBarLargeButton
      Enabled = False
    end
    inherited barbtnServerStatus: TdxBarLargeButton
      OnClick = barbtnServerStatusClick
    end
    inherited barbtnBaixarXML: TdxBarLargeButton
      Enabled = False
    end
    inherited barbtnChave: TdxBarLargeButton
      Enabled = False
    end
    inherited barbtnNovo: TdxBarSubItem
      Enabled = False
    end
  end
  inherited ImageList32: TcxImageList
    FormatVersion = 1
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
