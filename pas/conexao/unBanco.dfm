object dmBanco: TdmBanco
  OldCreateOrder = False
  Height = 461
  Width = 765
  object PostgreSQLUniProvider: TPostgreSQLUniProvider
    Left = 64
    Top = 24
  end
  object Conn: TUniConnection
    ProviderName = 'PostgreSQL'
    Port = 5432
    Database = 'karnak'
    DefaultTransaction = UniTransaction
    Username = 'postgres'
    Server = '127.0.0.1'
    LoginPrompt = False
    Left = 64
    Top = 72
    EncryptedPassword = 'B8FF8AFF9EFF8DFF9BFF96FF9EFF90FFCBFFCAFF'
  end
  object UniTransaction: TUniTransaction
    DefaultConnection = Conn
    Left = 64
    Top = 120
  end
  object UniEncryptor: TUniEncryptor
    HashAlgorithm = haMD5
    Left = 64
    Top = 168
  end
  object UniDump: TUniDump
    Connection = Conn
    Left = 64
    Top = 264
  end
  object UniAlerter: TUniAlerter
    Connection = Conn
    Left = 64
    Top = 216
  end
  object UniLoader: TUniLoader
    Connection = Conn
    Left = 64
    Top = 312
  end
end
