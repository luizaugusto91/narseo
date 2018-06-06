inherited frmGridDepositos: TfrmGridDepositos
  Tag = 2201
  Caption = 'Dep'#243'sito de Produtos'
  ClientHeight = 350
  ClientWidth = 900
  ExplicitWidth = 916
  ExplicitHeight = 389
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 310
    Width = 900
    ExplicitTop = 310
    ExplicitWidth = 900
    inherited btnNovo: TButton
      Left = 515
      OnClick = btnNovoClick
      ExplicitLeft = 515
    end
    inherited btnVisualizar: TButton
      Left = 611
      OnClick = btnVisualizarClick
      ExplicitLeft = 611
    end
    inherited btnEditar: TButton
      Left = 707
      OnClick = btnEditarClick
      ExplicitLeft = 707
    end
    inherited btnExcluir: TButton
      Left = 803
      Enabled = False
      ExplicitLeft = 803
    end
  end
  inherited grpLista: TGroupBox
    Left = 7
    Top = 7
    Width = 886
    Height = 303
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    ExplicitLeft = 7
    ExplicitTop = 7
    ExplicitWidth = 886
    ExplicitHeight = 303
    inherited pnlFuncoes: TPanel
      Left = 546
      Height = 276
      Margins.Bottom = 7
      ExplicitLeft = 546
      ExplicitHeight = 276
    end
    inherited Grid: TcxGrid
      Left = 9
      Width = 537
      Height = 276
      Margins.Left = 7
      Margins.Bottom = 7
      ExplicitLeft = 9
      ExplicitWidth = 537
      ExplicitHeight = 276
      inherited View: TcxGridDBTableView
        OnDblClick = ViewDblClick
        object ColViewID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'codigo'
          Width = 70
        end
        object ColViewDescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'nome'
          Width = 300
        end
      end
    end
    inherited pnlFiltros: TPanel
      Left = 577
      Height = 276
      Margins.Right = 7
      Margins.Bottom = 7
      ExplicitLeft = 577
      ExplicitHeight = 276
      inherited GridFiltros: TcxGrid
        Height = 276
        Margins.Left = 7
        Margins.Bottom = 7
        ExplicitHeight = 276
      end
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 320
  end
  inherited qConsulta: TUniQuery
    SQL.Strings = (
      'SELECT vd.codigo, '
      #9'vd.nome, '
      #9'vd.departamento, '
      #9'vd.liquido, '
      #9'vd.produto, '
      #9'vd.capacidade, '
      #9'vd.estoque_negativo, '
      #9'vd.unidade_medida'
      '   FROM vw_depositos vd'
      '  WHERE vd.liquido = FALSE ;')
    Left = 126
    Top = 144
  end
  inherited ds: TUniDataSource
    Left = 126
    Top = 192
  end
  inherited qInfo: TUniQuery
    Left = 126
    Top = 240
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
        Value = 'vw_depositos'
      end>
  end
  inherited StyleRepository: TcxStyleRepository
    Left = 126
    Top = 86
    PixelsPerInch = 96
  end
end
