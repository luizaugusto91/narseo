unit unDMCTe;

interface

uses
  System.SysUtils, System.Classes, unDMBasico, Data.DB, MemDS, DBAccess, Uni,
  unSystem, unParametros, unSEFAZ, pcnConversao, pcteConversaoCTe, pcnAuxiliar,
  ACBrBase, ACBrDFe, ACBrCTe, ACBrUtil, Math;

type
  TdmCTe = class(TdmBasico)
    qCTe: TUniQuery;
    dsCTe: TUniDataSource;
    qRemetente: TUniQuery;
    qDestinatario: TUniQuery;
    qOperacacoes: TUniQuery;
    qEmitente: TUniQuery;
    qDocumento: TUniQuery;
    qFrota: TUniQuery;
    procedure qCTeAfterOpen(DataSet: TDataSet);
    procedure qCTeAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure GetCTe(iCTE: Integer);
    procedure GerarCTe(iCTE: Integer);
    { Public declarations }
  end;

var
  dmCTe: TdmCTe;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
uses unConnection;
{$R *.dfm}

{ TdmCTe }

procedure TdmCTe.GerarCTe(iCTE: Integer);
var
  UF, aux: string;
  iConhecimento, iAmbiente: Integer;
  New: Boolean;
begin
  with Sefaz.ACBrCTe.Conhecimentos.Add.CTe do
    begin
      GetCTe(iCTE);
      if (qCTe.FieldByName('conhecimento').IsNull) or (qCTe.FieldByName('conhecimento').AsString = '') or (qCTe.FieldByName('conhecimento').AsInteger = 0) then
        begin
          New := True;
          iAmbiente := Connection.qHostConfig.FieldByName('sefaz_ambiente').AsInteger;
          qDocumento.Open;
            if Connection.qHostConfig.FieldByName('sefaz_ambiente').AsInteger = 1 then
              iConhecimento := qDocumento.FieldByName('producao').AsInteger
            else
              iConhecimento := qDocumento.FieldByName('homologacao').AsInteger;
          qDocumento.Close;
        end
      else
        begin
          New := False;
          iConhecimento := qCTe.FieldByName('conhecimento').AsInteger;
        end;
      qSQL.Close;
      qSQL.SQL.Clear;
      qSQL.SQL.Text := 'UPDATE cte SET conhecimento = ' + IntToStr(iConhecimento) + ' WHERE codigo = ' + IntToStr(iCTE);
      qSQL.Execute;
      // Dados de Identifica��o do CT-e

      UF := Copy(qRemetente.FieldByName('id_cidade').AsString,1,2);
      infCTe.Id := IntToStr(iConhecimento);
      Ide.cUF:=strtoint(uf);
      Ide.cCT :=-1;  // C�digo baseado no cte
      Ide.CFOP := StrToInt(LimpaTexto(qCTe.FieldByName('natureza_operacao_chave').AsString));

      ide.natOp := qCTe.FieldByName('natureza_operacao').AsString;
      if qCTe.FieldByName('despacho').AsInteger = 0 then
        Ide.forPag := fpPago
      else
        Ide.forPag := fpAPagar;
      Ide.modelo := 57;
      Ide.serie := 1; //serie unica
      ide.cCT := iConhecimento;
      Ide.nCT := iConhecimento;
      Ide.dhEmi := Now;
      Ide.tpImp := tiRetrato;

      // TpcnTipoEmissao = (teNormal, teContingencia, teSCAN, teDPEC, teFSDA);
      //Ide.tpEmis:=teNormal;

      // TpcteTipoCTe = (tcNormal, tcComplemento, tcAnulacao, tcSubstituto);
      Ide.tpCTe := tcNormal;

      // TpcnProcessoEmissao = (peAplicativoContribuinte, peAvulsaFisco, peAvulsaContribuinte, peContribuinteAplicativoFisco);
      Ide.procEmi := peAplicativoContribuinte;
      Ide.verProc := '4.0';
      // Ide.refCTE:=''; CAMPO OPCIONAL

      // ***********************************************************************
      Ide.cMunEnv := qCTe.FieldByName('remetente_id_cidade').AsInteger;     //qryremetente'cidade'.Value;
      Ide.xMunEnv := qCTe.FieldByName('remetente_cidade').AsString;
      Ide.UFEnv := qCTe.FieldByName('remetente_uf').AsString;

      // TpcteModal = (mdRodoviario, mdAereo, mdAquaviario, mdFerroviario, mdDutoviario);
      Ide.modal := mdRodoviario;

      // TpcteTipoServico = (tsNormal, tsSubcontratacao, tsRedespacho, tsIntermediario);
      Ide.tpServ := tsNormal;

      // Origem da Presta��o
      Ide.cMunIni := qRemetente.FieldByName('id_cidade').AsInteger;
      Ide.xMunIni := qRemetente.FieldByName('cidade').AsString;
      Ide.UFIni := qRemetente.FieldByName('uf').AsString;

      // Destino da Presta��o
      Ide.cMunFim := qDestinatario.FieldByName('id_cidade').AsInteger;
      Ide.xMunFim := qDestinatario.FieldByName('cidade').AsString;
      Ide.UFFim := qDestinatario.FieldByName('uf').AsString;

      // TpcteRetira = (rtSim, rtNao);
      Ide.retira := rtSim;

      // TOMADOR PODE SER DEST, REMET, REC, EXP OU OUTROS, EM CASO DE OUTROS PREENCHER
      //DADOS
      Ide.Toma03.Toma:=tmDestinatario;

      compl.xObs := qCTe.FieldByName('observacao').AsString;

      // ***** Dados do Emitente ***********************************************
      aux:=stringReplace(qEmitente.FieldByName('cnpj').AsString, '.', '', [rfReplaceAll]);
      aux:=stringReplace(aux, '/', '', []);
      aux:=stringReplace(aux, '-', '', []);
      emit.CNPJ:=aux;
      if (trim(qEmitente.FieldByName('ie').AsString)='') or (trim(qRemetente.FieldByName('ie').AsString)='ISENTO') then
        Emit.IE:='1234567890'
      else
        Emit.IE := trim(qEmitente.FieldByName('ie').AsString);

      Emit.xNome := qEmitente.FieldByName('nome').AsString;
      Emit.xFant := qEmitente.FieldByName('fantasia').AsString;
      Emit.EnderEmit.xLgr := qEmitente.FieldByName('endereco').AsString;
      Emit.EnderEmit.nro := qEmitente.FieldByName('endereco_numero').AsString;
      Emit.EnderEmit.xCpl := qEmitente.FieldByName('complemento').AsString;
      Emit.EnderEmit.xBairro := qEmitente.FieldByName('bairro').AsString;

      Emit.EnderEmit.cMun := qEmitente.FieldByName('id_cidade').AsInteger;
      Emit.EnderEmit.xMun := qEmitente.FieldByName('cidade').AsString;
      Emit.EnderEmit.CEP := qEmitente.FieldByName('cep').AsInteger;
      Emit.EnderEmit.UF := qEmitente.FieldByName('uf').AsString;
      Emit.EnderEmit.fone := qEmitente.FieldByName('tel1').AsString;

      // ***** Dados do Remetente **********************************************
      if qCTe.FieldByName('id_remetente').AsInteger <> 0 then
        begin
          Rem.xNome := qRemetente.FieldByName('nome').AsString;
          Rem.xFant := qRemetente.FieldByName('fantasia').AsString;
          Rem.EnderReme.xLgr := qRemetente.FieldByName('endereco').AsString;
          Rem.EnderReme.nro := qRemetente.FieldByName('endereco_numero').AsString;
          Rem.EnderReme.xCpl := qRemetente.FieldByName('complemento').AsString;
          Rem.EnderReme.xBairro := qRemetente.FieldByName('bairro').AsString;

          Rem.EnderReme.cMun := qRemetente.FieldByName('id_cidade').AsInteger;
          Rem.EnderReme.xMun := qRemetente.FieldByName('cidade').AsString;
          Rem.EnderReme.CEP := qRemetente.FieldByName('cep').AsInteger;
          Rem.EnderReme.UF := qRemetente.FieldByName('uf').AsString;
          Rem.EnderReme.cPais:=1058;
          Rem.EnderReme.xPais:='BRASIL';

          aux:=stringReplace(qRemetente.FieldByName('cnpj').AsString, '.', '', [rfReplaceAll]);
          aux:=stringReplace(aux, '/', '', []);
          aux:=stringReplace(aux, '-', '', []);

          rem.CNPJCPF := aux;
          rem.IE := qRemetente.FieldByName('ie').AsString;
          Rem.fone := qRemetente.FieldByName('tel1').AsString;

          // Rela��o das Notas Fiscais
          //
          // Nota Fiscal
          if qCTe.FieldByName('tipo_nota').AsString = 'NF' then
            begin
              with infCTeNorm.infDoc.infNF.Add do
                begin
                  serie := qCTe.FieldByName('nf_serie').AsString;
                  nDoc  := qCTe.FieldByName('nota').AsString;
                  dEmi  := qCTe.FieldByName('data_nfe').Value;
                  vBC   := RoundTo(qCTe.FieldByName('nf_bcicms').AsFloat, -2);
                  vICMS := RoundTo(qCTe.FieldByName('nf_icms').AsFloat, -2);
                  vBCST := RoundTo(qCTe.FieldByName('nf_bc_icms_st').AsFloat, -2);
                  vST   := RoundTo(qCTe.FieldByName('nf_icms_st').AsFloat, -2);
                  vProd := RoundTo(qCTe.FieldByName('nf_total_prod').AsFloat, -2);
                  vNF   := RoundTo(qCTe.FieldByName('valor_nf').AsFloat, -2);
                  nCFOP := StrToInt(LimpaTexto(qCTe.FieldByName('nf_cfop_chave').AsString));
                end;
            end;
            // Nota Fiscal Eletr�nica
          if qCTe.FieldByName('tipo_nota').AsString = 'NFE' then
            begin
              with infCTeNorm.infDoc.infNFe.Add do
                begin
                  chave := stringreplace(qCTe.FieldByName('nfe_chave').AsString, '.', '', [rfReplaceAll]);
                end;
            end;
        end;

      // ***** Dados do Destinatario *******************************************
      if qCTe.FieldByName('id_destinatario').AsInteger <> 0 then
        begin
          Dest.xNome := qDestinatario.FieldByName('nome').AsString;
          Dest.EnderDest.xLgr := qDestinatario.FieldByName('endereco').AsString;
          Dest.EnderDest.nro := qDestinatario.FieldByName('endereco_numero').AsString;
          Dest.EnderDest.xCpl := qDestinatario.FieldByName('complemento').AsString;
          Dest.EnderDest.xBairro := qDestinatario.FieldByName('bairro').AsString;

          Dest.EnderDest.cMun := qDestinatario.FieldByName('id_cidade').AsInteger;
          Dest.EnderDest.xMun:= qDestinatario.FieldByName('cidade').AsString;
          Dest.EnderDest.CEP := qDestinatario.FieldByName('cep').AsInteger;
          Dest.EnderDest.UF := qDestinatario.FieldByName('uf').AsString;
          Dest.EnderDest.cPais := 1058;
          Dest.EnderDest.xPais := 'BRASIL';

          aux:=stringReplace(qDestinatario.FieldByName('cnpj').AsString, '.', '', [rfReplaceAll]);
          aux:=stringReplace(aux, '/', '', []);
          aux:=stringReplace(aux, '-', '', []);
          dest.CNPJCPF:=aux;
          dest.IE := qDestinatario.FieldByName('ie').AsString;

          Dest.fone := qDestinatario.FieldByName('tel1').AsString;
          //  Dest.ISUF:=Trim(DM_CTA.PessoaFJInscSUF.AsString);   CAMPO OPCIONAL
        end;

      // ***** Dados do Expedidor (REMETENTE) **********************************
      if qCTe.FieldByName('id_remetente').AsInteger <> 0 then
        begin
          Exped.xNome := qRemetente.FieldByName('nome').AsString;
          Exped.EnderExped.xLgr := qRemetente.FieldByName('endereco').AsString;
          Exped.EnderExped.nro := qRemetente.FieldByName('endereco_numero').AsString;
          Exped.EnderExped.xCpl := qRemetente.FieldByName('complemento').AsString;
          Exped.EnderExped.xBairro := qRemetente.FieldByName('bairro').AsString;

          Exped.EnderExped.cMun := qRemetente.FieldByName('id_cidade').AsInteger;
          Exped.EnderExped.xMun := qRemetente.FieldByName('cidade').AsString;
          Exped.EnderExped.CEP := qRemetente.FieldByName('cep').AsInteger;
          Exped.EnderExped.UF := qRemetente.FieldByName('uf').AsString;
          Exped.EnderExped.cPais:=1058;
          Exped.EnderExped.xPais:='BRASIL';

          aux:=stringReplace(qRemetente.FieldByName('cnpj').AsString, '.', '', [rfReplaceAll]);
          aux:=stringReplace(aux, '/', '', []);
          aux:=stringReplace(aux, '-', '', []);

          Exped.CNPJCPF := aux;
          Exped.IE := qRemetente.FieldByName('ie').AsString;
          Exped.fone := qRemetente.FieldByName('tel1').AsString;
        end;

      // ***** Dados do Recebedor (DESTINATARIO) *******************************
      if qCTe.FieldByName('id_destinatario').AsInteger <> 0 then
        begin
          Receb.xNome := qDestinatario.FieldByName('nome').AsString;
          Receb.EnderReceb.xLgr := qDestinatario.FieldByName('endereco').AsString;
          Receb.EnderReceb.nro := qDestinatario.FieldByName('endereco_numero').AsString;
          Receb.EnderReceb.xCpl := qDestinatario.FieldByName('complemento').AsString;
          Receb.EnderReceb.xBairro := qDestinatario.FieldByName('bairro').AsString;

          Receb.EnderReceb.cMun := qDestinatario.FieldByName('id_cidade').AsInteger;
          Receb.EnderReceb.xMun := qDestinatario.FieldByName('cidade').AsString;
          Receb.EnderReceb.CEP := qDestinatario.FieldByName('cep').AsInteger;
          Receb.EnderReceb.UF := qDestinatario.FieldByName('uf').AsString;
          Receb.EnderReceb.cPais := 1058;
          Receb.EnderReceb.xPais := 'BRASIL';

          aux:=stringReplace(qDestinatario.FieldByName('cnpj').AsString, '.', '', [rfReplaceAll]);
          aux:=stringReplace(aux, '/', '', []);
          aux:=stringReplace(aux, '-', '', []);
          Receb.CNPJCPF :=aux;
          Receb.IE := qDestinatario.FieldByName('ie').AsString;
          Receb.fone := qDestinatario.FieldByName('tel1').AsString;
        end;

      //  Valores da Presta��o de Servi�o
      vPrest.vTPrest := RoundTo(qCTe.FieldByName('prestacao').AsFloat, -2);
      vPrest.vRec    := RoundTo(qCTe.FieldByName('prestacao').AsFloat, -2);
      with vPrest.comp.Add do
        begin
          xNome := 'FRETE';
          vComp := RoundTo(qCTe.FieldByName('valor_frete').asFloat, -2);
        end;

      // ***** Valores dos Impostos
      //
      // TpcnCSTIcms = (cst00, cst10, cst20, cst30, cst40, cst41, cst45, cst50, cst51, cst60, cst70, cst80, cst81, cst90);
      // 80 e 81 apenas para CTe
      //                CASO NOSSO � PADR�O 00
      Imp.ICMS.SituTrib    := cst00;
      Imp.ICMS.ICMS00.CST   := cst00; // Tributa��o Normal ICMS
      Imp.ICMS.ICMS00.vBC   := RoundTo(qCTe.FieldByName('basecalc_icms').AsFloat, -2);
      Imp.ICMS.ICMS00.pICMS := RoundTo(qCTe.FieldByName('aliquota').AsFloat, -2);
      Imp.ICMS.ICMS00.vICMS := RoundTo(qCTe.FieldByName('valor_icms').AsFloat, -2);

      // ***** Informa��es da Carga ********************************************
      infCTeNorm.infCarga.vCarga   := RoundTo(qCTe.FieldByName('valor_nf').AsFloat, -2);
      infCTeNorm.infCarga.proPred := qCTe.FieldByName('especie_volume').AsString;
      infCTeNorm.infCarga.xOutCat := qCTe.FieldByName('natureza_carga').AsString;

      // UnidMed = (uM3,uKG, uTON, uUNIDADE, uLITROS);
      with infCTeNorm.infCarga.InfQ.Add do
        begin
          if qCTe.FieldByName('un_med').AsString = 'M3' then
            begin
              cUnid  := uM3;
              tpMed  := 'M3';
            end;
          if qCTe.FieldByName('un_med').AsString = 'KG' then
            begin
              cUnid  := uKG;
              tpMed  := 'Kg';
            end;
          if qCTe.FieldByName('un_med').AsString = 'TON' then
            begin
              cUnid  := uTON;
              tpMed  := 'Tonelada';
            end;
          if qCTe.FieldByName('un_med').AsString = 'UNIDADE' then
            begin
              cUnid  := uUNIDADE;
              tpMed  := 'Unidade';
            end;
          if qCTe.FieldByName('un_med').AsString = 'LITROS' then
            begin
              cUnid  := uLITROS;
              tpMed  := 'Litros';
            end;
          if qCTe.FieldByName('un_med').AsString = 'MMBTU' then
            begin
              cUnid  := uMMBTU;
              tpMed  := 'MMBtu';
            end;
          if qCTe.FieldByName('un_med').AsString = 'LT' then
            begin
              cUnid  := uLITROS;
              tpMed  := 'Litros';
            end;
          qCarga := RoundTo(qCTe.FieldByName('qtde_volume').AsFloat, -2);
        end;

      // ***** Dados do Modal Rodovi�rio ***************************************
      infCTeNorm.rodo.RNTRC := PreencheEsquerda(qFrota.FieldByName('rntrc').AsString,'0',8);
      infCTeNorm.rodo.dPrev:=(qCTe.FieldByName('data_entrega').AsDateTime);

      with infCTeNorm.seg.Add do
        begin
          if qCTe.FieldByName('seguro_resp').Value = '0' then respSeg:=rsRemetente;
          if qCTe.FieldByName('seguro_resp').Value = '1' then respSeg:=rsExpedidor;
          if qCTe.FieldByName('seguro_resp').Value = '2' then respSeg:=rsRecebedor;
          if qCTe.FieldByName('seguro_resp').Value = '3' then respSeg:=rsDestinatario;
          if qCTe.FieldByName('seguro_resp').Value = '4' then respSeg:=rsEmitenteCTe;
          if qCTe.FieldByName('seguro_resp').Value = '5' then respSeg:=rsTomadorServico;
          xSeg:=Copy(trim(qCTe.FieldByName('seguro_seg').AsString), 1, 30);
          nApol:=Copy(trim(qCTe.FieldByName('seguro_apol').AsString), 1, 20);
          nAver:=qCTe.FieldByName('seguro_averb').AsString;
        end;

      // TpcteLocacao = (ltNao, ltsim);
      //Rodo.Lota:=ltNao;   }
    end;
  // Altera o Numero do Documento no registro
  if new then
    begin
      qSQL.Close;
      qSQL.SQL.Clear;
      qSQL.SQL.Text := 'UPDATE documento_series SET ';
      if iAmbiente = 1 then
        qSQL.SQL.Add('producao = ' + IntTOStr(iConhecimento + 1) + ' ')
      else
        qSQL.SQL.Add('homologacao = ' + IntTOStr(iConhecimento + 1) + ' ');
      qSQL.SQL.Add('WHERE tipo_documento = 57 and serie = 1;');
      qSQL.Execute;
    end;
end;

procedure TdmCTe.GetCTe(iCTE: Integer);
begin
  // Abre dados da CTe
  if qCTe.Active = True then
    qCTe.Close;
  qCTe.ParamByName('codigo').AsInteger := iCTE;
  qCTe.Open;
  // Abre dados do Emitente
  if qEmitente.Active = True then
    qEmitente.Close;
  qEmitente.ParamByName('codigo').asInteger := Parametros.cdsParametros.FieldByName('empresa').asInteger;
  qEmitente.Open;
end;

procedure TdmCTe.qCTeAfterClose(DataSet: TDataSet);
begin
  inherited;
  qRemetente.Close;
  qDestinatario.Close;
  qFrota.Close;
end;

procedure TdmCTe.qCTeAfterOpen(DataSet: TDataSet);
begin
  inherited;
  qRemetente.Open;
  qDestinatario.Open;
  qFrota.Open;
end;

end.
