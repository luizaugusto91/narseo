object Connection: TConnection
  OldCreateOrder = False
  Height = 597
  Width = 789
  object PostgreSQLUniProvider: TPostgreSQLUniProvider
    Left = 176
    Top = 24
  end
  object Conn: TUniConnection
    ProviderName = 'PostgreSQL'
    Port = 5432
    Database = 'olivers'
    DefaultTransaction = UniTransaction
    Debug = True
    Username = 'postgres'
    Server = '127.0.0.1'
    Connected = True
    LoginPrompt = False
    Left = 176
    Top = 72
    EncryptedPassword = 'B8FF8AFF9EFF8DFF9BFF96FF9EFF90FFCBFFCAFF'
  end
  object UniTransaction: TUniTransaction
    DefaultConnection = Conn
    Left = 176
    Top = 120
  end
  object UniEncryptor: TUniEncryptor
    HashAlgorithm = haMD5
    Left = 176
    Top = 168
  end
  object UniDump: TUniDump
    Connection = Conn
    Left = 176
    Top = 264
  end
  object UniAlerter: TUniAlerter
    Connection = Conn
    Transaction = UniTransaction
    Left = 176
    Top = 216
  end
  object UniLoader: TUniLoader
    Connection = Conn
    Left = 176
    Top = 312
  end
  object qEmpresas: TUniQuery
    Connection = Conn
    Transaction = UniTransaction
    UpdateTransaction = UniTransaction
    SQL.Strings = (
      'SELECT em.codigo, '
      #9'em.pessoa, '
      #9'em.serial, '
      #9'em.chave, '
      #9'em.data_inicio, '
      #9'em.data_fim, '
      #9'em.matriz, '
      #9'em.cd_matriz,'
      #9'ps.nome,'
      #9'ps.fantasia,'
      #9'ps.cnpj'
      '   FROM empresas em'
      '   LEFT JOIN pessoas ps on ps.codigo = em.pessoa;')
    Left = 496
    Top = 384
    object qEmpresascodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qEmpresaspessoa: TIntegerField
      FieldName = 'pessoa'
      Required = True
    end
    object qEmpresasserial: TStringField
      FieldName = 'serial'
      Size = 200
    end
    object qEmpresaschave: TStringField
      FieldName = 'chave'
      Size = 200
    end
    object qEmpresasdata_inicio: TDateField
      FieldName = 'data_inicio'
      Required = True
    end
    object qEmpresasdata_fim: TDateField
      FieldName = 'data_fim'
      Required = True
    end
    object qEmpresasmatriz: TBooleanField
      FieldName = 'matriz'
      Required = True
    end
    object qEmpresascd_matriz: TIntegerField
      FieldName = 'cd_matriz'
    end
    object qEmpresasnome: TStringField
      FieldName = 'nome'
      ReadOnly = True
      Required = True
      Size = 250
    end
    object qEmpresasfantasia: TStringField
      FieldName = 'fantasia'
      ReadOnly = True
      Size = 250
    end
    object qEmpresascnpj: TStringField
      FieldName = 'cnpj'
      ReadOnly = True
      Required = True
      EditMask = '00\.000\.000\/0000-00;0;_'
      Size = 50
    end
  end
  object qBasic: TUniQuery
    Connection = Conn
    Transaction = UniTransaction
    UpdateTransaction = UniTransaction
    SQL.Strings = (
      'select 1')
    Left = 424
    Top = 24
  end
  object qLogin: TUniQuery
    Connection = Conn
    Transaction = UniTransaction
    UpdateTransaction = UniTransaction
    SQL.Strings = (
      'SELECT codigo, '
      #9'login, '
      #9'senha, '
      #9'grupo, '
      #9'ativo, '
      #9'pessoa, '
      #9'empresa'
      '   FROM system_usuarios'
      
        '  WHERE :empresa = ANY (empresa) and ativo = true and upper(logi' +
        'n) = :login and senha = md5(:senha)')
    Left = 424
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'empresa'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'login'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'senha'
        ParamType = ptInput
        Value = nil
      end>
  end
  object qHelp: TUniQuery
    Connection = Conn
    Transaction = UniTransaction
    UpdateTransaction = UniTransaction
    SQL.Strings = (
      'SELECT '#9'sh.codigo, '
      #9'sh.formulario, '
      #9'sf.nome,'
      #9'sf.formname,'
      #9'sf.tag,'
      #9'sh.html,'
      #9'sh.versao'
      '   FROM system_help sh'
      '   LEFT JOIN system_formularios sf ON sh.formulario = sf.codigo'
      '  WHERE sf.tag = :tag'
      '    AND sh.versao = :versao;')
    Left = 424
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'tag'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'versao'
        Value = nil
      end>
    object qHelpcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qHelpformulario: TIntegerField
      FieldName = 'formulario'
      Required = True
    end
    object qHelpnome: TStringField
      FieldName = 'nome'
      ReadOnly = True
      Required = True
      Size = 100
    end
    object qHelpformname: TStringField
      FieldName = 'formname'
      ReadOnly = True
      Required = True
      Size = 100
    end
    object qHelptag: TIntegerField
      FieldName = 'tag'
      ReadOnly = True
      Required = True
    end
    object qHelphtml: TMemoField
      FieldName = 'html'
      Required = True
      BlobType = ftMemo
    end
    object qHelpversao: TStringField
      FieldName = 'versao'
      Size = 10
    end
  end
  object qModulos: TUniQuery
    Connection = Conn
    Transaction = UniTransaction
    UpdateTransaction = UniTransaction
    SQL.Strings = (
      'SELECT codigo, nome, descricao, instalado, ativo, tag'
      '  FROM system_modulos;')
    Left = 616
    Top = 24
  end
  object qFormularios: TUniQuery
    Connection = Conn
    Transaction = UniTransaction
    UpdateTransaction = UniTransaction
    SQL.Strings = (
      'SELECT codigo, nome, formname, tag, modulo, ativo'
      '  FROM system_formularios;')
    Left = 696
    Top = 24
  end
  object qPermissoesGrupo: TUniQuery
    Connection = Conn
    Transaction = UniTransaction
    UpdateTransaction = UniTransaction
    SQL.Strings = (
      'SELECT spg.codigo, '
      #9'spg.grupo, '
      #9'spg.formulario, '
      #9'spg.abrir, '
      #9'spg.alteracao, '
      #9'spg.exclusao, '
      #9'spg.executar,'
      #9'fm.tag'
      '   FROM system_permissoes_grupo spg'
      '   LEFT JOIN system_formularios fm on fm.codigo = spg.formulario'
      '   WHERE grupo = :grupo and tag = :tag;')
    Left = 696
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'grupo'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'tag'
        ParamType = ptInput
        Value = nil
      end>
    object qPermissoesGrupocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qPermissoesGrupogrupo: TIntegerField
      FieldName = 'grupo'
      Required = True
    end
    object qPermissoesGrupoformulario: TIntegerField
      FieldName = 'formulario'
      Required = True
    end
    object qPermissoesGrupoabrir: TBooleanField
      FieldName = 'abrir'
      Required = True
    end
    object qPermissoesGrupoalteracao: TBooleanField
      FieldName = 'alteracao'
      Required = True
    end
    object qPermissoesGrupoexclusao: TBooleanField
      FieldName = 'exclusao'
      Required = True
    end
    object qPermissoesGrupoexecutar: TBooleanField
      FieldName = 'executar'
      Required = True
    end
    object qPermissoesGrupotag: TIntegerField
      FieldName = 'tag'
      ReadOnly = True
      Required = True
    end
  end
  object qPermissoesUser: TUniQuery
    Connection = Conn
    Transaction = UniTransaction
    UpdateTransaction = UniTransaction
    SQL.Strings = (
      'SELECT spu.codigo, '
      #9'spu.usuario, '
      #9'spu.formulario, '
      #9'spu.abrir, '
      #9'spu.alteracao, '
      #9'spu.exclusao, '
      #9'spu.executar,'
      #9'fm.tag'
      '   FROM system_permissoes_usuario spu'
      '   LEFT JOIN system_formularios fm on fm.codigo = spu.formulario'
      '   WHERE usuario = :usuario and tag = :tag;')
    Left = 696
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'usuario'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'tag'
        ParamType = ptInput
        Value = nil
      end>
  end
  object qSQL: TUniQuery
    Connection = Conn
    Transaction = UniTransaction
    UpdateTransaction = UniTransaction
    Left = 424
    Top = 272
  end
  object qAssinatura: TUniQuery
    Connection = Conn
    Transaction = UniTransaction
    UpdateTransaction = UniTransaction
    SQL.Strings = (
      'SELECT '#9'codigo, '
      #9'empresa, '
      #9'certificado_datavencimento, '
      #9'certificado_senha, '
      #9'certificado_chave, '
      #9'arq_pastasseparadas, '
      #9'arq_criarpastasmensalmente, '
      #9'arq_separarmodelo, '
      #9'arq_path_nfe, '
      #9'arq_path_cancelamento, '
      #9'arq_path_cce, '
      #9'arq_path_cfe, '
      #9'arq_path_inutilizacao, '
      #9'arq_path_dpec, '
      #9'arq_path_eventos, '
      #9'web_ufdestino, '
      #9'web_ajustarautomaticamente, '
      #9'web_ajuste_aguardar, '
      #9'web_ajuste_tentativas, '
      #9'web_ajuste_intervalo, '
      #9'web_proxy_host, '
      #9'web_proxy_port, '
      #9'web_proxy_usuario, '
      #9'web_proxy_senha, '
      #9'email_smtp, '
      #9'email_conexaosegura, '
      #9'email_porta, '
      #9'email_usuario, '
      #9'email_senha, '
      #9'email_assunto, '
      #9'email_mensagem, '
      #9'danfe_logo, '
      #9'danfe_retrato'
      '  FROM empresa_assinatura'
      ' WHERE empresa = :empresa')
    Left = 496
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'empresa'
        ParamType = ptInput
        Value = nil
      end>
    object qAssinaturacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qAssinaturaempresa: TIntegerField
      FieldName = 'empresa'
      Required = True
    end
    object qAssinaturacertificado_datavencimento: TDateField
      FieldName = 'certificado_datavencimento'
    end
    object qAssinaturacertificado_senha: TStringField
      FieldName = 'certificado_senha'
      Size = 200
    end
    object qAssinaturacertificado_chave: TStringField
      FieldName = 'certificado_chave'
      Size = 200
    end
    object qAssinaturaarq_pastasseparadas: TBooleanField
      FieldName = 'arq_pastasseparadas'
    end
    object qAssinaturaarq_criarpastasmensalmente: TBooleanField
      FieldName = 'arq_criarpastasmensalmente'
    end
    object qAssinaturaarq_separarmodelo: TBooleanField
      FieldName = 'arq_separarmodelo'
    end
    object qAssinaturaarq_path_nfe: TStringField
      FieldName = 'arq_path_nfe'
      Size = 500
    end
    object qAssinaturaarq_path_cancelamento: TStringField
      FieldName = 'arq_path_cancelamento'
      Size = 500
    end
    object qAssinaturaarq_path_cce: TStringField
      FieldName = 'arq_path_cce'
      Size = 500
    end
    object qAssinaturaarq_path_cfe: TStringField
      FieldName = 'arq_path_cfe'
      Size = 500
    end
    object qAssinaturaarq_path_inutilizacao: TStringField
      FieldName = 'arq_path_inutilizacao'
      Size = 500
    end
    object qAssinaturaarq_path_dpec: TStringField
      FieldName = 'arq_path_dpec'
      Size = 500
    end
    object qAssinaturaarq_path_eventos: TStringField
      FieldName = 'arq_path_eventos'
      Size = 500
    end
    object qAssinaturaweb_ufdestino: TStringField
      FieldName = 'web_ufdestino'
      Size = 2
    end
    object qAssinaturaweb_ajustarautomaticamente: TBooleanField
      FieldName = 'web_ajustarautomaticamente'
    end
    object qAssinaturaweb_ajuste_aguardar: TIntegerField
      FieldName = 'web_ajuste_aguardar'
    end
    object qAssinaturaweb_ajuste_tentativas: TIntegerField
      FieldName = 'web_ajuste_tentativas'
    end
    object qAssinaturaweb_ajuste_intervalo: TIntegerField
      FieldName = 'web_ajuste_intervalo'
    end
    object qAssinaturaweb_proxy_host: TStringField
      FieldName = 'web_proxy_host'
      Size = 200
    end
    object qAssinaturaweb_proxy_port: TStringField
      FieldName = 'web_proxy_port'
      Size = 5
    end
    object qAssinaturaweb_proxy_usuario: TStringField
      FieldName = 'web_proxy_usuario'
      Size = 100
    end
    object qAssinaturaweb_proxy_senha: TStringField
      FieldName = 'web_proxy_senha'
      Size = 100
    end
    object qAssinaturaemail_smtp: TStringField
      FieldName = 'email_smtp'
      Size = 200
    end
    object qAssinaturaemail_conexaosegura: TBooleanField
      FieldName = 'email_conexaosegura'
    end
    object qAssinaturaemail_porta: TStringField
      FieldName = 'email_porta'
      Size = 5
    end
    object qAssinaturaemail_usuario: TStringField
      FieldName = 'email_usuario'
      Size = 100
    end
    object qAssinaturaemail_senha: TStringField
      FieldName = 'email_senha'
      Size = 100
    end
    object qAssinaturaemail_assunto: TStringField
      FieldName = 'email_assunto'
      Size = 100
    end
    object qAssinaturaemail_mensagem: TStringField
      FieldName = 'email_mensagem'
      Size = 250
    end
    object qAssinaturadanfe_logo: TBlobField
      FieldName = 'danfe_logo'
    end
    object qAssinaturadanfe_retrato: TIntegerField
      FieldName = 'danfe_retrato'
    end
  end
  object qHostConfig: TUniQuery
    Connection = Conn
    Transaction = UniTransaction
    UpdateTransaction = UniTransaction
    SQL.Strings = (
      'SELECT '#9'codigo, '
      #9'empresa, '
      #9'estacao_serial, '
      #9'estacao_terminal, '
      #9'estacao_usuario, '
      #9'certificado_path, '
      #9'certificado_datavencimento, '
      #9'certificado_senha, '
      #9'certificado_chave, '
      #9'sefaz_ambiente, '
      #9'web_proxy_host, '
      #9'web_proxy_port, '
      #9'web_proxy_usuario, '
      #9'web_proxy_senha'
      '  FROM empresa_hostconfig'
      ' WHERE empresa = :empresa and estacao_serial = :serial;')
    Left = 496
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'empresa'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'serial'
        ParamType = ptInput
        Value = nil
      end>
    object qHostConfigcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qHostConfigempresa: TIntegerField
      FieldName = 'empresa'
      Required = True
    end
    object qHostConfigestacao_serial: TStringField
      FieldName = 'estacao_serial'
      Size = 200
    end
    object qHostConfigestacao_terminal: TStringField
      FieldName = 'estacao_terminal'
      Size = 200
    end
    object qHostConfigestacao_usuario: TStringField
      FieldName = 'estacao_usuario'
      Size = 200
    end
    object qHostConfigcertificado_path: TStringField
      FieldName = 'certificado_path'
      Size = 500
    end
    object qHostConfigcertificado_datavencimento: TDateField
      FieldName = 'certificado_datavencimento'
    end
    object qHostConfigcertificado_senha: TStringField
      FieldName = 'certificado_senha'
      Size = 200
    end
    object qHostConfigcertificado_chave: TStringField
      FieldName = 'certificado_chave'
      Size = 200
    end
    object qHostConfigsefaz_ambiente: TIntegerField
      FieldName = 'sefaz_ambiente'
    end
    object qHostConfigweb_proxy_host: TStringField
      FieldName = 'web_proxy_host'
      Size = 200
    end
    object qHostConfigweb_proxy_port: TStringField
      FieldName = 'web_proxy_port'
      Size = 5
    end
    object qHostConfigweb_proxy_usuario: TStringField
      FieldName = 'web_proxy_usuario'
      Size = 100
    end
    object qHostConfigweb_proxy_senha: TStringField
      FieldName = 'web_proxy_senha'
      Size = 100
    end
  end
  object ScriptHostConfig1: TUniScript
    SQL.Strings = (
      'SELECT cria_configlocal(:iempresa, :sserial)')
    Connection = Conn
    Left = 696
    Top = 176
  end
  object ScriptHostConfig: TUniQuery
    Connection = Conn
    Transaction = UniTransaction
    UpdateTransaction = UniTransaction
    SQL.Strings = (
      'SELECT cria_configlocal(:iempresa, :sserial)')
    Left = 496
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iempresa'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'sserial'
        ParamType = ptInput
        Value = nil
      end>
  end
  object UniSQLMonitor: TUniSQLMonitor
    DBMonitorOptions.Host = '127.0.0.1'
    OnSQL = UniSQLMonitorSQL
    Left = 496
    Top = 272
  end
  object qBreak: TUniQuery
    Connection = Conn
    Transaction = UniTransaction
    UpdateTransaction = UniTransaction
    SQL.Strings = (
      
        'SELECT coalesce((SELECT codigo FROM system_break WHERE executada' +
        ' = FALSE),0) AS result;')
    Left = 496
    Top = 24
  end
  object qPessoa: TUniQuery
    Connection = Conn
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
      ' WHERE ps.codigo = :codigo;')
    Left = 424
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = nil
      end>
  end
  object conSQLite: TUniConnection
    ProviderName = 'SQLite'
    Port = 5432
    Debug = True
    Server = '127.0.0.1'
    LoginPrompt = False
    Left = 72
    Top = 72
  end
  object SQLiteUniProvider: TSQLiteUniProvider
    Left = 72
    Top = 24
  end
  object qSlite: TUniQuery
    Connection = conSQLite
    Transaction = UniTransaction
    UpdateTransaction = UniTransaction
    SQL.Strings = (
      'SELECT * FROM servidores')
    Left = 72
    Top = 120
  end
  object dsp_Login: TDataSetProvider
    DataSet = qLogin
    Left = 424
    Top = 432
  end
  object dsp_Empresas: TDataSetProvider
    DataSet = qEmpresas
    Left = 496
    Top = 432
  end
  object qMatriz: TUniQuery
    Connection = Conn
    Transaction = UniTransaction
    UpdateTransaction = UniTransaction
    SQL.Strings = (
      'SELECT em.codigo, '
      #9'em.pessoa, '
      #9'em.serial, '
      #9'em.chave, '
      #9'em.data_inicio, '
      #9'em.data_fim, '
      #9'em.matriz, '
      #9'em.cd_matriz,'
      #9'ps.nome,'
      #9'ps.fantasia,'
      #9'ps.cnpj'
      '   FROM empresas em'
      '   LEFT JOIN pessoas ps on ps.codigo = em.pessoa'
      '   WHERE em.matriz = TRUE;')
    Left = 496
    Top = 320
  end
  object qCheckSystem: TUniQuery
    Connection = Conn
    Transaction = UniTransaction
    UpdateTransaction = UniTransaction
    Left = 696
    Top = 224
  end
  object qRN: TUniQuery
    Tag = 7100
    SQLInsert.Strings = (
      'INSERT INTO empresa_regras_negocio'
      
        '  (empresa, compras_centro_custos, compras_tipo_conta, compras_t' +
        'ipo_pagamento, vendas_centro_custos, vendas_tipo_conta, vendas_t' +
        'ipo_pagamento)'
      'VALUES'
      
        '  (:empresa, :compras_centro_custos, :compras_tipo_conta, :compr' +
        'as_tipo_pagamento, :vendas_centro_custos, :vendas_tipo_conta, :v' +
        'endas_tipo_pagamento)')
    SQLDelete.Strings = (
      'DELETE FROM empresa_regras_negocio'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE empresa_regras_negocio'
      'SET'
      
        '  empresa = :empresa, compras_centro_custos = :compras_centro_cu' +
        'stos, compras_tipo_conta = :compras_tipo_conta, compras_tipo_pag' +
        'amento = :compras_tipo_pagamento, vendas_centro_custos = :vendas' +
        '_centro_custos, vendas_tipo_conta = :vendas_tipo_conta, vendas_t' +
        'ipo_pagamento = :vendas_tipo_pagamento'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM empresa_regras_negocio'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT empresa, compras_centro_custos, compras_tipo_conta, compr' +
        'as_tipo_pagamento, vendas_centro_custos, vendas_tipo_conta, vend' +
        'as_tipo_pagamento FROM empresa_regras_negocio'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM empresa_regras_negocio'
      ''
      ') t')
    Connection = Conn
    SQL.Strings = (
      
        'SELECT codigo, empresa, compras_centro_custos, compras_tipo_cont' +
        'a, compras_tipo_pagamento, '
      
        '        vendas_centro_custos, vendas_tipo_conta, vendas_tipo_pag' +
        'amento'
      '   FROM empresa_regras_negocio'
      '  WHERE empresa = :empresa')
    MasterFields = 'codigo'
    DetailFields = 'empresa'
    Left = 424
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empresa'
        Value = nil
      end>
    object qRNcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qRNempresa: TIntegerField
      FieldName = 'empresa'
      Required = True
    end
    object qRNcompras_centro_custos: TStringField
      FieldName = 'compras_centro_custos'
    end
    object qRNcompras_tipo_conta: TIntegerField
      FieldName = 'compras_tipo_conta'
    end
    object qRNcompras_tipo_pagamento: TIntegerField
      FieldName = 'compras_tipo_pagamento'
    end
    object qRNvendas_centro_custos: TStringField
      FieldName = 'vendas_centro_custos'
    end
    object qRNvendas_tipo_conta: TIntegerField
      FieldName = 'vendas_tipo_conta'
    end
    object qRNvendas_tipo_pagamento: TIntegerField
      FieldName = 'vendas_tipo_pagamento'
    end
  end
end
