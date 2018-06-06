--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.14
-- Dumped by pg_dump version 9.4.14
-- Started on 2018-05-05 01:58:32

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3587 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 811 (class 1247 OID 23763891)
-- Name: do_ip; Type: DOMAIN; Schema: public; Owner: -
--

CREATE DOMAIN do_ip AS character varying(15) DEFAULT '0.0.0.0'::character varying;


--
-- TOC entry 812 (class 1247 OID 23763892)
-- Name: do_km; Type: DOMAIN; Schema: public; Owner: -
--

CREATE DOMAIN do_km AS numeric(13,1) DEFAULT 0.0;


--
-- TOC entry 813 (class 1247 OID 23763893)
-- Name: do_volume; Type: DOMAIN; Schema: public; Owner: -
--

CREATE DOMAIN do_volume AS numeric(13,1) DEFAULT 0.0;


--
-- TOC entry 426 (class 1255 OID 23763894)
-- Name: assoc_pessoa(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION assoc_pessoa() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	if new.cliente is true then
		begin
			INSERT INTO pessoa_cliente(pessoa) VALUES (new.codigo);
		end;
	end if;
	if new.colaborador is true then
		begin
			INSERT INTO pessoa_funcionario(pessoa) VALUES (new.codigo);
		end;
	end if;
RETURN NEW;
end;
$$;


--
-- TOC entry 427 (class 1255 OID 23763895)
-- Name: assoc_produto_empresa(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION assoc_produto_empresa() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
Declare
	E record;
begin
  for E in (select codigo from empresas) loop
    begin
      insert into produto_empresas (empresa, produto) values (E.codigo, new.codigo);
    end;
  end loop;
RETURN NEW;
end;
$$;


--
-- TOC entry 428 (class 1255 OID 23763896)
-- Name: baixa_abastecimento(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION baixa_abastecimento() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
  IF (TG_OP = 'INSERT') or (TG_OP = 'UPDATE') THEN
    begin
      if (new.placa is not null) and (new.km is not null) then
        begin
	  INSERT INTO abastecimento_baixa(bico, quantidade, preco_unitario, valor, valor_baixa, forma_pagamento, data, hora, encerrante_inicial, encerrante_final, target_id, punp_id, km_baixa, placa, hora_baixa, troca_oleo, manual)
	                          VALUES (new.bico, new.quantidade, new.preco_unitario, 0, 0, 0, new.data, new.hora, new.encerrante_inicial, new.encerrante_final, new.target_id, new.punp_id, new.km, new.placa, current_timestamp, new.troca_oleo, new.manual);
	  update frotas SET ultimokm = new.km where placa = new.placa;
	  if (new.troca_oleo = TRUE) then 
	    BEGIN
	      update frotas set data_ultimatrocaoleo = current_date, km_oleomotor = new.km where placa = new.placa;
	    end;
	  end if;
	  delete from abastecimento where codigo = new.codigo;
        end;
      end if;
      RETURN NEW;
    end;
  ELSIF (TG_OP = 'DELETE') THEN
    begin
      --new.visivel = FALSE;
      --RETURN OLD;
    end;
  END IF;
  RETURN NULL;
end;
$$;


--
-- TOC entry 429 (class 1255 OID 23763897)
-- Name: calc_pedido_compras(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION calc_pedido_compras(npedido integer) RETURNS money
    LANGUAGE plpgsql
    AS $$
Declare
	E record;
	vTotalPedido money;
begin
  vTotalPedido = 0;
  for E in (select valor_total from pedido_compra_itens WHERE cancelado = FALSE AND pedido = nPedido) loop
    begin
      vTotalPedido = vTotalPedido + E.valor_total;
    end;
  end loop;
  --raise exception 'Não foi possivel finalizar a soma dos itens no pedido: %',nPedido;
  Return vTotalPedido;
end;
$$;


--
-- TOC entry 430 (class 1255 OID 23763898)
-- Name: calc_pedido_vendas(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION calc_pedido_vendas(npedido integer) RETURNS money
    LANGUAGE plpgsql
    AS $$
Declare
	E record;
	vTotalPedido money;
begin
  vTotalPedido = 0;
  for E in (select valor_total from pedido_vendas_itens WHERE cancelado = FALSE AND pedido = nPedido) loop
    begin
      vTotalPedido = vTotalPedido + E.valor_total;
    end;
  end loop;
  --raise exception 'Não foi possivel finalizar a soma dos itens no pedido: %',nPedido;
  Return vTotalPedido;
end;
$$;


--
-- TOC entry 431 (class 1255 OID 23763899)
-- Name: calc_vendas(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION calc_vendas(nvenda integer) RETURNS money
    LANGUAGE plpgsql
    AS $$
Declare
	E record;
	vTotalVenda money;
begin
  vTotalVenda = 0;
  for E in (select valor_total from venda_itens WHERE cancelado = FALSE AND venda = nVenda) loop
    begin
      vTotalVenda = vTotalVenda + E.valor_total;
    end;
  end loop;
  --raise exception 'Não foi possivel finalizar a soma dos itens no pedido: %',nPedido;
  Return vTotalVenda;
end;
$$;


--
-- TOC entry 432 (class 1255 OID 23763900)
-- Name: calc_vendas_entregue(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION calc_vendas_entregue(nvenda integer) RETURNS money
    LANGUAGE plpgsql
    AS $$
Declare
	E record;
	vTotalVenda money;
begin
  vTotalVenda = 0;
  for E in (select valor_entregue from venda_itens WHERE cancelado = FALSE AND venda = nVenda) loop
    begin
      vTotalVenda = vTotalVenda + E.valor_entregue;
    end;
  end loop;
  --raise exception 'Não foi possivel finalizar a soma dos itens no pedido: %',nPedido;
  Return vTotalVenda;
end;
$$;


--
-- TOC entry 433 (class 1255 OID 23763901)
-- Name: control_movimento_empenho(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION control_movimento_empenho() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
Declare
  cd_empresa integer;
begin
  /* Aplica-se ao pedido de venda */
  IF (TG_OP = 'INSERT') THEN
    begin
      select empresa into cd_empresa from pedido_vendas where codigo = new.pedido;
      update estoque SET total_disponivel = total_geral - new.quantidade, total_empenhado = new.quantidade
      WHERE produto = new.produto and empresa = cd_empresa;
      RETURN NEW;
    end;
  ELSIF (TG_OP = 'UPDATE') THEN
    begin
      if new.quantidade > old.quantidade then
        begin
          select empresa into cd_empresa from pedido_vendas where codigo = new.pedido;
          update estoque SET total_disponivel = total_geral - ((total_empenhado - old.quantidade) + new.quantidade), total_empenhado = (total_empenhado - old.quantidade) + new.quantidade
          WHERE produto = new.produto and empresa = cd_empresa;
          RETURN NEW;
        end;
      elsIF new.quantidade < old.quantidade then
        begin
          select empresa into cd_empresa from pedido_vendas where codigo = new.pedido;
          update estoque SET total_disponivel = total_geral - ((total_empenhado - old.quantidade) + new.quantidade), total_empenhado = (total_empenhado - old.quantidade) + new.quantidade
          WHERE produto = new.produto and empresa = cd_empresa;
          RETURN NEW;
        end;
      ElSE EXIT;
      end if;
    end;
  ELSIF (TG_OP = 'DELETE') THEN
    begin
      select empresa into cd_empresa from pedido_vendas where codigo = old.pedido;
      update estoque SET total_disponivel = total_geral - (total_empenhado - old.quantidade), total_empenhado = total_empenhado - old.quantidade
      WHERE produto = old.produto and empresa = cd_empresa;
      RETURN OLD;
    end;
  END IF;
end;
$$;


--
-- TOC entry 434 (class 1255 OID 23763902)
-- Name: control_movimento_venda_itens(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION control_movimento_venda_itens() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
Declare
  e 	      RECORD;
  cd_empresa  integer;
  cd_deposito Integer;
begin
  /* Aplica-se ao pedido de venda */
  IF (TG_OP = 'INSERT') THEN
    begin
      select empresa into cd_empresa from vendas where codigo = coalesce(new.venda);
      for e in (select * from estoque es WHERE es.produto = new.produto and es.empresa = cd_empresa) loop
      end loop;
      if new.item_pedido is not null then
	begin
          /* REGISTRA O MOVIMENTO DO PRODUTO */
	  INSERT INTO produto_movimento(empresa, produto, data_movimento, tipo_movimento, quantidade, quantidade_anterior, valor_compra, valor_venda, origem, deposito, referencia)
               VALUES (cd_empresa, new.produto, current_timestamp, 'V', new.quantidade, (e.total_geral - new.quantidade), 0, new.valor_total, 'PV', cd_deposito, new.venda);
          /* REGISTRA NOVOS VALORES DO ESTOQUE */
          update estoque 
	     SET total_anterior = total_geral,
		 total_geral = total_geral - new.quantidade, 
	         total_empenhado = total_empenhado - new.quantidade,
	         total_disponivel = (total_geral - new.quantidade) - (total_empenhado - new.quantidade)
          WHERE produto = new.produto and empresa = cd_empresa;
        end;
      else
	begin
          /* REGISTRA O MOVIMENTO DO PRODUTO */
	  INSERT INTO produto_movimento(empresa, produto, data_movimento, tipo_movimento, quantidade, quantidade_anterior, valor_compra, valor_venda, origem, deposito, referencia)
               VALUES (cd_empresa, new.produto, current_timestamp, 'V', new.quantidade, (e.total_geral - new.quantidade), 0, new.valor_total, 'V', cd_deposito, new.venda);
          /* REGISTRA NOVOS VALORES DO ESTOQUE */     
          update estoque 
	     SET total_anterior = total_geral,
		 total_geral = total_geral - new.quantidade,
	         total_disponivel = (total_geral - new.quantidade) - total_empenhado
          WHERE produto = new.produto and empresa = cd_empresa;
	end;
      end if;
      RETURN NEW;
    end;
  ELSIF (TG_OP = 'UPDATE') THEN
    begin
      select empresa into cd_empresa from vendas where codigo = coalesce(new.venda);
      for e in (select * from estoque es WHERE es.produto = new.produto and es.empresa = cd_empresa) loop
      end loop;
      if new.quantidade > old.quantidade then
        begin
          /* REGISTRA O MOVIMENTO DO PRODUTO */
	  UPDATE produto_movimento
	     SET quantidade = new.quantidade,
	         quantidade_anterior = quantidade_anterior - (new.quantidade - old.quantidade),
	         valor_venda = new.valor_total
	   WHERE produto = new.produto AND empresa = cd_empresa and referencia = new.venda::character varying;
          /* REGISTRA NOVOS VALORES DO ESTOQUE */
          update estoque 
             SET total_geral = (total_geral - (new.quantidade - old.quantidade)), 
                 total_disponivel = (total_geral - (new.quantidade - old.quantidade)) - total_empenhado
           WHERE produto = new.produto and empresa = cd_empresa;
          RETURN NEW;
        end;
      elsIF new.quantidade < old.quantidade then
        begin
          /* REGISTRA O MOVIMENTO DO PRODUTO */
	  UPDATE produto_movimento
	     SET quantidade = new.quantidade,
	         quantidade_anterior = quantidade_anterior + (old.quantidade - new.quantidade),
	         valor_venda = new.valor_venda
	   WHERE produto = new.produto AND empresa = cd_empresa and referencia = new.venda::character varying;
	  /* REGISTRA NOVOS VALORES DO ESTOQUE */
          update estoque 
             SET total_geral = (total_geral - old.quantidade) + new.quantidade,
                 total_disponivel = ((total_geral - old.quantidade) + new.quantidade) - total_empenhado
           WHERE produto = new.produto and empresa = cd_empresa;
	  RETURN NEW;
        end;
      ElSE 
	begin
	  return new;
	end;
      end if;
    end;
  ELSIF (TG_OP = 'DELETE') THEN
    begin
      select empresa into cd_empresa from vendas where codigo = coalesce(old.venda);
      /* REGISTRA O MOVIMENTO DO PRODUTO */
      DELETE FROM produto_movimento WHERE produto = old.produto AND empresa = cd_empresa and referencia = old.venda::character varying;
      /* REGISTRA NOVOS VALORES DO ESTOQUE */
      select empresa into cd_empresa from vendas where codigo = coalesce(old.venda);
      update estoque 
         SET total_anterior = total_geral,
             total_geral = total_geral + old.quantidade, 
             total_disponivel = (total_geral + old.quantidade) - total_empenhado
      WHERE produto = old.produto and empresa = cd_empresa;
     RETURN OLD;
    end;
  END IF;
end;
$$;


--
-- TOC entry 435 (class 1255 OID 23763903)
-- Name: cria_configlocal(integer, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cria_configlocal(cd_empresa integer, serial character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
   empresa integer;
BEGIN
  INSERT INTO empresa_hostconfig(empresa, estacao_serial) VALUES (cd_empresa, serial);
  RETURN true;
END;

$$;


--
-- TOC entry 436 (class 1255 OID 23763904)
-- Name: delete_pedido_venda_itens(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION delete_pedido_venda_itens() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
  delete from pedido_venda_itens where pedido = old.codigo;
  RETURN old;
end;
$$;


--
-- TOC entry 437 (class 1255 OID 23763905)
-- Name: delete_venda_itens(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION delete_venda_itens() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
  if (old.pedido is not null) then
    begin
      update pedido_vendas set status = 'C' where codigo = old.pedido;
    end;
  end if;
  delete from venda_itens where venda = old.codigo;
  RETURN old;
end;
$$;


--
-- TOC entry 471 (class 1255 OID 23770027)
-- Name: faturamento_contasreceber_reverter(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION faturamento_contasreceber_reverter(ifaturamento integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
Declare
  I   RECORD;
begin
  for i in (select * from contas_receber where conta_original = iFaturamento) loop
    begin
      UPDATE contas_receber
         SET status = 'A',
             quitada = false,
             conta_original = null
       WHERE codigo = i.codigo;
    end;
  end loop;
  delete from contas_receber where codigo = iFaturamento;
Return true;
end;
$$;


--
-- TOC entry 438 (class 1255 OID 23763906)
-- Name: fn_triggerall(boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION fn_triggerall(doenable boolean) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
mytables RECORD;
BEGIN
  FOR mytables IN SELECT relname FROM pg_class WHERE relhastriggers > 0 AND NOT relname LIKE 'pg_%'
  LOOP
    IF DoEnable THEN
      EXECUTE 'ALTER TABLE ' || mytables.relname || ' ENABLE TRIGGER ALL';
    ELSE
      EXECUTE 'ALTER TABLE ' || mytables.relname || ' DISABLE TRIGGER ALL';
    END IF;  
  END LOOP;
  RETURN 1;
END;
$$;


--
-- TOC entry 3588 (class 0 OID 0)
-- Dependencies: 438
-- Name: FUNCTION fn_triggerall(doenable boolean); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION fn_triggerall(doenable boolean) IS 'Enable/disable all the triggers in database';


--
-- TOC entry 439 (class 1255 OID 23763907)
-- Name: fnc_web_venda_produto(integer, integer, numeric, numeric, numeric); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION fnc_web_venda_produto(ivenda integer, iproduto integer, nquantidade numeric, ndesconto numeric, nacrescimo numeric) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
  cValor  money;
  pValor  money;
  vTotal  money;
BEGIN
  SELECT (case when (select tipo_pagamento from vendas where codigo = ivenda) in (2,6) then valor_prazo else valor_vista end) into pValor from produto_empresas where produto = iproduto; 
  cValor = ((nquantidade * pValor)::numeric + nacrescimo) - ndesconto;
  INSERT INTO venda_itens(venda, produto, valor_unitario, quantidade, desconto_total, acrescimo_total, valor_total)
                  VALUES (ivenda, iproduto, pValor, nquantidade, ndesconto, nacrescimo, cValor);
  select calc_vendas(ivenda) into vTotal;
  update vendas set total_pedido = vTotal, total_produtos = vTotal where codigo = ivenda;
  RETURN ivenda;
END;

$$;


--
-- TOC entry 440 (class 1255 OID 23763908)
-- Name: fnc_web_venda_produto_alteracao(integer, numeric, numeric, numeric); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION fnc_web_venda_produto_alteracao(iitem integer, nquantidade numeric, ndesconto numeric, nacrescimo numeric) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
  iVenda  Integer;
  cValor  money;
  pValor  money;
  vTotal  money;
BEGIN
  SELECT venda, valor_unitario into iVenda, pValor from venda_itens where codigo = iitem;
  cValor = ((nquantidade * pValor)::numeric + nacrescimo) - ndesconto;
  update venda_itens
     SET quantidade = nquantidade,
         desconto_total = ndesconto,
         acrescimo_total = nacrescimo,
         valor_total = cValor
   WHERE codigo = iitem;
  select calc_vendas(ivenda) into vTotal;
  update vendas set total_pedido = vTotal, total_produtos = vTotal where codigo = ivenda;
  RETURN ivenda;
END;

$$;


--
-- TOC entry 441 (class 1255 OID 23763909)
-- Name: gera_cupom_venda(integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gera_cupom_venda(nvenda integer, pgto integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare
  RES integer;
  CPN INTEGER;
  I   RECORD;
  CX  RECORD;
  CP  RECORD;
begin
  /* GERA O CUPOM DA VENDA */
  FOR CP in (SELECT codigo, empresa, documento, serie, numeracao FROM system_serie_documentos WHERE empresa = get_empresa() AND documento = 'CPN') loop
  end loop;
  CPN = cp.numeracao + 1;
  update system_serie_documentos SET numeracao = CPN where codigo = cp.codigo; 
  FOR CX in (SELECT * FROM caixa WHERE data_caixa = CURRENT_DATE AND fechamento IS NULL AND conferido = FALSE) loop
  end loop;
  for I in (select * from vendas WHERE codigo = nvenda) loop
    begin
      INSERT INTO cupom(empresa, situacao, 
			caixa_codigo, caixa_operador, caixa_data, caixa_turno, 
			nr_cupom, nr_serie, nr_ecf, nr_ccf, 
			venda, operador, pessoa, pessoa_cpf, tipo_pagamento,
			total_cupom, valor_pago)
		VALUES (i.empresa, 'E', 
			cx.codigo, cx.operador_caixa, cx.data_caixa, cx.turno, 
			CPN, cp.serie, 0, CPN, 
			nvenda, cx.operador_caixa, i.cliente, '', pgto, 
			i.total_produtos, i.total_produtos)
      RETURNING codigo into RES;
    end;
  end loop;
Return RES;
end;
$$;


--
-- TOC entry 470 (class 1255 OID 23770014)
-- Name: gera_faturamento(integer, numeric); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gera_faturamento(icliente integer, ntotal numeric) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare
  RES integer;
begin
  INSERT INTO contas_receber(empresa, data_registro, usuario, data_movimento, tipo_conta, valor, parcela, total_parcelas, tipo_pagamento, centro_custo, vencimento, documento, pessoa, descricao, condicao_pagamento, status, valor_original, fatura)
  VALUES (1, Current_date, 1, Current_date, 0, nTotal, 1,1,1,1, current_date, 'FATURAMENTO', iCliente, 'FATURAMENTO DE CLIENTE POR PERIODO', 1, 'A', nTotal, TRUE) returning codigo into RES;	
Return RES;
end;
$$;


--
-- TOC entry 442 (class 1255 OID 23763910)
-- Name: gera_venda_pedido(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gera_venda_pedido(npedido integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare
  RES integer;
  I   RECORD;
begin
  /* REGISTRA A VENDA COM BASE NO PEDIDO */
  INSERT INTO vendas(empresa, pedido, cliente, representante, data_registro, previsao_entrega, data_venda, data_entrega, status, observacao, total_pedido)
       SELECT pv.empresa, pv.codigo, pv.cliente, pv.representante, pv.data_pedido, pv.previsao_entrega, CURRENT_TIMESTAMP, pv.data_entrada, pv.status, pv.observacao, pv.total_pedido FROM pedido_vendas pv WHERE codigo = nPedido
  RETURNING codigo into RES;
  for I in (select * from pedido_vendas_itens WHERE pedido = nPedido) LOOP
    BEGIN
      INSERT INTO venda_itens(venda, item_pedido, produto, valor_unitario, quantidade, desconto_total, acrescimo_total, valor_total, entregue, cancelado)
           VALUES (RES, i.codigo, i.produto, i.valor_unitario, i.quantidade, i.desconto, i.acrescimo, i.valor_total, i.entrada, i.cancelado);
    eND;
  END LOOP;
  /* ATUALIZA O PEDIDO DE VENDAS */
  UPDATE pedido_vendas SET status = 'F' WHERE codigo = npedido;
  
Return RES;
end;
$$;


--
-- TOC entry 443 (class 1255 OID 23763911)
-- Name: get_empresa(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION get_empresa() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
   empresa integer;
BEGIN
  select coalesce((select codigo from empresas where matriz),(select codigo from empresas)) into empresa; 
  RETURN empresa;
END;

$$;


--
-- TOC entry 444 (class 1255 OID 23763912)
-- Name: get_operador(character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION get_operador(cv_operacao character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
OPER Character Varying;
BEGIN
  select funcao INTO OPER from tipo_movimento_produto tmp where tmp.operacao = cv_operacao; 
  RETURN OPER;
END;

$$;


--
-- TOC entry 445 (class 1255 OID 23763913)
-- Name: grava_estoque_diario(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION grava_estoque_diario() RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare
	Est Record;
	Prd record;
	RES INTEGER;
	REC Integer;
begin
	/* Grava o estoque anterior */
	RES = 0;
	for Prd in (select pe.empresa, pe.produto from produto_empresas pe) LOOP
	  BEGIN
	    REC = 0;
	    SELECT count(codigo) INTO REC FROM estoque_diario ed WHERE ed.empresa = Prd.empresa AND ed.produto = Prd.produto and ed.data_estoque = CURRENT_DATE;
	    if (REC > 0) then
	      BEGIN
		RES = 2;
	      END;
	    ELSE
	      BEGIN
		INSERT INTO estoque_diario(empresa, produto, data_estoque, total_geral, total_disponivel, total_anterior, total_empenhado)
		SELECT es.empresa, es.produto, current_date, es.total_geral, es.total_disponivel, es.total_anterior, es.total_empenhado FROM estoque es WHERE es.empresa = Prd.empresa AND es.produto = Prd.produto;
	      END;
	    END IF;
	  END;
	END LOOP;
	RES = 1;
Return RES;
end;
$$;


--
-- TOC entry 447 (class 1255 OID 23763914)
-- Name: grava_estoque_minimo(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION grava_estoque_minimo() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
Declare
  registros integer;
  vol_minimo do_volume;
begin
  select count(*) INTO registros from produto_alerta WHERE produto = new.produto and empresa = new.empresa;
  select estoque_minimo INTO vol_minimo from produto_empresas where produto = new.produto and empresa = new.empresa;
  if new.total_disponivel < vol_minimo then
    begin
      if registros = 0 THEN
        BEGIN
          INSERT INTO produto_alerta(empresa, produto, estoque_minimo, disponivel)
          VALUES (new.empresa, new.produto, vol_minimo, new.total_disponivel);
        END;
      ELSE
	begin
	  UPDATE produto_alerta SET estoque_minimo = vol_minimo, disponivel = new.total_disponivel
	  where produto = new.produto and empresa = new.empresa; 
	end;
      END if;
    end;
  else 
    if registros > 0 then
      begin
        DELETE FROM produto_alerta where produto = new.produto and empresa = new.empresa;
      end;
    end if;
  end if;
RETURN NEW;
end;
$$;


--
-- TOC entry 448 (class 1255 OID 23763915)
-- Name: grava_estoque_movimento(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION grava_estoque_movimento() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
Declare
begin
  if (new.origem = 'MM') then
    begin
      if get_operador(new.tipo_movimento) = '-' THEN
        BEGIN
	  UPDATE estoque
	     SET data_atualizacao = current_timestamp, 
	         total_geral = total_geral - new.quantidade, 
	         total_disponivel = total_disponivel - new.quantidade, 
	         total_anterior = total_geral
           WHERE empresa = new.empresa 
             AND produto = new.produto;
        END;
      ELSE
        BEGIN
          UPDATE estoque
	     SET data_atualizacao = current_timestamp, 
	         total_geral = total_geral + new.quantidade, 
	         total_disponivel = total_disponivel + new.quantidade, 
	         total_anterior = total_geral
           WHERE empresa = new.empresa 
             AND produto = new.produto;
        END;
      END IF;
    END;
  end if;
RETURN NEW;
end;
$$;


--
-- TOC entry 449 (class 1255 OID 23763916)
-- Name: grava_movimento_manual(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION grava_movimento_manual() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
Declare
	e record;
	cd_deposito INTEGER;
	val_anterior do_volume;
	valor_compra money;
	valor_venda money;
begin
  for e in (select * from estoque es WHERE es.produto = new.produto and es.empresa = new.empresa) LOOP
    BEGIN
      SELECT deposito INTO cd_deposito from produto_empresas pe WHERE pe.produto = new.produto and pe.empresa = new.empresa;
      if get_operador(new.tipo_movimento) = '-' THEN
        BEGIN
          select e.total_geral - new.quantidade INTO val_anterior;
          SELECT 0 INTO valor_compra;
          SELECT pe.valor_vista INTO valor_venda from produto_empresas pe WHERE pe.produto = new.produto and pe.empresa = new.empresa;
        END;
      ELSE
        BEGIN
	  select e.total_geral + new.quantidade INTO val_anterior;
          SELECT 0 INTO valor_venda;
          SELECT pe.valor_compra INTO valor_compra from produto_empresas pe WHERE pe.produto = new.produto and pe.empresa = new.empresa;
        END;
      END IF;
      /* Registra o movimento */
      INSERT INTO produto_movimento(empresa, produto, data_movimento, tipo_movimento, quantidade, quantidade_anterior, valor_compra, valor_venda, origem, deposito)
      VALUES (new.empresa, new.produto, new.data_movimento, new.tipo_movimento, new.quantidade, e.total_geral, valor_compra, valor_venda, 'MM', cd_deposito);
    END;
  END LOOP;
RETURN NEW;
end;
$$;


--
-- TOC entry 450 (class 1255 OID 23763917)
-- Name: grava_produto_estoque(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION grava_produto_estoque() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
Declare
	E record;
begin
  for E in (select codigo from empresas) loop
    begin
      insert into estoque (empresa, produto) values (E.codigo, new.codigo);
    end;
  end loop;
RETURN NEW;
end;
$$;


--
-- TOC entry 451 (class 1255 OID 23763918)
-- Name: gravasenha(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gravasenha() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	new.senha = md5(new.senha);
RETURN NEW;
end;
$$;


--
-- TOC entry 452 (class 1255 OID 23763919)
-- Name: md5senha(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION md5senha() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	IF (TG_OP = 'UPDATE') THEN
		begin
			if new.senha <> old.senha then
				begin
					new.senha = md5(new.senha);
				end;
			end if;
		end;
	end if;
	IF (TG_OP = 'INSERT') THEN
		begin
			new.senha = md5(new.senha);
		end;
	end if;
RETURN NEW;
end;
$$;


--
-- TOC entry 469 (class 1255 OID 23769928)
-- Name: rec_contasreceber_cte(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rec_contasreceber_cte(ncte integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare
  RES integer;
  I   RECORD;
begin
  for i in (select * from vw_cte where ambiente = 'P' and codigo = ncte) loop
    begin
      INSERT INTO contas_receber(empresa, data_registro, usuario, data_movimento, tipo_conta, valor, parcela, total_parcelas, tipo_pagamento, centro_custo, 
				 vencimento, documento, pessoa, descricao, condicao_pagamento, status, nfe,valor_original, tipo_documento, codigo_origem)
      VALUES (1, Current_date, 1, i.data_registro, 0, i.valor_frete::numeric, 1,1,1,1,
	      current_date, i.conhecimento, i.id_destinatario, 'FRETE DE CT-e', 1, 'A', i.conhecimento, i.valor_frete::numeric, 57, i.codigo) returning codigo into RES;
    end;
  end loop;
Return RES;
end;
$$;


--
-- TOC entry 468 (class 1255 OID 23770012)
-- Name: regrava_contasreceber_cte(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION regrava_contasreceber_cte() RETURNS boolean
    LANGUAGE plpgsql
    AS $$
Declare
  RES BOOLEAN;
  I   RECORD;
begin
  for i in (select * from vw_cte where status = 'E') loop
    begin
      INSERT INTO contas_receber(empresa, data_registro, usuario, data_movimento, tipo_conta, valor, parcela, total_parcelas, tipo_pagamento, centro_custo, 
				 vencimento, documento, pessoa, descricao, condicao_pagamento, status, nfe,valor_original, tipo_documento, codigo_origem)
      VALUES (1, i.data_registro, 1, i.data_movimento, 0, i.valor_frete::numeric, 1,1,1,1,
	      current_date, i.conhecimento, i.id_destinatario, 'FRETE DE CT-e', 1, 'A', i.conhecimento, i.valor_frete::numeric, 57, i.codigo);
    end;
  end loop;
  res = true;
Return RES;
end;
$$;


--
-- TOC entry 453 (class 1255 OID 23763920)
-- Name: retira_acentuacao(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION retira_acentuacao(texto text) RETURNS text
    LANGUAGE sql
    AS $_$  
 Select translate($1,  
 'áàâãäåaaaÁÂÃÄÅAAAÀéèêëeeeeeEEEÉEEÈìíîïìiiiÌÍÎÏÌIIIóôõöoooòÒÓÔÕÖOOOùúûüuuuuÙÚÛÜUUUUçÇñÑýÝ',  
 'aaaaaaaaaAAAAAAAAAeeeeeeeeeEEEEEEEiiiiiiiiIIIIIIIIooooooooOOOOOOOOuuuuuuuuUUUUUUUUcCnNyY'   
  ); 
 $_$;


--
-- TOC entry 454 (class 1255 OID 23763921)
-- Name: set_baixas_contas(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION set_baixas_contas() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
	r RECORD;
	vTotal money;
	vSaldo money;
	sStatus Character(10);
	iPessoa Integer;
begin
  IF (TG_OP = 'INSERT') or (TG_OP = 'UPDATE') THEN
    begin
      IF (TG_OP = 'INSERT') THEN
        begin
	  -- Considera-se que todas as contas a receber sejam referentes a vendas a serem faturadas.
          if new.tipo = 'F' and new.tipo_pagamento = 0 then
	    begin
	      select valor_corrigido, status, pessoa into vTotal, sStatus, iPessoa from contas_receber where codigo = new.conta;
	      if (vTotal = new.valor) then
		begin
		  update contas_receber
	             SET data_recebimento = current_date,
	                 quitada = TRUE,
	                 status = 'Q'
	           WHERE codigo = new.conta;
		end;
	      elsif (vTotal > new.valor) then
		begin
	          update contas_receber
	             SET data_recebimento = current_date,
	                 quitada = FALSE,
	                 para_quitar = TRUE,
	                 status = 'P',
	                 valor_corrigido = valor_corrigido - new.valor
	           WHERE codigo = new.conta; 
	        end;
	      else
	        begin
	          update contas_receber
	             SET data_recebimento = current_date,
	                 quitada = TRUE,
	                 para_quitar = FALSE,
	                 status = 'Q',
	                 valor_corrigido = valor
	           WHERE codigo = new.conta; 
	          INSERT INTO pessoa_saldo(pessoa, data_registro, tipo_receita, valor, parcial, origem, descricao)
	          VALUES (iPessoa, current_date, 0, (new.valor - vTotal), FALSE, new.codigo,'DIFERENCA DE QUITACAO DE CONTAS A RECEBER. ID: '||new.codigo::character varying);
	        end;
	      end if;
	    end;
	  elsif (new.tipo = 'F') and (new.tipo_pagamento <> 0) then
	    begin
	      select valor_corrigido, status, pessoa into vTotal, sStatus, iPessoa from contas_receber where codigo = new.conta;
	      if (vTotal = new.valor) then
		begin
		  update contas_receber
	             SET data_recebimento = current_date,
	                 quitada = TRUE,
	                 status = 'Q'
	           WHERE codigo = new.conta;
		end;
	      elsif (vTotal > new.valor) then
		begin
	          update contas_receber
	             SET data_recebimento = current_date,
	                 quitada = FALSE,
	                 para_quitar = TRUE,
	                 status = 'P',
	                 valor_corrigido = valor_corrigido - new.valor
	           WHERE codigo = new.conta; 
	        end;
	      else
	        begin
	          update contas_receber
	             SET data_recebimento = current_date,
	                 quitada = TRUE,
	                 para_quitar = FALSE,
	                 status = 'Q',
	                 valor_corrigido = valor
	           WHERE codigo = new.conta; 
	          INSERT INTO pessoa_saldo(pessoa, data_registro, tipo_receita, valor, parcial, origem, descricao)
	          VALUES (iPessoa, current_date, 0, (new.valor - vTotal), FALSE, new.codigo,'DIFERENCA DE QUITACAO DE CONTAS A RECEBER. ID: '||new.codigo::character varying||'. VALOR TOTAL RECEBIDO DE '||new.valor::character varying||'.');
	        end;
	      end if;
	    end;
	  elsif new.tipo in ('C','D') then
	    begin
	      update contas_pagar
	         SET data_pgto = current_date,
	             valor_pgto = new.valor,
	             quitada = TRUE
	       WHERE codigo = new.conta;
	    end;
	  end if;
          RETURN NEW;
        end;
      else
	begin
          RETURN NEW;
        end;
      end if;
    end;
  ELSIF (TG_OP = 'DELETE') THEN
    begin
      RETURN OLD;
    end;
  END IF;
  RETURN NULL;
end;
$$;


--
-- TOC entry 455 (class 1255 OID 23763922)
-- Name: set_baixas_cupom(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION set_baixas_cupom() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
	r RECORD;
	bFatura boolean;
	ctipo character(1);
begin
  IF (TG_OP = 'INSERT') or (TG_OP = 'UPDATE') THEN
    begin
      IF (TG_OP = 'INSERT') THEN
        begin
	  select fatura into bFatura from tipo_pagamento where tipo_pagamento = (select tipo_pagamento from vendas where codigo = new.venda);
	  if (bFatura = true) then ctipo = 'F'; else ctipo = 'O'; end if;
          INSERT INTO caixa_movimento(caixa, turno, data_movimento, operador_sistema, valor, cupom, data_hora, tipo, operador_caixa, tipo_pagamento)
               VALUES (new.caixa_codigo, caixa_turno, current_timestamp, new.operador, new.valor_pago, current_timestamp, ctipo, new.caixa_operador, new.tipo_pagamento);
          RETURN NEW;
        end;
      else
	begin
          RETURN NEW;
        end;
      end if;
    end;
  ELSIF (TG_OP = 'DELETE') THEN
    begin
      RETURN OLD;
    end;
  END IF;
  RETURN NULL;
end;
$$;


--
-- TOC entry 456 (class 1255 OID 23763923)
-- Name: set_baixas_pagamentos(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION set_baixas_pagamentos() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
  if new.quitada = true then
    begin
      update venda_pagamentos
         SET liquidado = TRUE,
             data_pagamento = current_date
       WHERE venda = new.venda;
    end;
  end if;
  return new;
end;
$$;


--
-- TOC entry 446 (class 1255 OID 23763924)
-- Name: set_entrega_venda_completa(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION set_entrega_venda_completa(nvenda integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
Declare
  RES BOOLEAN;
  I   RECORD;
begin
  RES = FALSE;
  for I in (select * from venda_itens WHERE venda = nvenda) LOOP
    BEGIN
      update venda_itens 
         SET entregue = quantidade,
             valor_entregue = valor_total
       WHERE codigo = i.codigo;
    eND;
  END LOOP;
  /* ATUALIZA O PEDIDO DE VENDAS */
  UPDATE vendas SET entregue = TRUE WHERE codigo = nvenda;
  RES = TRUE;
Return RES;
end;
$$;


--
-- TOC entry 457 (class 1255 OID 23763925)
-- Name: set_fechamento_caixa(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION set_fechamento_caixa(ncaixa integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
Declare
  RES          integer;
  CX           RECORD;
  PG           RECORD;
  nSANGRIA     money;
  nREFORCO     money;
  nDESPESA     money;
  nRECEBIMENTO money;
begin
  -- CALCULA O TROCO PARA O CAIXA
  UPDATE caixa SET troco_final = troco_inicial + (select sum(valor) from caixa_movimento WHERE tipo = 'R' and caixa = ncaixa)::numeric(13,3) WHERE codigo = ncaixa;
  -- GERA O RESUMO DE MOVIMENTACAO
  select coalesce(sum(valor),0::money) into nREFORCO from caixa_movimento WHERE tipo = 'R' and caixa = ncaixa;
  select coalesce(sum(valor),0::money) into nSANGRIA from caixa_movimento WHERE tipo = 'S' and caixa = ncaixa;
  select coalesce(sum(valor),0::money) into nDESPESA from caixa_movimento WHERE tipo = 'D' and caixa = ncaixa;
  select coalesce(sum(valor),0::money) into nRECEBIMENTO from caixa_movimento WHERE tipo IN ('O') and caixa = ncaixa;
  -- ATUALIZA VALORES DO CAIXA
  UPDATE caixa 
     SET sangria = nSANGRIA,
         reforco = nREFORCO,
         despesas = nDESPESA,
         recebimentos = nRECEBIMENTO,
         fechado = true
   WHERE codigo = ncaixa;
  -- REGISTRA SOMAS POR TIPO DE PAGAMENTO
  for CX IN (select * from caixa WHERE codigo = ncaixa) loop
  end loop;
  for PG in (SELECT * from vw_caixa_recebimentos where caixa = ncaixa) loop
    begin
      INSERT INTO caixa_conferncia(operador_conferencia, caixa, turno, tipo_pagamento, valor_original, valor_digitado, diferenca, responsavel_caixa, responsavel_fechamento)
           VALUES (cx.operador_caixa, ncaixa, cx.turno, pg.tipo_pagamento, pg.valor_total, 0, 0, cx.operador_caixa, cx.operador_caixa);
    end;
  end loop;
  -- FECHA O CAIXA
  update caixa SET fechamento = CURRENT_TIMESTAMP where codigo = nCaixa;
Return TRUE;
end;
$$;


--
-- TOC entry 458 (class 1255 OID 23763926)
-- Name: set_produtopreco_replica(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION set_produtopreco_replica() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
	r RECORD;
begin
  IF (TG_OP = 'INSERT') THEN
    begin
      RETURN NEW;
    end;
  ELSIF (TG_OP = 'UPDATE') THEN
    begin
      for r in (select pd.codigo from produtos pd where molde = FALSE and pd.cd_modelo = new.produto) loop
	begin
		  UPDATE produto_empresas 
			SET valor_compra = new.valor_compra, ultima_compra = new.ultima_compra, markup_vista = new.markup_vista, 
			valor_vista = new.valor_vista, markup_prazo = new.markup_prazo, valor_prazo = new.valor_prazo, 
			comissao = new.comissao, estoque_minimo = new.estoque_minimo, estoque_maximo = new.estoque_maximo, 
			deposito = new.deposito
		  WHERE produto = r.codigo and empresa = new.empresa;
	end;
      end loop;
      RETURN NEW;
    end;
  ELSIF (TG_OP = 'DELETE') THEN
    begin
      RETURN OLD;
    end;
  END IF;
  RETURN NULL;
end;
$$;


--
-- TOC entry 459 (class 1255 OID 23763927)
-- Name: set_produtos_regra(integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION set_produtos_regra(iregra integer, iempresa integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
declare 
  r RECORD;
BEGIN
  for r in (SELECT * FROM produto_empresas pe left join produtos pd on pd.codigo = pe.produto WHERE pd.inativo = false and pe.empresa = iempresa) LOOP
    begin
      INSERT INTO produto_precos(regra, produto, markup_vista, valor_vista, markup_prazo, valor_prazo)
      Values (iregra, r.produto, r.markup_vista, r.valor_vista, r.markup_prazo, r.valor_prazo);
    end;
  end loop;
  RETURN true;
END;

$$;


--
-- TOC entry 460 (class 1255 OID 23763928)
-- Name: set_registro(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION set_registro() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
  IF (TG_OP = 'INSERT') THEN
    begin
      new.novo = TRUE;
      RETURN NEW;
    end;
  ELSIF (TG_OP = 'UPDATE') THEN
    begin
      new.editado = TRUE;
      RETURN NEW;
    end;
  ELSIF (TG_OP = 'DELETE') THEN
    begin
      new.visivel = FALSE;
      RETURN OLD;
    end;
  END IF;
  RETURN NULL;
end;
$$;


--
-- TOC entry 461 (class 1255 OID 23763929)
-- Name: set_replica(integer, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION set_replica(i_modelo integer, v_descricao character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
   r RECORD;
   e RECORD;
   new_produto integer;
   new_name character varying;
   new_descricao character varying;
   RES BOOLEAN;
BEGIN
	v_descricao = upper(v_descricao);
	RAISE NOTICE 'VALOR DE V_DESCRICAO: %',v_descricao;
	RES = FALSE;
	for r in (SELECT * FROM produtos WHERE codigo = i_modelo) loop
	begin
		/*GERA O NOVO NOME E DESCRICAO*/
		select (select substring(r.nome from 1 for (SELECT POSITION('[' IN r.nome)) - 1)||v_descricao||(select substring(r.nome from (SELECT POSITION (']' IN r.nome) + 1) for char_length(r.nome)))) into new_name;
		select (select substring(r.descricao from 1 for (SELECT POSITION('[' IN r.descricao)) - 1)||v_descricao||(select substring(r.descricao from (SELECT POSITION (']' IN r.descricao) + 1) for char_length(r.descricao)))) into new_descricao;
		/*GERA O REGISTRO DE ACORDO COM O MODELO*/
		INSERT INTO produtos (nome, descricao, tipo, codigobarras, fornecedor, grupo, subgrupo, marca, categoria, modelo, unidade_entrada, unidade_saida, 
				     unidade_conversao, unidade_tamanho, producao_propria, perecivel, uso_consumo, inativo, dm_altura, dm_largura, dm_profundidade, 
				     dm_quantidade, dm_peso, dm_carga, cf_cest, cf_ncm, tipo_combustivel, cf_anp, empenho, execucao_minimo, execucao_maximo, certificado, 
				     cf_servico, molde, cd_modelo)
		VALUES (new_name, new_descricao, r.tipo, r.codigobarras, r.fornecedor, r.grupo, r.subgrupo, r.marca, r.categoria, r.modelo, r.unidade_entrada, r.unidade_saida, 
			r.unidade_conversao, r.unidade_tamanho, r.producao_propria, r.perecivel, r.uso_consumo, r.inativo, r.dm_altura, r.dm_largura, r.dm_profundidade, 
			r.dm_quantidade, r.dm_peso, r.dm_carga, r.cf_cest, r.cf_ncm, r.tipo_combustivel, r.cf_anp, r.empenho, r.execucao_minimo, r.execucao_maximo, r.certificado, 
			r.cf_servico, FALSE, r.codigo);
		/*INSERE AS CONFIGURACOES DE EMPRESA PARA OS PRODUTOS*/
		select currval('produtos_codigo_seq'::regclass) into new_produto;
		for e IN (select * from produto_empresas where produto = i_modelo) loop
		begin
			UPDATE produto_empresas
			   SET valor_compra = e.valor_compra, markup_vista = e.markup_vista, valor_vista = e.valor_vista, markup_prazo = e.markup_prazo, valor_prazo = e.valor_prazo, 
			   comissao = e.comissao, estoque_minimo = e.estoque_minimo, estoque_maximo = e.estoque_maximo, deposito = e.deposito
			WHERE empresa = e.empresa and produto = new_produto;
		end;
		end loop;
	end;
	RES = TRUE;
	END loop;
RETURN RES;
end;
$$;


--
-- TOC entry 462 (class 1255 OID 23763930)
-- Name: set_saldo_baixa(integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION set_saldo_baixa(ipessoa integer, ibaixa integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
declare 
  r RECORD;
  mTotal money;
  mResto money;
BEGIN
  select valor into mTotal from caixa_movimento where codigo = iBaixa;
  -- 
  for r in (SELECT codigo, valor FROM pessoa_saldo WHERE tipo_receita = 0 and liquidado = false and pessoa = iPessoa) LOOP
    begin
      -- BAIXA MENOR QUE SALDO
      if r.valor > mTotal then
	begin
	  mResto = r.valor - mTotal;
	  update pessoa_saldo
	     SET liquidado = true,
	         movimento = iBaixa,
	         observacao = 'SALDO UTILIZADO PARA BAIXA DE CONTA A RECEBER Nº '||iBaixa::Character||'. '||observacao,
	         data_consumo = current_date
	   WHERE codigo = r.codigo;
	   INSERT INTO pessoa_saldo(pessoa, tipo_receita, valor, parcial, origem, descricao)
	   VALUES (iPessoa, 0, mResto, TRUE, r.codigo, 'SALDO POR DIFERENCA DE BAIXA N° '||iBaixa::Character||'. ');
	   exit;
	end;
      -- BAIXA MAIOR QUE SALDO
      elsif r.valor < mTotal then
        begin
          mTotal = mTotal - r.valor;
          update pessoa_saldo
	     SET liquidado = true,
	         movimento = iBaixa,
	         observacao = 'SALDO UTILIZADO PARA BAIXA DE CONTA A RECEBER Nº '||iBaixa::Character||'. '||observacao,
	         data_consumo = current_date
	   WHERE codigo = r.codigo;
        end;
      -- BAIXA IGUAL A SALDO
      else
        begin
          update pessoa_saldo
	     SET liquidado = true,
	         movimento = iBaixa,
	         observacao = 'SALDO UTILIZADO PARA BAIXA DE CONTA A RECEBER Nº '||iBaixa::Character||'. '||observacao,
	         data_consumo = current_date
	   WHERE codigo = r.codigo;
	   EXit;
        end;
      end if;
    end;
  end loop;
  RETURN true;
END;

$$;


--
-- TOC entry 463 (class 1255 OID 23763931)
-- Name: soma_hora_minutos(time without time zone, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION soma_hora_minutos(thoras time without time zone, iminutos integer) RETURNS time without time zone
    LANGUAGE plpgsql
    AS $$
DECLARE
  INTERVALO interval;
  SOMA time without time zone;
BEGIN
  SELECT (iMINUTOS * 60) INTO INTERVALO;
  select (tHORAS:: time without time zone + INTERVALO) into SOMA; 
  RETURN SOMA;
END;
$$;


--
-- TOC entry 464 (class 1255 OID 23763932)
-- Name: system_autoengine(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION system_autoengine() RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
  -- Registros
  C       Record;
  -- Variaveis
  dinicio DATE;
  dfinal  date;
  NParc   integer;
  PAtual  Integer;
BEGIN
  -- Verifica dia inicial e final do mes corrente.
  SELECT date_trunc('month',CURRENT_DATE)::date as inicio, (date_trunc('month',CURRENT_DATE)+interval '1 month'-interval '1 day')::date as final into dinicio, dfinal;
  -- Verifica contas fixas.
  for C in (SELECT codigo, parcela_atual, total_parcelas from despesas_fixas where inativo = false and quitada = false and (ultimo_registro not between dinicio and dfinal or ultimo_registro is null)) loop
    begin
      case when c.total_parcelas = 0 then
        begin
          NParc  = 1;
          PAtual = 1;
        end;
      else
        begin
          NParc  = c.total_parcelas; 
          PAtual = c.parcela_atual + 1;
        end;
      end case;
      -- Registra o contas a pagar
      INSERT INTO contas_pagar(empresa, data_movimento, usuario, tipo_conta, 
            valor, parcela, total_parcelas, tipo_pagamento, centro_custo, 
            vencimento, valor_pgto, juros_dia, juros_porc, juros, desconto_porc, desconto, 
            documento, pessoa, descricao, conta_origem, compra, despesa)
      SELECT empresa, current_date, 0, tipo_conta,
	    valor, PAtual, NParc, tipo_pagamento, centro_custo,
	    (to_char(current_date, 'YYYY-MM')||'-'||dia_vencimento)::date, valor_parcela, juros_dia, juros_porc, juros, desconto_porc, desconto, 
	    documento, pessoa, descricao, codigo, compra, despesa FROM despesas_fixas where codigo = c.codigo;
      -- Atualiza o contas fixas
      update despesas_fixas 
         SET parcela_atual = PAtual,
             ultimo_registro = current_date
       WHERE codigo = c.codigo;
	
    end;
  end loop;
  return true;
END;
$$;


--
-- TOC entry 465 (class 1255 OID 23763933)
-- Name: system_break(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION system_break(ibreak integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
  hora time without time zone;
BEGIN
  select hora_execucao into hora from system_break where codigo = ibreak;
  if (select (hora - interval '10 minutes') < (CURRENT_TIME:: time without time zone)) then
    return true;
  else
    return FALSE;
  end if;
END;
$$;


--
-- TOC entry 466 (class 1255 OID 23763934)
-- Name: system_breakout(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION system_breakout(ibreak integer) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
DECLARE
  hora time without time zone;
  agora time without time zone;
  minutos interval;
  milisec double precision;
BEGIN
  select hora_execucao into hora from system_break where codigo = ibreak;
  select to_char((current_time::time without time zone),'HH12:MI:SS')::TIME into agora; 
  SELECT (hora - agora) into minutos;
  SELECT EXTRACT(EPOCH FROM minutos) into milisec;
  return milisec;
END;
$$;


--
-- TOC entry 467 (class 1255 OID 23763935)
-- Name: system_integridade(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION system_integridade() RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
  case 
    WHEN ((select count(*) from pessoas) > 0) and ((select count(*) from empresas) > 0) then return true;
    else return false;
  end case;
END;
$$;


SET default_with_oids = true;

--
-- TOC entry 173 (class 1259 OID 23763936)
-- Name: abastecimento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE abastecimento (
    codigo integer NOT NULL,
    bico character varying(10) NOT NULL,
    quantidade numeric(13,3) DEFAULT 0 NOT NULL,
    preco_unitario numeric(13,3),
    valor numeric(13,3),
    data date,
    hora time without time zone,
    encerrante_inicial double precision,
    encerrante_final double precision,
    target_id integer,
    punp_id integer,
    processo_date timestamp without time zone DEFAULT now(),
    placa character varying(7),
    km numeric(13,1),
    troca_oleo boolean DEFAULT false,
    manual boolean DEFAULT false
);


--
-- TOC entry 174 (class 1259 OID 23763943)
-- Name: abastecimento_baixa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE abastecimento_baixa (
    codigo integer NOT NULL,
    bico character varying(10) NOT NULL,
    quantidade numeric(13,3) DEFAULT 0 NOT NULL,
    preco_unitario numeric(13,3),
    valor numeric(13,3),
    valor_baixa numeric(13,3),
    forma_pagamento integer,
    data date,
    hora time without time zone,
    encerrante_inicial double precision,
    encerrante_final double precision,
    target_id integer,
    punp_id integer,
    km_baixa numeric(13,1),
    placa character varying(7),
    hora_baixa timestamp without time zone,
    troca_oleo boolean DEFAULT false,
    manual boolean DEFAULT false
);


--
-- TOC entry 175 (class 1259 OID 23763949)
-- Name: abastecimento_baixa_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE abastecimento_baixa_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3589 (class 0 OID 0)
-- Dependencies: 175
-- Name: abastecimento_baixa_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE abastecimento_baixa_codigo_seq OWNED BY abastecimento_baixa.codigo;


--
-- TOC entry 176 (class 1259 OID 23763951)
-- Name: abastecimento_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE abastecimento_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3590 (class 0 OID 0)
-- Dependencies: 176
-- Name: abastecimento_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE abastecimento_codigo_seq OWNED BY abastecimento.codigo;


SET default_with_oids = false;

--
-- TOC entry 177 (class 1259 OID 23763953)
-- Name: automacao_bombas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE automacao_bombas (
    codigo integer NOT NULL,
    descricao character varying(200) NOT NULL,
    fabricante integer DEFAULT 0 NOT NULL,
    host do_ip,
    ativo boolean DEFAULT true NOT NULL,
    conectado boolean DEFAULT false NOT NULL,
    ultima_conexao time without time zone
);


--
-- TOC entry 178 (class 1259 OID 23763962)
-- Name: automacao_bombas_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE automacao_bombas_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3591 (class 0 OID 0)
-- Dependencies: 178
-- Name: automacao_bombas_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE automacao_bombas_codigo_seq OWNED BY automacao_bombas.codigo;


SET default_with_oids = true;

--
-- TOC entry 179 (class 1259 OID 23763964)
-- Name: bancos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE bancos (
    codigo integer NOT NULL,
    febraban integer NOT NULL,
    nome character varying(250) NOT NULL,
    nome_reduzido character varying(60),
    inativo boolean DEFAULT false
);


--
-- TOC entry 180 (class 1259 OID 23763968)
-- Name: bancos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bancos_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3592 (class 0 OID 0)
-- Dependencies: 180
-- Name: bancos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bancos_codigo_seq OWNED BY bancos.codigo;


--
-- TOC entry 181 (class 1259 OID 23763970)
-- Name: bico_encerrantes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE bico_encerrantes (
    codigo integer NOT NULL,
    bico integer,
    responsavel integer,
    data date,
    empresa integer,
    encerrante_fim double precision,
    encerrante_fim_dig double precision,
    encerrante_ini double precision,
    finalizado boolean DEFAULT false,
    litros_aferido double precision,
    litros_cancelados double precision,
    litros_complemento double precision,
    litros_diferenca double precision,
    litros_total double precision,
    litros_vendas double precision,
    motivo_diferenca character varying(250)
);


--
-- TOC entry 182 (class 1259 OID 23763974)
-- Name: bico_encerrantes_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bico_encerrantes_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3593 (class 0 OID 0)
-- Dependencies: 182
-- Name: bico_encerrantes_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bico_encerrantes_codigo_seq OWNED BY bico_encerrantes.codigo;


--
-- TOC entry 183 (class 1259 OID 23763976)
-- Name: bicos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE bicos (
    codigo integer NOT NULL,
    bomba integer,
    tanque integer,
    nr_bico character varying(10),
    nr_logico character varying(10),
    nr_ilha character varying(10),
    empresa integer,
    inativo boolean DEFAULT false
);


--
-- TOC entry 184 (class 1259 OID 23763980)
-- Name: bicos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bicos_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3594 (class 0 OID 0)
-- Dependencies: 184
-- Name: bicos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bicos_codigo_seq OWNED BY bicos.codigo;


SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 23763982)
-- Name: bomba_fabricante; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE bomba_fabricante (
    codigo integer NOT NULL,
    descricao character varying(160)
);


--
-- TOC entry 186 (class 1259 OID 23763985)
-- Name: bomba_fabricante_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bomba_fabricante_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3595 (class 0 OID 0)
-- Dependencies: 186
-- Name: bomba_fabricante_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bomba_fabricante_codigo_seq OWNED BY bomba_fabricante.codigo;


--
-- TOC entry 187 (class 1259 OID 23763987)
-- Name: bomba_modelo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE bomba_modelo (
    codigo integer NOT NULL,
    fabricante integer NOT NULL,
    descricao character varying(160)
);


--
-- TOC entry 188 (class 1259 OID 23763990)
-- Name: bomba_modelo_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bomba_modelo_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3596 (class 0 OID 0)
-- Dependencies: 188
-- Name: bomba_modelo_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bomba_modelo_codigo_seq OWNED BY bomba_modelo.codigo;


--
-- TOC entry 189 (class 1259 OID 23763992)
-- Name: bombas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE bombas (
    codigo integer NOT NULL,
    descricao character varying(160),
    inativo boolean DEFAULT false,
    fabricante integer DEFAULT 0,
    nr_serie character varying(160),
    empresa integer,
    modelo integer DEFAULT 0
);


--
-- TOC entry 190 (class 1259 OID 23763998)
-- Name: bombas_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bombas_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3597 (class 0 OID 0)
-- Dependencies: 190
-- Name: bombas_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bombas_codigo_seq OWNED BY bombas.codigo;


--
-- TOC entry 191 (class 1259 OID 23764000)
-- Name: caixa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE caixa (
    codigo integer NOT NULL,
    data_caixa date DEFAULT ('now'::text)::date,
    turno integer DEFAULT 1 NOT NULL,
    empresa integer NOT NULL,
    operador_sistema integer DEFAULT 0 NOT NULL,
    abertura timestamp without time zone DEFAULT now(),
    fechamento timestamp without time zone,
    conferencia timestamp without time zone,
    pessoa_conferente integer,
    troco_inicial double precision,
    troco_final double precision,
    conferido boolean DEFAULT false,
    sangria money DEFAULT 0,
    reforco money DEFAULT 0,
    despesas money DEFAULT 0,
    recebimentos money DEFAULT 0,
    operador_caixa integer,
    obs character varying(600),
    manual boolean DEFAULT false,
    fechado boolean DEFAULT false NOT NULL
);


--
-- TOC entry 192 (class 1259 OID 23764017)
-- Name: caixa_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE caixa_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3598 (class 0 OID 0)
-- Dependencies: 192
-- Name: caixa_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE caixa_codigo_seq OWNED BY caixa.codigo;


--
-- TOC entry 193 (class 1259 OID 23764019)
-- Name: caixa_conferncia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE caixa_conferncia (
    codigo integer NOT NULL,
    operador_conferencia integer NOT NULL,
    caixa integer NOT NULL,
    turno integer,
    tipo_pagamento integer NOT NULL,
    descricao character varying(60),
    valor_original money NOT NULL,
    valor_digitado money NOT NULL,
    diferenca money,
    responsavel_caixa integer,
    responsavel_fechamento integer,
    data_conferencia timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 194 (class 1259 OID 23764023)
-- Name: caixa_conferncia_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE caixa_conferncia_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3599 (class 0 OID 0)
-- Dependencies: 194
-- Name: caixa_conferncia_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE caixa_conferncia_codigo_seq OWNED BY caixa_conferncia.codigo;


--
-- TOC entry 195 (class 1259 OID 23764025)
-- Name: caixa_movimento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE caixa_movimento (
    codigo integer NOT NULL,
    caixa integer,
    turno integer,
    data_movimento date DEFAULT ('now'::text)::date NOT NULL,
    operador_sistema integer,
    motivo character(30),
    valor money NOT NULL,
    cupom integer,
    data_hora timestamp without time zone DEFAULT now(),
    tipo character(1),
    operador_caixa integer,
    tipo_pagamento integer DEFAULT 1 NOT NULL,
    conta integer,
    observacao character varying(600)
);


--
-- TOC entry 3600 (class 0 OID 0)
-- Dependencies: 195
-- Name: TABLE caixa_movimento; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE caixa_movimento IS 'Registras os movimentos com dinheiro no caixa, não referentes a vendas e outras operações de entrada.';


--
-- TOC entry 3601 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN caixa_movimento.tipo; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN caixa_movimento.tipo IS 'S = Sangria 
D = Despesas 
R = Reforco
C = Compas 
F = Faturamento
O = Outras Op Credito';


--
-- TOC entry 196 (class 1259 OID 23764034)
-- Name: caixa_movimento_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE caixa_movimento_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3602 (class 0 OID 0)
-- Dependencies: 196
-- Name: caixa_movimento_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE caixa_movimento_codigo_seq OWNED BY caixa_movimento.codigo;


--
-- TOC entry 197 (class 1259 OID 23764036)
-- Name: cargos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cargos (
    codigo integer NOT NULL,
    descricao character varying(60),
    salario_base double precision,
    valor_hora_extra double precision,
    seguro_vida boolean,
    vale_transporte boolean,
    cesta_basica boolean,
    ticket boolean,
    carga_horaria character varying(10),
    carga_horaria_semana character varying(10)
);


--
-- TOC entry 198 (class 1259 OID 23764039)
-- Name: cargos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cargos_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3603 (class 0 OID 0)
-- Dependencies: 198
-- Name: cargos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cargos_codigo_seq OWNED BY cargos.codigo;


SET default_with_oids = true;

--
-- TOC entry 199 (class 1259 OID 23764041)
-- Name: centro_custos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE centro_custos (
    codigo character varying NOT NULL,
    empresa integer,
    descricao character varying(200),
    chave character varying(10),
    credito boolean DEFAULT false,
    debito boolean DEFAULT false,
    inativo boolean DEFAULT false NOT NULL
);


SET default_with_oids = false;

--
-- TOC entry 200 (class 1259 OID 23764050)
-- Name: cest_segmentos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cest_segmentos (
    codigo integer NOT NULL,
    descricao character varying(200)
);


--
-- TOC entry 201 (class 1259 OID 23764053)
-- Name: cest_segmentos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cest_segmentos_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3604 (class 0 OID 0)
-- Dependencies: 201
-- Name: cest_segmentos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cest_segmentos_codigo_seq OWNED BY cest_segmentos.codigo;


--
-- TOC entry 202 (class 1259 OID 23764055)
-- Name: cidades; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cidades (
    codigo integer NOT NULL,
    cidade character varying(75) NOT NULL,
    ddd character varying(3),
    uf character varying(2),
    micro_regiao integer
);


SET default_with_oids = true;

--
-- TOC entry 203 (class 1259 OID 23764058)
-- Name: cnae; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cnae (
    codigo integer NOT NULL,
    secao character(1) NOT NULL,
    chave character varying(15) NOT NULL,
    descricao character varying(255) NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 23764061)
-- Name: cnae_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cnae_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3605 (class 0 OID 0)
-- Dependencies: 204
-- Name: cnae_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cnae_codigo_seq OWNED BY cnae.codigo;


--
-- TOC entry 205 (class 1259 OID 23764063)
-- Name: cnae_secao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cnae_secao (
    codigo integer NOT NULL,
    secao character(1) NOT NULL,
    descricao character varying(255) NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 23764066)
-- Name: cnae_sessao_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cnae_sessao_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3606 (class 0 OID 0)
-- Dependencies: 206
-- Name: cnae_sessao_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cnae_sessao_codigo_seq OWNED BY cnae_secao.codigo;


--
-- TOC entry 207 (class 1259 OID 23764068)
-- Name: conta_empresa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE conta_empresa (
    codigo character varying(20) NOT NULL,
    empresa integer NOT NULL,
    pai character varying(20),
    nome character varying(250) NOT NULL,
    saldo_inicial money DEFAULT 0,
    credor boolean DEFAULT false,
    lancar boolean DEFAULT false,
    pendencia boolean DEFAULT false,
    programacao boolean DEFAULT false,
    pesquisa_vencto boolean DEFAULT false,
    tipo_conta_receber boolean DEFAULT false,
    tipo_conta_pagar boolean DEFAULT false,
    tipo_despesa boolean DEFAULT false,
    controle_limite smallint DEFAULT 0,
    imprimir boolean DEFAULT false,
    livro_caixa boolean DEFAULT false,
    limite_credito_pessoa_fisica double precision,
    limite_credito_pessoa_juridica double precision,
    CONSTRAINT conta_empresa_codigo_not_empty CHECK (((codigo IS NOT NULL) AND ((codigo)::bpchar <> ''::character(1)))),
    CONSTRAINT conta_empresa_nome_not_empty CHECK (((nome IS NOT NULL) AND ((nome)::bpchar <> ''::character(1))))
);


--
-- TOC entry 208 (class 1259 OID 23764085)
-- Name: contas_pagar; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contas_pagar (
    codigo integer NOT NULL,
    empresa integer,
    data_registro timestamp without time zone DEFAULT now(),
    data_movimento date NOT NULL,
    usuario integer NOT NULL,
    tipo_conta integer NOT NULL,
    valor double precision NOT NULL,
    parcela integer NOT NULL,
    total_parcelas integer DEFAULT 1 NOT NULL,
    tipo_pagamento integer,
    centro_custo character varying(20),
    vencimento date,
    valor_pgto money,
    juros_porc double precision,
    juros double precision,
    desconto_porc double precision,
    desconto money,
    documento character varying(15),
    data_pgto date,
    juros_dia double precision,
    carencia integer,
    pessoa integer,
    descricao character varying(70),
    condicao_pagamento integer,
    conta_origem bigint,
    desmembrada boolean DEFAULT false,
    quitada boolean DEFAULT false,
    empresa_referente integer,
    empresa_origem integer,
    multa double precision,
    observacoes text,
    nfe integer,
    cd_nfentrada integer,
    chave_nfe character varying(60),
    serie integer,
    cnpj character varying(20),
    data_agend date,
    vezes_agend integer,
    compra integer,
    mao_de_obra boolean DEFAULT false,
    despesa boolean DEFAULT false NOT NULL
);


--
-- TOC entry 3607 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN contas_pagar.cd_nfentrada; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN contas_pagar.cd_nfentrada IS 'Código da nota fiscal de entrada que originou essa conta a pagar';


--
-- TOC entry 209 (class 1259 OID 23764097)
-- Name: contas_pagar_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contas_pagar_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3608 (class 0 OID 0)
-- Dependencies: 209
-- Name: contas_pagar_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contas_pagar_codigo_seq OWNED BY contas_pagar.codigo;


SET default_with_oids = false;

--
-- TOC entry 210 (class 1259 OID 23764099)
-- Name: contas_receber; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contas_receber (
    codigo integer NOT NULL,
    empresa integer,
    data_registro timestamp without time zone DEFAULT now(),
    data_movimento date NOT NULL,
    tipo_conta integer NOT NULL,
    venda integer,
    usuario integer NOT NULL,
    valor money NOT NULL,
    parcela integer NOT NULL,
    total_parcelas integer,
    tipo_pagamento integer,
    centro_custo character varying,
    vencimento date,
    valor_corrigido money,
    juros_porc double precision,
    juros_valor money,
    desconto_porc double precision,
    desconto_valor money,
    documento character varying(15),
    data_recebimento date,
    juros_dia double precision,
    carencia integer,
    pessoa integer,
    descricao character varying(70),
    condicao_pagamento integer,
    status character varying(10) DEFAULT 'A'::character varying,
    quitada boolean DEFAULT false,
    multa double precision,
    observacoes text,
    nfe integer,
    cnpj character varying,
    mesclado_para integer,
    tipo integer,
    cupom integer,
    fatura boolean DEFAULT false,
    gerado_titulo boolean DEFAULT false,
    gerar_boleto boolean DEFAULT false,
    mao_de_obra boolean DEFAULT false,
    cd_fatura bigint,
    obs_comanda character varying,
    comanda integer,
    para_quitar boolean DEFAULT false,
    parcial integer,
    fatura_acresc double precision,
    fatura_cred double precision,
    fatura_desc double precision,
    fatura_tipo integer DEFAULT 0,
    nunca_titulo boolean,
    conta_original integer,
    valor_original money,
    tipo_documento integer,
    codigo_origem integer
);


--
-- TOC entry 3609 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN contas_receber.status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN contas_receber.status IS 'A = Aberto
C = Cancelado
Q = Quitado
P = Parcial';


--
-- TOC entry 3610 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN contas_receber.codigo_origem; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN contas_receber.codigo_origem IS 'Codigo da tabela de origem referenciada!';


--
-- TOC entry 211 (class 1259 OID 23764114)
-- Name: contas_receber_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contas_receber_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3611 (class 0 OID 0)
-- Dependencies: 211
-- Name: contas_receber_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contas_receber_codigo_seq OWNED BY contas_receber.codigo;


--
-- TOC entry 212 (class 1259 OID 23764116)
-- Name: cst_cest; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cst_cest (
    codigo integer NOT NULL,
    cest character varying(14) NOT NULL,
    ncmsh character varying(100) NOT NULL,
    descricao character varying(900) NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 23764122)
-- Name: cst_cest_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cst_cest_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3612 (class 0 OID 0)
-- Dependencies: 213
-- Name: cst_cest_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cst_cest_codigo_seq OWNED BY cst_cest.codigo;


SET default_with_oids = true;

--
-- TOC entry 214 (class 1259 OID 23764124)
-- Name: cst_cfop; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cst_cfop (
    codigo integer NOT NULL,
    chave character varying(6) NOT NULL,
    descricao character varying(400) NOT NULL,
    master character varying(6),
    submaster character varying(6),
    descricao_sefaz character varying(77),
    tipo_mvto character varying(2)
);


--
-- TOC entry 215 (class 1259 OID 23764130)
-- Name: cst_cfop_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cst_cfop_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3613 (class 0 OID 0)
-- Dependencies: 215
-- Name: cst_cfop_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cst_cfop_codigo_seq OWNED BY cst_cfop.codigo;


--
-- TOC entry 216 (class 1259 OID 23764132)
-- Name: cst_csosn; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cst_csosn (
    codigo integer NOT NULL,
    chave character varying(15) NOT NULL,
    descricao character varying(255) NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 23764135)
-- Name: cst_csosn_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cst_csosn_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3614 (class 0 OID 0)
-- Dependencies: 217
-- Name: cst_csosn_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cst_csosn_codigo_seq OWNED BY cst_csosn.codigo;


--
-- TOC entry 218 (class 1259 OID 23764137)
-- Name: cst_icms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cst_icms (
    codigo integer NOT NULL,
    chave character varying(15) NOT NULL,
    descricao character varying(255) NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 23764140)
-- Name: cst_icms_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cst_icms_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3615 (class 0 OID 0)
-- Dependencies: 219
-- Name: cst_icms_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cst_icms_codigo_seq OWNED BY cst_icms.codigo;


--
-- TOC entry 220 (class 1259 OID 23764142)
-- Name: cst_ipi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cst_ipi (
    codigo integer NOT NULL,
    chave character varying(15) NOT NULL,
    descricao character varying(255) NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 23764145)
-- Name: cst_ipi_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cst_ipi_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3616 (class 0 OID 0)
-- Dependencies: 221
-- Name: cst_ipi_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cst_ipi_codigo_seq OWNED BY cst_ipi.codigo;


--
-- TOC entry 222 (class 1259 OID 23764147)
-- Name: cst_piscofins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cst_piscofins (
    codigo integer NOT NULL,
    chave character varying(15) NOT NULL,
    descricao character varying(255) NOT NULL,
    mvto_pis character varying(3),
    mvto_cofins character varying(3)
);


--
-- TOC entry 223 (class 1259 OID 23764150)
-- Name: cst_piscofins_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cst_piscofins_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3617 (class 0 OID 0)
-- Dependencies: 223
-- Name: cst_piscofins_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cst_piscofins_codigo_seq OWNED BY cst_piscofins.codigo;


SET default_with_oids = false;

--
-- TOC entry 224 (class 1259 OID 23764152)
-- Name: cte; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cte (
    codigo integer NOT NULL,
    data_registro timestamp without time zone DEFAULT now(),
    conhecimento bigint,
    chave_cte character varying(200),
    chave_cancelamento character varying(200),
    data_cancelamento date,
    status character varying(1) DEFAULT 'P'::character varying,
    remetente bigint NOT NULL,
    remetente_endereco boolean DEFAULT false,
    destinatario bigint NOT NULL,
    destinatario_endereco boolean DEFAULT false,
    local_entrega bigint NOT NULL,
    data_entrega date,
    tipo_nota character varying(20),
    nota bigint,
    nfe_chave character varying(200),
    nf_serie integer,
    nf_bcicms double precision,
    nf_icms double precision,
    nf_icms_st double precision,
    nf_bc_icms_st double precision,
    nf_total_prod double precision,
    nf_cfop character varying(6),
    valor_nf double precision,
    data_nfe date,
    natureza_carga character varying(120),
    qtde_volume double precision,
    especie_volume character varying(30),
    marca character varying(200),
    qtde_kgm character varying(20),
    frete_kgm character varying(20),
    frete integer,
    valor_frete double precision,
    natureza_operacao character varying(6),
    despacho double precision,
    pedagio double precision,
    outras_despesas double precision,
    prestacao double precision,
    aliquota double precision,
    basecalc_icms double precision,
    valor_icms double precision,
    tarifa double precision,
    local_coleta bigint NOT NULL,
    data_coleta date,
    frota integer,
    veiculo_placa character varying(8),
    veiculo_uf character varying(2),
    sec_car character varying(254),
    base_calculo double precision,
    calculado_ate double precision,
    data_recebimento date,
    redespacho integer,
    processado boolean DEFAULT false,
    valor_produto double precision,
    marcado_manual boolean,
    un_med character varying(20),
    seguro_resp character varying(200),
    seguro_seg character varying(200),
    seguro_apol character varying(200),
    seguro_averb character varying(200),
    observacao character varying(254),
    ambiente character(1) DEFAULT 'P'::bpchar,
    cstat integer DEFAULT 0,
    protocolo bigint
);


--
-- TOC entry 3618 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN cte.ambiente; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN cte.ambiente IS 'H - Homologação
P - Produção';


--
-- TOC entry 225 (class 1259 OID 23764163)
-- Name: cte_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cte_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3619 (class 0 OID 0)
-- Dependencies: 225
-- Name: cte_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cte_codigo_seq OWNED BY cte.codigo;


SET default_with_oids = true;

--
-- TOC entry 226 (class 1259 OID 23764165)
-- Name: cte_enderecos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cte_enderecos (
    codigo integer NOT NULL,
    cte bigint NOT NULL,
    rem_endereco character varying(250) NOT NULL,
    rem_endereco_numero character(20) NOT NULL,
    rem_complemento character varying(100),
    rem_referencia character varying(150),
    rem_bairro character varying(200) NOT NULL,
    rem_cep character varying(15) NOT NULL,
    rem_cidade integer DEFAULT 0 NOT NULL,
    rem_uf character varying(2) NOT NULL,
    des_endereco character varying(250) NOT NULL,
    des_endereco_numero character(20) NOT NULL,
    des_complemento character varying(100),
    des_referencia character varying(150),
    des_bairro character varying(200) NOT NULL,
    des_cep character varying(15) NOT NULL,
    des_cidade integer DEFAULT 0 NOT NULL,
    des_uf character varying(2) NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 23764173)
-- Name: cte_enderecos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cte_enderecos_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3620 (class 0 OID 0)
-- Dependencies: 227
-- Name: cte_enderecos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cte_enderecos_codigo_seq OWNED BY cte_enderecos.codigo;


--
-- TOC entry 409 (class 1259 OID 23769955)
-- Name: cte_notas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cte_notas (
    codigo integer NOT NULL,
    cte bigint NOT NULL,
    chave_nfe character varying(150),
    nota integer NOT NULL,
    serie integer NOT NULL,
    cfop character varying(5),
    bcicms double precision,
    vricms double precision,
    bcicms_st double precision,
    vricms_st double precision,
    data_emissao date,
    emitente bigint,
    destinatario bigint,
    valor_produtos double precision DEFAULT 0 NOT NULL,
    valor_nota double precision DEFAULT 0 NOT NULL
);


--
-- TOC entry 408 (class 1259 OID 23769953)
-- Name: cte_notas_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cte_notas_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3621 (class 0 OID 0)
-- Dependencies: 408
-- Name: cte_notas_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cte_notas_codigo_seq OWNED BY cte_notas.codigo;


--
-- TOC entry 413 (class 1259 OID 23770076)
-- Name: cte_parametros; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cte_parametros (
    codigo integer NOT NULL,
    empresa integer DEFAULT 1 NOT NULL,
    cfop character varying(6),
    destinatario integer,
    remetente integer,
    origem integer,
    destino integer,
    tipo_nota character varying(4),
    frota integer
);


--
-- TOC entry 412 (class 1259 OID 23770074)
-- Name: cte_parametros_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cte_parametros_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3622 (class 0 OID 0)
-- Dependencies: 412
-- Name: cte_parametros_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cte_parametros_codigo_seq OWNED BY cte_parametros.codigo;


--
-- TOC entry 228 (class 1259 OID 23764175)
-- Name: cte_xml; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cte_xml (
    codigo integer NOT NULL,
    cte bigint NOT NULL,
    xml_cte text,
    xml_cancelamento text
);


--
-- TOC entry 229 (class 1259 OID 23764181)
-- Name: cte_xml_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cte_xml_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3623 (class 0 OID 0)
-- Dependencies: 229
-- Name: cte_xml_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cte_xml_codigo_seq OWNED BY cte_xml.codigo;


SET default_with_oids = false;

--
-- TOC entry 230 (class 1259 OID 23764183)
-- Name: cupom; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cupom (
    codigo integer NOT NULL,
    empresa integer NOT NULL,
    data_emissao timestamp without time zone DEFAULT now() NOT NULL,
    situacao character varying(5) DEFAULT 'I'::character varying,
    caixa_codigo integer,
    caixa_operador integer,
    caixa_data date,
    caixa_turno integer,
    nr_cupom integer NOT NULL,
    nr_serie text NOT NULL,
    nr_ecf integer,
    nr_ccf integer,
    venda integer,
    operador bigint,
    pessoa bigint,
    pessoa_cpf character(20),
    tipo_pagamento integer DEFAULT 1 NOT NULL,
    total_cupom money DEFAULT 0 NOT NULL,
    valor_acrescimo money DEFAULT 0 NOT NULL,
    valor_desconto money DEFAULT 0 NOT NULL,
    valor_troco money DEFAULT 0 NOT NULL,
    valor_pago money DEFAULT 0 NOT NULL,
    nf_imprimida boolean DEFAULT false,
    desconto_operador integer,
    md5 character varying,
    fatura boolean,
    cancelamento_data timestamp without time zone,
    cancelamento_motivo text,
    cancelamento_operador integer
);


--
-- TOC entry 3624 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN cupom.situacao; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN cupom.situacao IS '"E": emitido - "C": cancelado - "I": interminado (nao concluiu nem cancelou)';


--
-- TOC entry 231 (class 1259 OID 23764198)
-- Name: cupom_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cupom_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3625 (class 0 OID 0)
-- Dependencies: 231
-- Name: cupom_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cupom_codigo_seq OWNED BY cupom.codigo;


--
-- TOC entry 232 (class 1259 OID 23764200)
-- Name: departamentos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE departamentos (
    codigo integer NOT NULL,
    nome character varying(100) NOT NULL,
    descricao character varying(250) NOT NULL,
    turno_inicio time without time zone,
    turno_fim time without time zone,
    responsavel integer,
    desativado boolean DEFAULT false
);


--
-- TOC entry 233 (class 1259 OID 23764204)
-- Name: departamentos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE departamentos_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3626 (class 0 OID 0)
-- Dependencies: 233
-- Name: departamentos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE departamentos_codigo_seq OWNED BY departamentos.codigo;


SET default_with_oids = true;

--
-- TOC entry 234 (class 1259 OID 23764206)
-- Name: deposito; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE deposito (
    codigo integer NOT NULL,
    nome character varying(45),
    departamento integer,
    liquido boolean DEFAULT false,
    produto bigint,
    capacidade integer DEFAULT 0,
    estoque_negativo boolean,
    unidade_medida character varying(45),
    edita boolean DEFAULT false,
    enviado boolean DEFAULT false,
    enviado_filial character varying,
    novo boolean DEFAULT true,
    quantidade numeric(13,3) DEFAULT 0
);


--
-- TOC entry 235 (class 1259 OID 23764218)
-- Name: deposito_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE deposito_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3627 (class 0 OID 0)
-- Dependencies: 235
-- Name: deposito_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE deposito_codigo_seq OWNED BY deposito.codigo;


--
-- TOC entry 236 (class 1259 OID 23764220)
-- Name: deposito_grupo_produto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE deposito_grupo_produto (
    codigo integer NOT NULL,
    deposito integer NOT NULL,
    grupo integer NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 23764223)
-- Name: deposito_grupo_produto_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE deposito_grupo_produto_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3628 (class 0 OID 0)
-- Dependencies: 237
-- Name: deposito_grupo_produto_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE deposito_grupo_produto_codigo_seq OWNED BY deposito_grupo_produto.codigo;


--
-- TOC entry 238 (class 1259 OID 23764225)
-- Name: despesas_fixas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE despesas_fixas (
    codigo integer NOT NULL,
    empresa integer DEFAULT 1,
    data_registro timestamp without time zone DEFAULT now(),
    descricao character varying(250) NOT NULL,
    dia_vencimento integer NOT NULL,
    tipo_conta integer NOT NULL,
    tipo_pagamento integer,
    centro_custo character varying(20),
    valor double precision NOT NULL,
    total_parcelas integer DEFAULT 1 NOT NULL,
    parcela_atual integer,
    valor_parcela money,
    juros_dia double precision,
    juros_porc double precision,
    juros double precision,
    desconto_porc double precision,
    desconto money,
    documento character varying(15),
    ultimo_registro date,
    pessoa integer,
    observacoes text,
    nfe integer,
    cd_nfentrada integer,
    chave_nfe character varying(60),
    serie integer,
    compra integer,
    quitada boolean DEFAULT false,
    despesa boolean DEFAULT false NOT NULL,
    inativo boolean DEFAULT false NOT NULL
);


--
-- TOC entry 3629 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN despesas_fixas.cd_nfentrada; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN despesas_fixas.cd_nfentrada IS 'Código da nota fiscal de entrada que originou essa conta a pagar';


--
-- TOC entry 239 (class 1259 OID 23764237)
-- Name: despesas_fixas_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE despesas_fixas_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3630 (class 0 OID 0)
-- Dependencies: 239
-- Name: despesas_fixas_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE despesas_fixas_codigo_seq OWNED BY despesas_fixas.codigo;


--
-- TOC entry 240 (class 1259 OID 23764239)
-- Name: documento_series; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE documento_series (
    codigo integer NOT NULL,
    tipo_documento integer NOT NULL,
    serie integer,
    homologacao bigint DEFAULT 1,
    producao bigint DEFAULT 1
);


--
-- TOC entry 241 (class 1259 OID 23764244)
-- Name: documento_series_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE documento_series_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3631 (class 0 OID 0)
-- Dependencies: 241
-- Name: documento_series_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE documento_series_codigo_seq OWNED BY documento_series.codigo;


--
-- TOC entry 242 (class 1259 OID 23764246)
-- Name: documentos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE documentos (
    codigo integer NOT NULL,
    descricao character varying(120),
    definilcao character varying,
    inativo boolean DEFAULT false
);


--
-- TOC entry 243 (class 1259 OID 23764253)
-- Name: empresa_assinatura; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE empresa_assinatura (
    codigo integer NOT NULL,
    empresa integer NOT NULL,
    certificado_datavencimento date DEFAULT ('now'::text)::date,
    certificado_senha character varying(200),
    certificado_chave character varying(200),
    arq_pastasseparadas boolean DEFAULT true,
    arq_criarpastasmensalmente boolean DEFAULT true,
    arq_separarmodelo boolean DEFAULT true,
    arq_path_nfe character varying(500),
    arq_path_cancelamento character varying(500),
    arq_path_cce character varying(500),
    arq_path_cfe character varying(500),
    arq_path_inutilizacao character varying(500),
    arq_path_dpec character varying(500),
    arq_path_eventos character varying(500),
    web_ufdestino character varying(2),
    web_ajustarautomaticamente boolean DEFAULT false,
    web_ajuste_aguardar integer,
    web_ajuste_tentativas integer,
    web_ajuste_intervalo integer,
    web_proxy_host character varying(200),
    web_proxy_port character varying(5),
    web_proxy_usuario character varying(100),
    web_proxy_senha character varying(100),
    email_smtp character varying(200),
    email_conexaosegura boolean DEFAULT false,
    email_porta character varying(5),
    email_usuario character varying(100),
    email_senha character varying(100),
    email_assunto character varying(100),
    email_mensagem character varying(250),
    danfe_logo bytea,
    danfe_retrato integer DEFAULT 0
);


--
-- TOC entry 244 (class 1259 OID 23764266)
-- Name: empresa_assinatura_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE empresa_assinatura_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3632 (class 0 OID 0)
-- Dependencies: 244
-- Name: empresa_assinatura_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE empresa_assinatura_codigo_seq OWNED BY empresa_assinatura.codigo;


--
-- TOC entry 245 (class 1259 OID 23764268)
-- Name: empresa_config; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE empresa_config (
    codigo integer NOT NULL,
    empresa integer NOT NULL,
    ramo integer DEFAULT 0,
    regime_tributario integer,
    regime_apuracao integer,
    regime_escrituracao integer,
    natureza_empresa integer,
    tipo_tributario integer,
    contador integer,
    crc character varying(20),
    escritorio integer,
    contribuinte_ipi boolean DEFAULT false,
    aliquota_pis numeric(13,3),
    aliquota_cofins numeric(13,3),
    aliquota_combatepobreza numeric(13,3),
    destacar_icms boolean DEFAULT false,
    cnae character varying(15)
);


--
-- TOC entry 246 (class 1259 OID 23764274)
-- Name: empresa_config_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE empresa_config_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3633 (class 0 OID 0)
-- Dependencies: 246
-- Name: empresa_config_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE empresa_config_codigo_seq OWNED BY empresa_config.codigo;


--
-- TOC entry 411 (class 1259 OID 23770053)
-- Name: empresa_documentos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE empresa_documentos (
    codigo integer NOT NULL,
    empresa integer NOT NULL,
    cfe boolean DEFAULT false,
    cte boolean DEFAULT false,
    nfe boolean DEFAULT false,
    nfce boolean DEFAULT false
);


--
-- TOC entry 410 (class 1259 OID 23770051)
-- Name: empresa_documentos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE empresa_documentos_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3634 (class 0 OID 0)
-- Dependencies: 410
-- Name: empresa_documentos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE empresa_documentos_codigo_seq OWNED BY empresa_documentos.codigo;


--
-- TOC entry 247 (class 1259 OID 23764276)
-- Name: empresa_hostconfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE empresa_hostconfig (
    codigo integer NOT NULL,
    empresa integer NOT NULL,
    estacao_serial character varying(200),
    estacao_terminal character varying(200),
    estacao_usuario character varying(200),
    certificado_path character varying(500),
    certificado_datavencimento date DEFAULT ('now'::text)::date,
    certificado_senha character varying(200),
    certificado_chave character varying(200),
    sefaz_ambiente integer DEFAULT 1,
    web_proxy_host character varying(200),
    web_proxy_port character varying(5),
    web_proxy_usuario character varying(100),
    web_proxy_senha character varying(100),
    print_termica character varying(254),
    print_danfe character varying(254),
    print_cfe character varying(254)
);


--
-- TOC entry 3635 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN empresa_hostconfig.sefaz_ambiente; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN empresa_hostconfig.sefaz_ambiente IS '1 = PRODUCAO
2 = HOMOLOGACAO';


--
-- TOC entry 248 (class 1259 OID 23764284)
-- Name: empresa_hostconfig_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE empresa_hostconfig_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3636 (class 0 OID 0)
-- Dependencies: 248
-- Name: empresa_hostconfig_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE empresa_hostconfig_codigo_seq OWNED BY empresa_hostconfig.codigo;


--
-- TOC entry 249 (class 1259 OID 23764286)
-- Name: empresa_regras_negocio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE empresa_regras_negocio (
    codigo integer NOT NULL,
    empresa integer NOT NULL,
    compras_centro_custos character varying(20),
    compras_tipo_conta integer,
    compras_tipo_pagamento integer,
    vendas_centro_custos character varying(20),
    vendas_tipo_conta integer,
    vendas_tipo_pagamento integer
);


--
-- TOC entry 250 (class 1259 OID 23764289)
-- Name: empresa_regras_negocio_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE empresa_regras_negocio_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3637 (class 0 OID 0)
-- Dependencies: 250
-- Name: empresa_regras_negocio_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE empresa_regras_negocio_codigo_seq OWNED BY empresa_regras_negocio.codigo;


--
-- TOC entry 251 (class 1259 OID 23764291)
-- Name: empresa_services; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE empresa_services (
    codigo integer NOT NULL,
    empresa integer NOT NULL,
    auto_service boolean DEFAULT false,
    auto_server character varying(15) DEFAULT '127.0.0.1'::character varying,
    auto_synctime integer DEFAULT 1,
    auto_autolog boolean DEFAULT true,
    e_proc boolean DEFAULT false,
    e_synctime integer DEFAULT 1,
    e_autolog boolean DEFAULT true
);


--
-- TOC entry 252 (class 1259 OID 23764301)
-- Name: empresa_services_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE empresa_services_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3638 (class 0 OID 0)
-- Dependencies: 252
-- Name: empresa_services_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE empresa_services_codigo_seq OWNED BY empresa_services.codigo;


SET default_with_oids = false;

--
-- TOC entry 253 (class 1259 OID 23764303)
-- Name: empresas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE empresas (
    codigo integer NOT NULL,
    pessoa integer NOT NULL,
    serial character varying(200),
    chave character varying(200),
    data_inicio date NOT NULL,
    data_fim date NOT NULL,
    matriz boolean NOT NULL,
    cd_matriz integer,
    inativo boolean DEFAULT false NOT NULL,
    datacadastro date DEFAULT ('now'::text)::date
);


--
-- TOC entry 254 (class 1259 OID 23764308)
-- Name: empresas_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE empresas_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3639 (class 0 OID 0)
-- Dependencies: 254
-- Name: empresas_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE empresas_codigo_seq OWNED BY empresas.codigo;


--
-- TOC entry 255 (class 1259 OID 23764310)
-- Name: estoque; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE estoque (
    codigo integer NOT NULL,
    empresa integer NOT NULL,
    produto integer NOT NULL,
    data_atualizacao date DEFAULT ('now'::text)::date NOT NULL,
    total_geral do_volume NOT NULL,
    total_disponivel do_volume NOT NULL,
    total_anterior do_volume NOT NULL,
    total_empenhado do_volume NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 23764317)
-- Name: estoque_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE estoque_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3640 (class 0 OID 0)
-- Dependencies: 256
-- Name: estoque_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE estoque_codigo_seq OWNED BY estoque.codigo;


--
-- TOC entry 257 (class 1259 OID 23764319)
-- Name: estoque_diario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE estoque_diario (
    codigo integer NOT NULL,
    empresa integer NOT NULL,
    produto integer NOT NULL,
    data_estoque date DEFAULT ('now'::text)::date NOT NULL,
    total_geral do_volume NOT NULL,
    total_disponivel do_volume NOT NULL,
    total_anterior do_volume NOT NULL,
    total_empenhado do_volume NOT NULL
);


--
-- TOC entry 258 (class 1259 OID 23764326)
-- Name: estoque_diario_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE estoque_diario_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3641 (class 0 OID 0)
-- Dependencies: 258
-- Name: estoque_diario_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE estoque_diario_codigo_seq OWNED BY estoque_diario.codigo;


SET default_with_oids = true;

--
-- TOC entry 259 (class 1259 OID 23764328)
-- Name: frotas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE frotas (
    codigo integer NOT NULL,
    transportadora integer,
    tipo integer,
    placa character(7) NOT NULL,
    identificacao character(10),
    automacao character(20),
    veiculo character varying(160),
    motorista integer,
    ultimokm numeric(13,1) DEFAULT 0 NOT NULL,
    data_aquisicao date,
    data_ultimamanutencao date,
    data_venda date,
    data_ultimatrocaoleo date,
    observacao text,
    km_oleomotor do_km,
    km_oleocambio do_km,
    km_manutencao do_km,
    terceiro boolean DEFAULT false,
    esporadico boolean DEFAULT false,
    inativo boolean DEFAULT false,
    rntrc character varying(120)
);


--
-- TOC entry 260 (class 1259 OID 23764338)
-- Name: frotas_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE frotas_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3642 (class 0 OID 0)
-- Dependencies: 260
-- Name: frotas_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE frotas_codigo_seq OWNED BY frotas.codigo;


--
-- TOC entry 261 (class 1259 OID 23764340)
-- Name: ncm; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ncm (
    codigo character varying(8) NOT NULL,
    descricao character varying,
    cf character(5)
);


SET default_with_oids = false;

--
-- TOC entry 262 (class 1259 OID 23764346)
-- Name: paises; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE paises (
    codigo integer NOT NULL,
    pais character varying(250) NOT NULL
);


--
-- TOC entry 263 (class 1259 OID 23764349)
-- Name: paises_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE paises_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3643 (class 0 OID 0)
-- Dependencies: 263
-- Name: paises_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE paises_codigo_seq OWNED BY paises.codigo;


SET default_with_oids = true;

--
-- TOC entry 264 (class 1259 OID 23764351)
-- Name: pedido_compra_itens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pedido_compra_itens (
    codigo integer NOT NULL,
    pedido integer NOT NULL,
    produto integer NOT NULL,
    valor_unitario money DEFAULT 0,
    quantidade integer DEFAULT 1 NOT NULL,
    desconto money DEFAULT 0,
    acrescimo money DEFAULT 0,
    valor_total money DEFAULT 0,
    entrada integer,
    cancelado boolean DEFAULT false NOT NULL
);


--
-- TOC entry 265 (class 1259 OID 23764360)
-- Name: pedido_compra_itens_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pedido_compra_itens_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3644 (class 0 OID 0)
-- Dependencies: 265
-- Name: pedido_compra_itens_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pedido_compra_itens_codigo_seq OWNED BY pedido_compra_itens.codigo;


SET default_with_oids = false;

--
-- TOC entry 266 (class 1259 OID 23764362)
-- Name: pedido_compras; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pedido_compras (
    codigo integer NOT NULL,
    empresa integer DEFAULT get_empresa(),
    fornecedor integer NOT NULL,
    representante integer,
    data_pedido timestamp without time zone DEFAULT now() NOT NULL,
    previsao_entrega date,
    data_compra date,
    data_entrada date,
    status character varying(2) DEFAULT 'P'::character varying,
    observacao text,
    total_pedido money DEFAULT 0
);


--
-- TOC entry 3645 (class 0 OID 0)
-- Dependencies: 266
-- Name: COLUMN pedido_compras.status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN pedido_compras.status IS 'P = Pendente
C = Cancelado
A = Adquirido
AP = Adquirido Parcialmente';


--
-- TOC entry 267 (class 1259 OID 23764372)
-- Name: pedido_compras_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pedido_compras_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3646 (class 0 OID 0)
-- Dependencies: 267
-- Name: pedido_compras_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pedido_compras_codigo_seq OWNED BY pedido_compras.codigo;


--
-- TOC entry 268 (class 1259 OID 23764374)
-- Name: pedido_vendas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pedido_vendas (
    codigo integer NOT NULL,
    empresa integer DEFAULT get_empresa(),
    cliente integer NOT NULL,
    representante integer,
    data_pedido timestamp without time zone DEFAULT now() NOT NULL,
    previsao_entrega date,
    data_compra date,
    data_entrada date,
    status character varying(2) DEFAULT 'P'::character varying,
    observacao text,
    total_pedido money DEFAULT 0
);


--
-- TOC entry 3647 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN pedido_vendas.status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN pedido_vendas.status IS 'P = Pendente
C = Cancelado
E = Entregue
EP = Entregue Parcialmente';


--
-- TOC entry 269 (class 1259 OID 23764384)
-- Name: pedido_vendas_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pedido_vendas_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3648 (class 0 OID 0)
-- Dependencies: 269
-- Name: pedido_vendas_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pedido_vendas_codigo_seq OWNED BY pedido_vendas.codigo;


SET default_with_oids = true;

--
-- TOC entry 270 (class 1259 OID 23764386)
-- Name: pedido_vendas_itens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pedido_vendas_itens (
    codigo integer NOT NULL,
    pedido integer NOT NULL,
    produto integer NOT NULL,
    valor_unitario money DEFAULT 0,
    quantidade integer DEFAULT 1 NOT NULL,
    desconto money DEFAULT 0,
    acrescimo money DEFAULT 0,
    valor_total money DEFAULT 0,
    entrada integer,
    cancelado boolean DEFAULT false NOT NULL
);


--
-- TOC entry 271 (class 1259 OID 23764395)
-- Name: pedido_vendas_itens_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pedido_vendas_itens_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3649 (class 0 OID 0)
-- Dependencies: 271
-- Name: pedido_vendas_itens_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pedido_vendas_itens_codigo_seq OWNED BY pedido_vendas_itens.codigo;


--
-- TOC entry 272 (class 1259 OID 23764397)
-- Name: pessoa_categorias; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pessoa_categorias (
    codigo integer NOT NULL,
    empresa integer DEFAULT 1,
    categoria character varying(100),
    descricao character varying(500),
    bloqueado boolean DEFAULT false
);


--
-- TOC entry 273 (class 1259 OID 23764405)
-- Name: pessoa_categorias_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pessoa_categorias_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3650 (class 0 OID 0)
-- Dependencies: 273
-- Name: pessoa_categorias_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pessoa_categorias_codigo_seq OWNED BY pessoa_categorias.codigo;


--
-- TOC entry 274 (class 1259 OID 23764407)
-- Name: pessoa_cliente; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pessoa_cliente (
    codigo integer NOT NULL,
    pessoa integer NOT NULL,
    tabela_preco integer,
    limite_atraso integer,
    limite_credito money,
    limite_credito_cheques money,
    desconto_pedido money,
    pgto_padrao_forma integer,
    pgto_padrao_condicao integer,
    permite_faturar boolean DEFAULT false,
    rota integer,
    km_base do_km,
    ramo_atividade integer DEFAULT 0
);


--
-- TOC entry 275 (class 1259 OID 23764415)
-- Name: pessoa_cliente_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pessoa_cliente_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3651 (class 0 OID 0)
-- Dependencies: 275
-- Name: pessoa_cliente_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pessoa_cliente_codigo_seq OWNED BY pessoa_cliente.codigo;


--
-- TOC entry 276 (class 1259 OID 23764417)
-- Name: pessoa_contabancaria; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pessoa_contabancaria (
    codigo integer NOT NULL,
    pessoa integer NOT NULL,
    banco integer,
    tipo_conta character(2) DEFAULT 'CC'::bpchar NOT NULL,
    agencia_num integer NOT NULL,
    agencia_cod integer NOT NULL,
    conta_num integer NOT NULL,
    conta_cod integer NOT NULL,
    conta_principal boolean,
    conta_inativa boolean DEFAULT false NOT NULL
);


--
-- TOC entry 277 (class 1259 OID 23764422)
-- Name: pessoa_contabancaria_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pessoa_contabancaria_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3652 (class 0 OID 0)
-- Dependencies: 277
-- Name: pessoa_contabancaria_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pessoa_contabancaria_codigo_seq OWNED BY pessoa_contabancaria.codigo;


--
-- TOC entry 278 (class 1259 OID 23764424)
-- Name: pessoa_endereco_cobranca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pessoa_endereco_cobranca (
    codigo integer NOT NULL,
    pessoa integer NOT NULL,
    endereco character varying(250) NOT NULL,
    endereco_numero character(20) NOT NULL,
    complemento character varying(100),
    referencia character varying(150),
    bairro character varying(200) NOT NULL,
    cep character varying(15) NOT NULL,
    cidade integer DEFAULT 0 NOT NULL,
    uf character varying(2) NOT NULL,
    pais integer DEFAULT 55 NOT NULL,
    tel1 character varying(20),
    tel2 character varying(20),
    tel3 character varying(20)
);


--
-- TOC entry 279 (class 1259 OID 23764432)
-- Name: pessoa_endereco_cobranca_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pessoa_endereco_cobranca_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3653 (class 0 OID 0)
-- Dependencies: 279
-- Name: pessoa_endereco_cobranca_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pessoa_endereco_cobranca_codigo_seq OWNED BY pessoa_endereco_cobranca.codigo;


--
-- TOC entry 280 (class 1259 OID 23764434)
-- Name: pessoa_endereco_entrega; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pessoa_endereco_entrega (
    codigo integer NOT NULL,
    pessoa integer NOT NULL,
    endereco character varying(250) NOT NULL,
    endereco_numero character(20) NOT NULL,
    complemento character varying(100),
    referencia character varying(150),
    bairro character varying(200) NOT NULL,
    cep character varying(15) NOT NULL,
    cidade integer DEFAULT 0 NOT NULL,
    uf character varying(2) NOT NULL,
    pais integer DEFAULT 55 NOT NULL,
    tel1 character varying(20),
    tel2 character varying(20),
    tel3 character varying(20)
);


--
-- TOC entry 281 (class 1259 OID 23764442)
-- Name: pessoa_endereco_entrega_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pessoa_endereco_entrega_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3654 (class 0 OID 0)
-- Dependencies: 281
-- Name: pessoa_endereco_entrega_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pessoa_endereco_entrega_codigo_seq OWNED BY pessoa_endereco_entrega.codigo;


--
-- TOC entry 282 (class 1259 OID 23764444)
-- Name: pessoa_funcionario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pessoa_funcionario (
    codigo integer NOT NULL,
    pessoa integer NOT NULL,
    numero_pis integer,
    ctps_numero integer,
    ctps_serie integer,
    ctps_uf character(2) DEFAULT 'SP'::bpchar,
    departamento integer,
    cargo integer,
    funcao integer,
    salario money,
    data_admissao date,
    data_demissao date,
    data_ultimo_reajuste date,
    data_ultima_ferias date,
    forma_pagamento integer,
    tipo_pagamento integer,
    tipo_contrato integer
);


--
-- TOC entry 3655 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN pessoa_funcionario.tipo_contrato; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN pessoa_funcionario.tipo_contrato IS '0 = CLT
1 = PJ
2 = LIBERAL';


--
-- TOC entry 283 (class 1259 OID 23764448)
-- Name: pessoa_funcionario_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pessoa_funcionario_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3656 (class 0 OID 0)
-- Dependencies: 283
-- Name: pessoa_funcionario_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pessoa_funcionario_codigo_seq OWNED BY pessoa_funcionario.codigo;


SET default_with_oids = false;

--
-- TOC entry 284 (class 1259 OID 23764450)
-- Name: pessoa_funcoes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pessoa_funcoes (
    codigo integer NOT NULL,
    cbo character varying(10),
    descricao character varying(160) NOT NULL
);


--
-- TOC entry 285 (class 1259 OID 23764453)
-- Name: pessoa_funcoes_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pessoa_funcoes_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3657 (class 0 OID 0)
-- Dependencies: 285
-- Name: pessoa_funcoes_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pessoa_funcoes_codigo_seq OWNED BY pessoa_funcoes.codigo;


SET default_with_oids = true;

--
-- TOC entry 286 (class 1259 OID 23764455)
-- Name: pessoa_grupos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pessoa_grupos (
    codigo integer NOT NULL,
    empresa integer DEFAULT 1,
    nome character varying(50),
    tipo character(1) DEFAULT 'C'::bpchar,
    bloqueado boolean DEFAULT false,
    motivo_bloqueio character varying(255),
    tabela_preco integer,
    forma_pgto integer,
    tabela_preco_fatura integer,
    bloqueia_geracao_ponto boolean,
    limite double precision,
    desconto_pedido double precision
);


--
-- TOC entry 287 (class 1259 OID 23764461)
-- Name: pessoa_grupos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pessoa_grupos_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3658 (class 0 OID 0)
-- Dependencies: 287
-- Name: pessoa_grupos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pessoa_grupos_codigo_seq OWNED BY pessoa_grupos.codigo;


SET default_with_oids = false;

--
-- TOC entry 288 (class 1259 OID 23764463)
-- Name: pessoa_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pessoa_log (
    codigo integer NOT NULL,
    pessoa integer NOT NULL,
    usuario integer DEFAULT 0 NOT NULL,
    log character varying(300) NOT NULL,
    data_registro date DEFAULT ('now'::text)::date NOT NULL,
    hora_registro time without time zone DEFAULT ('now'::text)::time with time zone NOT NULL
);


--
-- TOC entry 289 (class 1259 OID 23764469)
-- Name: pessoa_log_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pessoa_log_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3659 (class 0 OID 0)
-- Dependencies: 289
-- Name: pessoa_log_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pessoa_log_codigo_seq OWNED BY pessoa_log.codigo;


SET default_with_oids = true;

--
-- TOC entry 290 (class 1259 OID 23764471)
-- Name: pessoa_regras; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pessoa_regras (
    codigo integer NOT NULL,
    pessoa integer NOT NULL,
    regra integer NOT NULL,
    data_inicio date DEFAULT ('now'::text)::date
);


--
-- TOC entry 291 (class 1259 OID 23764475)
-- Name: pessoa_regras_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pessoa_regras_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3660 (class 0 OID 0)
-- Dependencies: 291
-- Name: pessoa_regras_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pessoa_regras_codigo_seq OWNED BY pessoa_regras.codigo;


--
-- TOC entry 292 (class 1259 OID 23764477)
-- Name: pessoa_responsavel; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pessoa_responsavel (
    codigo integer NOT NULL,
    pessoa integer,
    nome character varying(250) NOT NULL,
    nomereduzido character varying(30),
    cpf character varying(50) NOT NULL,
    rg character varying(50),
    datanascimento date,
    sexo character varying(1),
    endereco character varying(250) NOT NULL,
    endereco_numero character(20) NOT NULL,
    complemento character varying(100),
    referencia character varying(150),
    bairro character varying(200) NOT NULL,
    cep character varying(15) NOT NULL,
    cidade integer DEFAULT 0 NOT NULL,
    uf character varying(2) NOT NULL,
    pais integer DEFAULT 1058 NOT NULL,
    tel1 character varying(20),
    tel2 character varying(20),
    tel3 character varying(20),
    email character varying(60),
    site character varying(60),
    obs text
);


--
-- TOC entry 293 (class 1259 OID 23764485)
-- Name: pessoa_responsavel_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pessoa_responsavel_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3661 (class 0 OID 0)
-- Dependencies: 293
-- Name: pessoa_responsavel_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pessoa_responsavel_codigo_seq OWNED BY pessoa_responsavel.codigo;


--
-- TOC entry 294 (class 1259 OID 23764487)
-- Name: pessoa_saldo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pessoa_saldo (
    codigo integer NOT NULL,
    pessoa integer NOT NULL,
    data_registro date DEFAULT ('now'::text)::date NOT NULL,
    tipo_receita integer DEFAULT 0 NOT NULL,
    valor money DEFAULT 0 NOT NULL,
    parcial boolean DEFAULT false,
    origem integer,
    descricao character varying(250) NOT NULL,
    movimento integer,
    observacao character varying(600),
    liquidado boolean DEFAULT false,
    data_consumo date
);


--
-- TOC entry 3662 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN pessoa_saldo.tipo_receita; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN pessoa_saldo.tipo_receita IS '0 - CREDITO
1 - DEBITO';


--
-- TOC entry 295 (class 1259 OID 23764498)
-- Name: pessoa_saldo_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pessoa_saldo_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3663 (class 0 OID 0)
-- Dependencies: 295
-- Name: pessoa_saldo_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pessoa_saldo_codigo_seq OWNED BY pessoa_saldo.codigo;


SET default_with_oids = false;

--
-- TOC entry 296 (class 1259 OID 23764500)
-- Name: pessoa_web; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pessoa_web (
    codigo integer NOT NULL,
    pessoa integer NOT NULL,
    login character varying(250) NOT NULL,
    senha character varying(250) NOT NULL,
    ultimo_acesso timestamp without time zone,
    dica_senha character varying(250),
    inativo boolean DEFAULT false NOT NULL
);


--
-- TOC entry 297 (class 1259 OID 23764507)
-- Name: pessoa_web_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pessoa_web_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3664 (class 0 OID 0)
-- Dependencies: 297
-- Name: pessoa_web_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pessoa_web_codigo_seq OWNED BY pessoa_web.codigo;


SET default_with_oids = true;

--
-- TOC entry 298 (class 1259 OID 23764509)
-- Name: pessoas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pessoas (
    codigo integer NOT NULL,
    empresa integer,
    datacadastro date DEFAULT ('now'::text)::date,
    nome character varying(250) NOT NULL,
    fantasia character varying(250),
    nomereduzido character varying(30),
    tipopessoa integer NOT NULL,
    cnpj character varying(50) NOT NULL,
    ie character varying(50),
    im character varying(50),
    datanascimento date,
    sexo character varying(1),
    endereco character varying(250) NOT NULL,
    endereco_numero character(20) NOT NULL,
    complemento character varying(100),
    referencia character varying(150),
    bairro character varying(200) NOT NULL,
    cep character varying(15) NOT NULL,
    cidade integer DEFAULT 0 NOT NULL,
    uf character varying(2) NOT NULL,
    pais integer DEFAULT 1058 NOT NULL,
    tel1 character varying(20),
    tel2 character varying(20),
    tel3 character varying(20),
    email character varying(60),
    site character varying(60),
    obs text,
    alerta character varying(255),
    cliente boolean DEFAULT false,
    colaborador boolean DEFAULT false,
    fornecedor boolean DEFAULT false,
    representante boolean DEFAULT false,
    transportadora boolean DEFAULT false,
    inativo boolean DEFAULT false,
    perpetuo boolean DEFAULT true,
    oldid character varying(20)
);


--
-- TOC entry 299 (class 1259 OID 23764525)
-- Name: pessoas_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pessoas_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3665 (class 0 OID 0)
-- Dependencies: 299
-- Name: pessoas_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pessoas_codigo_seq OWNED BY pessoas.codigo;


--
-- TOC entry 300 (class 1259 OID 23764527)
-- Name: produto_alerta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produto_alerta (
    codigo integer NOT NULL,
    empresa integer NOT NULL,
    produto integer NOT NULL,
    data_alerta timestamp without time zone DEFAULT now() NOT NULL,
    estoque_minimo do_volume DEFAULT 1,
    disponivel do_volume DEFAULT 0 NOT NULL
);


--
-- TOC entry 301 (class 1259 OID 23764536)
-- Name: produto_alerta_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE produto_alerta_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3666 (class 0 OID 0)
-- Dependencies: 301
-- Name: produto_alerta_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE produto_alerta_codigo_seq OWNED BY produto_alerta.codigo;


--
-- TOC entry 302 (class 1259 OID 23764538)
-- Name: produto_categorias; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produto_categorias (
    codigo integer NOT NULL,
    categoria character varying(100),
    bloqueado boolean DEFAULT false,
    iva double precision,
    margem_desconto double precision,
    edita boolean DEFAULT false,
    enviado boolean DEFAULT false,
    enviado_filial character varying,
    novo boolean DEFAULT true
);


--
-- TOC entry 303 (class 1259 OID 23764548)
-- Name: produto_categorias_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE produto_categorias_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3667 (class 0 OID 0)
-- Dependencies: 303
-- Name: produto_categorias_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE produto_categorias_codigo_seq OWNED BY produto_categorias.codigo;


SET default_with_oids = false;

--
-- TOC entry 304 (class 1259 OID 23764550)
-- Name: produto_codigobarras; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produto_codigobarras (
    codigo integer NOT NULL,
    produto integer NOT NULL,
    codigobarras character varying(20) NOT NULL
);


--
-- TOC entry 305 (class 1259 OID 23764553)
-- Name: produto_codigobarras_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE produto_codigobarras_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3668 (class 0 OID 0)
-- Dependencies: 305
-- Name: produto_codigobarras_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE produto_codigobarras_codigo_seq OWNED BY produto_codigobarras.codigo;


SET default_with_oids = true;

--
-- TOC entry 306 (class 1259 OID 23764555)
-- Name: produto_empresas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produto_empresas (
    codigo integer NOT NULL,
    empresa integer NOT NULL,
    produto integer NOT NULL,
    valor_compra money DEFAULT 0 NOT NULL,
    ultima_compra date,
    markup_vista numeric(13,3) DEFAULT 0,
    valor_vista money DEFAULT 0,
    markup_prazo numeric(13,3) DEFAULT 0,
    valor_prazo money DEFAULT 0,
    comissao numeric(13,3) DEFAULT 0,
    estoque_minimo integer DEFAULT 0,
    estoque_maximo integer DEFAULT 0,
    deposito integer
);


--
-- TOC entry 307 (class 1259 OID 23764566)
-- Name: produto_empresa_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE produto_empresa_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3669 (class 0 OID 0)
-- Dependencies: 307
-- Name: produto_empresa_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE produto_empresa_codigo_seq OWNED BY produto_empresas.codigo;


SET default_with_oids = false;

--
-- TOC entry 308 (class 1259 OID 23764568)
-- Name: produto_fornecedores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produto_fornecedores (
    codigo integer NOT NULL,
    produto integer NOT NULL,
    fornecedor integer NOT NULL,
    representante integer,
    ultima_compra date,
    preco_compra money DEFAULT 0,
    tempo_entrega integer,
    minimo_compra integer
);


--
-- TOC entry 309 (class 1259 OID 23764572)
-- Name: produto_fornecedores_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE produto_fornecedores_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3670 (class 0 OID 0)
-- Dependencies: 309
-- Name: produto_fornecedores_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE produto_fornecedores_codigo_seq OWNED BY produto_fornecedores.codigo;


SET default_with_oids = true;

--
-- TOC entry 310 (class 1259 OID 23764574)
-- Name: produto_grupos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produto_grupos (
    codigo integer NOT NULL,
    descricao character varying(100),
    flag character(1) DEFAULT 'A'::bpchar,
    estoque_negativo boolean DEFAULT false,
    aviso_estoque_minimo boolean DEFAULT false,
    minimo integer DEFAULT 0,
    estoque_negativo_deposito boolean,
    gerar_ponto_valor boolean DEFAULT false,
    gerar_ponto_qtde boolean DEFAULT false,
    trocar_ponto boolean DEFAULT false,
    reajusta_preco_auto boolean DEFAULT false,
    comissao double precision DEFAULT 0,
    tipo_comissao character(1) DEFAULT 'P'::bpchar,
    margem_lucro double precision
);


--
-- TOC entry 311 (class 1259 OID 23764587)
-- Name: produto_grupos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE produto_grupos_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3671 (class 0 OID 0)
-- Dependencies: 311
-- Name: produto_grupos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE produto_grupos_codigo_seq OWNED BY produto_grupos.codigo;


--
-- TOC entry 312 (class 1259 OID 23764589)
-- Name: produto_marcas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produto_marcas (
    codigo integer NOT NULL,
    descricao character varying(100)
);


--
-- TOC entry 313 (class 1259 OID 23764592)
-- Name: produto_marcas_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE produto_marcas_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3672 (class 0 OID 0)
-- Dependencies: 313
-- Name: produto_marcas_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE produto_marcas_codigo_seq OWNED BY produto_marcas.codigo;


--
-- TOC entry 314 (class 1259 OID 23764594)
-- Name: produto_modelos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produto_modelos (
    codigo integer NOT NULL,
    descricao character varying(100)
);


--
-- TOC entry 315 (class 1259 OID 23764597)
-- Name: produto_modelos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE produto_modelos_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3673 (class 0 OID 0)
-- Dependencies: 315
-- Name: produto_modelos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE produto_modelos_codigo_seq OWNED BY produto_modelos.codigo;


--
-- TOC entry 316 (class 1259 OID 23764599)
-- Name: produto_movimento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produto_movimento (
    codigo integer NOT NULL,
    empresa integer NOT NULL,
    produto integer NOT NULL,
    data_movimento timestamp without time zone DEFAULT now() NOT NULL,
    tipo_movimento character varying(2) DEFAULT 'V'::character varying NOT NULL,
    quantidade do_volume NOT NULL,
    quantidade_anterior do_volume NOT NULL,
    valor_compra money DEFAULT 0 NOT NULL,
    valor_venda money DEFAULT 0 NOT NULL,
    origem character varying(2),
    referencia character varying(20),
    chave character varying(200),
    deposito integer
);


--
-- TOC entry 317 (class 1259 OID 23764609)
-- Name: produto_movimento_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE produto_movimento_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3674 (class 0 OID 0)
-- Dependencies: 317
-- Name: produto_movimento_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE produto_movimento_codigo_seq OWNED BY produto_movimento.codigo;


--
-- TOC entry 318 (class 1259 OID 23764611)
-- Name: produto_movimento_manual; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produto_movimento_manual (
    codigo integer NOT NULL,
    empresa integer NOT NULL,
    produto integer NOT NULL,
    data_movimento timestamp without time zone DEFAULT now() NOT NULL,
    tipo_movimento character varying(2) DEFAULT 'V'::character varying NOT NULL,
    quantidade do_volume NOT NULL,
    descricao character varying(600)
);


--
-- TOC entry 319 (class 1259 OID 23764619)
-- Name: produto_movimento_manual_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE produto_movimento_manual_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3675 (class 0 OID 0)
-- Dependencies: 319
-- Name: produto_movimento_manual_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE produto_movimento_manual_codigo_seq OWNED BY produto_movimento_manual.codigo;


--
-- TOC entry 320 (class 1259 OID 23764621)
-- Name: produto_precos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produto_precos (
    codigo integer NOT NULL,
    regra integer NOT NULL,
    produto integer NOT NULL,
    markup_vista numeric(13,3) DEFAULT 0,
    valor_vista money DEFAULT 0,
    markup_prazo numeric(13,3) DEFAULT 0,
    valor_prazo money DEFAULT 0
);


--
-- TOC entry 321 (class 1259 OID 23764628)
-- Name: produto_precos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE produto_precos_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3676 (class 0 OID 0)
-- Dependencies: 321
-- Name: produto_precos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE produto_precos_codigo_seq OWNED BY produto_precos.codigo;


--
-- TOC entry 322 (class 1259 OID 23764630)
-- Name: produto_regras; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produto_regras (
    codigo integer NOT NULL,
    empresa integer DEFAULT 1 NOT NULL,
    descricao character varying(100) NOT NULL,
    observacao character varying(250),
    bloqueada boolean DEFAULT false NOT NULL
);


--
-- TOC entry 323 (class 1259 OID 23764635)
-- Name: produto_regras_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE produto_regras_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3677 (class 0 OID 0)
-- Dependencies: 323
-- Name: produto_regras_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE produto_regras_codigo_seq OWNED BY produto_regras.codigo;


SET default_with_oids = false;

--
-- TOC entry 324 (class 1259 OID 23764637)
-- Name: produto_subgrupos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produto_subgrupos (
    codigo integer NOT NULL,
    codgrupo integer DEFAULT 1,
    descricao character varying(100),
    flag character(1) DEFAULT 'A'::bpchar,
    comissao double precision DEFAULT 0 NOT NULL,
    tipo_comissao character(1) DEFAULT 'P'::bpchar
);


--
-- TOC entry 325 (class 1259 OID 23764644)
-- Name: produto_subgrupos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE produto_subgrupos_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3678 (class 0 OID 0)
-- Dependencies: 325
-- Name: produto_subgrupos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE produto_subgrupos_codigo_seq OWNED BY produto_subgrupos.codigo;


--
-- TOC entry 326 (class 1259 OID 23764646)
-- Name: produto_unidade; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produto_unidade (
    codigo integer NOT NULL,
    descricao character varying(120),
    unidade character varying(3),
    venda_decimal boolean DEFAULT true NOT NULL
);


--
-- TOC entry 327 (class 1259 OID 23764650)
-- Name: produto_unidade_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE produto_unidade_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3679 (class 0 OID 0)
-- Dependencies: 327
-- Name: produto_unidade_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE produto_unidade_codigo_seq OWNED BY produto_unidade.codigo;


SET default_with_oids = true;

--
-- TOC entry 328 (class 1259 OID 23764652)
-- Name: produtos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produtos (
    codigo integer NOT NULL,
    nome character varying(200) NOT NULL,
    descricao text,
    tipo character(1) DEFAULT 'P'::bpchar,
    codigobarras character varying(20),
    fornecedor integer,
    grupo integer DEFAULT 1 NOT NULL,
    subgrupo integer,
    marca integer,
    categoria integer,
    modelo integer,
    unidade_entrada character(2),
    unidade_saida character(2),
    unidade_conversao character(2),
    unidade_tamanho character(2),
    producao_propria boolean DEFAULT false,
    perecivel boolean DEFAULT false,
    uso_consumo boolean DEFAULT false,
    inativo boolean DEFAULT false,
    dm_altura numeric(13,3),
    dm_largura numeric(13,3),
    dm_profundidade numeric(13,3),
    dm_quantidade integer,
    dm_peso numeric(13,3),
    dm_carga integer,
    cf_cest character varying(12),
    cf_ncm character varying(12),
    tipo_combustivel integer,
    cf_anp character varying(12),
    empenho boolean DEFAULT false,
    execucao_minimo integer DEFAULT 1,
    execucao_maximo integer,
    certificado boolean DEFAULT false,
    cf_servico character varying(20),
    molde boolean DEFAULT false NOT NULL,
    cd_modelo integer
);


--
-- TOC entry 3680 (class 0 OID 0)
-- Dependencies: 328
-- Name: COLUMN produtos.tipo; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN produtos.tipo IS 'P = Produto
S = Serviço
C = Combustivel';


--
-- TOC entry 3681 (class 0 OID 0)
-- Dependencies: 328
-- Name: COLUMN produtos.molde; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN produtos.molde IS 'Este tipo de produto tranfere as configurações de preço, custo, padrões e categorias para seus derivados.';


--
-- TOC entry 3682 (class 0 OID 0)
-- Dependencies: 328
-- Name: COLUMN produtos.cd_modelo; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN produtos.cd_modelo IS 'Define o codigo do produto utilizado como modelo.';


--
-- TOC entry 329 (class 1259 OID 23764668)
-- Name: produtos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE produtos_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3683 (class 0 OID 0)
-- Dependencies: 329
-- Name: produtos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE produtos_codigo_seq OWNED BY produtos.codigo;


SET default_with_oids = false;

--
-- TOC entry 330 (class 1259 OID 23764670)
-- Name: system_break; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE system_break (
    codigo integer NOT NULL,
    usuario integer NOT NULL,
    data_registro date DEFAULT ('now'::text)::date NOT NULL,
    hora_registro time without time zone DEFAULT ('now'::text)::time with time zone NOT NULL,
    hora_execucao time without time zone,
    tempo_execucao integer,
    executada boolean DEFAULT false,
    motivo integer NOT NULL,
    descricao text NOT NULL,
    data_retorno date,
    hora_retorno time without time zone,
    expectativa integer DEFAULT 10 NOT NULL
);


--
-- TOC entry 331 (class 1259 OID 23764680)
-- Name: system_break_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE system_break_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3684 (class 0 OID 0)
-- Dependencies: 331
-- Name: system_break_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE system_break_codigo_seq OWNED BY system_break.codigo;


--
-- TOC entry 332 (class 1259 OID 23764682)
-- Name: system_formulario_filtros; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE system_formulario_filtros (
    codigo integer NOT NULL,
    formulario integer NOT NULL,
    campo character varying(150) NOT NULL,
    descricao character varying(250) NOT NULL,
    filtro character varying(250) NOT NULL,
    valor character varying(150) NOT NULL,
    tipo character varying(100) NOT NULL,
    ativo boolean DEFAULT true NOT NULL
);


--
-- TOC entry 333 (class 1259 OID 23764689)
-- Name: system_formulario_filtros_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE system_formulario_filtros_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3685 (class 0 OID 0)
-- Dependencies: 333
-- Name: system_formulario_filtros_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE system_formulario_filtros_codigo_seq OWNED BY system_formulario_filtros.codigo;


--
-- TOC entry 334 (class 1259 OID 23764691)
-- Name: system_formularios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE system_formularios (
    codigo integer NOT NULL,
    nome character varying(100) NOT NULL,
    formname character varying(100) NOT NULL,
    tag integer DEFAULT 0 NOT NULL,
    modulo integer DEFAULT 0 NOT NULL,
    ativo boolean DEFAULT true NOT NULL
);


--
-- TOC entry 335 (class 1259 OID 23764697)
-- Name: system_formularios_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE system_formularios_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3686 (class 0 OID 0)
-- Dependencies: 335
-- Name: system_formularios_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE system_formularios_codigo_seq OWNED BY system_formularios.codigo;


SET default_with_oids = true;

--
-- TOC entry 336 (class 1259 OID 23764699)
-- Name: system_grupo_usuarios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE system_grupo_usuarios (
    codigo integer NOT NULL,
    nome character varying(100) NOT NULL,
    departamento integer DEFAULT 0 NOT NULL,
    ativo boolean DEFAULT true NOT NULL
);


--
-- TOC entry 337 (class 1259 OID 23764704)
-- Name: system_grupo_usuarios_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE system_grupo_usuarios_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3687 (class 0 OID 0)
-- Dependencies: 337
-- Name: system_grupo_usuarios_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE system_grupo_usuarios_codigo_seq OWNED BY system_grupo_usuarios.codigo;


--
-- TOC entry 338 (class 1259 OID 23764706)
-- Name: system_help; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE system_help (
    codigo integer NOT NULL,
    formulario integer NOT NULL,
    html text NOT NULL,
    versao character varying(10)
);


--
-- TOC entry 339 (class 1259 OID 23764712)
-- Name: system_help_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE system_help_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3688 (class 0 OID 0)
-- Dependencies: 339
-- Name: system_help_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE system_help_codigo_seq OWNED BY system_help.codigo;


SET default_with_oids = false;

--
-- TOC entry 340 (class 1259 OID 23764714)
-- Name: system_modulos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE system_modulos (
    codigo integer NOT NULL,
    nome character varying(100) NOT NULL,
    descricao character varying(254),
    instalado boolean DEFAULT true NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    tag integer DEFAULT 0 NOT NULL
);


--
-- TOC entry 341 (class 1259 OID 23764720)
-- Name: system_modulos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE system_modulos_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3689 (class 0 OID 0)
-- Dependencies: 341
-- Name: system_modulos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE system_modulos_codigo_seq OWNED BY system_modulos.codigo;


--
-- TOC entry 342 (class 1259 OID 23764722)
-- Name: system_permissoes_grupo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE system_permissoes_grupo (
    codigo integer NOT NULL,
    grupo integer NOT NULL,
    formulario integer NOT NULL,
    abrir boolean DEFAULT true NOT NULL,
    alteracao boolean DEFAULT true NOT NULL,
    exclusao boolean DEFAULT true NOT NULL,
    executar boolean DEFAULT true NOT NULL
);


--
-- TOC entry 343 (class 1259 OID 23764729)
-- Name: system_permissoes_grupo_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE system_permissoes_grupo_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3690 (class 0 OID 0)
-- Dependencies: 343
-- Name: system_permissoes_grupo_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE system_permissoes_grupo_codigo_seq OWNED BY system_permissoes_grupo.codigo;


--
-- TOC entry 344 (class 1259 OID 23764731)
-- Name: system_permissoes_usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE system_permissoes_usuario (
    codigo integer NOT NULL,
    usuario integer NOT NULL,
    formulario integer NOT NULL,
    abrir boolean DEFAULT true NOT NULL,
    alteracao boolean DEFAULT true NOT NULL,
    exclusao boolean DEFAULT true NOT NULL,
    executar boolean DEFAULT true NOT NULL
);


--
-- TOC entry 345 (class 1259 OID 23764738)
-- Name: system_permissoes_usuario_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE system_permissoes_usuario_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3691 (class 0 OID 0)
-- Dependencies: 345
-- Name: system_permissoes_usuario_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE system_permissoes_usuario_codigo_seq OWNED BY system_permissoes_usuario.codigo;


--
-- TOC entry 346 (class 1259 OID 23764740)
-- Name: system_serie_documentos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE system_serie_documentos (
    codigo integer NOT NULL,
    empresa integer DEFAULT get_empresa() NOT NULL,
    documento character varying(10) NOT NULL,
    serie integer DEFAULT 1 NOT NULL,
    numeracao bigint DEFAULT 0 NOT NULL
);


--
-- TOC entry 347 (class 1259 OID 23764746)
-- Name: system_serie_documentos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE system_serie_documentos_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3692 (class 0 OID 0)
-- Dependencies: 347
-- Name: system_serie_documentos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE system_serie_documentos_codigo_seq OWNED BY system_serie_documentos.codigo;


SET default_with_oids = true;

--
-- TOC entry 348 (class 1259 OID 23764748)
-- Name: system_usuarios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE system_usuarios (
    codigo integer NOT NULL,
    login character varying(100) NOT NULL,
    senha character varying(200) NOT NULL,
    grupo integer DEFAULT 1 NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    pessoa integer,
    empresa integer[] DEFAULT '{1}'::integer[]
);


--
-- TOC entry 349 (class 1259 OID 23764757)
-- Name: system_usuarios_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE system_usuarios_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3693 (class 0 OID 0)
-- Dependencies: 349
-- Name: system_usuarios_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE system_usuarios_codigo_seq OWNED BY system_usuarios.codigo;


--
-- TOC entry 350 (class 1259 OID 23764759)
-- Name: system_versao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE system_versao (
    codigo integer NOT NULL,
    versao character varying(10),
    data_versao date NOT NULL,
    data_atualizacao date NOT NULL,
    hora_atualizacao time without time zone NOT NULL
);


--
-- TOC entry 351 (class 1259 OID 23764762)
-- Name: system_versao_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE system_versao_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3694 (class 0 OID 0)
-- Dependencies: 351
-- Name: system_versao_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE system_versao_codigo_seq OWNED BY system_versao.codigo;


SET default_with_oids = false;

--
-- TOC entry 352 (class 1259 OID 23764764)
-- Name: system_web_formularios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE system_web_formularios (
    codigo integer NOT NULL,
    nome character varying(100) NOT NULL,
    icon character varying(100) NOT NULL,
    formname character varying(100) NOT NULL,
    tag integer DEFAULT 0 NOT NULL,
    modulo integer DEFAULT 0 NOT NULL,
    ativo boolean DEFAULT true NOT NULL
);


--
-- TOC entry 353 (class 1259 OID 23764770)
-- Name: system_web_formularios_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE system_web_formularios_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3695 (class 0 OID 0)
-- Dependencies: 353
-- Name: system_web_formularios_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE system_web_formularios_codigo_seq OWNED BY system_web_formularios.codigo;


--
-- TOC entry 354 (class 1259 OID 23764772)
-- Name: system_web_modulos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE system_web_modulos (
    codigo integer NOT NULL,
    nome character varying(100) NOT NULL,
    descricao character varying(254),
    instalado boolean DEFAULT true NOT NULL,
    ativo boolean DEFAULT true NOT NULL
);


--
-- TOC entry 355 (class 1259 OID 23764777)
-- Name: system_web_modulos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE system_web_modulos_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3696 (class 0 OID 0)
-- Dependencies: 355
-- Name: system_web_modulos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE system_web_modulos_codigo_seq OWNED BY system_web_modulos.codigo;


--
-- TOC entry 356 (class 1259 OID 23764779)
-- Name: system_web_permissoes_usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE system_web_permissoes_usuario (
    codigo integer NOT NULL,
    usuario integer NOT NULL,
    formulario integer NOT NULL,
    executar boolean DEFAULT true NOT NULL,
    visualizar boolean DEFAULT true NOT NULL,
    detalhar boolean DEFAULT true NOT NULL
);


--
-- TOC entry 357 (class 1259 OID 23764785)
-- Name: system_web_permissoes_usuario_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE system_web_permissoes_usuario_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3697 (class 0 OID 0)
-- Dependencies: 357
-- Name: system_web_permissoes_usuario_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE system_web_permissoes_usuario_codigo_seq OWNED BY system_web_permissoes_usuario.codigo;


--
-- TOC entry 358 (class 1259 OID 23764787)
-- Name: system_web_usuarios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE system_web_usuarios (
    codigo integer NOT NULL,
    usuario character varying(200),
    senha character varying(200),
    perfil integer,
    empresa integer[],
    ativo boolean DEFAULT false
);


--
-- TOC entry 359 (class 1259 OID 23764794)
-- Name: system_web_usuarios_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE system_web_usuarios_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3698 (class 0 OID 0)
-- Dependencies: 359
-- Name: system_web_usuarios_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE system_web_usuarios_codigo_seq OWNED BY system_web_usuarios.codigo;


--
-- TOC entry 360 (class 1259 OID 23764796)
-- Name: tabela_campos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tabela_campos (
    codigo integer NOT NULL,
    tabela integer NOT NULL,
    campo character varying(160) NOT NULL,
    descricao character varying(250),
    exemplo character varying(200)
);


--
-- TOC entry 361 (class 1259 OID 23764802)
-- Name: tabela_campos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tabela_campos_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3699 (class 0 OID 0)
-- Dependencies: 361
-- Name: tabela_campos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tabela_campos_codigo_seq OWNED BY tabela_campos.codigo;


--
-- TOC entry 362 (class 1259 OID 23764804)
-- Name: tabelas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tabelas (
    codigo integer NOT NULL,
    nome character varying(160) NOT NULL,
    descricao character varying(200) NOT NULL,
    referencia integer[]
);


--
-- TOC entry 363 (class 1259 OID 23764810)
-- Name: tabelas_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tabelas_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3700 (class 0 OID 0)
-- Dependencies: 363
-- Name: tabelas_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tabelas_codigo_seq OWNED BY tabelas.codigo;


SET default_with_oids = true;

--
-- TOC entry 364 (class 1259 OID 23764812)
-- Name: tipo_break; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipo_break (
    codigo integer NOT NULL,
    descricao character varying(200) NOT NULL,
    img character varying(200) NOT NULL,
    comando text
);


--
-- TOC entry 365 (class 1259 OID 23764818)
-- Name: tipo_break_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipo_break_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3701 (class 0 OID 0)
-- Dependencies: 365
-- Name: tipo_break_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipo_break_codigo_seq OWNED BY tipo_break.codigo;


--
-- TOC entry 366 (class 1259 OID 23764820)
-- Name: tipo_combustivel; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipo_combustivel (
    codigo integer NOT NULL,
    nome character varying(100) NOT NULL,
    codigo_sefaz_sp character varying(20)
);


SET default_with_oids = false;

--
-- TOC entry 367 (class 1259 OID 23764823)
-- Name: tipo_contas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipo_contas (
    codigo integer NOT NULL,
    descricao character varying(160) NOT NULL
);


--
-- TOC entry 368 (class 1259 OID 23764826)
-- Name: tipo_contas_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipo_contas_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3702 (class 0 OID 0)
-- Dependencies: 368
-- Name: tipo_contas_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipo_contas_codigo_seq OWNED BY tipo_contas.codigo;


SET default_with_oids = true;

--
-- TOC entry 369 (class 1259 OID 23764828)
-- Name: tipo_frota; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipo_frota (
    codigo integer NOT NULL,
    descricao character varying(160) NOT NULL,
    bloqueado boolean DEFAULT false,
    carregamento_unidade character(2) DEFAULT 'UN'::bpchar,
    carregamento_capacidade numeric(13,3) DEFAULT 0
);


--
-- TOC entry 370 (class 1259 OID 23764834)
-- Name: tipo_frota_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipo_frota_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3703 (class 0 OID 0)
-- Dependencies: 370
-- Name: tipo_frota_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipo_frota_codigo_seq OWNED BY tipo_frota.codigo;


--
-- TOC entry 371 (class 1259 OID 23764836)
-- Name: tipo_imovel; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipo_imovel (
    codigo integer NOT NULL,
    descricao character varying(160) NOT NULL,
    bloqueado boolean DEFAULT false
);


--
-- TOC entry 372 (class 1259 OID 23764840)
-- Name: tipo_imovel_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipo_imovel_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3704 (class 0 OID 0)
-- Dependencies: 372
-- Name: tipo_imovel_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipo_imovel_codigo_seq OWNED BY tipo_imovel.codigo;


--
-- TOC entry 373 (class 1259 OID 23764842)
-- Name: tipo_movimento_produto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipo_movimento_produto (
    codigo integer NOT NULL,
    descricao character varying(160) NOT NULL,
    operacao character varying(160) NOT NULL,
    funcao character varying(160),
    bloqueado boolean DEFAULT false NOT NULL
);


--
-- TOC entry 374 (class 1259 OID 23764846)
-- Name: tipo_movimento_produto_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipo_movimento_produto_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3705 (class 0 OID 0)
-- Dependencies: 374
-- Name: tipo_movimento_produto_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipo_movimento_produto_codigo_seq OWNED BY tipo_movimento_produto.codigo;


SET default_with_oids = false;

--
-- TOC entry 375 (class 1259 OID 23764848)
-- Name: tipo_pagamentos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipo_pagamentos (
    codigo integer NOT NULL,
    descricao character varying(60),
    segunda_via boolean DEFAULT true,
    comissionada boolean DEFAULT true,
    mov_cont_receber boolean DEFAULT false,
    tef boolean DEFAULT false,
    cheque boolean DEFAULT false,
    mov_cont_bancaria boolean DEFAULT false,
    registra_venda boolean DEFAULT true,
    cartao boolean DEFAULT false,
    perc_operadora double precision,
    controlar_cheque boolean DEFAULT false,
    nro_parcela_max integer,
    requer_autorizacao boolean DEFAULT false,
    credito boolean DEFAULT false,
    debito_dias integer,
    inativo boolean DEFAULT false,
    pagamento boolean DEFAULT false NOT NULL,
    baixa boolean DEFAULT false NOT NULL,
    fatura boolean DEFAULT false NOT NULL
);


--
-- TOC entry 376 (class 1259 OID 23764866)
-- Name: tipo_pagamentos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipo_pagamentos_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3706 (class 0 OID 0)
-- Dependencies: 376
-- Name: tipo_pagamentos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipo_pagamentos_codigo_seq OWNED BY tipo_pagamentos.codigo;


SET default_with_oids = true;

--
-- TOC entry 377 (class 1259 OID 23764868)
-- Name: venda_itens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE venda_itens (
    codigo integer NOT NULL,
    venda integer NOT NULL,
    item_pedido integer,
    produto integer NOT NULL,
    valor_unitario money DEFAULT 0,
    desconto_unitario money DEFAULT 0,
    acrescimo_unitario money DEFAULT 0,
    quantidade do_volume DEFAULT 1 NOT NULL,
    desconto_total money DEFAULT 0,
    acrescimo_total money DEFAULT 0,
    valor_total money DEFAULT 0,
    entregue do_volume,
    cancelado boolean DEFAULT false NOT NULL,
    valor_entregue money DEFAULT 0
);


--
-- TOC entry 378 (class 1259 OID 23764883)
-- Name: venda_itens_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE venda_itens_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3707 (class 0 OID 0)
-- Dependencies: 378
-- Name: venda_itens_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE venda_itens_codigo_seq OWNED BY venda_itens.codigo;


SET default_with_oids = false;

--
-- TOC entry 379 (class 1259 OID 23764885)
-- Name: venda_pagamentos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE venda_pagamentos (
    codigo integer NOT NULL,
    venda integer NOT NULL,
    forma integer DEFAULT 1 NOT NULL,
    valor_parcela money DEFAULT 0 NOT NULL,
    numero_parcela integer DEFAULT 1 NOT NULL,
    valor_total money DEFAULT 0 NOT NULL,
    total_parcelas integer DEFAULT 1 NOT NULL,
    data_regristro timestamp without time zone DEFAULT now() NOT NULL,
    data_pagamento timestamp without time zone,
    liquidado boolean DEFAULT false NOT NULL,
    caixa integer,
    usuario integer NOT NULL
);


--
-- TOC entry 380 (class 1259 OID 23764895)
-- Name: venda_pagamentos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE venda_pagamentos_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3708 (class 0 OID 0)
-- Dependencies: 380
-- Name: venda_pagamentos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE venda_pagamentos_codigo_seq OWNED BY venda_pagamentos.codigo;


--
-- TOC entry 381 (class 1259 OID 23764897)
-- Name: vendas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vendas (
    codigo integer NOT NULL,
    empresa integer DEFAULT get_empresa(),
    pedido integer,
    cliente integer NOT NULL,
    representante integer,
    data_registro timestamp without time zone DEFAULT now() NOT NULL,
    previsao_entrega date,
    data_venda timestamp without time zone DEFAULT now() NOT NULL,
    data_entrega date,
    status character varying(2) DEFAULT 'P'::character varying,
    observacao text,
    total_pedido money DEFAULT 0,
    total_produtos money DEFAULT 0,
    concluido boolean DEFAULT false NOT NULL,
    entregue boolean DEFAULT false NOT NULL,
    liquidado boolean DEFAULT false NOT NULL,
    fechar boolean DEFAULT false NOT NULL,
    tipo_pagamento integer DEFAULT 1,
    cupom integer,
    nota integer,
    origem character varying(2) DEFAULT 'CX'::character varying NOT NULL
);


--
-- TOC entry 3709 (class 0 OID 0)
-- Dependencies: 381
-- Name: COLUMN vendas.status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN vendas.status IS 'P = Pendente
C = Cancelado
E = Entregue
EP = Entregue Parcialmente';


--
-- TOC entry 3710 (class 0 OID 0)
-- Dependencies: 381
-- Name: COLUMN vendas.cupom; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN vendas.cupom IS 'Numero do Cupom relacionado';


--
-- TOC entry 3711 (class 0 OID 0)
-- Dependencies: 381
-- Name: COLUMN vendas.origem; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN vendas.origem IS 'CX - Caixa Padrao
CG - Caixa Gerencial';


--
-- TOC entry 382 (class 1259 OID 23764914)
-- Name: vendas_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE vendas_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3712 (class 0 OID 0)
-- Dependencies: 382
-- Name: vendas_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE vendas_codigo_seq OWNED BY vendas.codigo;


--
-- TOC entry 383 (class 1259 OID 23764916)
-- Name: vw_abastecimentos; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_abastecimentos AS
 SELECT ab.codigo,
    ab.bico AS nr_logico,
    bc.codigo AS idbico,
    bc.nr_bico AS bico,
    bb.descricao AS bomba,
    ab.quantidade,
    ab.preco_unitario,
    ab.valor,
    ab.data,
    ab.hora,
    ab.encerrante_inicial,
    ab.encerrante_final,
    ab.target_id,
    ab.punp_id,
    ab.processo_date,
    ab.km,
    ab.placa,
    ab.manual,
    ab.troca_oleo,
    dp.nome AS combustivel
   FROM (((abastecimento ab
     LEFT JOIN bicos bc ON (((bc.nr_logico)::text = (ab.bico)::text)))
     LEFT JOIN deposito dp ON ((dp.codigo = bc.tanque)))
     LEFT JOIN bombas bb ON ((bb.codigo = bc.bomba)));


--
-- TOC entry 384 (class 1259 OID 23764921)
-- Name: vw_abastecimentos_baixados; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_abastecimentos_baixados AS
 SELECT ab.codigo,
    ab.bico AS nr_logico,
    bc.codigo AS idbico,
    bc.nr_bico AS bico,
    bb.descricao AS bomba,
    ab.quantidade,
    ab.preco_unitario,
    ab.valor,
    ab.data,
    ab.hora,
    ab.encerrante_inicial,
    ab.encerrante_final,
    ab.target_id,
    ab.punp_id,
    ab.hora_baixa,
    ab.km_baixa,
    ab.placa,
    ab.manual,
    ab.troca_oleo,
    dp.nome AS combustivel
   FROM (((abastecimento_baixa ab
     LEFT JOIN bicos bc ON (((bc.nr_logico)::text = (ab.bico)::text)))
     LEFT JOIN deposito dp ON ((dp.codigo = bc.tanque)))
     LEFT JOIN bombas bb ON ((bb.codigo = bc.bomba)));


--
-- TOC entry 385 (class 1259 OID 23764926)
-- Name: vw_caixa_recebimentos; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_caixa_recebimentos AS
 SELECT caixa_movimento.caixa,
    caixa_movimento.tipo_pagamento,
    caixa_movimento.data_movimento,
    caixa_movimento.operador_caixa,
    sum(caixa_movimento.valor) AS valor_total
   FROM caixa_movimento
  GROUP BY caixa_movimento.caixa, caixa_movimento.tipo_pagamento, caixa_movimento.data_movimento, caixa_movimento.operador_caixa
  ORDER BY caixa_movimento.caixa, caixa_movimento.data_movimento, caixa_movimento.tipo_pagamento;


--
-- TOC entry 386 (class 1259 OID 23764930)
-- Name: vw_cnae; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_cnae AS
 SELECT c.codigo,
    c.secao,
    cs.descricao AS secao_descricao,
    c.chave,
    c.descricao
   FROM (cnae c
     LEFT JOIN cnae_secao cs ON ((cs.secao = c.secao)));


--
-- TOC entry 387 (class 1259 OID 23764934)
-- Name: vw_contas_pagar; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_contas_pagar AS
 SELECT cp.codigo,
    cp.empresa,
    cp.data_registro,
    cp.data_movimento,
    cp.usuario,
    cp.tipo_conta AS cd_tipo_conta,
    cp.documento,
    tc.descricao AS tipo_conta,
    cp.compra,
    cp.valor,
    cp.parcela,
    cp.total_parcelas,
    cp.tipo_pagamento AS cd_tipo_pagamento,
    tp.descricao AS tipo_pagamento,
    cp.centro_custo,
    cp.vencimento,
    cp.valor_pgto,
    cp.juros,
    cp.desconto,
    cp.data_pgto,
    cp.pessoa AS cd_pessoa,
    COALESCE(ps.fantasia, 'NÂO VINCULADO'::character varying(250)) AS pessoa,
    cp.descricao,
    cp.quitada,
    cp.observacoes,
    cp.nfe,
    cp.despesa
   FROM (((contas_pagar cp
     LEFT JOIN tipo_contas tc ON ((tc.codigo = cp.tipo_conta)))
     LEFT JOIN tipo_pagamentos tp ON ((tp.codigo = cp.tipo_pagamento)))
     LEFT JOIN pessoas ps ON ((ps.codigo = cp.pessoa)));


--
-- TOC entry 388 (class 1259 OID 23764939)
-- Name: vw_contas_receber; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_contas_receber AS
 SELECT cr.codigo,
    cr.empresa,
    cr.data_registro,
    cr.data_movimento,
    cr.usuario,
    cr.tipo_conta AS cd_tipo_conta,
    tc.descricao AS tipo_conta,
    cr.documento,
    cr.descricao,
    cr.venda,
    cr.valor,
    cr.parcela,
    cr.total_parcelas,
    cr.tipo_pagamento AS cd_tipo_pagamento,
    tp.descricao AS tipo_pagamento,
    cr.centro_custo,
    cr.vencimento,
    cr.valor_corrigido,
    cr.juros_valor,
    cr.desconto_valor,
    cr.data_recebimento,
    cr.pessoa AS cd_pessoa,
    COALESCE(ps.fantasia, 'NÂO VINCULADO'::character varying(250)) AS pessoa,
    cr.status,
    cr.quitada,
    cr.multa,
    cr.nfe,
    cr.fatura
   FROM (((contas_receber cr
     LEFT JOIN tipo_contas tc ON ((tc.codigo = cr.tipo_conta)))
     LEFT JOIN tipo_pagamentos tp ON ((tp.codigo = cr.tipo_pagamento)))
     LEFT JOIN pessoas ps ON ((ps.codigo = cr.pessoa)));


--
-- TOC entry 389 (class 1259 OID 23764944)
-- Name: vw_cte; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_cte AS
 SELECT ct.codigo,
    ct.data_registro,
    ct.conhecimento,
    ct.status,
    ct.remetente AS id_remetente,
    pr.fantasia AS remetente,
    ct.destinatario AS id_destinatario,
    pd.fantasia AS destinatario,
    ct.local_entrega AS id_local_entrega,
    cd.cidade AS local_entrega,
    ct.nota,
    ct.processado,
    ct.chave_cte,
    ct.valor_frete,
    ct.ambiente,
        CASE
            WHEN (cr.codigo IS NULL) THEN false
            ELSE true
        END AS financeiro
   FROM ((((cte ct
     LEFT JOIN pessoas pr ON ((pr.codigo = ct.remetente)))
     LEFT JOIN pessoas pd ON ((pd.codigo = ct.destinatario)))
     LEFT JOIN cidades cd ON ((cd.codigo = ct.local_entrega)))
     LEFT JOIN contas_receber cr ON ((cr.codigo_origem = ct.codigo)));


--
-- TOC entry 390 (class 1259 OID 23764949)
-- Name: vw_cte_completa; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_cte_completa AS
 SELECT ct.codigo,
    ct.data_registro,
    ct.conhecimento,
    ct.chave_cte,
    ct.chave_cancelamento,
    ct.data_cancelamento,
    ct.status,
    ct.remetente AS id_remetente,
    pr.fantasia AS remetente,
    pr.cidade AS remetente_id_cidade,
    cr.cidade AS remetente_cidade,
    cr.uf AS remetente_uf,
    ct.remetente_endereco,
    ct.destinatario AS id_destinatario,
    pd.fantasia AS destinatario,
    pd.cidade AS destinatario_id_cidade,
    cd.cidade AS destinatario_cidade,
    cd.uf AS destinatario_uf,
    ct.destinatario_endereco,
    ct.local_entrega AS id_local_entrega,
    ce.cidade AS local_entrega,
    ct.data_entrega,
    ct.tipo_nota,
    ct.nota,
    ct.nfe_chave,
    ct.nf_serie,
    ct.nf_bcicms,
    ct.nf_icms,
    ct.nf_icms_st,
    ct.nf_bc_icms_st,
    ct.nf_total_prod,
    ct.nf_cfop AS nf_cfop_chave,
    (nnf.descricao_sefaz)::character varying(60) AS nf_cfop,
    ct.valor_nf,
    ct.data_nfe,
    ct.natureza_carga,
    ct.qtde_volume,
    ct.especie_volume,
    ct.marca,
    ct.qtde_kgm,
    ct.frete_kgm,
    ct.frete,
    ct.valor_frete,
    ct.natureza_operacao AS natureza_operacao_chave,
    (nct.descricao_sefaz)::character varying(60) AS natureza_operacao,
    ct.despacho,
    ct.pedagio,
    ct.outras_despesas,
    ct.prestacao,
    ct.aliquota,
    ct.basecalc_icms,
    ct.valor_icms,
    ct.tarifa,
    ct.local_coleta AS id_local_coleta,
    cc.cidade AS local_coleta,
    ct.data_coleta,
    ct.frota,
    ct.veiculo_placa,
    ct.veiculo_uf,
    ct.sec_car,
    ct.base_calculo,
    ct.calculado_ate,
    ct.data_recebimento,
    ct.redespacho,
    ct.processado,
    ct.valor_produto,
    ct.marcado_manual,
    ct.un_med,
    ct.seguro_resp,
    ct.seguro_seg,
    ct.seguro_apol,
    ct.seguro_averb,
    ct.observacao,
    ct.ambiente
   FROM ((((((((cte ct
     LEFT JOIN pessoas pr ON ((pr.codigo = ct.remetente)))
     LEFT JOIN pessoas pd ON ((pd.codigo = ct.destinatario)))
     LEFT JOIN cidades cr ON ((cr.codigo = pr.cidade)))
     LEFT JOIN cidades cd ON ((cd.codigo = pd.cidade)))
     LEFT JOIN cidades cc ON ((cc.codigo = ct.local_coleta)))
     LEFT JOIN cidades ce ON ((ce.codigo = ct.local_entrega)))
     LEFT JOIN cst_cfop nct ON (((nct.chave)::text = (ct.natureza_operacao)::text)))
     LEFT JOIN cst_cfop nnf ON (((nnf.chave)::text = (ct.nf_cfop)::text)));


--
-- TOC entry 391 (class 1259 OID 23764954)
-- Name: vw_departamentos; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_departamentos AS
 SELECT dp.codigo,
    dp.nome,
    dp.descricao,
    dp.turno_inicio,
    dp.turno_fim,
    dp.responsavel AS cd_responsavel,
    ps.nome AS responsavel,
    dp.desativado
   FROM (departamentos dp
     LEFT JOIN pessoas ps ON ((ps.codigo = dp.responsavel)));


--
-- TOC entry 392 (class 1259 OID 23764959)
-- Name: vw_depositos; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_depositos AS
 SELECT dp.codigo,
    dp.nome,
    dp.departamento,
    dp.liquido,
    dp.produto,
    dp.capacidade,
    dp.estoque_negativo,
    dp.unidade_medida
   FROM deposito dp;


--
-- TOC entry 393 (class 1259 OID 23764963)
-- Name: vw_detalhe_tabela; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_detalhe_tabela AS
 SELECT rel.nspname AS schema,
    rel.relname AS tabela,
    attrs.attname AS coluna,
    attrs."Type" AS tipo,
    attrs."Default" AS padrao,
    attrs.attnotnull AS nulo
   FROM (( SELECT c.oid,
            n.nspname,
            c.relname
           FROM (pg_class c
             LEFT JOIN pg_namespace n ON ((n.oid = c.relnamespace)))
          WHERE pg_table_is_visible(c.oid)) rel
     JOIN ( SELECT a.attname,
            a.attrelid,
            format_type(a.atttypid, a.atttypmod) AS "Type",
            ( SELECT "substring"(d.adsrc, 1, 128) AS "substring"
                   FROM pg_attrdef d
                  WHERE (((d.adrelid = a.attrelid) AND (d.adnum = a.attnum)) AND a.atthasdef)) AS "Default",
            a.attnotnull,
            a.attnum
           FROM pg_attribute a
          WHERE ((a.attnum > 0) AND (NOT a.attisdropped))) attrs ON ((attrs.attrelid = rel.oid)))
  ORDER BY attrs.attnum;


--
-- TOC entry 394 (class 1259 OID 23764968)
-- Name: vw_estoque; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_estoque AS
 SELECT pd.codigo,
    es.empresa,
    es.codigo AS cd_estoque,
    pd.nome AS produto,
    pc.categoria,
    es.data_atualizacao,
    es.total_geral,
    es.total_disponivel,
    es.total_anterior,
    es.total_empenhado
   FROM ((estoque es
     LEFT JOIN produtos pd ON ((pd.codigo = es.produto)))
     LEFT JOIN produto_categorias pc ON ((pc.codigo = pd.categoria)))
  WHERE (pd.molde = false);


--
-- TOC entry 395 (class 1259 OID 23764973)
-- Name: vw_estoque_dia; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_estoque_dia AS
 SELECT pd.codigo,
    es.empresa,
    es.codigo AS cd_estoque,
    pd.nome AS produto,
    pc.categoria,
    es.data_estoque,
    es.total_geral,
    es.total_disponivel,
    es.total_anterior,
    es.total_empenhado
   FROM ((estoque_diario es
     LEFT JOIN produtos pd ON ((pd.codigo = es.produto)))
     LEFT JOIN produto_categorias pc ON ((pc.codigo = pd.categoria)));


--
-- TOC entry 396 (class 1259 OID 23764978)
-- Name: vw_estoque_geral; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_estoque_geral AS
 SELECT vwe.codigo,
    vwe.empresa,
    vwe.produto,
    vwe.categoria,
    vwe.data_atualizacao,
    vwe.total_geral,
    vwe.total_disponivel,
    vwe.total_anterior,
    vwe.total_empenhado,
    'DIA'::character(3) AS origem,
    (
        CASE
            WHEN ((vwe.total_disponivel)::numeric < (pee.estoque_minimo)::numeric) THEN 'CRITICO'::text
            WHEN ((vwe.total_disponivel)::numeric = (pee.estoque_minimo)::numeric) THEN 'ALERTA'::text
            WHEN ((vwe.total_disponivel)::numeric > (pee.estoque_maximo)::numeric) THEN 'EXCESSO'::text
            ELSE 'PADRAO'::text
        END)::character varying(30) AS status
   FROM (vw_estoque vwe
     LEFT JOIN produto_empresas pee ON (((pee.produto = vwe.codigo) AND (pee.empresa = vwe.empresa))))
UNION ALL
 SELECT vwd.codigo,
    vwd.empresa,
    vwd.produto,
    vwd.categoria,
    vwd.data_estoque AS data_atualizacao,
    vwd.total_geral,
    vwd.total_disponivel,
    vwd.total_anterior,
    vwd.total_empenhado,
    'REG'::character(3) AS origem,
    (
        CASE
            WHEN ((vwd.total_disponivel)::numeric < (ped.estoque_minimo)::numeric) THEN 'CRITICO'::text
            WHEN ((vwd.total_disponivel)::numeric = (ped.estoque_minimo)::numeric) THEN 'ALERTA'::text
            WHEN ((vwd.total_disponivel)::numeric > (ped.estoque_maximo)::numeric) THEN 'EXCESSO'::text
            ELSE 'PADRAO'::text
        END)::character varying(30) AS status
   FROM (vw_estoque_dia vwd
     LEFT JOIN produto_empresas ped ON (((ped.produto = vwd.codigo) AND (ped.empresa = vwd.empresa))));


--
-- TOC entry 397 (class 1259 OID 23764983)
-- Name: vw_frotas; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_frotas AS
 SELECT ft.codigo,
    ft.tipo AS cd_tipo,
    tf.descricao AS desc_tipo,
    ft.placa,
    ft.identificacao,
    ft.automacao,
    ft.veiculo,
    ft.motorista AS cd_motorista,
    ps.fantasia AS desc_mototista,
    ft.ultimokm,
    ft.inativo
   FROM ((frotas ft
     LEFT JOIN tipo_frota tf ON ((tf.codigo = ft.tipo)))
     LEFT JOIN pessoas ps ON ((ps.codigo = ft.motorista)))
  ORDER BY ft.placa;


--
-- TOC entry 398 (class 1259 OID 23764988)
-- Name: vw_modulos; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_modulos AS
 SELECT sm.codigo,
    sm.nome,
    sm.descricao,
    sm.instalado,
    sm.ativo,
    sm.tag
   FROM system_modulos sm;


--
-- TOC entry 399 (class 1259 OID 23764992)
-- Name: vw_pedido_compras; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_pedido_compras AS
 SELECT pc.codigo,
    pc.empresa,
    pc.fornecedor AS cd_fornecedor,
    pf.fantasia AS fornecedor,
    pc.representante AS cd_representante,
    pr.fantasia AS representante,
    pc.data_pedido,
    pc.previsao_entrega,
    pc.data_compra,
    pc.data_entrada,
    pc.total_pedido,
    (
        CASE
            WHEN ((pc.status)::text = 'P'::text) THEN 'Pendente'::text
            WHEN ((pc.status)::text = 'C'::text) THEN 'Cancelado'::text
            WHEN ((pc.status)::text = 'A'::text) THEN 'Adquirido'::text
            WHEN ((pc.status)::text = 'AP'::text) THEN 'Adquirido Parcialmente'::text
            ELSE NULL::text
        END)::character varying(22) AS status
   FROM ((pedido_compras pc
     LEFT JOIN pessoas pf ON ((pf.codigo = pc.fornecedor)))
     LEFT JOIN pessoas pr ON ((pr.codigo = pc.representante)));


--
-- TOC entry 400 (class 1259 OID 23764997)
-- Name: vw_pedido_vendas; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_pedido_vendas AS
 SELECT pc.codigo,
    pc.empresa,
    pc.cliente AS cd_cliente,
    pf.fantasia AS cliente,
    pc.representante AS cd_representante,
    pr.fantasia AS representante,
    pc.data_pedido,
    pc.previsao_entrega,
    pc.data_compra,
    pc.data_entrada,
    pc.total_pedido,
    (
        CASE
            WHEN ((pc.status)::text = 'P'::text) THEN 'Pendente'::text
            WHEN ((pc.status)::text = 'F'::text) THEN 'Fechado'::text
            WHEN ((pc.status)::text = 'C'::text) THEN 'Cancelado'::text
            WHEN ((pc.status)::text = 'E'::text) THEN 'Entregue'::text
            WHEN ((pc.status)::text = 'EP'::text) THEN 'Entregue Parcialmente'::text
            ELSE NULL::text
        END)::character varying(22) AS status
   FROM ((pedido_vendas pc
     LEFT JOIN pessoas pf ON ((pf.codigo = pc.cliente)))
     LEFT JOIN pessoas pr ON ((pr.codigo = pc.representante)));


--
-- TOC entry 401 (class 1259 OID 23765002)
-- Name: vw_pessoa_grupos; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_pessoa_grupos AS
 SELECT gp.codigo,
    gp.empresa,
    gp.nome,
    (
        CASE
            WHEN (gp.tipo = 'C'::bpchar) THEN 'CLIENTE'::text
            WHEN (gp.tipo = 'L'::bpchar) THEN 'COLABORADOR'::text
            WHEN (gp.tipo = 'F'::bpchar) THEN 'FORNECEDORES'::text
            WHEN (gp.tipo = 'R'::bpchar) THEN 'REPRESENTANTES'::text
            WHEN (gp.tipo = 'T'::bpchar) THEN 'TRANSPORTADOR'::text
            ELSE 'OUTROS'::text
        END)::character varying(20) AS tipo,
    gp.bloqueado,
    gp.motivo_bloqueio,
    gp.tabela_preco,
    gp.forma_pgto,
    gp.tabela_preco_fatura,
    gp.bloqueia_geracao_ponto,
    gp.limite,
    gp.desconto_pedido
   FROM pessoa_grupos gp;


--
-- TOC entry 402 (class 1259 OID 23765007)
-- Name: vw_pessoa_movimentacao; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_pessoa_movimentacao AS
 SELECT v.codigo,
    v.pedido,
    v.cliente AS cd_cliente,
    COALESCE(v.representante, 0) AS cd_representante,
    COALESCE(ps.fantasia, 'NÃO IDENTIFICADO'::character varying) AS representante,
    v.data_venda,
    v.data_entrega,
    v.status,
    v.total_pedido,
    v.total_produtos,
    v.concluido,
    v.entregue,
    v.liquidado,
    v.cupom,
    v.nota
   FROM (vendas v
     LEFT JOIN pessoas ps ON ((ps.codigo = v.representante)));


--
-- TOC entry 403 (class 1259 OID 23765012)
-- Name: vw_pessoas; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_pessoas AS
 SELECT ps.codigo,
    ps.datacadastro,
    ps.nome,
    ps.fantasia,
    (
        CASE
            WHEN (char_length((ps.cnpj)::text) = 14) THEN regexp_replace((ps.cnpj)::text, '(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})'::text, '\1.\2.\3/\4-\5'::text)
            ELSE regexp_replace((ps.cnpj)::text, '(\d{3})(\d{3})(\d{3})(\d{2})'::text, '\1.\2.\3-\4'::text)
        END)::character varying(50) AS cnpj,
    cd.cidade,
    ps.uf,
    (
        CASE
            WHEN (char_length((ps.tel1)::text) = 10) THEN regexp_replace((ps.tel1)::text, '(\d{2})(\d{4})(\d{4})'::text, '(\1) \2-\3'::text)
            ELSE regexp_replace((ps.tel1)::text, '(\d{2})(\d{5})(\d{4})'::text, '(\1) \2-\3'::text)
        END)::character varying(20) AS tel1,
    ps.inativo,
    ps.cliente,
    ps.colaborador,
    ps.fornecedor,
    ps.representante,
    ps.transportadora
   FROM (pessoas ps
     LEFT JOIN cidades cd ON ((cd.codigo = ps.cidade)))
  ORDER BY ps.nome;


--
-- TOC entry 404 (class 1259 OID 23765017)
-- Name: vw_produtos; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_produtos AS
 SELECT pd.codigo,
    es.empresa,
    es.codigo AS cd_estoque,
    pd.nome AS produto,
    pc.categoria,
    pg.descricao AS grupo,
    es.total_geral,
    es.total_disponivel,
    es.total_anterior,
    es.total_empenhado,
    pe.valor_vista,
    pe.valor_prazo,
    pd.codigobarras
   FROM ((((produtos pd
     LEFT JOIN estoque es ON ((es.produto = pd.codigo)))
     LEFT JOIN produto_grupos pg ON ((pg.codigo = pd.grupo)))
     LEFT JOIN produto_categorias pc ON ((pc.codigo = pd.categoria)))
     LEFT JOIN produto_empresas pe ON (((pe.produto = pd.codigo) AND (pe.empresa = 1))))
  WHERE (pd.molde = false);


--
-- TOC entry 405 (class 1259 OID 23765022)
-- Name: vw_system_formulario_filtros; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_system_formulario_filtros AS
 SELECT sf.codigo,
    sf.nome,
    sf.formname,
    sf.tag,
    sf.modulo,
    sff.formulario,
    sff.campo,
    sff.descricao,
    sff.filtro,
    sff.valor,
    sff.tipo,
    sff.ativo
   FROM (system_formularios sf
     LEFT JOIN system_formulario_filtros sff ON ((sff.formulario = sf.codigo)));


--
-- TOC entry 406 (class 1259 OID 23765026)
-- Name: vw_system_grupo_usuarios; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_system_grupo_usuarios AS
 SELECT sgu.codigo,
    sgu.nome,
    sgu.departamento AS cd_departamento,
    dp.nome AS departamento,
    sgu.ativo
   FROM (system_grupo_usuarios sgu
     LEFT JOIN departamentos dp ON ((dp.codigo = sgu.departamento)));


--
-- TOC entry 407 (class 1259 OID 23765030)
-- Name: vw_vendas; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW vw_vendas AS
 SELECT v.codigo,
    v.empresa,
    v.pedido,
    v.cliente AS cd_cliente,
    pf.fantasia AS cliente,
    v.representante AS cd_representante,
    pr.fantasia AS representante,
    v.data_registro,
    v.previsao_entrega,
    v.data_venda,
    v.data_entrega,
    v.status AS idstatus,
    (
        CASE
            WHEN ((v.status)::text = 'P'::text) THEN 'Pendente'::text
            WHEN ((v.status)::text = 'F'::text) THEN 'Fechado'::text
            WHEN ((v.status)::text = 'C'::text) THEN 'Cancelado'::text
            WHEN ((v.status)::text = 'E'::text) THEN 'Entregue'::text
            WHEN ((v.status)::text = 'EP'::text) THEN 'Entregue Parcialmente'::text
            ELSE NULL::text
        END)::character varying(22) AS status,
    v.observacao,
    v.total_pedido,
    v.total_produtos,
    v.concluido,
    v.entregue,
    v.liquidado
   FROM ((vendas v
     LEFT JOIN pessoas pf ON ((pf.codigo = v.cliente)))
     LEFT JOIN pessoas pr ON ((pr.codigo = v.representante)));


--
-- TOC entry 2728 (class 2604 OID 23765035)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY abastecimento ALTER COLUMN codigo SET DEFAULT nextval('abastecimento_codigo_seq'::regclass);


--
-- TOC entry 2732 (class 2604 OID 23765036)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY abastecimento_baixa ALTER COLUMN codigo SET DEFAULT nextval('abastecimento_baixa_codigo_seq'::regclass);


--
-- TOC entry 2736 (class 2604 OID 23765037)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY automacao_bombas ALTER COLUMN codigo SET DEFAULT nextval('automacao_bombas_codigo_seq'::regclass);


--
-- TOC entry 2738 (class 2604 OID 23765038)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY bancos ALTER COLUMN codigo SET DEFAULT nextval('bancos_codigo_seq'::regclass);


--
-- TOC entry 2740 (class 2604 OID 23765039)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY bico_encerrantes ALTER COLUMN codigo SET DEFAULT nextval('bico_encerrantes_codigo_seq'::regclass);


--
-- TOC entry 2742 (class 2604 OID 23765040)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY bicos ALTER COLUMN codigo SET DEFAULT nextval('bicos_codigo_seq'::regclass);


--
-- TOC entry 2743 (class 2604 OID 23765041)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY bomba_fabricante ALTER COLUMN codigo SET DEFAULT nextval('bomba_fabricante_codigo_seq'::regclass);


--
-- TOC entry 2744 (class 2604 OID 23765042)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY bomba_modelo ALTER COLUMN codigo SET DEFAULT nextval('bomba_modelo_codigo_seq'::regclass);


--
-- TOC entry 2748 (class 2604 OID 23765043)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY bombas ALTER COLUMN codigo SET DEFAULT nextval('bombas_codigo_seq'::regclass);


--
-- TOC entry 2760 (class 2604 OID 23765044)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY caixa ALTER COLUMN codigo SET DEFAULT nextval('caixa_codigo_seq'::regclass);


--
-- TOC entry 2762 (class 2604 OID 23765045)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY caixa_conferncia ALTER COLUMN codigo SET DEFAULT nextval('caixa_conferncia_codigo_seq'::regclass);


--
-- TOC entry 2766 (class 2604 OID 23765046)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY caixa_movimento ALTER COLUMN codigo SET DEFAULT nextval('caixa_movimento_codigo_seq'::regclass);


--
-- TOC entry 2767 (class 2604 OID 23765047)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cargos ALTER COLUMN codigo SET DEFAULT nextval('cargos_codigo_seq'::regclass);


--
-- TOC entry 2771 (class 2604 OID 23765048)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cest_segmentos ALTER COLUMN codigo SET DEFAULT nextval('cest_segmentos_codigo_seq'::regclass);


--
-- TOC entry 2772 (class 2604 OID 23765049)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cnae ALTER COLUMN codigo SET DEFAULT nextval('cnae_codigo_seq'::regclass);


--
-- TOC entry 2773 (class 2604 OID 23765050)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cnae_secao ALTER COLUMN codigo SET DEFAULT nextval('cnae_sessao_codigo_seq'::regclass);


--
-- TOC entry 2794 (class 2604 OID 23765051)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contas_pagar ALTER COLUMN codigo SET DEFAULT nextval('contas_pagar_codigo_seq'::regclass);


--
-- TOC entry 2804 (class 2604 OID 23765052)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contas_receber ALTER COLUMN codigo SET DEFAULT nextval('contas_receber_codigo_seq'::regclass);


--
-- TOC entry 2805 (class 2604 OID 23765053)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cst_cest ALTER COLUMN codigo SET DEFAULT nextval('cst_cest_codigo_seq'::regclass);


--
-- TOC entry 2806 (class 2604 OID 23765054)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cst_cfop ALTER COLUMN codigo SET DEFAULT nextval('cst_cfop_codigo_seq'::regclass);


--
-- TOC entry 2807 (class 2604 OID 23765055)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cst_csosn ALTER COLUMN codigo SET DEFAULT nextval('cst_csosn_codigo_seq'::regclass);


--
-- TOC entry 2808 (class 2604 OID 23765056)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cst_icms ALTER COLUMN codigo SET DEFAULT nextval('cst_icms_codigo_seq'::regclass);


--
-- TOC entry 2809 (class 2604 OID 23765057)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cst_ipi ALTER COLUMN codigo SET DEFAULT nextval('cst_ipi_codigo_seq'::regclass);


--
-- TOC entry 2810 (class 2604 OID 23765058)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cst_piscofins ALTER COLUMN codigo SET DEFAULT nextval('cst_piscofins_codigo_seq'::regclass);


--
-- TOC entry 2816 (class 2604 OID 23765059)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cte ALTER COLUMN codigo SET DEFAULT nextval('cte_codigo_seq'::regclass);


--
-- TOC entry 2821 (class 2604 OID 23765060)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cte_enderecos ALTER COLUMN codigo SET DEFAULT nextval('cte_enderecos_codigo_seq'::regclass);


--
-- TOC entry 3143 (class 2604 OID 23769958)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cte_notas ALTER COLUMN codigo SET DEFAULT nextval('cte_notas_codigo_seq'::regclass);


--
-- TOC entry 3151 (class 2604 OID 23770079)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cte_parametros ALTER COLUMN codigo SET DEFAULT nextval('cte_parametros_codigo_seq'::regclass);


--
-- TOC entry 2822 (class 2604 OID 23765061)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cte_xml ALTER COLUMN codigo SET DEFAULT nextval('cte_xml_codigo_seq'::regclass);


--
-- TOC entry 2832 (class 2604 OID 23765062)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cupom ALTER COLUMN codigo SET DEFAULT nextval('cupom_codigo_seq'::regclass);


--
-- TOC entry 2834 (class 2604 OID 23765063)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY departamentos ALTER COLUMN codigo SET DEFAULT nextval('departamentos_codigo_seq'::regclass);


--
-- TOC entry 2841 (class 2604 OID 23765064)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY deposito ALTER COLUMN codigo SET DEFAULT nextval('deposito_codigo_seq'::regclass);


--
-- TOC entry 2842 (class 2604 OID 23765065)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY deposito_grupo_produto ALTER COLUMN codigo SET DEFAULT nextval('deposito_grupo_produto_codigo_seq'::regclass);


--
-- TOC entry 2849 (class 2604 OID 23765066)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY despesas_fixas ALTER COLUMN codigo SET DEFAULT nextval('despesas_fixas_codigo_seq'::regclass);


--
-- TOC entry 2852 (class 2604 OID 23765067)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY documento_series ALTER COLUMN codigo SET DEFAULT nextval('documento_series_codigo_seq'::regclass);


--
-- TOC entry 2861 (class 2604 OID 23765068)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY empresa_assinatura ALTER COLUMN codigo SET DEFAULT nextval('empresa_assinatura_codigo_seq'::regclass);


--
-- TOC entry 2865 (class 2604 OID 23765069)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY empresa_config ALTER COLUMN codigo SET DEFAULT nextval('empresa_config_codigo_seq'::regclass);


--
-- TOC entry 3146 (class 2604 OID 23770056)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY empresa_documentos ALTER COLUMN codigo SET DEFAULT nextval('empresa_documentos_codigo_seq'::regclass);


--
-- TOC entry 2868 (class 2604 OID 23765070)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY empresa_hostconfig ALTER COLUMN codigo SET DEFAULT nextval('empresa_hostconfig_codigo_seq'::regclass);


--
-- TOC entry 2869 (class 2604 OID 23765071)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY empresa_regras_negocio ALTER COLUMN codigo SET DEFAULT nextval('empresa_regras_negocio_codigo_seq'::regclass);


--
-- TOC entry 2877 (class 2604 OID 23765072)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY empresa_services ALTER COLUMN codigo SET DEFAULT nextval('empresa_services_codigo_seq'::regclass);


--
-- TOC entry 2880 (class 2604 OID 23765073)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY empresas ALTER COLUMN codigo SET DEFAULT nextval('empresas_codigo_seq'::regclass);


--
-- TOC entry 2882 (class 2604 OID 23765074)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY estoque ALTER COLUMN codigo SET DEFAULT nextval('estoque_codigo_seq'::regclass);


--
-- TOC entry 2884 (class 2604 OID 23765075)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY estoque_diario ALTER COLUMN codigo SET DEFAULT nextval('estoque_diario_codigo_seq'::regclass);


--
-- TOC entry 2889 (class 2604 OID 23765076)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY frotas ALTER COLUMN codigo SET DEFAULT nextval('frotas_codigo_seq'::regclass);


--
-- TOC entry 2890 (class 2604 OID 23765077)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY paises ALTER COLUMN codigo SET DEFAULT nextval('paises_codigo_seq'::regclass);


--
-- TOC entry 2897 (class 2604 OID 23765078)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedido_compra_itens ALTER COLUMN codigo SET DEFAULT nextval('pedido_compra_itens_codigo_seq'::regclass);


--
-- TOC entry 2902 (class 2604 OID 23765079)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedido_compras ALTER COLUMN codigo SET DEFAULT nextval('pedido_compras_codigo_seq'::regclass);


--
-- TOC entry 2907 (class 2604 OID 23765080)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedido_vendas ALTER COLUMN codigo SET DEFAULT nextval('pedido_vendas_codigo_seq'::regclass);


--
-- TOC entry 2914 (class 2604 OID 23765081)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedido_vendas_itens ALTER COLUMN codigo SET DEFAULT nextval('pedido_vendas_itens_codigo_seq'::regclass);


--
-- TOC entry 2917 (class 2604 OID 23765082)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_categorias ALTER COLUMN codigo SET DEFAULT nextval('pessoa_categorias_codigo_seq'::regclass);


--
-- TOC entry 2920 (class 2604 OID 23765083)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_cliente ALTER COLUMN codigo SET DEFAULT nextval('pessoa_cliente_codigo_seq'::regclass);


--
-- TOC entry 2923 (class 2604 OID 23765084)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_contabancaria ALTER COLUMN codigo SET DEFAULT nextval('pessoa_contabancaria_codigo_seq'::regclass);


--
-- TOC entry 2926 (class 2604 OID 23765085)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_endereco_cobranca ALTER COLUMN codigo SET DEFAULT nextval('pessoa_endereco_cobranca_codigo_seq'::regclass);


--
-- TOC entry 2929 (class 2604 OID 23765086)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_endereco_entrega ALTER COLUMN codigo SET DEFAULT nextval('pessoa_endereco_entrega_codigo_seq'::regclass);


--
-- TOC entry 2931 (class 2604 OID 23765087)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_funcionario ALTER COLUMN codigo SET DEFAULT nextval('pessoa_funcionario_codigo_seq'::regclass);


--
-- TOC entry 2932 (class 2604 OID 23765088)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_funcoes ALTER COLUMN codigo SET DEFAULT nextval('pessoa_funcoes_codigo_seq'::regclass);


--
-- TOC entry 2936 (class 2604 OID 23765089)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_grupos ALTER COLUMN codigo SET DEFAULT nextval('pessoa_grupos_codigo_seq'::regclass);


--
-- TOC entry 2940 (class 2604 OID 23765090)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_log ALTER COLUMN codigo SET DEFAULT nextval('pessoa_log_codigo_seq'::regclass);


--
-- TOC entry 2942 (class 2604 OID 23765091)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_regras ALTER COLUMN codigo SET DEFAULT nextval('pessoa_regras_codigo_seq'::regclass);


--
-- TOC entry 2945 (class 2604 OID 23765092)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_responsavel ALTER COLUMN codigo SET DEFAULT nextval('pessoa_responsavel_codigo_seq'::regclass);


--
-- TOC entry 2951 (class 2604 OID 23765093)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_saldo ALTER COLUMN codigo SET DEFAULT nextval('pessoa_saldo_codigo_seq'::regclass);


--
-- TOC entry 2953 (class 2604 OID 23765094)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_web ALTER COLUMN codigo SET DEFAULT nextval('pessoa_web_codigo_seq'::regclass);


--
-- TOC entry 2964 (class 2604 OID 23765095)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoas ALTER COLUMN codigo SET DEFAULT nextval('pessoas_codigo_seq'::regclass);


--
-- TOC entry 2968 (class 2604 OID 23765096)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_alerta ALTER COLUMN codigo SET DEFAULT nextval('produto_alerta_codigo_seq'::regclass);


--
-- TOC entry 2973 (class 2604 OID 23765097)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_categorias ALTER COLUMN codigo SET DEFAULT nextval('produto_categorias_codigo_seq'::regclass);


--
-- TOC entry 2974 (class 2604 OID 23765098)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_codigobarras ALTER COLUMN codigo SET DEFAULT nextval('produto_codigobarras_codigo_seq'::regclass);


--
-- TOC entry 2983 (class 2604 OID 23765099)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_empresas ALTER COLUMN codigo SET DEFAULT nextval('produto_empresa_codigo_seq'::regclass);


--
-- TOC entry 2985 (class 2604 OID 23765100)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_fornecedores ALTER COLUMN codigo SET DEFAULT nextval('produto_fornecedores_codigo_seq'::regclass);


--
-- TOC entry 2996 (class 2604 OID 23765101)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_grupos ALTER COLUMN codigo SET DEFAULT nextval('produto_grupos_codigo_seq'::regclass);


--
-- TOC entry 2997 (class 2604 OID 23765102)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_marcas ALTER COLUMN codigo SET DEFAULT nextval('produto_marcas_codigo_seq'::regclass);


--
-- TOC entry 2998 (class 2604 OID 23765103)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_modelos ALTER COLUMN codigo SET DEFAULT nextval('produto_modelos_codigo_seq'::regclass);


--
-- TOC entry 3003 (class 2604 OID 23765104)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_movimento ALTER COLUMN codigo SET DEFAULT nextval('produto_movimento_codigo_seq'::regclass);


--
-- TOC entry 3006 (class 2604 OID 23765105)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_movimento_manual ALTER COLUMN codigo SET DEFAULT nextval('produto_movimento_manual_codigo_seq'::regclass);


--
-- TOC entry 3011 (class 2604 OID 23765106)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_precos ALTER COLUMN codigo SET DEFAULT nextval('produto_precos_codigo_seq'::regclass);


--
-- TOC entry 3014 (class 2604 OID 23765107)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_regras ALTER COLUMN codigo SET DEFAULT nextval('produto_regras_codigo_seq'::regclass);


--
-- TOC entry 3019 (class 2604 OID 23765108)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_subgrupos ALTER COLUMN codigo SET DEFAULT nextval('produto_subgrupos_codigo_seq'::regclass);


--
-- TOC entry 3021 (class 2604 OID 23765109)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_unidade ALTER COLUMN codigo SET DEFAULT nextval('produto_unidade_codigo_seq'::regclass);


--
-- TOC entry 3032 (class 2604 OID 23765110)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY produtos ALTER COLUMN codigo SET DEFAULT nextval('produtos_codigo_seq'::regclass);


--
-- TOC entry 3037 (class 2604 OID 23765111)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_break ALTER COLUMN codigo SET DEFAULT nextval('system_break_codigo_seq'::regclass);


--
-- TOC entry 3039 (class 2604 OID 23765112)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_formulario_filtros ALTER COLUMN codigo SET DEFAULT nextval('system_formulario_filtros_codigo_seq'::regclass);


--
-- TOC entry 3043 (class 2604 OID 23765113)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_formularios ALTER COLUMN codigo SET DEFAULT nextval('system_formularios_codigo_seq'::regclass);


--
-- TOC entry 3046 (class 2604 OID 23765114)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_grupo_usuarios ALTER COLUMN codigo SET DEFAULT nextval('system_grupo_usuarios_codigo_seq'::regclass);


--
-- TOC entry 3047 (class 2604 OID 23765115)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_help ALTER COLUMN codigo SET DEFAULT nextval('system_help_codigo_seq'::regclass);


--
-- TOC entry 3051 (class 2604 OID 23765116)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_modulos ALTER COLUMN codigo SET DEFAULT nextval('system_modulos_codigo_seq'::regclass);


--
-- TOC entry 3056 (class 2604 OID 23765117)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_permissoes_grupo ALTER COLUMN codigo SET DEFAULT nextval('system_permissoes_grupo_codigo_seq'::regclass);


--
-- TOC entry 3061 (class 2604 OID 23765118)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_permissoes_usuario ALTER COLUMN codigo SET DEFAULT nextval('system_permissoes_usuario_codigo_seq'::regclass);


--
-- TOC entry 3065 (class 2604 OID 23765119)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_serie_documentos ALTER COLUMN codigo SET DEFAULT nextval('system_serie_documentos_codigo_seq'::regclass);


--
-- TOC entry 3069 (class 2604 OID 23765120)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_usuarios ALTER COLUMN codigo SET DEFAULT nextval('system_usuarios_codigo_seq'::regclass);


--
-- TOC entry 3070 (class 2604 OID 23765121)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_versao ALTER COLUMN codigo SET DEFAULT nextval('system_versao_codigo_seq'::regclass);


--
-- TOC entry 3074 (class 2604 OID 23765122)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_web_formularios ALTER COLUMN codigo SET DEFAULT nextval('system_web_formularios_codigo_seq'::regclass);


--
-- TOC entry 3077 (class 2604 OID 23765123)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_web_modulos ALTER COLUMN codigo SET DEFAULT nextval('system_web_modulos_codigo_seq'::regclass);


--
-- TOC entry 3081 (class 2604 OID 23765124)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_web_permissoes_usuario ALTER COLUMN codigo SET DEFAULT nextval('system_web_permissoes_usuario_codigo_seq'::regclass);


--
-- TOC entry 3083 (class 2604 OID 23765125)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_web_usuarios ALTER COLUMN codigo SET DEFAULT nextval('system_web_usuarios_codigo_seq'::regclass);


--
-- TOC entry 3084 (class 2604 OID 23765126)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tabela_campos ALTER COLUMN codigo SET DEFAULT nextval('tabela_campos_codigo_seq'::regclass);


--
-- TOC entry 3085 (class 2604 OID 23765127)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tabelas ALTER COLUMN codigo SET DEFAULT nextval('tabelas_codigo_seq'::regclass);


--
-- TOC entry 3086 (class 2604 OID 23765128)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipo_break ALTER COLUMN codigo SET DEFAULT nextval('tipo_break_codigo_seq'::regclass);


--
-- TOC entry 3087 (class 2604 OID 23765129)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipo_contas ALTER COLUMN codigo SET DEFAULT nextval('tipo_contas_codigo_seq'::regclass);


--
-- TOC entry 3091 (class 2604 OID 23765130)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipo_frota ALTER COLUMN codigo SET DEFAULT nextval('tipo_frota_codigo_seq'::regclass);


--
-- TOC entry 3093 (class 2604 OID 23765131)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipo_imovel ALTER COLUMN codigo SET DEFAULT nextval('tipo_imovel_codigo_seq'::regclass);


--
-- TOC entry 3095 (class 2604 OID 23765132)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipo_movimento_produto ALTER COLUMN codigo SET DEFAULT nextval('tipo_movimento_produto_codigo_seq'::regclass);


--
-- TOC entry 3111 (class 2604 OID 23765133)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipo_pagamentos ALTER COLUMN codigo SET DEFAULT nextval('tipo_pagamentos_codigo_seq'::regclass);


--
-- TOC entry 3121 (class 2604 OID 23765134)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY venda_itens ALTER COLUMN codigo SET DEFAULT nextval('venda_itens_codigo_seq'::regclass);


--
-- TOC entry 3129 (class 2604 OID 23765135)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY venda_pagamentos ALTER COLUMN codigo SET DEFAULT nextval('venda_pagamentos_codigo_seq'::regclass);


--
-- TOC entry 3141 (class 2604 OID 23765136)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY vendas ALTER COLUMN codigo SET DEFAULT nextval('vendas_codigo_seq'::regclass);


--
-- TOC entry 3156 (class 2606 OID 23767056)
-- Name: abastecimento_baixa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abastecimento_baixa
    ADD CONSTRAINT abastecimento_baixa_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3154 (class 2606 OID 23767058)
-- Name: abastecimento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abastecimento
    ADD CONSTRAINT abastecimento_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3158 (class 2606 OID 23767060)
-- Name: automacao_bombas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY automacao_bombas
    ADD CONSTRAINT automacao_bombas_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3160 (class 2606 OID 23767062)
-- Name: bancos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bancos
    ADD CONSTRAINT bancos_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3162 (class 2606 OID 23767064)
-- Name: bico_encerrante_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bico_encerrantes
    ADD CONSTRAINT bico_encerrante_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3164 (class 2606 OID 23767066)
-- Name: bico_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bicos
    ADD CONSTRAINT bico_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3166 (class 2606 OID 23767068)
-- Name: bico_unk_nr_bico; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bicos
    ADD CONSTRAINT bico_unk_nr_bico UNIQUE (nr_bico);


--
-- TOC entry 3168 (class 2606 OID 23767070)
-- Name: bico_unk_nr_logico; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bicos
    ADD CONSTRAINT bico_unk_nr_logico UNIQUE (nr_logico);


--
-- TOC entry 3170 (class 2606 OID 23767072)
-- Name: bomba_fabricante_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bomba_fabricante
    ADD CONSTRAINT bomba_fabricante_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3172 (class 2606 OID 23767074)
-- Name: bomba_modelo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bomba_modelo
    ADD CONSTRAINT bomba_modelo_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3174 (class 2606 OID 23767076)
-- Name: bombas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bombas
    ADD CONSTRAINT bombas_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3178 (class 2606 OID 23767078)
-- Name: caixa_conferncia_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY caixa_conferncia
    ADD CONSTRAINT caixa_conferncia_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3180 (class 2606 OID 23767080)
-- Name: caixa_movimento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY caixa_movimento
    ADD CONSTRAINT caixa_movimento_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3176 (class 2606 OID 23767082)
-- Name: caixa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY caixa
    ADD CONSTRAINT caixa_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3182 (class 2606 OID 23767084)
-- Name: cargos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cargos
    ADD CONSTRAINT cargos_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3185 (class 2606 OID 23767086)
-- Name: centro_custos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY centro_custos
    ADD CONSTRAINT centro_custos_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3187 (class 2606 OID 23767088)
-- Name: cest_segmentos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cest_segmentos
    ADD CONSTRAINT cest_segmentos_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3189 (class 2606 OID 23767090)
-- Name: cidades_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cidades
    ADD CONSTRAINT cidades_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3191 (class 2606 OID 23767092)
-- Name: cnae_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cnae
    ADD CONSTRAINT cnae_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3193 (class 2606 OID 23767094)
-- Name: cnae_sessao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cnae_secao
    ADD CONSTRAINT cnae_sessao_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3195 (class 2606 OID 23767096)
-- Name: conta_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY conta_empresa
    ADD CONSTRAINT conta_empresa_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3197 (class 2606 OID 23767098)
-- Name: contas_pagar_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contas_pagar
    ADD CONSTRAINT contas_pagar_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3199 (class 2606 OID 23767100)
-- Name: contas_receber_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contas_receber
    ADD CONSTRAINT contas_receber_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3201 (class 2606 OID 23767102)
-- Name: cst_cest_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cst_cest
    ADD CONSTRAINT cst_cest_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3203 (class 2606 OID 23767104)
-- Name: cst_cfop_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cst_cfop
    ADD CONSTRAINT cst_cfop_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3205 (class 2606 OID 23767106)
-- Name: cst_csosn_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cst_csosn
    ADD CONSTRAINT cst_csosn_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3207 (class 2606 OID 23767108)
-- Name: cst_icms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cst_icms
    ADD CONSTRAINT cst_icms_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3209 (class 2606 OID 23767110)
-- Name: cst_ipi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cst_ipi
    ADD CONSTRAINT cst_ipi_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3211 (class 2606 OID 23767112)
-- Name: cst_piscofins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cst_piscofins
    ADD CONSTRAINT cst_piscofins_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3215 (class 2606 OID 23767114)
-- Name: cte_enderecos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cte_enderecos
    ADD CONSTRAINT cte_enderecos_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3378 (class 2606 OID 23769962)
-- Name: cte_notas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cte_notas
    ADD CONSTRAINT cte_notas_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3382 (class 2606 OID 23770082)
-- Name: cte_parametros_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cte_parametros
    ADD CONSTRAINT cte_parametros_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3213 (class 2606 OID 23767116)
-- Name: cte_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cte
    ADD CONSTRAINT cte_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3217 (class 2606 OID 23767118)
-- Name: cte_xml_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cte_xml
    ADD CONSTRAINT cte_xml_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3219 (class 2606 OID 23767120)
-- Name: cupom_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cupom
    ADD CONSTRAINT cupom_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3221 (class 2606 OID 23767122)
-- Name: departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3225 (class 2606 OID 23767124)
-- Name: deposito_grupo_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY deposito_grupo_produto
    ADD CONSTRAINT deposito_grupo_produto_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3223 (class 2606 OID 23767126)
-- Name: deposito_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY deposito
    ADD CONSTRAINT deposito_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3227 (class 2606 OID 23767128)
-- Name: despesas_fixas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY despesas_fixas
    ADD CONSTRAINT despesas_fixas_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3229 (class 2606 OID 23767130)
-- Name: documento_series_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documento_series
    ADD CONSTRAINT documento_series_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3231 (class 2606 OID 23767132)
-- Name: documentos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documentos
    ADD CONSTRAINT documentos_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3233 (class 2606 OID 23767134)
-- Name: empresa_assinatura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY empresa_assinatura
    ADD CONSTRAINT empresa_assinatura_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3235 (class 2606 OID 23767136)
-- Name: empresa_config_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY empresa_config
    ADD CONSTRAINT empresa_config_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3380 (class 2606 OID 23770062)
-- Name: empresa_documentos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY empresa_documentos
    ADD CONSTRAINT empresa_documentos_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3237 (class 2606 OID 23767138)
-- Name: empresa_hostconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY empresa_hostconfig
    ADD CONSTRAINT empresa_hostconfig_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3239 (class 2606 OID 23767140)
-- Name: empresa_regras_negocio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY empresa_regras_negocio
    ADD CONSTRAINT empresa_regras_negocio_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3241 (class 2606 OID 23767142)
-- Name: empresa_services_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY empresa_services
    ADD CONSTRAINT empresa_services_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3243 (class 2606 OID 23767144)
-- Name: empresas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY empresas
    ADD CONSTRAINT empresas_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3247 (class 2606 OID 23767146)
-- Name: estoque_diario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY estoque_diario
    ADD CONSTRAINT estoque_diario_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3245 (class 2606 OID 23767148)
-- Name: estoque_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY estoque
    ADD CONSTRAINT estoque_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3249 (class 2606 OID 23767150)
-- Name: frotas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY frotas
    ADD CONSTRAINT frotas_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3251 (class 2606 OID 23767152)
-- Name: frotas_unk_placa; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY frotas
    ADD CONSTRAINT frotas_unk_placa UNIQUE (placa);


--
-- TOC entry 3253 (class 2606 OID 23767154)
-- Name: ncm_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ncm
    ADD CONSTRAINT ncm_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3255 (class 2606 OID 23767156)
-- Name: paises_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY paises
    ADD CONSTRAINT paises_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3257 (class 2606 OID 23767158)
-- Name: pedido_compra_itens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedido_compra_itens
    ADD CONSTRAINT pedido_compra_itens_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3259 (class 2606 OID 23767160)
-- Name: pedido_compras_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedido_compras
    ADD CONSTRAINT pedido_compras_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3263 (class 2606 OID 23767162)
-- Name: pedido_vendas_itens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedido_vendas_itens
    ADD CONSTRAINT pedido_vendas_itens_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3261 (class 2606 OID 23767164)
-- Name: pedido_vendas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedido_vendas
    ADD CONSTRAINT pedido_vendas_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3265 (class 2606 OID 23767166)
-- Name: pessoa_categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_categorias
    ADD CONSTRAINT pessoa_categorias_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3267 (class 2606 OID 23767168)
-- Name: pessoa_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_cliente
    ADD CONSTRAINT pessoa_cliente_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3269 (class 2606 OID 23767170)
-- Name: pessoa_contabancaria_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_contabancaria
    ADD CONSTRAINT pessoa_contabancaria_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3271 (class 2606 OID 23767172)
-- Name: pessoa_endereco_cobranca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_endereco_cobranca
    ADD CONSTRAINT pessoa_endereco_cobranca_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3273 (class 2606 OID 23767174)
-- Name: pessoa_endereco_entrega_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_endereco_entrega
    ADD CONSTRAINT pessoa_endereco_entrega_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3275 (class 2606 OID 23767176)
-- Name: pessoa_funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_funcionario
    ADD CONSTRAINT pessoa_funcionario_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3277 (class 2606 OID 23767178)
-- Name: pessoa_funcoes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_funcoes
    ADD CONSTRAINT pessoa_funcoes_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3279 (class 2606 OID 23767180)
-- Name: pessoa_grupos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_grupos
    ADD CONSTRAINT pessoa_grupos_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3281 (class 2606 OID 23767182)
-- Name: pessoa_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_log
    ADD CONSTRAINT pessoa_log_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3283 (class 2606 OID 23767184)
-- Name: pessoa_regras_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_regras
    ADD CONSTRAINT pessoa_regras_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3285 (class 2606 OID 23767186)
-- Name: pessoa_responsavel_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_responsavel
    ADD CONSTRAINT pessoa_responsavel_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3287 (class 2606 OID 23767188)
-- Name: pessoa_saldo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_saldo
    ADD CONSTRAINT pessoa_saldo_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3289 (class 2606 OID 23767190)
-- Name: pessoa_web_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_web
    ADD CONSTRAINT pessoa_web_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3292 (class 2606 OID 23767192)
-- Name: pessoas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoas
    ADD CONSTRAINT pessoas_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3294 (class 2606 OID 23767194)
-- Name: produto_alerta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_alerta
    ADD CONSTRAINT produto_alerta_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3296 (class 2606 OID 23767196)
-- Name: produto_categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_categorias
    ADD CONSTRAINT produto_categorias_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3298 (class 2606 OID 23767198)
-- Name: produto_codigobarras_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_codigobarras
    ADD CONSTRAINT produto_codigobarras_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3300 (class 2606 OID 23767200)
-- Name: produto_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_empresas
    ADD CONSTRAINT produto_empresa_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3302 (class 2606 OID 23767202)
-- Name: produto_fornecedor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_fornecedores
    ADD CONSTRAINT produto_fornecedor_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3304 (class 2606 OID 23767204)
-- Name: produto_grupos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_grupos
    ADD CONSTRAINT produto_grupos_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3306 (class 2606 OID 23767206)
-- Name: produto_marcas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_marcas
    ADD CONSTRAINT produto_marcas_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3308 (class 2606 OID 23767208)
-- Name: produto_modelos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_modelos
    ADD CONSTRAINT produto_modelos_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3312 (class 2606 OID 23767210)
-- Name: produto_movimento_manual_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_movimento_manual
    ADD CONSTRAINT produto_movimento_manual_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3310 (class 2606 OID 23767212)
-- Name: produto_movimento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_movimento
    ADD CONSTRAINT produto_movimento_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3314 (class 2606 OID 23767214)
-- Name: produto_precos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_precos
    ADD CONSTRAINT produto_precos_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3316 (class 2606 OID 23767216)
-- Name: produto_regras_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_regras
    ADD CONSTRAINT produto_regras_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3318 (class 2606 OID 23767218)
-- Name: produto_subgrupos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_subgrupos
    ADD CONSTRAINT produto_subgrupos_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3320 (class 2606 OID 23767220)
-- Name: produto_unidade_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_unidade
    ADD CONSTRAINT produto_unidade_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3322 (class 2606 OID 23767222)
-- Name: produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3324 (class 2606 OID 23767224)
-- Name: system_break_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_break
    ADD CONSTRAINT system_break_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3326 (class 2606 OID 23767226)
-- Name: system_formulario_filtros_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_formulario_filtros
    ADD CONSTRAINT system_formulario_filtros_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3328 (class 2606 OID 23767228)
-- Name: system_formularios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_formularios
    ADD CONSTRAINT system_formularios_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3330 (class 2606 OID 23767230)
-- Name: system_grupo_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_grupo_usuarios
    ADD CONSTRAINT system_grupo_usuarios_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3332 (class 2606 OID 23767232)
-- Name: system_help_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_help
    ADD CONSTRAINT system_help_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3334 (class 2606 OID 23767234)
-- Name: system_modulos_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_modulos
    ADD CONSTRAINT system_modulos_pk PRIMARY KEY (codigo);


--
-- TOC entry 3336 (class 2606 OID 23767236)
-- Name: system_permissoes_grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_permissoes_grupo
    ADD CONSTRAINT system_permissoes_grupo_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3338 (class 2606 OID 23767238)
-- Name: system_permissoes_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_permissoes_usuario
    ADD CONSTRAINT system_permissoes_usuario_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3340 (class 2606 OID 23767240)
-- Name: system_serie_documentos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_serie_documentos
    ADD CONSTRAINT system_serie_documentos_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3342 (class 2606 OID 23767242)
-- Name: system_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_usuarios
    ADD CONSTRAINT system_usuario_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3344 (class 2606 OID 23767244)
-- Name: system_versao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_versao
    ADD CONSTRAINT system_versao_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3346 (class 2606 OID 23767246)
-- Name: system_web_formularios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_web_formularios
    ADD CONSTRAINT system_web_formularios_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3348 (class 2606 OID 23767248)
-- Name: system_web_modulos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_web_modulos
    ADD CONSTRAINT system_web_modulos_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3350 (class 2606 OID 23767250)
-- Name: system_web_permissoes_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_web_permissoes_usuario
    ADD CONSTRAINT system_web_permissoes_usuario_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3352 (class 2606 OID 23767252)
-- Name: system_web_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_web_usuarios
    ADD CONSTRAINT system_web_usuarios_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3354 (class 2606 OID 23767254)
-- Name: tabela_campos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tabela_campos
    ADD CONSTRAINT tabela_campos_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3356 (class 2606 OID 23767256)
-- Name: tabelas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tabelas
    ADD CONSTRAINT tabelas_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3358 (class 2606 OID 23767258)
-- Name: tipo_break_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipo_break
    ADD CONSTRAINT tipo_break_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3360 (class 2606 OID 23767260)
-- Name: tipo_combustivel_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipo_combustivel
    ADD CONSTRAINT tipo_combustivel_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3362 (class 2606 OID 23767262)
-- Name: tipo_contas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipo_contas
    ADD CONSTRAINT tipo_contas_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3364 (class 2606 OID 23767264)
-- Name: tipo_frota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipo_frota
    ADD CONSTRAINT tipo_frota_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3366 (class 2606 OID 23767266)
-- Name: tipo_imovel_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipo_imovel
    ADD CONSTRAINT tipo_imovel_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3368 (class 2606 OID 23767268)
-- Name: tipo_movimento_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipo_movimento_produto
    ADD CONSTRAINT tipo_movimento_produto_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3370 (class 2606 OID 23767270)
-- Name: tipo_pagamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipo_pagamentos
    ADD CONSTRAINT tipo_pagamentos_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3374 (class 2606 OID 23767272)
-- Name: venda_pagamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY venda_pagamentos
    ADD CONSTRAINT venda_pagamentos_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3372 (class 2606 OID 23767274)
-- Name: vendas_itens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY venda_itens
    ADD CONSTRAINT vendas_itens_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3376 (class 2606 OID 23767276)
-- Name: vendas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vendas
    ADD CONSTRAINT vendas_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3183 (class 1259 OID 23767277)
-- Name: centro_custos_index_chave; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX centro_custos_index_chave ON centro_custos USING btree (chave);


--
-- TOC entry 3290 (class 1259 OID 23767278)
-- Name: pessoas_cnpj_ukey; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX pessoas_cnpj_ukey ON pessoas USING btree (cnpj);


--
-- TOC entry 3431 (class 2620 OID 23767279)
-- Name: trg_ae_abastecimentos; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_ae_abastecimentos AFTER INSERT OR DELETE OR UPDATE ON abastecimento FOR EACH ROW EXECUTE PROCEDURE baixa_abastecimento();


--
-- TOC entry 3437 (class 2620 OID 23767280)
-- Name: trg_ai_assoc_pessoa; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_ai_assoc_pessoa AFTER INSERT ON pessoas FOR EACH ROW EXECUTE PROCEDURE assoc_pessoa();


--
-- TOC entry 3441 (class 2620 OID 23767281)
-- Name: trg_ai_assoc_produto_empresa; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_ai_assoc_produto_empresa AFTER INSERT ON produtos FOR EACH ROW EXECUTE PROCEDURE assoc_produto_empresa();


--
-- TOC entry 3439 (class 2620 OID 23767282)
-- Name: trg_ai_grava_estoque_movimento; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_ai_grava_estoque_movimento AFTER INSERT ON produto_movimento FOR EACH ROW EXECUTE PROCEDURE grava_estoque_movimento();


--
-- TOC entry 3442 (class 2620 OID 23767283)
-- Name: trg_ai_grava_produto_estoque; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_ai_grava_produto_estoque AFTER INSERT ON produtos FOR EACH ROW EXECUTE PROCEDURE grava_produto_estoque();


--
-- TOC entry 3438 (class 2620 OID 23767284)
-- Name: trg_au_alterapreco; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_au_alterapreco AFTER UPDATE ON produto_empresas FOR EACH ROW EXECUTE PROCEDURE set_produtopreco_replica();


--
-- TOC entry 3435 (class 2620 OID 23767285)
-- Name: trg_bd_delete_pedido_venda_itens; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_bd_delete_pedido_venda_itens BEFORE DELETE ON pedido_vendas FOR EACH ROW EXECUTE PROCEDURE delete_pedido_venda_itens();


--
-- TOC entry 3446 (class 2620 OID 23767286)
-- Name: trg_bd_delete_venda_itens; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_bd_delete_venda_itens BEFORE DELETE ON vendas FOR EACH ROW EXECUTE PROCEDURE delete_venda_itens();


--
-- TOC entry 3440 (class 2620 OID 23767287)
-- Name: trg_bi_grava_movimento_manual; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_bi_grava_movimento_manual BEFORE INSERT ON produto_movimento_manual FOR EACH ROW EXECUTE PROCEDURE grava_movimento_manual();


--
-- TOC entry 3434 (class 2620 OID 23767288)
-- Name: trg_biu_grava_estoque_minimo; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_biu_grava_estoque_minimo BEFORE INSERT OR UPDATE ON estoque FOR EACH ROW EXECUTE PROCEDURE grava_estoque_minimo();


--
-- TOC entry 3443 (class 2620 OID 23767289)
-- Name: trg_biu_gravasenha; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_biu_gravasenha BEFORE INSERT OR UPDATE ON system_usuarios FOR EACH ROW EXECUTE PROCEDURE gravasenha();


--
-- TOC entry 3444 (class 2620 OID 23767290)
-- Name: trg_biu_md5Senha; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "trg_biu_md5Senha" BEFORE INSERT OR UPDATE ON system_web_usuarios FOR EACH ROW EXECUTE PROCEDURE md5senha();


--
-- TOC entry 3436 (class 2620 OID 23767291)
-- Name: trg_biud_control_movimento_empenho; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_biud_control_movimento_empenho BEFORE INSERT OR DELETE OR UPDATE ON pedido_vendas_itens FOR EACH ROW EXECUTE PROCEDURE control_movimento_empenho();


--
-- TOC entry 3445 (class 2620 OID 23767292)
-- Name: trg_biud_control_movimento_venda_itens; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_biud_control_movimento_venda_itens BEFORE INSERT OR DELETE OR UPDATE ON venda_itens FOR EACH ROW EXECUTE PROCEDURE control_movimento_venda_itens();


--
-- TOC entry 3432 (class 2620 OID 23767293)
-- Name: trg_biud_set_baixas_contas; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_biud_set_baixas_contas BEFORE INSERT OR DELETE OR UPDATE ON caixa_movimento FOR EACH ROW EXECUTE PROCEDURE set_baixas_contas();


--
-- TOC entry 3433 (class 2620 OID 23767294)
-- Name: trg_bu_set_baixas_pagamentos; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_bu_set_baixas_pagamentos BEFORE UPDATE ON contas_receber FOR EACH ROW EXECUTE PROCEDURE set_baixas_pagamentos();


--
-- TOC entry 3383 (class 2606 OID 23767295)
-- Name: centro_custos_fkey_empresas; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY centro_custos
    ADD CONSTRAINT centro_custos_fkey_empresas FOREIGN KEY (empresa) REFERENCES empresas(codigo);


--
-- TOC entry 3384 (class 2606 OID 23767300)
-- Name: deposito_grupo_produto_fkey_deposito; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY deposito_grupo_produto
    ADD CONSTRAINT deposito_grupo_produto_fkey_deposito FOREIGN KEY (deposito) REFERENCES deposito(codigo);


--
-- TOC entry 3385 (class 2606 OID 23767305)
-- Name: documentos_series_fkey_documentos; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documento_series
    ADD CONSTRAINT documentos_series_fkey_documentos FOREIGN KEY (tipo_documento) REFERENCES documentos(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3386 (class 2606 OID 23767310)
-- Name: empresas_fkey_pessoas; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY empresas
    ADD CONSTRAINT empresas_fkey_pessoas FOREIGN KEY (pessoa) REFERENCES pessoas(codigo) ON UPDATE CASCADE;


--
-- TOC entry 3389 (class 2606 OID 23767315)
-- Name: estoque_diario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY estoque_diario
    ADD CONSTRAINT estoque_diario_fkey FOREIGN KEY (produto) REFERENCES produtos(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3390 (class 2606 OID 23767320)
-- Name: estoque_diario_fkey_empresa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY estoque_diario
    ADD CONSTRAINT estoque_diario_fkey_empresa FOREIGN KEY (empresa) REFERENCES empresas(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3387 (class 2606 OID 23767325)
-- Name: estoque_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY estoque
    ADD CONSTRAINT estoque_fkey FOREIGN KEY (produto) REFERENCES produtos(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3388 (class 2606 OID 23767330)
-- Name: estoque_fkey_empresa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY estoque
    ADD CONSTRAINT estoque_fkey_empresa FOREIGN KEY (empresa) REFERENCES empresas(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3391 (class 2606 OID 23767335)
-- Name: pedido_compra_itens_fkey_pedido_compras; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedido_compra_itens
    ADD CONSTRAINT pedido_compra_itens_fkey_pedido_compras FOREIGN KEY (pedido) REFERENCES pedido_compras(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3392 (class 2606 OID 23767340)
-- Name: pedido_compra_itens_fkey_produtos; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedido_compra_itens
    ADD CONSTRAINT pedido_compra_itens_fkey_produtos FOREIGN KEY (produto) REFERENCES produtos(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3393 (class 2606 OID 23767345)
-- Name: pedido_compras_fkey_fornecedor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedido_compras
    ADD CONSTRAINT pedido_compras_fkey_fornecedor FOREIGN KEY (fornecedor) REFERENCES pessoas(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3394 (class 2606 OID 23767350)
-- Name: pedido_compras_fkey_representante; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedido_compras
    ADD CONSTRAINT pedido_compras_fkey_representante FOREIGN KEY (representante) REFERENCES pessoas(codigo) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3395 (class 2606 OID 23767355)
-- Name: pedido_vendas_fkey_cliente; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedido_vendas
    ADD CONSTRAINT pedido_vendas_fkey_cliente FOREIGN KEY (cliente) REFERENCES pessoas(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3396 (class 2606 OID 23767360)
-- Name: pedido_vendas_fkey_representante; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedido_vendas
    ADD CONSTRAINT pedido_vendas_fkey_representante FOREIGN KEY (representante) REFERENCES pessoas(codigo) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3397 (class 2606 OID 23767365)
-- Name: pedido_vendas_itens_fkey_pedido_vendas; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedido_vendas_itens
    ADD CONSTRAINT pedido_vendas_itens_fkey_pedido_vendas FOREIGN KEY (pedido) REFERENCES pedido_vendas(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3398 (class 2606 OID 23767370)
-- Name: pedido_vendas_itens_fkey_produtos; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedido_vendas_itens
    ADD CONSTRAINT pedido_vendas_itens_fkey_produtos FOREIGN KEY (produto) REFERENCES produtos(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3399 (class 2606 OID 23767375)
-- Name: pessoa_cliente_fkey_pessoas; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_cliente
    ADD CONSTRAINT pessoa_cliente_fkey_pessoas FOREIGN KEY (pessoa) REFERENCES pessoas(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3400 (class 2606 OID 23767380)
-- Name: pessoa_contabancaria_fkey_pessoas; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_contabancaria
    ADD CONSTRAINT pessoa_contabancaria_fkey_pessoas FOREIGN KEY (pessoa) REFERENCES pessoas(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3401 (class 2606 OID 23767385)
-- Name: pessoa_funcionario_fkey_pessoas; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_funcionario
    ADD CONSTRAINT pessoa_funcionario_fkey_pessoas FOREIGN KEY (pessoa) REFERENCES pessoas(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3402 (class 2606 OID 23767390)
-- Name: pessoa_web_fkey_pessoa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_web
    ADD CONSTRAINT pessoa_web_fkey_pessoa FOREIGN KEY (pessoa) REFERENCES pessoas(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3403 (class 2606 OID 23767395)
-- Name: produto_alerta_fkey_empresas; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_alerta
    ADD CONSTRAINT produto_alerta_fkey_empresas FOREIGN KEY (empresa) REFERENCES empresas(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3404 (class 2606 OID 23767400)
-- Name: produto_alerta_fkey_produto; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_alerta
    ADD CONSTRAINT produto_alerta_fkey_produto FOREIGN KEY (produto) REFERENCES produtos(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3405 (class 2606 OID 23767405)
-- Name: produto_codigobarras_fkey_produto; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_codigobarras
    ADD CONSTRAINT produto_codigobarras_fkey_produto FOREIGN KEY (produto) REFERENCES produtos(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3406 (class 2606 OID 23767410)
-- Name: produto_empresa_fkey_produto; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_empresas
    ADD CONSTRAINT produto_empresa_fkey_produto FOREIGN KEY (produto) REFERENCES produtos(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3407 (class 2606 OID 23767415)
-- Name: produto_fornecedor_fkey_pessoa_fornecedor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_fornecedores
    ADD CONSTRAINT produto_fornecedor_fkey_pessoa_fornecedor FOREIGN KEY (fornecedor) REFERENCES pessoas(codigo) ON UPDATE CASCADE ON DELETE SET DEFAULT;


--
-- TOC entry 3408 (class 2606 OID 23767420)
-- Name: produto_fornecedor_fkey_pessoa_representante; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_fornecedores
    ADD CONSTRAINT produto_fornecedor_fkey_pessoa_representante FOREIGN KEY (representante) REFERENCES pessoas(codigo) ON UPDATE CASCADE ON DELETE SET DEFAULT;


--
-- TOC entry 3409 (class 2606 OID 23767425)
-- Name: produto_fornecedor_fkey_produtos; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_fornecedores
    ADD CONSTRAINT produto_fornecedor_fkey_produtos FOREIGN KEY (produto) REFERENCES produtos(codigo) ON UPDATE CASCADE ON DELETE SET DEFAULT;


--
-- TOC entry 3410 (class 2606 OID 23767430)
-- Name: produto_movimento_fkey_empresa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_movimento
    ADD CONSTRAINT produto_movimento_fkey_empresa FOREIGN KEY (empresa) REFERENCES empresas(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3411 (class 2606 OID 23767435)
-- Name: produto_movimento_fkey_produtos; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_movimento
    ADD CONSTRAINT produto_movimento_fkey_produtos FOREIGN KEY (produto) REFERENCES produtos(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3412 (class 2606 OID 23767440)
-- Name: produto_movimento_manual_fkey_empresa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_movimento_manual
    ADD CONSTRAINT produto_movimento_manual_fkey_empresa FOREIGN KEY (empresa) REFERENCES empresas(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3413 (class 2606 OID 23767445)
-- Name: produto_movimento_manual_fkey_produtos; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_movimento_manual
    ADD CONSTRAINT produto_movimento_manual_fkey_produtos FOREIGN KEY (produto) REFERENCES produtos(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3414 (class 2606 OID 23767450)
-- Name: produto_precos_fkey_produto; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_precos
    ADD CONSTRAINT produto_precos_fkey_produto FOREIGN KEY (produto) REFERENCES produtos(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3415 (class 2606 OID 23767455)
-- Name: produto_precos_fkey_produto_regras; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produto_precos
    ADD CONSTRAINT produto_precos_fkey_produto_regras FOREIGN KEY (regra) REFERENCES produto_regras(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3416 (class 2606 OID 23767460)
-- Name: system_formulario_filtros_fkey_system_formularios; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_formulario_filtros
    ADD CONSTRAINT system_formulario_filtros_fkey_system_formularios FOREIGN KEY (formulario) REFERENCES system_formularios(codigo) ON UPDATE CASCADE;


--
-- TOC entry 3417 (class 2606 OID 23767465)
-- Name: system_formularios_fk_system_modulos; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_formularios
    ADD CONSTRAINT system_formularios_fk_system_modulos FOREIGN KEY (modulo) REFERENCES system_modulos(codigo) ON UPDATE CASCADE;


--
-- TOC entry 3418 (class 2606 OID 23767470)
-- Name: system_permissoes_grupo_fkey_formularios; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_permissoes_grupo
    ADD CONSTRAINT system_permissoes_grupo_fkey_formularios FOREIGN KEY (formulario) REFERENCES system_formularios(codigo) ON UPDATE CASCADE;


--
-- TOC entry 3419 (class 2606 OID 23767475)
-- Name: system_permissoes_grupo_fkey_grupo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_permissoes_grupo
    ADD CONSTRAINT system_permissoes_grupo_fkey_grupo FOREIGN KEY (grupo) REFERENCES system_grupo_usuarios(codigo) ON UPDATE CASCADE;


--
-- TOC entry 3420 (class 2606 OID 23767480)
-- Name: system_permissoes_usuario_fkey_formularios; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_permissoes_usuario
    ADD CONSTRAINT system_permissoes_usuario_fkey_formularios FOREIGN KEY (formulario) REFERENCES system_formularios(codigo) ON UPDATE CASCADE;


--
-- TOC entry 3421 (class 2606 OID 23767485)
-- Name: system_permissoes_usuario_fkey_usuarios; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_permissoes_usuario
    ADD CONSTRAINT system_permissoes_usuario_fkey_usuarios FOREIGN KEY (usuario) REFERENCES system_usuarios(codigo);


--
-- TOC entry 3422 (class 2606 OID 23767490)
-- Name: system_usuario_fkey_grupo_usuarios; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_usuarios
    ADD CONSTRAINT system_usuario_fkey_grupo_usuarios FOREIGN KEY (grupo) REFERENCES system_grupo_usuarios(codigo);


--
-- TOC entry 3423 (class 2606 OID 23767495)
-- Name: system_usuarios_fkey_pessoas; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_usuarios
    ADD CONSTRAINT system_usuarios_fkey_pessoas FOREIGN KEY (pessoa) REFERENCES pessoas(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3424 (class 2606 OID 23767500)
-- Name: system_web_formularios_fkey_modulos; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_web_formularios
    ADD CONSTRAINT system_web_formularios_fkey_modulos FOREIGN KEY (modulo) REFERENCES system_web_modulos(codigo) ON UPDATE CASCADE;


--
-- TOC entry 3425 (class 2606 OID 23767510)
-- Name: tabela_campos_fkey_tabelas; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tabela_campos
    ADD CONSTRAINT tabela_campos_fkey_tabelas FOREIGN KEY (tabela) REFERENCES tabelas(codigo) ON UPDATE CASCADE;


--
-- TOC entry 3428 (class 2606 OID 23767515)
-- Name: vendas_fkey_cliente; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vendas
    ADD CONSTRAINT vendas_fkey_cliente FOREIGN KEY (cliente) REFERENCES pessoas(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3429 (class 2606 OID 23767520)
-- Name: vendas_fkey_empresas; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vendas
    ADD CONSTRAINT vendas_fkey_empresas FOREIGN KEY (empresa) REFERENCES empresas(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3430 (class 2606 OID 23767525)
-- Name: vendas_fkey_representante; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vendas
    ADD CONSTRAINT vendas_fkey_representante FOREIGN KEY (representante) REFERENCES pessoas(codigo) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3426 (class 2606 OID 23767530)
-- Name: vendas_itens_fkey_produtos; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY venda_itens
    ADD CONSTRAINT vendas_itens_fkey_produtos FOREIGN KEY (produto) REFERENCES produtos(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3427 (class 2606 OID 23767535)
-- Name: vendas_itens_fkey_vendas; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY venda_itens
    ADD CONSTRAINT vendas_itens_fkey_vendas FOREIGN KEY (venda) REFERENCES vendas(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2018-05-05 01:58:35

--
-- PostgreSQL database dump complete
--

