object Report: TReport
  OldCreateOrder = False
  Height = 495
  Width = 812
  object qEmpresa: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO pessoas'
      
        '  (empresa, datacadastro, nome, fantasia, nomereduzido, tipopess' +
        'oa, cnpj, ie, im, datanascimento, sexo, endereco, endereco_numer' +
        'o, complemento, referencia, bairro, cep, cidade, uf, pais, tel1,' +
        ' tel2, tel3, email, site, obs, alerta, cliente, colaborador, for' +
        'necedor, representante, transportadora, inativo)'
      'VALUES'
      
        '  (:empresa, :datacadastro, :nome, :fantasia, :nomereduzido, :ti' +
        'popessoa, :cnpj, :ie, :im, :datanascimento, :sexo, :endereco, :e' +
        'ndereco_numero, :complemento, :referencia, :bairro, :cep, :cidad' +
        'e, :uf, :pais, :tel1, :tel2, :tel3, :email, :site, :obs, :alerta' +
        ', :cliente, :colaborador, :fornecedor, :representante, :transpor' +
        'tadora, :inativo)')
    SQLDelete.Strings = (
      'DELETE FROM pessoas'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE pessoas'
      'SET'
      
        '  empresa = :empresa, datacadastro = :datacadastro, nome = :nome' +
        ', fantasia = :fantasia, nomereduzido = :nomereduzido, tipopessoa' +
        ' = :tipopessoa, cnpj = :cnpj, ie = :ie, im = :im, datanascimento' +
        ' = :datanascimento, sexo = :sexo, endereco = :endereco, endereco' +
        '_numero = :endereco_numero, complemento = :complemento, referenc' +
        'ia = :referencia, bairro = :bairro, cep = :cep, cidade = :cidade' +
        ', uf = :uf, pais = :pais, tel1 = :tel1, tel2 = :tel2, tel3 = :te' +
        'l3, email = :email, site = :site, obs = :obs, alerta = :alerta, ' +
        'cliente = :cliente, colaborador = :colaborador, fornecedor = :fo' +
        'rnecedor, representante = :representante, transportadora = :tran' +
        'sportadora, inativo = :inativo'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM pessoas'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT empresa, datacadastro, nome, fantasia, nomereduzido, tipo' +
        'pessoa, cnpj, ie, im, datanascimento, sexo, endereco, endereco_n' +
        'umero, complemento, referencia, bairro, cep, cidade, uf, pais, t' +
        'el1, tel2, tel3, email, site, obs, alerta, cliente, colaborador,' +
        ' fornecedor, representante, transportadora, inativo FROM pessoas'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM pessoas'
      ''
      ') t')
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT '#9'ps.codigo, '
      #9'ps.empresa, '
      #9'ps.datacadastro, '
      #9'ps.nome, '
      #9'ps.fantasia, '
      #9'ps.nomereduzido, '
      #9'ps.tipopessoa, '
      
        #9'regexp_replace(ps.cnpj,'#39'(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})'#39','#39'\' +
        '1.\2.\3/\4-\5'#39')::CHARACTER VARYING(20) as cnpj,'
      #9'ps.ie, '
      #9'ps.im, '
      #9'ps.datanascimento, '
      #9'ps.sexo, '
      #9'ps.endereco,'
      #9'ps.endereco_numero,'
      #9'ps.complemento,'
      #9'ps.referencia,'
      #9'ps.bairro,'
      #9'ps.cep,'
      #9'cd.cidade,'
      #9'ps.uf,'
      #9'ps.pais,'
      #9'ps.tel1,'
      #9'ps.tel2,'
      #9'ps.tel3,'
      #9'ps.email,'
      #9'ps.site,'
      #9'ps.obs,'
      #9'ps.alerta,'
      #9'ps.cliente,'
      #9'ps.colaborador,'
      #9'ps.fornecedor,'
      #9'ps.representante,'
      #9'ps.transportadora,'
      #9'ps.inativo'
      '  FROM pessoas ps'
      '  LEFT JOIN cidades cd on cd.codigo = ps.cidade'
      ' WHERE ps.codigo = :codigo;')
    Left = 56
    Top = 21
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = 1
      end>
    object qEmpresacodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
    end
    object qEmpresaempresa: TIntegerField
      FieldName = 'empresa'
    end
    object qEmpresanome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 250
    end
    object qEmpresafantasia: TStringField
      DisplayLabel = 'Fantasia'
      FieldName = 'fantasia'
      Required = True
      Size = 250
    end
    object qEmpresanomereduzido: TStringField
      DisplayLabel = 'Nome Reduzido'
      FieldName = 'nomereduzido'
      Size = 30
    end
    object qEmpresatipopessoa: TIntegerField
      DisplayLabel = 'Tipo de Pessoa'
      FieldName = 'tipopessoa'
      Required = True
    end
    object qEmpresacnpj: TStringField
      DisplayLabel = 'CNPJ/CPF'
      FieldName = 'cnpj'
      Required = True
      Size = 50
    end
    object qEmpresaie: TStringField
      DisplayLabel = 'IE/RG'
      FieldName = 'ie'
      Required = True
      Size = 50
    end
    object qEmpresaim: TStringField
      FieldName = 'im'
      Size = 50
    end
    object qEmpresaendereco: TStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'endereco'
      Required = True
      Size = 250
    end
    object qEmpresaendereco_numero: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'endereco_numero'
      Required = True
      FixedChar = True
    end
    object qEmpresacomplemento: TStringField
      FieldName = 'complemento'
      Size = 100
    end
    object qEmpresareferencia: TStringField
      FieldName = 'referencia'
      Size = 150
    end
    object qEmpresabairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Required = True
      Size = 200
    end
    object qEmpresacep: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      Required = True
      EditMask = '00000\-999;0;_'
      Size = 15
    end
    object qEmpresauf: TStringField
      DisplayLabel = 'UF'
      FieldName = 'uf'
      Required = True
      Size = 2
    end
    object qEmpresatel1: TStringField
      FieldName = 'tel1'
      EditMask = '!\(99\) 0000-00000;0;_'
    end
    object qEmpresatel2: TStringField
      FieldName = 'tel2'
      EditMask = '!\(99\) 0000-00000;0;_'
    end
    object qEmpresatel3: TStringField
      FieldName = 'tel3'
      EditMask = '!\(99\) 0000-00000;0;_'
    end
    object qEmpresaemail: TStringField
      FieldName = 'email'
      Size = 60
    end
    object qEmpresasite: TStringField
      FieldName = 'site'
      Size = 60
    end
    object qEmpresacidade: TStringField
      FieldName = 'cidade'
      ReadOnly = True
      Required = True
      Size = 75
    end
  end
  object qCliente: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO pessoas'
      
        '  (empresa, datacadastro, nome, fantasia, nomereduzido, tipopess' +
        'oa, cnpj, ie, im, datanascimento, sexo, endereco, endereco_numer' +
        'o, complemento, referencia, bairro, cep, cidade, uf, pais, tel1,' +
        ' tel2, tel3, email, site, obs, alerta, cliente, colaborador, for' +
        'necedor, representante, transportadora, inativo)'
      'VALUES'
      
        '  (:empresa, :datacadastro, :nome, :fantasia, :nomereduzido, :ti' +
        'popessoa, :cnpj, :ie, :im, :datanascimento, :sexo, :endereco, :e' +
        'ndereco_numero, :complemento, :referencia, :bairro, :cep, :cidad' +
        'e, :uf, :pais, :tel1, :tel2, :tel3, :email, :site, :obs, :alerta' +
        ', :cliente, :colaborador, :fornecedor, :representante, :transpor' +
        'tadora, :inativo)')
    SQLDelete.Strings = (
      'DELETE FROM pessoas'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE pessoas'
      'SET'
      
        '  empresa = :empresa, datacadastro = :datacadastro, nome = :nome' +
        ', fantasia = :fantasia, nomereduzido = :nomereduzido, tipopessoa' +
        ' = :tipopessoa, cnpj = :cnpj, ie = :ie, im = :im, datanascimento' +
        ' = :datanascimento, sexo = :sexo, endereco = :endereco, endereco' +
        '_numero = :endereco_numero, complemento = :complemento, referenc' +
        'ia = :referencia, bairro = :bairro, cep = :cep, cidade = :cidade' +
        ', uf = :uf, pais = :pais, tel1 = :tel1, tel2 = :tel2, tel3 = :te' +
        'l3, email = :email, site = :site, obs = :obs, alerta = :alerta, ' +
        'cliente = :cliente, colaborador = :colaborador, fornecedor = :fo' +
        'rnecedor, representante = :representante, transportadora = :tran' +
        'sportadora, inativo = :inativo'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM pessoas'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT empresa, datacadastro, nome, fantasia, nomereduzido, tipo' +
        'pessoa, cnpj, ie, im, datanascimento, sexo, endereco, endereco_n' +
        'umero, complemento, referencia, bairro, cep, cidade, uf, pais, t' +
        'el1, tel2, tel3, email, site, obs, alerta, cliente, colaborador,' +
        ' fornecedor, representante, transportadora, inativo FROM pessoas'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM pessoas'
      ''
      ') t')
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT '#9'ps.codigo, '
      #9'ps.empresa, '
      #9'ps.datacadastro, '
      #9'ps.nome, '
      #9'ps.fantasia, '
      #9'ps.nomereduzido, '
      #9'ps.tipopessoa, '
      
        #9'regexp_replace(ps.cnpj,'#39'(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})'#39','#39'\' +
        '1.\2.\3/\4-\5'#39')::CHARACTER VARYING(20) as cnpj, '
      #9'ps.ie, '
      #9'ps.im, '
      #9'ps.datanascimento, '
      #9'ps.sexo, '
      #9'ps.endereco,'
      #9'ps.endereco_numero,'
      #9'ps.complemento,'
      #9'ps.referencia,'
      #9'ps.bairro,'
      #9'ps.cep,'
      #9'cd.cidade,'
      #9'ps.uf,'
      #9'ps.pais,'
      #9'ps.tel1,'
      #9'ps.tel2,'
      #9'ps.tel3,'
      #9'ps.email,'
      #9'ps.site,'
      #9'ps.obs,'
      #9'ps.alerta,'
      #9'ps.cliente,'
      #9'ps.colaborador,'
      #9'ps.fornecedor,'
      #9'ps.representante,'
      #9'ps.transportadora,'
      #9'ps.inativo'
      '  FROM pessoas ps'
      '  LEFT JOIN cidades cd on cd.codigo = ps.cidade'
      ' WHERE ps.codigo = :codigo;')
    Left = 56
    Top = 69
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = 1
      end>
    object IntegerField1: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
    end
    object IntegerField2: TIntegerField
      FieldName = 'empresa'
    end
    object StringField1: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 250
    end
    object StringField2: TStringField
      DisplayLabel = 'Fantasia'
      FieldName = 'fantasia'
      Required = True
      Size = 250
    end
    object StringField3: TStringField
      DisplayLabel = 'Nome Reduzido'
      FieldName = 'nomereduzido'
      Size = 30
    end
    object IntegerField3: TIntegerField
      DisplayLabel = 'Tipo de Pessoa'
      FieldName = 'tipopessoa'
      Required = True
    end
    object StringField4: TStringField
      DisplayLabel = 'CNPJ/CPF'
      FieldName = 'cnpj'
      Required = True
      Size = 50
    end
    object StringField5: TStringField
      DisplayLabel = 'IE/RG'
      FieldName = 'ie'
      Required = True
      Size = 50
    end
    object StringField6: TStringField
      FieldName = 'im'
      Size = 50
    end
    object StringField7: TStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'endereco'
      Required = True
      Size = 250
    end
    object StringField8: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'endereco_numero'
      Required = True
      FixedChar = True
    end
    object StringField9: TStringField
      FieldName = 'complemento'
      Size = 100
    end
    object StringField10: TStringField
      FieldName = 'referencia'
      Size = 150
    end
    object StringField11: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Required = True
      Size = 200
    end
    object StringField12: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      Required = True
      EditMask = '00000\-999;0;_'
      Size = 15
    end
    object StringField13: TStringField
      DisplayLabel = 'UF'
      FieldName = 'uf'
      Required = True
      Size = 2
    end
    object StringField14: TStringField
      FieldName = 'tel1'
      EditMask = '!\(99\) 0000-00000;0;_'
    end
    object StringField15: TStringField
      FieldName = 'tel2'
      EditMask = '!\(99\) 0000-00000;0;_'
    end
    object StringField16: TStringField
      FieldName = 'tel3'
      EditMask = '!\(99\) 0000-00000;0;_'
    end
    object StringField17: TStringField
      FieldName = 'email'
      Size = 60
    end
    object StringField18: TStringField
      FieldName = 'site'
      Size = 60
    end
    object MemoField1: TMemoField
      FieldName = 'obs'
      BlobType = ftMemo
    end
    object BooleanField1: TBooleanField
      DefaultExpression = 'False'
      FieldName = 'inativo'
    end
    object qClientecidade: TStringField
      FieldName = 'cidade'
      ReadOnly = True
      Required = True
      Size = 75
    end
  end
end
