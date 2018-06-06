inherited frmGridFrota: TfrmGridFrota
  Tag = 2211
  Caption = 'Cadastro de Frota'
  ExplicitWidth = 1116
  ExplicitHeight = 539
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Visible = False
    ExplicitTop = 341
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
    ExplicitHeight = 212
    inherited pnlFuncoes: TPanel
      Left = 746
      Height = 285
      Margins.Bottom = 7
      ExplicitLeft = 546
      ExplicitHeight = 185
    end
    inherited Grid: TcxGrid
      Left = 9
      Width = 737
      Height = 285
      Margins.Left = 7
      Margins.Bottom = 7
      ExplicitLeft = 9
      ExplicitWidth = 537
      ExplicitHeight = 185
      inherited View: TcxGridDBTableView
        OnDblClick = ViewDblClick
        object ColViewID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'codigo'
          Width = 60
        end
        object ColViewPlaca: TcxGridDBColumn
          Caption = 'Placa'
          DataBinding.FieldName = 'placa'
          Width = 70
        end
        object ColViewTipo: TcxGridDBColumn
          Caption = 'Tipo'
          DataBinding.FieldName = 'desc_tipo'
          Width = 200
        end
        object ColViewDescricao: TcxGridDBColumn
          Caption = 'Descricao'
          DataBinding.FieldName = 'veiculo'
          Width = 160
        end
        object ColumnInativo: TcxGridDBColumn
          Caption = 'Inativo'
          DataBinding.FieldName = 'inativo'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Items = <
            item
              Description = 'Sim'
              ImageIndex = 0
              Value = True
            end
            item
              Description = 'N'#227'o'
              Value = False
            end>
          Width = 50
        end
      end
    end
    inherited pnlFiltros: TPanel
      Left = 777
      Height = 285
      Margins.Right = 7
      Margins.Bottom = 7
      ExplicitLeft = 577
      ExplicitHeight = 185
      inherited GridFiltros: TcxGrid
        Height = 285
        Margins.Left = 7
        Margins.Bottom = 7
        ExplicitHeight = 185
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
    ExplicitTop = 381
    ExplicitWidth = 900
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited qConsulta: TUniQuery
    SQL.Strings = (
      'SELECT vf.codigo, '
      #9'vf.cd_tipo, '
      #9'vf.desc_tipo, '
      #9'vf.placa, '
      #9'vf.identificacao, '
      #9'vf.automacao, '
      #9'vf.veiculo, '
      #9'vf.cd_motorista, '
      #9'vf.desc_mototista, '
      #9'vf.ultimokm, '
      #9'vf.inativo'
      '   FROM vw_frotas vf ;')
    object qConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qConsultacd_tipo: TIntegerField
      FieldName = 'cd_tipo'
    end
    object qConsultadesc_tipo: TStringField
      FieldName = 'desc_tipo'
      Size = 160
    end
    object qConsultaplaca: TStringField
      FieldName = 'placa'
      EditMask = '!LLL-9000;0;_'
      FixedChar = True
      Size = 7
    end
    object qConsultaidentificacao: TStringField
      FieldName = 'identificacao'
      FixedChar = True
      Size = 10
    end
    object qConsultaautomacao: TStringField
      FieldName = 'automacao'
      FixedChar = True
    end
    object qConsultaveiculo: TStringField
      FieldName = 'veiculo'
      Size = 160
    end
    object qConsultacd_motorista: TIntegerField
      FieldName = 'cd_motorista'
    end
    object qConsultadesc_mototista: TStringField
      FieldName = 'desc_mototista'
      Size = 250
    end
    object qConsultaultimokm: TFloatField
      FieldName = 'ultimokm'
    end
    object qConsultainativo: TBooleanField
      FieldName = 'inativo'
    end
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
        Value = 'vw_frotas'
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
