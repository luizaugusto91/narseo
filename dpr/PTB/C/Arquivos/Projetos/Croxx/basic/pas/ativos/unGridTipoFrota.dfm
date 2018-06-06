inherited frmGridTipoFrota: TfrmGridTipoFrota
  Tag = 2213
  Caption = 'Tipo de Frota'
  ClientHeight = 350
  ClientWidth = 900
  ExplicitWidth = 916
  ExplicitHeight = 389
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 310
    Width = 900
    ExplicitTop = 382
    ExplicitWidth = 808
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
      OnClick = btnExcluirClick
      ExplicitLeft = 711
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
    ExplicitWidth = 794
    ExplicitHeight = 375
    inherited pnlFuncoes: TPanel
      Left = 546
      Height = 276
      Margins.Bottom = 7
      ExplicitLeft = 454
      ExplicitHeight = 348
    end
    inherited Grid: TcxGrid
      Left = 9
      Width = 537
      Height = 276
      Margins.Left = 7
      Margins.Bottom = 7
      ExplicitLeft = 9
      ExplicitWidth = 445
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
      Left = 577
      Height = 276
      Margins.Right = 7
      Margins.Bottom = 7
      ExplicitLeft = 485
      ExplicitHeight = 348
      inherited GridFiltros: TcxGrid
        Height = 276
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
end
