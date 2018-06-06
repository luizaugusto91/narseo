inherited frmGridPessoaFuncionario: TfrmGridPessoaFuncionario
  Tag = 2106
  Caption = 'Cadastro de Pessoas - Colaboradores'
  ExplicitWidth = 1116
  ExplicitHeight = 539
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Visible = False
    inherited btnExcluir: TButton
      Enabled = False
    end
  end
  inherited grpLista: TGroupBox
    ExplicitHeight = 313
    inherited pnlFuncoes: TPanel
      ExplicitHeight = 287
    end
    inherited Grid: TcxGrid
      ExplicitHeight = 287
      inherited View: TcxGridDBTableView
        object ColViewID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'codigo'
          Width = 50
        end
        object ColViewCNPJ: TcxGridDBColumn
          Caption = 'CNPJ/CPF'
          DataBinding.FieldName = 'cnpj'
          Width = 80
        end
        object ColViewNome: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'nome'
          Width = 200
        end
        object ColViewFantasia: TcxGridDBColumn
          Caption = 'Fantasia'
          DataBinding.FieldName = 'fantasia'
          Width = 200
        end
        object ColViewCidade: TcxGridDBColumn
          Caption = 'Cidade'
          DataBinding.FieldName = 'cidade'
          Width = 120
        end
        object ColViewTelefone: TcxGridDBColumn
          Caption = 'Telefone'
          DataBinding.FieldName = 'tel1'
          Width = 80
        end
      end
    end
    inherited pnlFiltros: TPanel
      ExplicitHeight = 287
      inherited GridFiltros: TcxGrid
        ExplicitHeight = 287
      end
    end
  end
  inherited Ribbon: TdxRibbon
    inherited MTabRegistros: TdxRibbonTab
      Index = 0
    end
  end
  inherited stb: TStatusBar
    ExplicitTop = 481
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
      '  WHERE vp.colaborador = TRUE ;')
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
      Enabled = False
    end
  end
end
