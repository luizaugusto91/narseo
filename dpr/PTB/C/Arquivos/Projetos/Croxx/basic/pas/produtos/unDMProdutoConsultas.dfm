object dmProdutoConsultas: TdmProdutoConsultas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 571
  Width = 734
  object qDepositos: TUniQuery
    Tag = 7000
    KeyFields = 'codigo'
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT codigo, nome'
      '  FROM deposito;')
    Left = 40
    Top = 16
  end
  object qGrupos: TUniQuery
    Tag = 7000
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT codigo, descricao'
      '  FROM produto_grupos;')
    Left = 40
    Top = 64
  end
  object qSubGrupos: TUniQuery
    Tag = 7000
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT codigo, codgrupo, descricao'
      '  FROM produto_subgrupos;')
    Left = 40
    Top = 112
  end
  object qCategoria: TUniQuery
    Tag = 7000
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT codigo, categoria'
      '  FROM produto_categorias;')
    Left = 40
    Top = 160
  end
  object qMarca: TUniQuery
    Tag = 7000
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT codigo, descricao'
      '  FROM produto_marcas;')
    Left = 40
    Top = 208
  end
  object qModelo: TUniQuery
    Tag = 7000
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT codigo, descricao'
      '  FROM produto_modelos;')
    Left = 40
    Top = 256
  end
  object qNCM: TUniQuery
    Connection = Connection.Conn
    Left = 288
    Top = 16
  end
  object qANP: TUniQuery
    Connection = Connection.Conn
    Left = 288
    Top = 64
  end
  object qCEST: TUniQuery
    Connection = Connection.Conn
    Left = 288
    Top = 112
  end
  object qCSOSN: TUniQuery
    Connection = Connection.Conn
    Left = 288
    Top = 160
  end
  object qCFOP: TUniQuery
    Connection = Connection.Conn
    Left = 288
    Top = 208
  end
  object dsDepositos: TUniDataSource
    DataSet = qDepositos
    Left = 96
    Top = 16
  end
  object dsGrupos: TUniDataSource
    DataSet = qGrupos
    Left = 96
    Top = 64
  end
  object dsSubGrupos: TUniDataSource
    DataSet = qSubGrupos
    Left = 96
    Top = 112
  end
  object dsCategoria: TUniDataSource
    DataSet = qCategoria
    Left = 96
    Top = 160
  end
  object dsMarca: TUniDataSource
    DataSet = qMarca
    Left = 96
    Top = 208
  end
  object dsModelo: TUniDataSource
    DataSet = qModelo
    Left = 96
    Top = 256
  end
  object dsNCM: TUniDataSource
    DataSet = qNCM
    Left = 344
    Top = 16
  end
  object dsANP: TUniDataSource
    DataSet = qANP
    Left = 344
    Top = 64
  end
  object dsCEST: TUniDataSource
    DataSet = qCEST
    Left = 344
    Top = 112
  end
  object dsCSOSN: TUniDataSource
    DataSet = qCSOSN
    Left = 344
    Top = 160
  end
  object dsCFOP: TUniDataSource
    DataSet = qCFOP
    Left = 344
    Top = 208
  end
  object qFornecedor: TUniQuery
    Tag = 7000
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT codigo, nome, fantasia, cnpj'
      '  FROM pessoas'
      '  WHERE fornecedor;')
    Left = 40
    Top = 304
  end
  object dsFornecedor: TUniDataSource
    DataSet = qFornecedor
    Left = 96
    Top = 304
  end
  object qUnidade: TUniQuery
    Tag = 7000
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT codigo, descricao, unidade, venda_decimal'
      '  FROM produto_unidade;')
    Left = 40
    Top = 352
  end
  object dsUnidade: TUniDataSource
    DataSet = qUnidade
    Left = 96
    Top = 352
  end
  object qEmpresas: TUniQuery
    Tag = 7000
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT ep.codigo, '
      #9'ep.pessoa, '
      #9'ps.nome,'
      #9'ps.fantasia,'
      #9'ep.matriz, '
      #9'ep.cd_matriz, '
      #9'ep.inativo'
      '   FROM empresas ep'
      '   LEFT JOIN pessoas ps on ps.codigo = ep.pessoa'
      '  WHERE ep.inativo = FALSE;')
    Left = 40
    Top = 400
  end
  object dsEmpresas: TUniDataSource
    DataSet = qEmpresas
    Left = 96
    Top = 400
  end
  object qDeposito: TUniQuery
    Tag = 7000
    Connection = Connection.Conn
    SQL.Strings = (
      
        'SELECT codigo, nome, departamento, liquido, produto, capacidade,' +
        ' estoque_negativo, '
      
        '       unidade_medida, edita, enviado, enviado_filial, novo, qua' +
        'ntidade'
      '  FROM deposito'
      ' WHERE produto is null')
    Left = 40
    Top = 448
  end
  object dsDeposito: TUniDataSource
    DataSet = qDeposito
    Left = 96
    Top = 448
  end
end
