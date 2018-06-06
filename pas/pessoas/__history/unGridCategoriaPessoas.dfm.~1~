inherited frmGridCategoriaPessoas: TfrmGridCategoriaPessoas
  Tag = 2103
  Caption = 'Categoria de Pessoas'
  ClientHeight = 422
  ClientWidth = 1038
  ExplicitWidth = 1054
  ExplicitHeight = 461
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 382
    Width = 1038
    ExplicitTop = 382
    ExplicitWidth = 1038
    inherited btnNovo: TButton
      Left = 653
      OnClick = btnNovoClick
      ExplicitLeft = 653
    end
    inherited btnVisualizar: TButton
      Left = 749
      OnClick = btnVisualizarClick
      ExplicitLeft = 749
    end
    inherited btnEditar: TButton
      Left = 845
      OnClick = btnEditarClick
      ExplicitLeft = 845
    end
    inherited btnExcluir: TButton
      Left = 941
      OnClick = btnExcluirClick
      ExplicitLeft = 941
    end
  end
  inherited grpLista: TGroupBox
    Left = 7
    Top = 7
    Width = 1024
    Height = 375
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    ExplicitLeft = 7
    ExplicitTop = 7
    ExplicitWidth = 1024
    ExplicitHeight = 375
    inherited pnlFuncoes: TPanel
      Left = 684
      Height = 348
      Margins.Bottom = 7
      ExplicitLeft = 684
      ExplicitHeight = 348
    end
    inherited Grid: TcxGrid
      Left = 9
      Width = 675
      Height = 348
      Margins.Left = 7
      Margins.Bottom = 7
      ExplicitLeft = 9
      ExplicitWidth = 675
      ExplicitHeight = 348
      inherited View: TcxGridDBTableView
        OnDblClick = ViewDblClick
        object ColViewID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'codigo'
          Width = 60
        end
        object ColViewDescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'categoria'
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
      Left = 715
      Height = 348
      Margins.Right = 7
      Margins.Bottom = 7
      ExplicitLeft = 715
      ExplicitHeight = 348
      inherited GridFiltros: TcxGrid
        Height = 348
        Margins.Left = 7
        Margins.Bottom = 7
        ExplicitHeight = 348
      end
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited qConsulta: TUniQuery
    SQL.Strings = (
      'SELECT  pc.codigo, '
      #9'pc.empresa, '
      #9'pc.categoria, '
      #9'pc.bloqueado'
      '  FROM  pessoa_categorias pc'
      ' order by pc.categoria;')
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
        Value = 'pessoa_categorias'
      end>
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
