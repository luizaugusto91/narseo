inherited frmGridProdutos: TfrmGridProdutos
  Tag = 2207
  Caption = 'Cadastro de Produtos'
  ClientHeight = 400
  ExplicitWidth = 1116
  ExplicitHeight = 439
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 360
    ExplicitTop = 360
    inherited btnNovo: TButton
      Left = 715
      OnClick = btnNovoClick
      ExplicitLeft = 715
    end
    inherited btnVisualizar: TButton
      Left = 811
      OnClick = btnVisualizarClick
      ExplicitLeft = 811
    end
    inherited btnEditar: TButton
      Left = 907
      OnClick = btnEditarClick
      ExplicitLeft = 907
    end
    inherited btnExcluir: TButton
      Left = 1003
      Enabled = False
      ExplicitLeft = 1003
    end
  end
  inherited grpLista: TGroupBox
    Left = 7
    Top = 7
    Width = 1086
    Height = 353
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    ExplicitLeft = 7
    ExplicitTop = 7
    ExplicitWidth = 1086
    ExplicitHeight = 353
    inherited pnlFuncoes: TPanel
      Left = 746
      Height = 326
      Margins.Bottom = 7
      ExplicitLeft = 746
      ExplicitHeight = 326
    end
    inherited Grid: TcxGrid
      Left = 9
      Width = 737
      Height = 326
      Margins.Left = 7
      Margins.Bottom = 7
      ExplicitLeft = 9
      ExplicitWidth = 737
      ExplicitHeight = 326
      inherited View: TcxGridDBTableView
        OnDblClick = ViewDblClick
        object ColumnID: TcxGridDBColumn
          Caption = '#ID'
          DataBinding.FieldName = 'codigo'
          Width = 50
        end
        object ColumnDescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'nome'
          Width = 200
        end
        object ColumnSigla: TcxGridDBColumn
          Caption = 'Codigo Barras'
          DataBinding.FieldName = 'codigobarra'
          Visible = False
          Width = 60
        end
        object ColumnCodigoBarras: TcxGridDBColumn
          Caption = 'Codigo Barras'
          DataBinding.FieldName = 'codigobarras'
          Width = 80
        end
      end
    end
    inherited pnlFiltros: TPanel
      Left = 777
      Height = 326
      Margins.Right = 7
      Margins.Bottom = 7
      ExplicitLeft = 777
      ExplicitHeight = 326
      inherited GridFiltros: TcxGrid
        Height = 326
        Margins.Left = 7
        Margins.Bottom = 7
        ExplicitHeight = 326
      end
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited qConsulta: TUniQuery
    SQL.Strings = (
      'SELECT '#9'pd.codigo, '
      #9'pd.nome,'
      #9'pd.codigobarras'
      '  FROM produtos pd'
      ' WHERE tipo = '#39'P'#39';')
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
        Value = 'produtos'
      end>
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
