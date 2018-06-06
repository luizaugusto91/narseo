inherited dmCTe: TdmCTe
  OldCreateOrder = True
  Height = 364
  Width = 486
  inherited qSQL: TUniQuery
    Left = 192
    Top = 56
  end
  object qCTe: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO cte'
      
        '  (data_registro, conhecimento, chave_cte, chave_cancelamento, d' +
        'ata_cancelamento, status, remetente, remetente_endereco, destina' +
        'tario, destinatario_endereco, local_entrega, data_entrega, tipo_' +
        'nota, nota, nfe_chave, nf_serie, nf_bcicms, nf_icms, nf_icms_st,' +
        ' nf_bc_icms_st, nf_total_prod, nf_cfop, valor_nf, data_nfe, natu' +
        'reza_carga, qtde_volume, especie_volume, marca, qtde_kgm, frete_' +
        'kgm, frete, valor_frete, natureza_operacao, despacho, pedagio, o' +
        'utras_despesas, prestacao, aliquota, basecalc_icms, valor_icms, ' +
        'tarifa, local_coleta, data_coleta, frota, veiculo_placa, veiculo' +
        '_uf, sec_car, base_calculo, calculado_ate, data_recebimento, red' +
        'espacho, processado, valor_produto, marcado_manual, un_med, segu' +
        'ro_resp, seguro_seg, seguro_apol, seguro_averb, observacao)'
      'VALUES'
      
        '  (:data_registro, :conhecimento, :chave_cte, :chave_cancelament' +
        'o, :data_cancelamento, :status, :remetente, :remetente_endereco,' +
        ' :destinatario, :destinatario_endereco, :local_entrega, :data_en' +
        'trega, :tipo_nota, :nota, :nfe_chave, :nf_serie, :nf_bcicms, :nf' +
        '_icms, :nf_icms_st, :nf_bc_icms_st, :nf_total_prod, :nf_cfop, :v' +
        'alor_nf, :data_nfe, :natureza_carga, :qtde_volume, :especie_volu' +
        'me, :marca, :qtde_kgm, :frete_kgm, :frete, :valor_frete, :nature' +
        'za_operacao, :despacho, :pedagio, :outras_despesas, :prestacao, ' +
        ':aliquota, :basecalc_icms, :valor_icms, :tarifa, :local_coleta, ' +
        ':data_coleta, :frota, :veiculo_placa, :veiculo_uf, :sec_car, :ba' +
        'se_calculo, :calculado_ate, :data_recebimento, :redespacho, :pro' +
        'cessado, :valor_produto, :marcado_manual, :un_med, :seguro_resp,' +
        ' :seguro_seg, :seguro_apol, :seguro_averb, :observacao)')
    SQLDelete.Strings = (
      'DELETE FROM cte'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE cte'
      'SET'
      
        '  data_registro = :data_registro, conhecimento = :conhecimento, ' +
        'chave_cte = :chave_cte, chave_cancelamento = :chave_cancelamento' +
        ', data_cancelamento = :data_cancelamento, status = :status, reme' +
        'tente = :remetente, remetente_endereco = :remetente_endereco, de' +
        'stinatario = :destinatario, destinatario_endereco = :destinatari' +
        'o_endereco, local_entrega = :local_entrega, data_entrega = :data' +
        '_entrega, tipo_nota = :tipo_nota, nota = :nota, nfe_chave = :nfe' +
        '_chave, nf_serie = :nf_serie, nf_bcicms = :nf_bcicms, nf_icms = ' +
        ':nf_icms, nf_icms_st = :nf_icms_st, nf_bc_icms_st = :nf_bc_icms_' +
        'st, nf_total_prod = :nf_total_prod, nf_cfop = :nf_cfop, valor_nf' +
        ' = :valor_nf, data_nfe = :data_nfe, natureza_carga = :natureza_c' +
        'arga, qtde_volume = :qtde_volume, especie_volume = :especie_volu' +
        'me, marca = :marca, qtde_kgm = :qtde_kgm, frete_kgm = :frete_kgm' +
        ', frete = :frete, valor_frete = :valor_frete, natureza_operacao ' +
        '= :natureza_operacao, despacho = :despacho, pedagio = :pedagio, ' +
        'outras_despesas = :outras_despesas, prestacao = :prestacao, aliq' +
        'uota = :aliquota, basecalc_icms = :basecalc_icms, valor_icms = :' +
        'valor_icms, tarifa = :tarifa, local_coleta = :local_coleta, data' +
        '_coleta = :data_coleta, frota = :frota, veiculo_placa = :veiculo' +
        '_placa, veiculo_uf = :veiculo_uf, sec_car = :sec_car, base_calcu' +
        'lo = :base_calculo, calculado_ate = :calculado_ate, data_recebim' +
        'ento = :data_recebimento, redespacho = :redespacho, processado =' +
        ' :processado, valor_produto = :valor_produto, marcado_manual = :' +
        'marcado_manual, un_med = :un_med, seguro_resp = :seguro_resp, se' +
        'guro_seg = :seguro_seg, seguro_apol = :seguro_apol, seguro_averb' +
        ' = :seguro_averb, observacao = :observacao'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM cte'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT data_registro, conhecimento, chave_cte, chave_cancelament' +
        'o, data_cancelamento, status, remetente, remetente_endereco, des' +
        'tinatario, destinatario_endereco, local_entrega, data_entrega, t' +
        'ipo_nota, nota, nfe_chave, nf_serie, nf_bcicms, nf_icms, nf_icms' +
        '_st, nf_bc_icms_st, nf_total_prod, nf_cfop, valor_nf, data_nfe, ' +
        'natureza_carga, qtde_volume, especie_volume, marca, qtde_kgm, fr' +
        'ete_kgm, frete, valor_frete, natureza_operacao, despacho, pedagi' +
        'o, outras_despesas, prestacao, aliquota, basecalc_icms, valor_ic' +
        'ms, tarifa, local_coleta, data_coleta, frota, veiculo_placa, vei' +
        'culo_uf, sec_car, base_calculo, calculado_ate, data_recebimento,' +
        ' redespacho, processado, valor_produto, marcado_manual, un_med, ' +
        'seguro_resp, seguro_seg, seguro_apol, seguro_averb, observacao F' +
        'ROM cte'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM cte'
      ''
      ') t')
    Connection = Connection.Conn
    SQL.Strings = (
      
        'SELECT codigo, data_registro, conhecimento, chave_cte, chave_can' +
        'celamento, '
      
        '       data_cancelamento, status, id_remetente, remetente, remet' +
        'ente_id_cidade, '
      
        '       remetente_cidade, remetente_uf, remetente_endereco, id_de' +
        'stinatario, '
      
        '       destinatario, destinatario_id_cidade, destinatario_cidade' +
        ', destinatario_uf, '
      
        '       destinatario_endereco, id_local_entrega, local_entrega, d' +
        'ata_entrega, '
      
        '       tipo_nota, nota, nfe_chave, nf_serie, nf_bcicms, nf_icms,' +
        ' nf_icms_st, '
      
        '       nf_bc_icms_st, nf_total_prod, nf_cfop_chave, nf_cfop, val' +
        'or_nf, '
      
        '       data_nfe, natureza_carga, qtde_volume, especie_volume, ma' +
        'rca, '
      
        '       qtde_kgm, frete_kgm, frete, valor_frete, natureza_operaca' +
        'o_chave, '
      
        '       natureza_operacao, despacho, pedagio, outras_despesas, pr' +
        'estacao, '
      
        '       aliquota, basecalc_icms, valor_icms, tarifa, id_local_col' +
        'eta, '
      
        '       local_coleta, data_coleta, frota, veiculo_placa, veiculo_' +
        'uf, '
      
        '       sec_car, base_calculo, calculado_ate, data_recebimento, r' +
        'edespacho, '
      
        '       processado, valor_produto, marcado_manual, un_med, seguro' +
        '_resp, '
      '       seguro_seg, seguro_apol, seguro_averb, observacao'
      '  FROM vw_cte_completa'
      ' WHERE codigo = :codigo;')
    AfterOpen = qCTeAfterOpen
    AfterClose = qCTeAfterClose
    Left = 64
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = 0
      end>
  end
  object dsCTe: TUniDataSource
    DataSet = qCTe
    Left = 120
    Top = 56
  end
  object qRemetente: TUniQuery
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
      #9'ps.cidade as id_cidade, '
      
        #9'(SELECT cidade from cidades where codigo = ps.cidade) as cidade' +
        ','
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
      '   FROM pessoas ps'
      '  WHERE ps.codigo = :id_remetente;')
    MasterSource = dsCTe
    MasterFields = 'id_remetente'
    DetailFields = 'codigo'
    Left = 64
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_remetente'
        ParamType = ptInput
        Value = nil
      end>
  end
  object qDestinatario: TUniQuery
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
      #9'ps.cidade as id_cidade, '
      
        #9'(SELECT cidade from cidades where codigo = ps.cidade) as cidade' +
        ','
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
      ' WHERE ps.codigo = :id_destinatario;')
    MasterSource = dsCTe
    MasterFields = 'id_destinatario'
    DetailFields = 'codigo'
    Left = 64
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_destinatario'
        ParamType = ptInput
        Value = nil
      end>
  end
  object qOperacacoes: TUniQuery
    Connection = Connection.Conn
    SQL.Strings = (
      
        'SELECT codigo, chave, descricao, master, submaster, descricao_se' +
        'faz, '
      '       tipo_mvto'
      '  FROM cst_cfop'
      ' ORDER BY chave ASC;')
    DetailFields = 'pessoa'
    Left = 64
    Top = 200
  end
  object qEmitente: TUniQuery
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
      #9'ps.cidade as id_cidade, '
      
        #9'(SELECT cidade from cidades where codigo = ps.cidade) as cidade' +
        ','
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
    DetailFields = 'codigo'
    Left = 64
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = nil
      end>
  end
  object qDocumento: TUniQuery
    Connection = Connection.Conn
    SQL.Strings = (
      
        'SELECT homologacao, producao FROM documento_series where tipo_do' +
        'cumento = 57 and serie = 1;')
    Left = 120
    Top = 104
  end
  object qFrota: TUniQuery
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
      
        'SELECT codigo, transportadora, tipo, placa, identificacao, autom' +
        'acao, '
      
        '       veiculo, motorista, ultimokm, data_aquisicao, data_ultima' +
        'manutencao, '
      
        '       data_venda, data_ultimatrocaoleo, observacao, km_oleomoto' +
        'r, km_oleocambio, '
      '       km_manutencao, terceiro, esporadico, inativo, rntrc'
      '  FROM frotas'
      ' WHERE codigo = :frota;')
    MasterSource = dsCTe
    MasterFields = 'frota'
    DetailFields = 'codigo'
    Left = 120
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'frota'
        ParamType = ptInput
        Value = nil
      end>
  end
end
