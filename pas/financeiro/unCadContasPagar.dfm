inherited frmCadContasPagar: TfrmCadContasPagar
  Caption = 'Contas a Pagar'
  ClientHeight = 538
  ClientWidth = 990
  ExplicitWidth = 996
  ExplicitHeight = 567
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 503
    Width = 990
    ExplicitTop = 503
    ExplicitWidth = 990
    inherited btnCancelar: TButton
      Left = 713
      ExplicitLeft = 713
    end
    inherited btnSalvar: TButton
      Left = 806
      ExplicitLeft = 806
    end
    inherited btnFechar: TButton
      Left = 899
      ExplicitLeft = 899
    end
  end
  inherited grpContent: TGroupBox
    Width = 980
    Height = 451
    ExplicitWidth = 980
    ExplicitHeight = 451
    object lblCodigo: TLabel
      Left = 10
      Top = 24
      Width = 41
      Height = 15
      Caption = 'C'#243'digo:'
      FocusControl = edtCodigo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 111
      Top = 24
      Width = 88
      Height = 15
      Caption = 'Data do registro:'
      FocusControl = edtdata_registro
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 311
      Top = 24
      Width = 110
      Height = 15
      Caption = 'Data do Movimento:'
      FocusControl = edtdata_movimento
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblusuario: TLabel
      Left = 533
      Top = 24
      Width = 43
      Height = 15
      Caption = 'Usu'#225'rio:'
      FocusControl = edtusuario
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTipoConta: TLabel
      Left = 10
      Top = 53
      Width = 77
      Height = 15
      Caption = 'Tipo de Conta:'
      FocusControl = edttipo_conta
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValor: TLabel
      Left = 360
      Top = 53
      Width = 30
      Height = 15
      Caption = 'Valor:'
      FocusControl = edtvalor
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblParcela: TLabel
      Left = 502
      Top = 53
      Width = 41
      Height = 15
      Caption = 'Parcela:'
      FocusControl = edtparcela
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblParcelas: TLabel
      Left = 604
      Top = 53
      Width = 79
      Height = 15
      Caption = 'N'#186' de Parcelas:'
      FocusControl = edttotal_parcelas
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblVencimento: TLabel
      Left = 745
      Top = 53
      Width = 67
      Height = 15
      Caption = 'Vencimento:'
      FocusControl = edtvencimento
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbldocumento: TLabel
      Left = 10
      Top = 82
      Width = 67
      Height = 15
      Caption = 'Documento:'
      FocusControl = edtdocumento
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbljuros_porc: TLabel
      Left = 206
      Top = 82
      Width = 44
      Height = 15
      Caption = 'Juros %:'
      FocusControl = edtjuros_porc
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbljuros: TLabel
      Left = 312
      Top = 82
      Width = 48
      Height = 15
      Caption = 'Juros R$:'
      FocusControl = edtjuros
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbldesconto_porc: TLabel
      Left = 432
      Top = 82
      Width = 67
      Height = 15
      Caption = 'Desconto %:'
      FocusControl = edtdesconto_porc
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbldesconto: TLabel
      Left = 561
      Top = 82
      Width = 71
      Height = 15
      Caption = 'Desconto R$:'
      FocusControl = edtdesconto
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblMoraDia: TLabel
      Left = 704
      Top = 82
      Width = 52
      Height = 15
      Caption = 'Juros Dia:'
      FocusControl = edtMoraDia
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCarencia: TLabel
      Left = 818
      Top = 82
      Width = 48
      Height = 15
      Caption = 'Carencia:'
      FocusControl = edtcarencia
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCredor: TLabel
      Left = 10
      Top = 111
      Width = 46
      Height = 15
      Caption = 'Cedente:'
      FocusControl = edtCredor
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDescricao: TLabel
      Left = 432
      Top = 111
      Width = 55
      Height = 15
      Caption = 'Descri'#231#227'o:'
      FocusControl = edtdescricao
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblcentrocustos: TLabel
      Left = 10
      Top = 140
      Width = 92
      Height = 15
      Caption = 'Centro de Custos:'
      FocusControl = edtcentro_custo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblcontaorigem: TLabel
      Left = 10
      Top = 169
      Width = 93
      Height = 15
      Caption = 'Conta de Origem:'
      FocusControl = edtconta_origem
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCompra: TLabel
      Left = 165
      Top = 169
      Width = 45
      Height = 15
      Caption = 'Compra:'
      FocusControl = edtcompra
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbldata_pagto: TLabel
      Left = 302
      Top = 169
      Width = 109
      Height = 15
      Caption = 'Data do Pagamento:'
      FocusControl = edtdata_pgto
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNFe: TLabel
      Left = 10
      Top = 198
      Width = 39
      Height = 15
      Caption = 'DOC-e:'
      FocusControl = edtnfe
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSerie: TLabel
      Left = 114
      Top = 198
      Width = 29
      Height = 15
      Caption = 'Serie:'
      FocusControl = edtserie
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblcnpj: TLabel
      Left = 201
      Top = 198
      Width = 30
      Height = 15
      Caption = 'CNPJ:'
      FocusControl = edtcnpj
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTipoPagamento: TLabel
      Left = 561
      Top = 140
      Width = 64
      Height = 15
      Caption = 'Pagamento:'
      FocusControl = edttipo_pagamento
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblChaveNFe: TLabel
      Left = 381
      Top = 198
      Width = 35
      Height = 15
      Caption = 'Chave:'
      FocusControl = edtchave_nfe
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCodigo: TcxDBSpinEdit
      Left = 57
      Top = 21
      DataBinding.DataField = 'codigo'
      DataBinding.DataSource = ds
      Enabled = False
      Properties.SpinButtons.Visible = False
      Style.Color = clBtnFace
      TabOrder = 0
      Width = 48
    end
    object edtdata_registro: TcxDBDateEdit
      Left = 205
      Top = 21
      DataBinding.DataField = 'data_registro'
      DataBinding.DataSource = ds
      Enabled = False
      TabOrder = 1
      Width = 100
    end
    object edtdata_movimento: TcxDBDateEdit
      Left = 427
      Top = 21
      DataBinding.DataField = 'data_movimento'
      DataBinding.DataSource = ds
      TabOrder = 2
      OnExit = grpContentExit
      Width = 100
    end
    object edtusuario: TcxDBSpinEdit
      Left = 582
      Top = 21
      DataBinding.DataField = 'usuario'
      DataBinding.DataSource = ds
      Properties.ReadOnly = True
      Properties.SpinButtons.Visible = False
      TabOrder = 3
      OnExit = grpContentExit
      Width = 50
    end
    object cbbusuario: TcxDBLookupComboBox
      Left = 638
      Top = 21
      DataBinding.DataField = 'usuario'
      DataBinding.DataSource = ds
      Properties.KeyFieldNames = 'codigo'
      Properties.ListColumns = <
        item
          Caption = 'Nome'
          Width = 200
          FieldName = 'fantasia'
        end>
      Properties.ListSource = dsUsuario
      Properties.ReadOnly = True
      TabOrder = 4
      OnExit = grpContentExit
      Width = 331
    end
    object edttipo_conta: TcxDBSpinEdit
      Left = 93
      Top = 50
      DataBinding.DataField = 'tipo_conta'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 5
      OnExit = grpContentExit
      Width = 50
    end
    object edtvalor: TcxDBCalcEdit
      Left = 396
      Top = 50
      DataBinding.DataField = 'valor'
      DataBinding.DataSource = ds
      TabOrder = 7
      OnExit = grpContentExit
      Width = 100
    end
    object edtparcela: TcxDBSpinEdit
      Left = 548
      Top = 50
      DataBinding.DataField = 'parcela'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 8
      OnEnter = edtparcelaEnter
      OnExit = grpContentExit
      Width = 50
    end
    object edttotal_parcelas: TcxDBSpinEdit
      Left = 689
      Top = 50
      DataBinding.DataField = 'total_parcelas'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 9
      OnExit = grpContentExit
      Width = 50
    end
    object cbbTipoConta: TcxDBLookupComboBox
      Left = 149
      Top = 50
      DataBinding.DataField = 'tipo_conta'
      DataBinding.DataSource = ds
      Properties.KeyFieldNames = 'codigo'
      Properties.ListColumns = <
        item
          Caption = 'Descri'#231#227'o'
          Width = 300
          FieldName = 'descricao'
        end>
      Properties.ListSource = dsTipoConta
      Properties.ReadOnly = False
      TabOrder = 6
      OnExit = grpContentExit
      Width = 205
    end
    object edtvencimento: TcxDBDateEdit
      Left = 818
      Top = 50
      DataBinding.DataField = 'vencimento'
      DataBinding.DataSource = ds
      TabOrder = 10
      OnExit = grpContentExit
      OnKeyDown = edtvencimentoKeyDown
      Width = 151
    end
    object edtdocumento: TcxDBTextEdit
      Left = 83
      Top = 79
      DataBinding.DataField = 'documento'
      DataBinding.DataSource = ds
      TabOrder = 11
      OnExit = grpContentExit
      Width = 117
    end
    object edtjuros_porc: TcxDBCalcEdit
      Left = 256
      Top = 79
      DataBinding.DataField = 'juros_porc'
      DataBinding.DataSource = ds
      TabOrder = 12
      OnExit = grpContentExit
      Width = 50
    end
    object edtjuros: TcxDBCalcEdit
      Left = 366
      Top = 79
      DataBinding.DataField = 'juros'
      DataBinding.DataSource = ds
      TabOrder = 13
      OnExit = grpContentExit
      Width = 60
    end
    object edtdesconto_porc: TcxDBCalcEdit
      Left = 505
      Top = 79
      DataBinding.DataField = 'desconto_porc'
      DataBinding.DataSource = ds
      TabOrder = 14
      OnExit = grpContentExit
      Width = 50
    end
    object edtdesconto: TcxDBCurrencyEdit
      Left = 638
      Top = 79
      DataBinding.DataField = 'desconto'
      DataBinding.DataSource = ds
      TabOrder = 15
      OnExit = grpContentExit
      Width = 60
    end
    object edtMoraDia: TcxDBCalcEdit
      Left = 762
      Top = 79
      DataBinding.DataField = 'juros_dia'
      DataBinding.DataSource = ds
      TabOrder = 16
      OnExit = grpContentExit
      Width = 50
    end
    object edtcarencia: TcxDBSpinEdit
      Left = 872
      Top = 79
      DataBinding.DataField = 'carencia'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 17
      OnExit = grpContentExit
      Width = 97
    end
    object edtCredor: TcxDBSpinEdit
      Left = 62
      Top = 108
      DataBinding.DataField = 'pessoa'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 18
      OnExit = grpContentExit
      OnKeyPress = edtCredorKeyPress
      Width = 50
    end
    object cbbCredor: TcxDBLookupComboBox
      Left = 118
      Top = 108
      DataBinding.DataField = 'pessoa'
      DataBinding.DataSource = ds
      Properties.KeyFieldNames = 'codigo'
      Properties.ListColumns = <
        item
          Caption = 'Nome'
          Width = 200
          FieldName = 'fantasia'
        end>
      Properties.ListSource = dsPessoas
      Properties.ReadOnly = False
      TabOrder = 19
      OnExit = grpContentExit
      Width = 308
    end
    object edtdescricao: TcxDBTextEdit
      Left = 493
      Top = 108
      DataBinding.DataField = 'descricao'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      TabOrder = 20
      OnExit = grpContentExit
      Width = 476
    end
    object edtcentro_custo: TcxDBTextEdit
      Left = 108
      Top = 137
      DataBinding.DataField = 'centro_custo'
      DataBinding.DataSource = ds
      TabOrder = 21
      OnExit = grpContentExit
      Width = 80
    end
    object cbbCentroCustos: TcxDBLookupComboBox
      Left = 194
      Top = 137
      DataBinding.DataField = 'centro_custo'
      DataBinding.DataSource = ds
      Properties.KeyFieldNames = 'codigo'
      Properties.ListColumns = <
        item
          Caption = 'Pai'
          Width = 50
          FieldName = 'chave'
        end
        item
          Caption = 'Descri'#231#227'o'
          Width = 200
          FieldName = 'descricao'
        end>
      Properties.ListFieldIndex = 1
      Properties.ListSource = dsCentroCustos
      Properties.ReadOnly = False
      TabOrder = 22
      OnExit = grpContentExit
      Width = 361
    end
    object edtconta_origem: TcxDBSpinEdit
      Left = 109
      Top = 166
      DataBinding.DataField = 'conta_origem'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 25
      OnExit = grpContentExit
      Width = 50
    end
    object cbbdesmembrada: TcxDBCheckBox
      Left = 523
      Top = 166
      Caption = 'Desmenbrada'
      DataBinding.DataField = 'desmembrada'
      DataBinding.DataSource = ds
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI Semibold'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 28
      Width = 98
    end
    object cbbquitada: TcxDBCheckBox
      Left = 627
      Top = 166
      Caption = 'Quitada'
      DataBinding.DataField = 'quitada'
      DataBinding.DataSource = ds
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI Semibold'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 29
      Width = 69
    end
    object edtcompra: TcxDBSpinEdit
      Left = 216
      Top = 166
      DataBinding.DataField = 'compra'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 26
      OnExit = grpContentExit
      Width = 80
    end
    object edtdata_pgto: TcxDBDateEdit
      Left = 417
      Top = 166
      DataBinding.DataField = 'data_pgto'
      DataBinding.DataSource = ds
      TabOrder = 27
      OnExit = grpContentExit
      Width = 100
    end
    object edtnfe: TcxDBSpinEdit
      Left = 55
      Top = 195
      DataBinding.DataField = 'nfe'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 31
      OnExit = grpContentExit
      Width = 53
    end
    object edtserie: TcxDBSpinEdit
      Left = 149
      Top = 195
      DataBinding.DataField = 'serie'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 32
      OnExit = grpContentExit
      Width = 46
    end
    object edtcnpj: TcxDBTextEdit
      Left = 237
      Top = 195
      DataBinding.DataField = 'cnpj'
      DataBinding.DataSource = ds
      TabOrder = 33
      OnExit = grpContentExit
      Width = 138
    end
    object grpDetalhesCompra: TGroupBox
      Left = 10
      Top = 224
      Width = 959
      Height = 105
      Caption = ' Detalhes da compra '
      Enabled = False
      TabOrder = 35
    end
    object grpObservacoes: TGroupBox
      Left = 10
      Top = 335
      Width = 959
      Height = 105
      Caption = ' Observa'#231#245'es '
      TabOrder = 36
      object mmoobservacoes: TcxDBMemo
        AlignWithMargins = True
        Left = 5
        Top = 20
        Align = alClient
        DataBinding.DataField = 'observacoes'
        DataBinding.DataSource = ds
        Properties.CharCase = ecUpperCase
        TabOrder = 0
        Height = 80
        Width = 949
      end
    end
    object edttipo_pagamento: TcxDBSpinEdit
      Left = 631
      Top = 137
      DataBinding.DataField = 'tipo_pagamento'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 23
      OnExit = grpContentExit
      Width = 50
    end
    object cbbTipoPagamento: TcxDBLookupComboBox
      Left = 687
      Top = 137
      DataBinding.DataField = 'tipo_pagamento'
      DataBinding.DataSource = ds
      Properties.KeyFieldNames = 'codigo'
      Properties.ListColumns = <
        item
          Caption = 'Descri'#231#227'o'
          Width = 300
          FieldName = 'descricao'
        end>
      Properties.ListSource = dsTipoPagamento
      Properties.ReadOnly = False
      TabOrder = 24
      OnExit = grpContentExit
      Width = 282
    end
    object edtchave_nfe: TcxDBTextEdit
      Left = 423
      Top = 195
      DataBinding.DataField = 'chave_nfe'
      DataBinding.DataSource = ds
      TabOrder = 34
      OnExit = grpContentExit
      Width = 546
    end
    object cbbdespesa: TcxDBCheckBox
      Left = 702
      Top = 166
      Caption = 'Despesa'
      DataBinding.DataField = 'despesa'
      DataBinding.DataSource = ds
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI Semibold'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 30
      Width = 121
    end
  end
  inherited pnlHelp: TPanel
    Width = 981
    ExplicitWidth = 981
    inherited mmoHelp: TMemo
      Width = 934
      ExplicitWidth = 934
    end
  end
  inherited ds: TUniDataSource
    Left = 576
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO contas_pagar'
      
        '  (empresa, data_movimento, usuario, tipo_conta, valor, parcela,' +
        ' total_parcelas, tipo_pagamento, centro_custo, vencimento, valor' +
        '_pgto, juros_porc, juros, desconto_porc, desconto, documento, da' +
        'ta_pgto, juros_dia, carencia, pessoa, descricao, condicao_pagame' +
        'nto, conta_origem, desmembrada, quitada, empresa_referente, empr' +
        'esa_origem, multa, observacoes, nfe, cd_nfentrada, chave_nfe, se' +
        'rie, cnpj, data_agend, vezes_agend, compra, mao_de_obra, despesa' +
        ')'
      'VALUES'
      
        '  (:empresa, :data_movimento, :usuario, :tipo_conta, :valor, :pa' +
        'rcela, :total_parcelas, :tipo_pagamento, :centro_custo, :vencime' +
        'nto, :valor_pgto, :juros_porc, :juros, :desconto_porc, :desconto' +
        ', :documento, :data_pgto, :juros_dia, :carencia, :pessoa, :descr' +
        'icao, :condicao_pagamento, :conta_origem, :desmembrada, :quitada' +
        ', :empresa_referente, :empresa_origem, :multa, :observacoes, :nf' +
        'e, :cd_nfentrada, :chave_nfe, :serie, :cnpj, :data_agend, :vezes' +
        '_agend, :compra, :mao_de_obra, :despesa)')
    SQLDelete.Strings = (
      'DELETE FROM contas_pagar'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE contas_pagar'
      'SET'
      
        '  empresa = :empresa, data_registro = :data_registro, data_movim' +
        'ento = :data_movimento, usuario = :usuario, tipo_conta = :tipo_c' +
        'onta, valor = :valor, parcela = :parcela, total_parcelas = :tota' +
        'l_parcelas, tipo_pagamento = :tipo_pagamento, centro_custo = :ce' +
        'ntro_custo, vencimento = :vencimento, valor_pgto = :valor_pgto, ' +
        'juros_porc = :juros_porc, juros = :juros, desconto_porc = :desco' +
        'nto_porc, desconto = :desconto, documento = :documento, data_pgt' +
        'o = :data_pgto, juros_dia = :juros_dia, carencia = :carencia, pe' +
        'ssoa = :pessoa, descricao = :descricao, condicao_pagamento = :co' +
        'ndicao_pagamento, conta_origem = :conta_origem, desmembrada = :d' +
        'esmembrada, quitada = :quitada, empresa_referente = :empresa_ref' +
        'erente, empresa_origem = :empresa_origem, multa = :multa, observ' +
        'acoes = :observacoes, nfe = :nfe, cd_nfentrada = :cd_nfentrada, ' +
        'chave_nfe = :chave_nfe, serie = :serie, cnpj = :cnpj, data_agend' +
        ' = :data_agend, vezes_agend = :vezes_agend, compra = :compra, ma' +
        'o_de_obra = :mao_de_obra, despesa = :despesa'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM contas_pagar'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT empresa, data_registro, data_movimento, usuario, tipo_con' +
        'ta, valor, parcela, total_parcelas, tipo_pagamento, centro_custo' +
        ', vencimento, valor_pgto, juros_porc, juros, desconto_porc, desc' +
        'onto, documento, data_pgto, juros_dia, carencia, pessoa, descric' +
        'ao, condicao_pagamento, conta_origem, desmembrada, quitada, empr' +
        'esa_referente, empresa_origem, multa, observacoes, nfe, cd_nfent' +
        'rada, chave_nfe, serie, cnpj, data_agend, vezes_agend, compra, m' +
        'ao_de_obra, despesa FROM contas_pagar'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM contas_pagar'
      ''
      ') t')
    SQL.Strings = (
      
        'SELECT codigo, empresa, data_registro, data_movimento, usuario, ' +
        'tipo_conta, '
      
        '       valor, parcela, total_parcelas, tipo_pagamento, centro_cu' +
        'sto, '
      
        '       vencimento, valor_pgto, juros_porc, juros, desconto_porc,' +
        ' desconto, '
      
        '       documento, data_pgto, juros_dia, carencia, pessoa, descri' +
        'cao, '
      
        '       condicao_pagamento, conta_origem, desmembrada, quitada, e' +
        'mpresa_referente, '
      
        '       empresa_origem, multa, observacoes, nfe, cd_nfentrada, ch' +
        'ave_nfe, '
      
        '       serie, cnpj, data_agend, vezes_agend, compra, mao_de_obra' +
        ', despesa'
      '  FROM contas_pagar'
      ' WHERE codigo = :codigo;')
    Left = 536
    object qConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qConsultaempresa: TIntegerField
      FieldName = 'empresa'
    end
    object qConsultadata_registro: TDateTimeField
      FieldName = 'data_registro'
    end
    object qConsultadata_movimento: TDateField
      FieldName = 'data_movimento'
      Required = True
    end
    object qConsultausuario: TIntegerField
      FieldName = 'usuario'
      Required = True
    end
    object qConsultatipo_conta: TIntegerField
      DisplayLabel = 'Tipo da conta'
      FieldName = 'tipo_conta'
      Required = True
    end
    object qConsultavalor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      Required = True
    end
    object qConsultaparcela: TIntegerField
      DisplayLabel = 'Parcela'
      FieldName = 'parcela'
      Required = True
    end
    object qConsultatotal_parcelas: TIntegerField
      DisplayLabel = 'N'#186' de Parcelas'
      FieldName = 'total_parcelas'
      Required = True
    end
    object qConsultatipo_pagamento: TIntegerField
      DisplayLabel = 'Pagamento'
      FieldName = 'tipo_pagamento'
      Required = True
    end
    object qConsultacentro_custo: TStringField
      DisplayLabel = 'Centro de Custos'
      FieldName = 'centro_custo'
      Required = True
    end
    object qConsultavencimento: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'vencimento'
      Required = True
    end
    object qConsultavalor_pgto: TCurrencyField
      FieldName = 'valor_pgto'
    end
    object qConsultajuros_porc: TFloatField
      FieldName = 'juros_porc'
    end
    object qConsultajuros: TFloatField
      FieldName = 'juros'
    end
    object qConsultadesconto_porc: TFloatField
      FieldName = 'desconto_porc'
    end
    object qConsultadesconto: TCurrencyField
      FieldName = 'desconto'
    end
    object qConsultadocumento: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'documento'
      Required = True
      Size = 15
    end
    object qConsultadata_pgto: TDateField
      FieldName = 'data_pgto'
    end
    object qConsultajuros_dia: TFloatField
      FieldName = 'juros_dia'
    end
    object qConsultacarencia: TIntegerField
      FieldName = 'carencia'
    end
    object qConsultapessoa: TIntegerField
      FieldName = 'pessoa'
    end
    object qConsultadescricao: TStringField
      FieldName = 'descricao'
      Size = 70
    end
    object qConsultacondicao_pagamento: TIntegerField
      FieldName = 'condicao_pagamento'
    end
    object qConsultaconta_origem: TLargeintField
      FieldName = 'conta_origem'
    end
    object qConsultadesmembrada: TBooleanField
      FieldName = 'desmembrada'
    end
    object qConsultaquitada: TBooleanField
      FieldName = 'quitada'
    end
    object qConsultaempresa_referente: TIntegerField
      FieldName = 'empresa_referente'
    end
    object qConsultaempresa_origem: TIntegerField
      FieldName = 'empresa_origem'
    end
    object qConsultamulta: TFloatField
      FieldName = 'multa'
    end
    object qConsultaobservacoes: TMemoField
      FieldName = 'observacoes'
      BlobType = ftMemo
    end
    object qConsultanfe: TIntegerField
      FieldName = 'nfe'
    end
    object qConsultacd_nfentrada: TIntegerField
      FieldName = 'cd_nfentrada'
    end
    object qConsultachave_nfe: TStringField
      FieldName = 'chave_nfe'
      Size = 60
    end
    object qConsultaserie: TIntegerField
      FieldName = 'serie'
    end
    object qConsultacnpj: TStringField
      FieldName = 'cnpj'
    end
    object qConsultadata_agend: TDateField
      FieldName = 'data_agend'
    end
    object qConsultavezes_agend: TIntegerField
      FieldName = 'vezes_agend'
    end
    object qConsultacompra: TIntegerField
      FieldName = 'compra'
    end
    object qConsultamao_de_obra: TBooleanField
      FieldName = 'mao_de_obra'
    end
    object qConsultadespesa: TBooleanField
      FieldName = 'despesa'
      Required = True
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 492
  end
  object qPessoas: TUniQuery
    Tag = 7000
    SQLInsert.Strings = (
      'INSERT INTO pedido_compras'
      
        '  (empresa, fornecedor, representante, data_pedido, previsao_ent' +
        'rega, data_compra, data_entrada, status)'
      'VALUES'
      
        '  (:empresa, :fornecedor, :representante, :data_pedido, :previsa' +
        'o_entrega, :data_compra, :data_entrada, :status)')
    SQLDelete.Strings = (
      'DELETE FROM pedido_compras'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE pedido_compras'
      'SET'
      
        '  empresa = :empresa, fornecedor = :fornecedor, representante = ' +
        ':representante, data_pedido = :data_pedido, previsao_entrega = :' +
        'previsao_entrega, data_compra = :data_compra, data_entrada = :da' +
        'ta_entrada, status = :status'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM pedido_compras'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT empresa, fornecedor, representante, data_pedido, previsao' +
        '_entrega, data_compra, data_entrada, status FROM pedido_compras'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM pedido_compras'
      ''
      ') t')
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT codigo, nome, fantasia, cnpj'
      '  FROM pessoas WHERE inativo = FALSE;')
    Left = 648
  end
  object dsPessoas: TUniDataSource
    DataSet = qPessoas
    Left = 688
  end
  object qUsuario: TUniQuery
    Tag = 7000
    SQLInsert.Strings = (
      'INSERT INTO pedido_compras'
      
        '  (empresa, fornecedor, representante, data_pedido, previsao_ent' +
        'rega, data_compra, data_entrada, status)'
      'VALUES'
      
        '  (:empresa, :fornecedor, :representante, :data_pedido, :previsa' +
        'o_entrega, :data_compra, :data_entrada, :status)')
    SQLDelete.Strings = (
      'DELETE FROM pedido_compras'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE pedido_compras'
      'SET'
      
        '  empresa = :empresa, fornecedor = :fornecedor, representante = ' +
        ':representante, data_pedido = :data_pedido, previsao_entrega = :' +
        'previsao_entrega, data_compra = :data_compra, data_entrada = :da' +
        'ta_entrada, status = :status'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM pedido_compras'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT empresa, fornecedor, representante, data_pedido, previsao' +
        '_entrega, data_compra, data_entrada, status FROM pedido_compras'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM pedido_compras'
      ''
      ') t')
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT codigo, nome, fantasia, cnpj'
      '  FROM pessoas')
    Left = 768
  end
  object dsUsuario: TUniDataSource
    DataSet = qUsuario
    Left = 808
  end
  object qCentroCustos: TUniQuery
    Tag = 7000
    SQLInsert.Strings = (
      'INSERT INTO pedido_compras'
      
        '  (empresa, fornecedor, representante, data_pedido, previsao_ent' +
        'rega, data_compra, data_entrada, status)'
      'VALUES'
      
        '  (:empresa, :fornecedor, :representante, :data_pedido, :previsa' +
        'o_entrega, :data_compra, :data_entrada, :status)')
    SQLDelete.Strings = (
      'DELETE FROM pedido_compras'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE pedido_compras'
      'SET'
      
        '  empresa = :empresa, fornecedor = :fornecedor, representante = ' +
        ':representante, data_pedido = :data_pedido, previsao_entrega = :' +
        'previsao_entrega, data_compra = :data_compra, data_entrada = :da' +
        'ta_entrada, status = :status'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM pedido_compras'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT empresa, fornecedor, representante, data_pedido, previsao' +
        '_entrega, data_compra, data_entrada, status FROM pedido_compras'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM pedido_compras'
      ''
      ') t')
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT codigo, empresa, descricao, chave'
      '  FROM centro_custos where debito = true and inativo = false;')
    Left = 272
    Top = 416
  end
  object dsCentroCustos: TUniDataSource
    DataSet = qCentroCustos
    Left = 312
    Top = 416
  end
  object qTipoConta: TUniQuery
    Tag = 7000
    SQLInsert.Strings = (
      'INSERT INTO pedido_compras'
      
        '  (empresa, fornecedor, representante, data_pedido, previsao_ent' +
        'rega, data_compra, data_entrada, status)'
      'VALUES'
      
        '  (:empresa, :fornecedor, :representante, :data_pedido, :previsa' +
        'o_entrega, :data_compra, :data_entrada, :status)')
    SQLDelete.Strings = (
      'DELETE FROM pedido_compras'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE pedido_compras'
      'SET'
      
        '  empresa = :empresa, fornecedor = :fornecedor, representante = ' +
        ':representante, data_pedido = :data_pedido, previsao_entrega = :' +
        'previsao_entrega, data_compra = :data_compra, data_entrada = :da' +
        'ta_entrada, status = :status'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM pedido_compras'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT empresa, fornecedor, representante, data_pedido, previsao' +
        '_entrega, data_compra, data_entrada, status FROM pedido_compras'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM pedido_compras'
      ''
      ') t')
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT codigo, descricao'
      '  FROM tipo_contas;')
    Left = 392
    Top = 416
  end
  object dsTipoConta: TUniDataSource
    DataSet = qTipoConta
    Left = 432
    Top = 416
  end
  object qTipoPagamento: TUniQuery
    Tag = 7000
    SQLInsert.Strings = (
      'INSERT INTO pedido_compras'
      
        '  (empresa, fornecedor, representante, data_pedido, previsao_ent' +
        'rega, data_compra, data_entrada, status)'
      'VALUES'
      
        '  (:empresa, :fornecedor, :representante, :data_pedido, :previsa' +
        'o_entrega, :data_compra, :data_entrada, :status)')
    SQLDelete.Strings = (
      'DELETE FROM pedido_compras'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE pedido_compras'
      'SET'
      
        '  empresa = :empresa, fornecedor = :fornecedor, representante = ' +
        ':representante, data_pedido = :data_pedido, previsao_entrega = :' +
        'previsao_entrega, data_compra = :data_compra, data_entrada = :da' +
        'ta_entrada, status = :status'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM pedido_compras'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT empresa, fornecedor, representante, data_pedido, previsao' +
        '_entrega, data_compra, data_entrada, status FROM pedido_compras'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM pedido_compras'
      ''
      ') t')
    Connection = Connection.Conn
    SQL.Strings = (
      
        'SELECT codigo, descricao, segunda_via, comissionada, mov_cont_re' +
        'ceber, '
      
        '       tef, cheque, mov_cont_bancaria, registra_venda, cartao, p' +
        'erc_operadora, '
      
        '       controlar_cheque, nro_parcela_max, requer_autorizacao, cr' +
        'edito, '
      '       debito_dias, inativo'
      '  FROM tipo_pagamentos'
      ' WHERE pagamento = true;')
    Left = 512
    Top = 416
  end
  object dsTipoPagamento: TUniDataSource
    DataSet = qTipoPagamento
    Left = 552
    Top = 416
  end
end
