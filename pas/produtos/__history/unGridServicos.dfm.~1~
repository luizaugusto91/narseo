inherited frmGridServicos: TfrmGridServicos
  Tag = 2208
  Caption = 'Cadastro de Servi'#231'os'
  ClientHeight = 400
  ExplicitWidth = 1116
  ExplicitHeight = 439
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 360
    ExplicitTop = 360
    inherited btnNovo: TButton
      OnClick = btnNovoClick
    end
    inherited btnVisualizar: TButton
      OnClick = btnVisualizarClick
    end
    inherited btnEditar: TButton
      OnClick = btnEditarClick
    end
    inherited btnExcluir: TButton
      OnClick = btnExcluirClick
    end
  end
  inherited grpLista: TGroupBox
    Height = 354
    ExplicitHeight = 354
    inherited pnlFuncoes: TPanel
      Height = 328
      ExplicitHeight = 328
    end
    inherited Grid: TcxGrid
      Height = 328
      ExplicitHeight = 328
      inherited View: TcxGridDBTableView
        object ColumnID: TcxGridDBColumn
          Caption = '#ID'
          DataBinding.FieldName = 'codigo'
          Width = 50
        end
        object ColumnDescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'nome'
          Width = 300
        end
        object ColumnIntaivo: TcxGridDBColumn
          Caption = 'Inativo'
          DataBinding.FieldName = 'inativo'
          Width = 60
        end
      end
    end
    inherited pnlFiltros: TPanel
      Height = 328
      ExplicitHeight = 328
      inherited GridFiltros: TcxGrid
        Height = 328
        ExplicitHeight = 328
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
      #9'pd.inativo'
      '  FROM produtos pd'
      ' WHERE tipo = '#39'S'#39';')
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
