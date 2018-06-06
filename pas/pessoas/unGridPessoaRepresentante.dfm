inherited frmGridPessoaRepresentante: TfrmGridPessoaRepresentante
  Tag = 2108
  Caption = 'Cadastro de Pessoas - Representantes'
  ExplicitWidth = 1116
  ExplicitHeight = 539
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Visible = False
    ExplicitTop = 341
    ExplicitWidth = 1300
    inherited btnNovo: TButton
      ExplicitLeft = 916
    end
    inherited btnVisualizar: TButton
      ExplicitLeft = 1012
    end
    inherited btnEditar: TButton
      ExplicitLeft = 1108
    end
    inherited btnExcluir: TButton
      ExplicitLeft = 1204
    end
  end
  inherited grpLista: TGroupBox
    ExplicitWidth = 1288
    ExplicitHeight = 213
    inherited pnlFuncoes: TPanel
      ExplicitLeft = 949
      ExplicitHeight = 187
    end
    inherited Grid: TcxGrid
      ExplicitWidth = 941
      ExplicitHeight = 187
      inherited View: TcxGridDBTableView
        OnDblClick = ViewDblClick
        object ColumnID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'codigo'
          Width = 50
        end
        object ColumnCNPJ: TcxGridDBColumn
          Caption = 'CNPJ/CPF'
          DataBinding.FieldName = 'cnpj'
          Width = 80
        end
        object ColumnNome: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'nome'
          Width = 200
        end
        object ColumnFantasia: TcxGridDBColumn
          Caption = 'Fantasia'
          DataBinding.FieldName = 'fantasia'
          Width = 200
        end
        object ColumnCidade: TcxGridDBColumn
          Caption = 'Cidade'
          DataBinding.FieldName = 'cidade'
          Width = 120
        end
        object ColumnTelefone: TcxGridDBColumn
          Caption = 'Telefone'
          DataBinding.FieldName = 'tel1'
          Width = 80
        end
      end
    end
    inherited pnlFiltros: TPanel
      ExplicitLeft = 980
      ExplicitHeight = 187
      inherited GridFiltros: TcxGrid
        ExplicitHeight = 187
      end
    end
  end
  inherited Ribbon: TdxRibbon
    ExplicitWidth = 1300
    inherited MTabRegistros: TdxRibbonTab
      Index = 0
    end
  end
  inherited stb: TStatusBar
    ExplicitTop = 381
    ExplicitWidth = 1300
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited qConsulta: TUniQuery
    SQL.Strings = (
      'SELECT vp.codigo, '
      #9'vp.datacadastro, '
      #9'vp.nome, '
      #9'vp.fantasia, '
      #9'vp.cnpj, '
      #9'vp.cidade, '
      #9'vp.uf, '
      #9'vp.tel1, '
      #9'vp.inativo, '
      #9'vp.cliente, '
      #9'vp.colaborador, '
      #9'vp.fornecedor, '
      #9'vp.representante, '
      #9'vp.transportadora'
      '   FROM vw_pessoas vp'
      '  WHERE vp.representante = TRUE ;')
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
        Value = 'vw_pessoas'
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
      OnClick = MnExcluirClick
    end
  end
end
