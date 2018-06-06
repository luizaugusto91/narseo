inherited frmGridDepartamentoPessoas: TfrmGridDepartamentoPessoas
  Tag = 2101
  Caption = 'Departamentos'
  ClientHeight = 422
  ClientWidth = 1154
  ExplicitWidth = 1170
  ExplicitHeight = 461
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 382
    Width = 1154
    ExplicitTop = 382
    ExplicitWidth = 1154
    inherited btnNovo: TButton
      Left = 769
      OnClick = btnNovoClick
      ExplicitLeft = 769
    end
    inherited btnVisualizar: TButton
      Left = 865
      OnClick = btnVisualizarClick
      ExplicitLeft = 865
    end
    inherited btnEditar: TButton
      Left = 961
      OnClick = btnEditarClick
      ExplicitLeft = 961
    end
    inherited btnExcluir: TButton
      Left = 1057
      OnClick = btnExcluirClick
      ExplicitLeft = 1057
    end
  end
  inherited grpLista: TGroupBox
    Left = 7
    Top = 7
    Width = 1140
    Height = 375
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    ExplicitLeft = 7
    ExplicitTop = 7
    ExplicitWidth = 1140
    ExplicitHeight = 375
    inherited pnlFuncoes: TPanel
      Left = 800
      Height = 348
      Margins.Bottom = 7
      ExplicitLeft = 800
      ExplicitHeight = 348
    end
    inherited Grid: TcxGrid
      Left = 9
      Width = 791
      Height = 348
      Margins.Left = 7
      Margins.Bottom = 7
      ExplicitLeft = 9
      ExplicitWidth = 791
      ExplicitHeight = 348
      inherited View: TcxGridDBTableView
        object ColViewID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'codigo'
          Width = 70
        end
        object ColViewNome: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'nome'
          Width = 160
        end
        object ColViewDescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'descricao'
          Width = 300
        end
      end
    end
    inherited pnlFiltros: TPanel
      Left = 831
      Height = 348
      Margins.Right = 7
      Margins.Bottom = 7
      ExplicitLeft = 831
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
      'SELECT codigo, '
      #9'nome, '
      #9'descricao, '
      #9'turno_inicio, '
      #9'turno_fim, '
      #9'cd_responsavel, '
      #9'responsavel, '
      #9'desativado'
      '   FROM vw_departamentos ;')
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
        Value = 'vw_departamentos'
      end>
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
