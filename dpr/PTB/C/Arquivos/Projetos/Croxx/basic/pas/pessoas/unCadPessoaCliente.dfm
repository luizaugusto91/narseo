inherited frmCadPessoaCliente: TfrmCadPessoaCliente
  Caption = 'Cadastro de Pessoas - Clientes'
  PixelsPerInch = 96
  TextHeight = 15
  inherited ds: TUniDataSource
    Top = 407
  end
  inherited qConsulta: TUniQuery
    SQL.Strings = (
      'SELECT '#9'ps.codigo, '
      #9'ps.empresa, '
      #9'ps.datacadastro, '
      #9'ps.nome, '
      #9'ps.fantasia, '
      #9'ps.nomereduzido, '
      #9'ps.tipopessoa, '
      #9'ps.cnpj, '
      #9'ps.ie, '
      #9'ps.im, '
      #9'ps.datanascimento, '
      #9'ps.sexo, '
      #9'ps.endereco, '
      #9'ps.endereco_numero, '
      #9'ps.complemento, '
      #9'ps.referencia, '
      #9'ps.bairro, '
      #9'ps.cep, '
      #9'ps.cidade, '
      #9'ps.uf, '
      #9'ps.pais, '
      #9'ps.tel1, '
      #9'ps.tel2, '
      #9'ps.tel3, '
      #9'ps.email, '
      #9'ps.site, '
      #9'ps.obs, '
      #9'ps.alerta, '
      #9'ps.cliente, '
      #9'ps.colaborador, '
      #9'ps.fornecedor, '
      #9'ps.representante, '
      #9'ps.transportadora, '
      #9'ps.inativo'
      '  FROM pessoas ps'
      ' WHERE ps.cliente = true and ps.codigo = :codigo;')
    Top = 407
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 26673292
  end
  inherited qCidade: TUniQuery
    Left = 456
  end
  inherited dsCidade: TUniDataSource
    Left = 656
  end
  object dsPerfil: TUniDataSource
    Left = 560
    Top = 144
  end
  object dsContas: TUniDataSource
    Left = 512
    Top = 144
  end
  object dsBanco: TUniDataSource
    Left = 608
    Top = 144
  end
end
