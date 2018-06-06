inherited frmGridGrupoPessoas: TfrmGridGrupoPessoas
  Tag = 2104
  Caption = 'Grupo de Pessoas'
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
        object ColViewNome: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'nome'
          Width = 260
        end
        object ColViewTipo: TcxGridDBColumn
          Caption = 'Tipo'
          DataBinding.FieldName = 'tipo'
          Width = 100
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
      'SELECT vpg.codigo, '
      #9'vpg.empresa, '
      #9'vpg.nome, '
      #9'vpg.tipo, '
      #9'vpg.bloqueado, '
      #9'vpg.motivo_bloqueio, '
      #9'vpg.tabela_preco, '
      #9'vpg.forma_pgto, '
      #9'vpg.tabela_preco_fatura, '
      #9'vpg.bloqueia_geracao_ponto, '
      #9'vpg.limite, '
      #9'vpg.desconto_pedido'
      '   FROM vw_pessoa_grupos vpg ;')
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
        Value = 'vw_pessoa_grupos'
      end>
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
