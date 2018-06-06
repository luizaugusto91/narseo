inherited frmGridConfigEmpresa: TfrmGridConfigEmpresa
  Tag = 1201
  Caption = 'Configura'#231#245'es da Empresa'
  Position = poMainFormCenter
  ExplicitWidth = 1116
  ExplicitHeight = 539
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Visible = False
    inherited btnNovo: TButton
      Left = 715
      ExplicitLeft = 715
    end
    inherited btnVisualizar: TButton
      Left = 811
      ExplicitLeft = 811
    end
    inherited btnEditar: TButton
      Left = 907
      Top = 4
      OnClick = btnEditarClick
      ExplicitLeft = 907
      ExplicitTop = 4
    end
    inherited btnExcluir: TButton
      Left = 1003
      Enabled = False
      ExplicitLeft = 1003
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
    ExplicitWidth = 1086
    ExplicitHeight = 312
    inherited pnlFuncoes: TPanel
      Left = 746
      Height = 285
      Margins.Bottom = 7
      ExplicitLeft = 746
      ExplicitHeight = 285
    end
    inherited Grid: TcxGrid
      Left = 9
      Width = 737
      Height = 285
      Margins.Left = 7
      Margins.Bottom = 7
      ExplicitLeft = 9
      ExplicitWidth = 737
      ExplicitHeight = 285
      inherited View: TcxGridDBTableView
        object ColumnID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'codigo'
          Width = 30
        end
        object ColumnCNPJ: TcxGridDBColumn
          Caption = 'CNPJ'
          DataBinding.FieldName = 'cnpj'
          Width = 80
        end
        object ColumnRazaoSocial: TcxGridDBColumn
          Caption = 'Raz'#227'o Social'
          DataBinding.FieldName = 'nome'
          Width = 280
        end
        object ColumnMatriz: TcxGridDBColumn
          Caption = 'Matriz'
          DataBinding.FieldName = 'matriz'
          Width = 50
        end
        object ColumnInativo: TcxGridDBColumn
          Caption = 'Inativo'
          DataBinding.FieldName = 'inativo'
          Width = 50
        end
      end
    end
    inherited pnlFiltros: TPanel
      Left = 777
      Height = 285
      Margins.Right = 7
      Margins.Bottom = 7
      ExplicitLeft = 777
      ExplicitHeight = 285
      inherited GridFiltros: TcxGrid
        Height = 285
        Margins.Left = 7
        Margins.Bottom = 7
        ExplicitHeight = 285
      end
    end
  end
  inherited Ribbon: TdxRibbon
    inherited MTabRegistros: TdxRibbonTab
      Index = 0
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited qConsulta: TUniQuery
    SQL.Strings = (
      'SELECT ep.codigo, '
      #9'ep.pessoa,'
      #9'ep.datacadastro,'
      #9'ps.cnpj as cnpj,'
      #9'ps.nome as nome,  '
      #9'ep.serial, '
      #9'ep.chave, '
      #9'ep.data_inicio, '
      #9'ep.data_fim, '
      #9'ep.matriz, '
      #9'ep.cd_matriz, '
      #9'ep.inativo'
      '   FROM empresas ep'
      '   left join pessoas ps on ps.codigo = ep.pessoa;')
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
        Value = 'empresas'
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
      Visible = ivNever
    end
  end
end
