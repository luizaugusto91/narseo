inherited dmPessoaClientes: TdmPessoaClientes
  OldCreateOrder = True
  object qBancos: TUniQuery
    Tag = 7000
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT codigo, febraban, nome, nome_reduzido, inativo'
      '  FROM bancos;')
    Left = 24
    Top = 8
  end
  object qRegras: TUniQuery
    Tag = 7100
    Connection = Connection.Conn
    Transaction = Connection.UniTransaction
    UpdateTransaction = Connection.UniTransaction
    SQL.Strings = (
      'SELECT codigo, empresa, descricao, observacao, bloqueada'
      '  FROM produto_regras;')
    Left = 70
    Top = 8
  end
  object dsRegras: TUniDataSource
    DataSet = qRegras
    Left = 70
    Top = 56
  end
end
