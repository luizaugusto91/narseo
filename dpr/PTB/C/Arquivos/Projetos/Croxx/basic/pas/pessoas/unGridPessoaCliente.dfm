inherited frmGridPessoaCliente: TfrmGridPessoaCliente
  Tag = 2105
  Caption = 'Cadastro de Pessoas - Clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotton: TPanel
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
    inherited Grid: TcxGrid
      inherited View: TcxGridDBTableView
        OnDblClick = ViewDblClick
        object ColViewID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'codigo'
          Width = 50
        end
        object ColViewCNPJ: TcxGridDBColumn
          Caption = 'CNPJ'
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
          Visible = False
          Width = 80
        end
      end
    end
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
      '  WHERE vp.cliente = TRUE ;')
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
end
