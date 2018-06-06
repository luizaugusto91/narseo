inherited frmGridDespesasFixas: TfrmGridDespesasFixas
  Caption = 'Despesas Fixas'
  ExplicitLeft = -119
  ExplicitTop = 8
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Visible = False
    ExplicitWidth = 900
    inherited btnNovo: TButton
      ExplicitLeft = 516
    end
    inherited btnVisualizar: TButton
      ExplicitLeft = 612
    end
    inherited btnEditar: TButton
      ExplicitLeft = 708
    end
    inherited btnExcluir: TButton
      ExplicitLeft = 804
    end
  end
  inherited grpLista: TGroupBox
    ExplicitWidth = 888
    inherited pnlFuncoes: TPanel
      ExplicitLeft = 549
    end
    inherited Grid: TcxGrid
      ExplicitLeft = 192
      ExplicitTop = 17
      inherited View: TcxGridDBTableView
        OptionsView.ColumnAutoWidth = False
        object ColumnViewcodigo: TcxGridDBColumn
          Caption = '#ID'
          DataBinding.FieldName = 'codigo'
          Width = 60
        end
        object ColumnViewdata_registro: TcxGridDBColumn
          Caption = 'Registro'
          DataBinding.FieldName = 'data_registro'
          Width = 100
        end
        object ColumnViewdescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'descricao'
          Width = 250
        end
        object ColumnViewpessoa: TcxGridDBColumn
          Caption = 'Pessoal'
          DataBinding.FieldName = 'pessoa'
          Width = 260
        end
        object ColumnViewdia_vencimento: TcxGridDBColumn
          Caption = 'Dia'
          DataBinding.FieldName = 'dia_vencimento'
          Width = 40
        end
        object ColumnViewtipo_conta: TcxGridDBColumn
          Caption = 'Tipo'
          DataBinding.FieldName = 'tipo_conta'
          Width = 160
        end
        object ColumnViewtipo_pagamento: TcxGridDBColumn
          Caption = 'Pagamento'
          DataBinding.FieldName = 'tipo_pagamento'
          Width = 160
        end
        object ColumnViewtotal_parcelas: TcxGridDBColumn
          Caption = 'Parcelas'
          DataBinding.FieldName = 'total_parcelas'
          Width = 70
        end
        object ColumnViewvalor: TcxGridDBColumn
          Caption = 'Valor Total'
          DataBinding.FieldName = 'valor'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Width = 100
        end
        object ColumnViewparcela_atual: TcxGridDBColumn
          Caption = 'Atual'
          DataBinding.FieldName = 'parcela_atual'
          Width = 70
        end
        object ColumnViewvalor_parcela: TcxGridDBColumn
          Caption = 'Valor'
          DataBinding.FieldName = 'valor_parcela'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Width = 70
        end
        object ColumnViewdocumento: TcxGridDBColumn
          Caption = 'Documento'
          DataBinding.FieldName = 'documento'
          Width = 100
        end
        object ColumnViewultimo_registro: TcxGridDBColumn
          Caption = 'Ultimo registro'
          DataBinding.FieldName = 'ultimo_registro'
          Width = 100
        end
        object ColumnViewcompra: TcxGridDBColumn
          Caption = 'Compra'
          DataBinding.FieldName = 'compra'
          Width = 70
        end
        object ColumnViewdespesa: TcxGridDBColumn
          Caption = 'Despesa'
          DataBinding.FieldName = 'despesa'
          Width = 60
        end
        object ColumnViewquitada: TcxGridDBColumn
          Caption = 'Quitada'
          DataBinding.FieldName = 'quitada'
          Width = 60
        end
        object ColumnViewinativo: TcxGridDBColumn
          Caption = 'Inativo'
          DataBinding.FieldName = 'inativo'
          Width = 60
        end
      end
    end
    inherited pnlFiltros: TPanel
      ExplicitLeft = 580
    end
  end
  inherited Ribbon: TdxRibbon
    ExplicitWidth = 900
    inherited MTabRegistros: TdxRibbonTab
      Index = 0
    end
  end
  inherited stb: TStatusBar
    ExplicitWidth = 900
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO despesas_fixas'
      
        '  (descricao, intervalo, valor, vencimento, centro_custos, tipo_' +
        'pagamento, prefixo, limite, ultimo)'
      'VALUES'
      
        '  (:descricao, :intervalo, :valor, :vencimento, :centro_custos, ' +
        ':tipo_pagamento, :prefixo, :limite, :ultimo)')
    SQLDelete.Strings = (
      'DELETE FROM despesas_fixas'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE despesas_fixas'
      'SET'
      
        '  descricao = :descricao, intervalo = :intervalo, valor = :valor' +
        ', vencimento = :vencimento, centro_custos = :centro_custos, tipo' +
        '_pagamento = :tipo_pagamento, prefixo = :prefixo, limite = :limi' +
        'te, ultimo = :ultimo'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM despesas_fixas'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT descricao, intervalo, valor, vencimento, centro_custos, t' +
        'ipo_pagamento, prefixo, limite, ultimo FROM despesas_fixas'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM despesas_fixas'
      ''
      ') t')
    SQL.Strings = (
      'SELECT df.codigo, '
      #9'df.empresa, '
      #9'df.data_registro, '
      #9'df.descricao, '
      #9'df.dia_vencimento, '
      #9'df.tipo_conta as cd_tipo_conto,'
      #9'tc.descricao as tipo_conta, '
      #9'df.tipo_pagamento as cd_tipo_pagamento,'
      #9'tp.descricao as tipo_pagamento, '
      #9'df.centro_custo, '
      #9'df.valor, '
      #9'df.total_parcelas, '
      #9'df.parcela_atual, '
      #9'df.valor_parcela, '
      #9'df.juros_dia, '
      #9'df.juros_porc, '
      #9'df.juros, '
      #9'df.desconto_porc, '
      #9'df.desconto, '
      #9'df.documento, '
      #9'df.ultimo_registro, '
      #9'df.pessoa as cd_pessoa,'
      #9'coalesce(ps.fantasia,'#39'N'#195'O IDENTIFICADO'#39') as pessoa, '
      #9'df.observacoes, '
      #9'df.nfe, '
      #9'df.cd_nfentrada, '
      #9'df.chave_nfe, '
      #9'df.serie, '
      #9'df.compra, '
      #9'df.quitada, '
      #9'df.despesa, '
      #9'df.inativo'
      '   FROM despesas_fixas df'
      '   LEFT JOIN pessoas ps on ps.codigo = df.pessoa'
      '   LEFT JOIN tipo_contas tc on tc.codigo = df.tipo_conta'
      
        '   left join tipo_pagamentos tp on tp.codigo = df.tipo_pagamento' +
        ';')
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited BarManager: TdxBarManager
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarOpcoes: TdxBar
      FloatClientWidth = 65
      FloatClientHeight = 216
    end
    inherited BarOutros: TdxBar
      FloatClientWidth = 76
      FloatClientHeight = 21
    end
    inherited BarSistem: TdxBar
      FloatClientWidth = 51
      FloatClientHeight = 108
    end
    inherited MnNovo: TdxBarLargeButton
      OnClick = MnNovoClick
    end
    inherited MnVisualizar: TdxBarLargeButton
      OnClick = MnVisualizarClick
    end
    inherited MnEditar: TdxBarLargeButton
      OnClick = MnEditarClick
    end
    inherited MnExcluir: TdxBarLargeButton
      OnClick = MnExcluirClick
    end
  end
end
