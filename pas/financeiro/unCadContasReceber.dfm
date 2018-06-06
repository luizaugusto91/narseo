inherited frmCadContasReceber: TfrmCadContasReceber
  Caption = 'Contas a Receber'
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
      Font.Name = 'Segoe UI'
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
      Width = 42
      Height = 15
      Caption = 'Sacado:'
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
    object lblcontaorigem: TLabel
      Left = 149
      Top = 169
      Width = 71
      Height = 15
      Caption = 'Faturamento:'
      FocusControl = edtFaturamento
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCompra: TLabel
      Left = 312
      Top = 169
      Width = 36
      Height = 15
      Caption = 'Venda:'
      FocusControl = edtvenda
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbldata_pagto: TLabel
      Left = 441
      Top = 169
      Width = 118
      Height = 15
      Caption = 'Data do Recebimento:'
      FocusControl = edtdata_recebimento
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
      Left = 111
      Top = 198
      Width = 42
      Height = 15
      Caption = 'Cupom:'
      FocusControl = edtserie
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblcnpj: TLabel
      Left = 225
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
    object lblContaOriginal: TLabel
      Left = 10
      Top = 169
      Width = 77
      Height = 15
      Caption = 'Conta original:'
      FocusControl = edtconta_original
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblvalor_corrigido: TLabel
      Left = 671
      Top = 169
      Width = 82
      Height = 15
      Caption = 'Valor Corrigido:'
      FocusControl = edtvalor_corrigido
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
      Width = 331
    end
    object edttipo_conta: TcxDBSpinEdit
      Left = 93
      Top = 50
      DataBinding.DataField = 'tipo_conta'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 5
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
      Width = 205
    end
    object edtvalor: TcxDBCalcEdit
      Left = 396
      Top = 50
      DataBinding.DataField = 'valor'
      DataBinding.DataSource = ds
      TabOrder = 7
      Width = 100
    end
    object edtparcela: TcxDBSpinEdit
      Left = 548
      Top = 50
      DataBinding.DataField = 'parcela'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 8
      Width = 50
    end
    object edttotal_parcelas: TcxDBSpinEdit
      Left = 689
      Top = 50
      DataBinding.DataField = 'total_parcelas'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 9
      Width = 50
    end
    object edtvencimento: TcxDBDateEdit
      Left = 818
      Top = 50
      DataBinding.DataField = 'vencimento'
      DataBinding.DataSource = ds
      TabOrder = 10
      OnKeyDown = edtvencimentoKeyDown
      Width = 151
    end
    object edtdocumento: TcxDBTextEdit
      Left = 83
      Top = 79
      DataBinding.DataField = 'documento'
      DataBinding.DataSource = ds
      TabOrder = 11
      Width = 117
    end
    object edtjuros_porc: TcxDBCalcEdit
      Left = 256
      Top = 79
      DataBinding.DataField = 'juros_porc'
      DataBinding.DataSource = ds
      TabOrder = 12
      Width = 50
    end
    object edtjuros: TcxDBCalcEdit
      Left = 366
      Top = 79
      DataBinding.DataField = 'juros_valor'
      DataBinding.DataSource = ds
      TabOrder = 13
      Width = 60
    end
    object edtdesconto_porc: TcxDBCalcEdit
      Left = 505
      Top = 79
      DataBinding.DataField = 'desconto_porc'
      DataBinding.DataSource = ds
      TabOrder = 14
      Width = 50
    end
    object edtdesconto: TcxDBCurrencyEdit
      Left = 638
      Top = 79
      DataBinding.DataField = 'desconto_valor'
      DataBinding.DataSource = ds
      TabOrder = 15
      Width = 60
    end
    object edtMoraDia: TcxDBCalcEdit
      Left = 762
      Top = 79
      DataBinding.DataField = 'juros_dia'
      DataBinding.DataSource = ds
      TabOrder = 16
      Width = 50
    end
    object edtcarencia: TcxDBSpinEdit
      Left = 872
      Top = 79
      DataBinding.DataField = 'carencia'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 17
      Width = 97
    end
    object edtCredor: TcxDBSpinEdit
      Left = 58
      Top = 108
      DataBinding.DataField = 'pessoa'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 18
      OnKeyPress = edtCredorKeyPress
      Width = 50
    end
    object cbbCredor: TcxDBLookupComboBox
      Left = 114
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
      Width = 312
    end
    object edtdescricao: TcxDBTextEdit
      Left = 493
      Top = 108
      DataBinding.DataField = 'descricao'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      TabOrder = 20
      Width = 476
    end
    object edtcentro_custo: TcxDBTextEdit
      Left = 108
      Top = 137
      DataBinding.DataField = 'centro_custo'
      DataBinding.DataSource = ds
      TabOrder = 21
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
      Width = 361
    end
    object edttipo_pagamento: TcxDBSpinEdit
      Left = 631
      Top = 137
      DataBinding.DataField = 'tipo_pagamento'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 23
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
      Width = 282
    end
    object edtFaturamento: TcxDBSpinEdit
      Left = 226
      Top = 166
      DataBinding.DataField = 'cd_fatura'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 26
      Width = 80
    end
    object edtvenda: TcxDBSpinEdit
      Left = 354
      Top = 166
      DataBinding.DataField = 'venda'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 27
      Width = 81
    end
    object edtdata_recebimento: TcxDBDateEdit
      Left = 565
      Top = 166
      DataBinding.DataField = 'data_recebimento'
      DataBinding.DataSource = ds
      TabOrder = 28
      Width = 100
    end
    object cbbquitada: TcxDBCheckBox
      Left = 886
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
      TabOrder = 30
      Width = 69
    end
    object edtnfe: TcxDBSpinEdit
      Left = 55
      Top = 195
      DataBinding.DataField = 'nfe'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 31
      Width = 50
    end
    object edtserie: TcxDBSpinEdit
      Left = 159
      Top = 195
      DataBinding.DataField = 'serie'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 32
      Width = 60
    end
    object edtcnpj: TcxDBTextEdit
      Left = 261
      Top = 195
      DataBinding.DataField = 'cnpj'
      DataBinding.DataSource = ds
      TabOrder = 33
      Width = 114
    end
    object edtconta_original: TcxDBSpinEdit
      Left = 93
      Top = 166
      DataBinding.DataField = 'conta_original'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 25
      Width = 50
    end
    object edtvalor_corrigido: TcxDBCurrencyEdit
      Left = 759
      Top = 166
      DataBinding.DataField = 'valor_corrigido'
      DataBinding.DataSource = ds
      TabOrder = 29
      Width = 121
    end
    object cbbfatura: TcxDBCheckBox
      Left = 381
      Top = 195
      Caption = 'Fatura'
      DataBinding.DataField = 'fatura'
      DataBinding.DataSource = ds
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI Semibold'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 34
      Width = 61
    end
    object cbbgerado_titulo: TcxDBCheckBox
      Left = 448
      Top = 195
      Caption = 'Gerar Titulo'
      DataBinding.DataField = 'gerado_titulo'
      DataBinding.DataSource = ds
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI Semibold'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 35
      Width = 88
    end
    object cbbgerar_boleto: TcxDBCheckBox
      Left = 542
      Top = 195
      Caption = 'Gerar Boleto'
      DataBinding.DataField = 'gerar_boleto'
      DataBinding.DataSource = ds
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI Semibold'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 36
      Width = 92
    end
    object grpDetalhesCompra: TGroupBox
      Left = 10
      Top = 224
      Width = 959
      Height = 105
      Caption = ' Detalhes da venda '
      Enabled = False
      TabOrder = 37
      object Label3: TLabel
        Left = 12
        Top = 24
        Width = 86
        Height = 15
        Caption = 'Representante:'
        FocusControl = edtrepresentante
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 494
        Top = 24
        Width = 96
        Height = 15
        Caption = 'Status do pedido:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 12
        Top = 53
        Width = 113
        Height = 15
        Caption = 'Previs'#227'o de Entrega:'
        FocusControl = edtprevisao_entrega
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 237
        Top = 53
        Width = 92
        Height = 15
        Caption = 'Data da entrega:'
        FocusControl = edtdata_entrega
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbltotal_produtos: TLabel
        Left = 441
        Top = 53
        Width = 105
        Height = 15
        Caption = 'Total dos Produtos:'
        FocusControl = edttotal_produtos
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 678
        Top = 53
        Width = 83
        Height = 15
        Caption = 'Total da venda:'
        FocusControl = edttotal_pedido
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtrepresentante: TcxDBSpinEdit
        Left = 104
        Top = 21
        DataBinding.DataField = 'representante'
        DataBinding.DataSource = dsVenda
        Properties.SpinButtons.Visible = False
        TabOrder = 0
        OnExit = grpContentExit
        Width = 50
      end
      object cbbstatus: TcxDBImageComboBox
        Left = 596
        Top = 21
        DataBinding.DataField = 'status'
        DataBinding.DataSource = dsVenda
        Properties.Alignment.Horz = taLeftJustify
        Properties.Items = <
          item
            Description = '-'
            ImageIndex = 0
          end
          item
            Description = 'PENDENTE'
            Value = 'P'
          end
          item
            Description = 'CANCELADO'
            Value = 'C'
          end
          item
            Description = 'ADQUIRIDO'
            Value = 'A'
          end
          item
            Description = 'ADQUIRIDO PARCIALMENTE'
            Value = 'AP'
          end
          item
            Description = 'FECHADO'
            Value = 'F'
          end>
        Style.BorderStyle = ebsUltraFlat
        TabOrder = 1
        OnExit = grpContentExit
        Width = 349
      end
      object edtprevisao_entrega: TcxDBDateEdit
        Left = 131
        Top = 50
        DataBinding.DataField = 'previsao_entrega'
        DataBinding.DataSource = dsVenda
        TabOrder = 2
        OnExit = grpContentExit
        Width = 100
      end
      object edtdata_entrega: TcxDBDateEdit
        Left = 335
        Top = 50
        DataBinding.DataField = 'data_entrega'
        DataBinding.DataSource = dsVenda
        TabOrder = 3
        OnExit = grpContentExit
        Width = 100
      end
      object edttotal_produtos: TcxDBCurrencyEdit
        Left = 552
        Top = 50
        DataBinding.DataField = 'total_produtos'
        DataBinding.DataSource = dsVenda
        TabOrder = 4
        Width = 120
      end
      object edttotal_pedido: TcxDBCurrencyEdit
        Left = 767
        Top = 50
        DataBinding.DataField = 'total_pedido'
        DataBinding.DataSource = dsVenda
        Properties.ReadOnly = True
        TabOrder = 5
        OnExit = grpContentExit
        Width = 120
      end
      object cbbconcluido: TcxDBCheckBox
        Left = 12
        Top = 74
        Caption = 'Concluido'
        DataBinding.DataField = 'concluido'
        DataBinding.DataSource = dsVenda
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clGray
        Style.Font.Height = -12
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = [fsBold]
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 6
        Width = 121
      end
      object cbbentregue: TcxDBCheckBox
        Left = 139
        Top = 74
        Caption = 'Entregue'
        DataBinding.DataField = 'entregue'
        DataBinding.DataSource = dsVenda
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clGray
        Style.Font.Height = -12
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = [fsBold]
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 7
        Width = 121
      end
      object cbbliquidado: TcxDBCheckBox
        Left = 266
        Top = 74
        Caption = 'Liquidado'
        DataBinding.DataField = 'liquidado'
        DataBinding.DataSource = dsVenda
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clGray
        Style.Font.Height = -12
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = [fsBold]
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 8
        Width = 121
      end
      object cbbRepresentante: TcxDBLookupComboBox
        Left = 160
        Top = 21
        DataBinding.DataField = 'representante'
        DataBinding.DataSource = dsVenda
        Properties.KeyFieldNames = 'codigo'
        Properties.ListColumns = <
          item
            Caption = 'Nome'
            Width = 300
            FieldName = 'nome'
          end>
        Properties.ListSource = dsRepresentante
        TabOrder = 9
        OnExit = grpContentExit
        Width = 328
      end
    end
    object grpObservacoes: TGroupBox
      Left = 10
      Top = 335
      Width = 959
      Height = 105
      Caption = ' Observa'#231#245'es '
      TabOrder = 38
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
    Left = 592
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO contas_receber'
      
        '  (empresa, data_movimento, tipo_conta, venda, usuario, valor, p' +
        'arcela, total_parcelas, tipo_pagamento, centro_custo, vencimento' +
        ', valor_corrigido, juros_porc, juros_valor, desconto_porc, desco' +
        'nto_valor, documento, data_recebimento, juros_dia, carencia, pes' +
        'soa, descricao, condicao_pagamento, status, quitada, multa, obse' +
        'rvacoes, nfe, cnpj, mesclado_para, tipo, cupom, fatura, gerado_t' +
        'itulo, gerar_boleto, mao_de_obra, cd_fatura, obs_comanda, comand' +
        'a, para_quitar, parcial, valor_original, fatura_acresc, fatura_c' +
        'red, fatura_desc, fatura_tipo, nunca_titulo, conta_original)'
      'VALUES'
      
        '  (:empresa, :data_movimento, :tipo_conta, :venda, :usuario, :va' +
        'lor, :parcela, :total_parcelas, :tipo_pagamento, :centro_custo, ' +
        ':vencimento, :valor_corrigido, :juros_porc, :juros_valor, :desco' +
        'nto_porc, :desconto_valor, :documento, :data_recebimento, :juros' +
        '_dia, :carencia, :pessoa, :descricao, :condicao_pagamento, :stat' +
        'us, :quitada, :multa, :observacoes, :nfe, :cnpj, :mesclado_para,' +
        ' :tipo, :cupom, :fatura, :gerado_titulo, :gerar_boleto, :mao_de_' +
        'obra, :cd_fatura, :obs_comanda, :comanda, :para_quitar, :parcial' +
        ', :valor_original, :fatura_acresc, :fatura_cred, :fatura_desc, :' +
        'fatura_tipo, :nunca_titulo, :conta_original)')
    SQLDelete.Strings = (
      'DELETE FROM contas_receber'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE contas_receber'
      'SET'
      
        '  empresa = :empresa, data_registro = :data_registro, data_movim' +
        'ento = :data_movimento, tipo_conta = :tipo_conta, venda = :venda' +
        ', usuario = :usuario, valor = :valor, parcela = :parcela, total_' +
        'parcelas = :total_parcelas, tipo_pagamento = :tipo_pagamento, ce' +
        'ntro_custo = :centro_custo, vencimento = :vencimento, valor_corr' +
        'igido = :valor_corrigido, juros_porc = :juros_porc, juros_valor ' +
        '= :juros_valor, desconto_porc = :desconto_porc, desconto_valor =' +
        ' :desconto_valor, documento = :documento, data_recebimento = :da' +
        'ta_recebimento, juros_dia = :juros_dia, carencia = :carencia, pe' +
        'ssoa = :pessoa, descricao = :descricao, condicao_pagamento = :co' +
        'ndicao_pagamento, status = :status, quitada = :quitada, multa = ' +
        ':multa, observacoes = :observacoes, nfe = :nfe, cnpj = :cnpj, me' +
        'sclado_para = :mesclado_para, tipo = :tipo, cupom = :cupom, fatu' +
        'ra = :fatura, gerado_titulo = :gerado_titulo, gerar_boleto = :ge' +
        'rar_boleto, mao_de_obra = :mao_de_obra, cd_fatura = :cd_fatura, ' +
        'obs_comanda = :obs_comanda, comanda = :comanda, para_quitar = :p' +
        'ara_quitar, parcial = :parcial, valor_original = :valor_original' +
        ', fatura_acresc = :fatura_acresc, fatura_cred = :fatura_cred, fa' +
        'tura_desc = :fatura_desc, fatura_tipo = :fatura_tipo, nunca_titu' +
        'lo = :nunca_titulo, conta_original = :conta_original'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM contas_receber'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT empresa, data_registro, data_movimento, tipo_conta, venda' +
        ', usuario, valor, parcela, total_parcelas, tipo_pagamento, centr' +
        'o_custo, vencimento, valor_corrigido, juros_porc, juros_valor, d' +
        'esconto_porc, desconto_valor, documento, data_recebimento, juros' +
        '_dia, carencia, pessoa, descricao, condicao_pagamento, status, q' +
        'uitada, multa, observacoes, nfe, cnpj, mesclado_para, tipo, cupo' +
        'm, fatura, gerado_titulo, gerar_boleto, mao_de_obra, cd_fatura, ' +
        'obs_comanda, comanda, para_quitar, parcial, valor_original, fatu' +
        'ra_acresc, fatura_cred, fatura_desc, fatura_tipo, nunca_titulo, ' +
        'conta_original FROM contas_receber'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM contas_receber'
      ''
      ') t')
    SQL.Strings = (
      
        'SELECT codigo, empresa, data_registro, data_movimento, tipo_cont' +
        'a, venda, '
      
        '       usuario, valor, parcela, total_parcelas, tipo_pagamento, ' +
        'centro_custo, '
      
        '       vencimento, valor_corrigido, juros_porc, juros_valor, des' +
        'conto_porc, '
      
        '       desconto_valor, documento, data_recebimento, juros_dia, c' +
        'arencia, '
      
        '       pessoa, descricao, condicao_pagamento, status, quitada, m' +
        'ulta, '
      
        '       observacoes, nfe, cnpj, mesclado_para, tipo, cupom, fatur' +
        'a, gerado_titulo, '
      
        '       gerar_boleto, mao_de_obra, cd_fatura, obs_comanda, comand' +
        'a, para_quitar, '
      
        '       parcial, valor_original, fatura_acresc, fatura_cred, fatu' +
        'ra_desc, '
      '       fatura_tipo, nunca_titulo, conta_original'
      '  FROM contas_receber '
      ' WHERE codigo = :codigo;')
    Left = 552
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
    object qConsultatipo_conta: TIntegerField
      FieldName = 'tipo_conta'
      Required = True
    end
    object qConsultavenda: TIntegerField
      FieldName = 'venda'
    end
    object qConsultausuario: TIntegerField
      FieldName = 'usuario'
      Required = True
    end
    object qConsultavalor: TCurrencyField
      FieldName = 'valor'
      Required = True
    end
    object qConsultaparcela: TIntegerField
      FieldName = 'parcela'
      Required = True
    end
    object qConsultatotal_parcelas: TIntegerField
      FieldName = 'total_parcelas'
    end
    object qConsultatipo_pagamento: TIntegerField
      FieldName = 'tipo_pagamento'
    end
    object qConsultacentro_custo: TMemoField
      FieldName = 'centro_custo'
      BlobType = ftMemo
    end
    object qConsultavencimento: TDateField
      FieldName = 'vencimento'
    end
    object qConsultavalor_corrigido: TCurrencyField
      FieldName = 'valor_corrigido'
    end
    object qConsultajuros_porc: TFloatField
      FieldName = 'juros_porc'
    end
    object qConsultajuros_valor: TCurrencyField
      FieldName = 'juros_valor'
    end
    object qConsultadesconto_porc: TFloatField
      FieldName = 'desconto_porc'
    end
    object qConsultadesconto_valor: TCurrencyField
      FieldName = 'desconto_valor'
    end
    object qConsultadocumento: TStringField
      FieldName = 'documento'
      Size = 15
    end
    object qConsultadata_recebimento: TDateField
      FieldName = 'data_recebimento'
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
    object qConsultastatus: TStringField
      FieldName = 'status'
      Size = 10
    end
    object qConsultaquitada: TBooleanField
      FieldName = 'quitada'
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
    object qConsultacnpj: TMemoField
      FieldName = 'cnpj'
      BlobType = ftMemo
    end
    object qConsultamesclado_para: TIntegerField
      FieldName = 'mesclado_para'
    end
    object qConsultatipo: TIntegerField
      FieldName = 'tipo'
    end
    object qConsultacupom: TIntegerField
      FieldName = 'cupom'
    end
    object qConsultafatura: TBooleanField
      FieldName = 'fatura'
    end
    object qConsultagerado_titulo: TBooleanField
      FieldName = 'gerado_titulo'
    end
    object qConsultagerar_boleto: TBooleanField
      FieldName = 'gerar_boleto'
    end
    object qConsultamao_de_obra: TBooleanField
      FieldName = 'mao_de_obra'
    end
    object qConsultacd_fatura: TLargeintField
      FieldName = 'cd_fatura'
    end
    object qConsultaobs_comanda: TMemoField
      FieldName = 'obs_comanda'
      BlobType = ftMemo
    end
    object qConsultacomanda: TIntegerField
      FieldName = 'comanda'
    end
    object qConsultapara_quitar: TBooleanField
      FieldName = 'para_quitar'
    end
    object qConsultaparcial: TIntegerField
      FieldName = 'parcial'
    end
    object qConsultavalor_original: TFloatField
      FieldName = 'valor_original'
    end
    object qConsultafatura_acresc: TFloatField
      FieldName = 'fatura_acresc'
    end
    object qConsultafatura_cred: TFloatField
      FieldName = 'fatura_cred'
    end
    object qConsultafatura_desc: TFloatField
      FieldName = 'fatura_desc'
    end
    object qConsultafatura_tipo: TIntegerField
      FieldName = 'fatura_tipo'
    end
    object qConsultanunca_titulo: TBooleanField
      FieldName = 'nunca_titulo'
    end
    object qConsultaconta_original: TIntegerField
      FieldName = 'conta_original'
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 508
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
      '  FROM pessoas where inativo = false'
      ' ORDER BY nome')
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
      '  FROM centro_custos where credito = true and inativo = false;')
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
      '  FROM tipo_pagamentos;')
    Left = 512
    Top = 416
  end
  object dsTipoPagamento: TUniDataSource
    DataSet = qTipoPagamento
    Left = 552
    Top = 416
  end
  object qVenda: TUniQuery
    Tag = 7100
    SQLInsert.Strings = (
      'INSERT INTO vendas'
      
        '  (empresa, pedido, cliente, representante, data_registro, previ' +
        'sao_entrega, data_venda, data_entrega, status, observacao, total' +
        '_pedido, total_produtos, concluido, entregue, liquidado)'
      'VALUES'
      
        '  (:empresa, :pedido, :cliente, :representante, :data_registro, ' +
        ':previsao_entrega, :data_venda, :data_entrega, :status, :observa' +
        'cao, :total_pedido, :total_produtos, :concluido, :entregue, :liq' +
        'uidado)')
    SQLDelete.Strings = (
      'DELETE FROM vendas'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE vendas'
      'SET'
      
        '  empresa = :empresa, pedido = :pedido, cliente = :cliente, repr' +
        'esentante = :representante, data_registro = :data_registro, prev' +
        'isao_entrega = :previsao_entrega, data_venda = :data_venda, data' +
        '_entrega = :data_entrega, status = :status, observacao = :observ' +
        'acao, total_pedido = :total_pedido, total_produtos = :total_prod' +
        'utos, concluido = :concluido, entregue = :entregue, liquidado = ' +
        ':liquidado'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM vendas'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT empresa, pedido, cliente, representante, data_registro, p' +
        'revisao_entrega, data_venda, data_entrega, status, observacao, t' +
        'otal_pedido, total_produtos, concluido, entregue, liquidado FROM' +
        ' vendas'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM vendas'
      ''
      ') t')
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT codigo, '
      #9'empresa, '
      #9'pedido, '
      #9'cliente, '
      #9'representante, '
      #9'data_registro, '
      #9'previsao_entrega, '
      #9'data_venda, '
      #9'data_entrega, '
      #9'status, '
      #9'observacao, '
      #9'total_pedido, '
      #9'total_produtos, '
      #9'concluido, '
      #9'entregue, '
      #9'liquidado'
      '   FROM vendas'
      '  WHERE codigo = :venda;')
    MasterSource = ds
    MasterFields = 'venda'
    DetailFields = 'codigo'
    Left = 120
    Top = 424
    ParamData = <
      item
        DataType = ftInteger
        Name = 'venda'
        ParamType = ptInput
        Value = nil
      end>
    object IntegerField1: TIntegerField
      FieldName = 'codigo'
    end
    object IntegerField2: TIntegerField
      FieldName = 'empresa'
    end
    object qConsultapedido: TIntegerField
      FieldName = 'pedido'
    end
    object qConsultacliente: TIntegerField
      FieldName = 'cliente'
      Required = True
    end
    object qConsultarepresentante: TIntegerField
      FieldName = 'representante'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'data_registro'
      Required = True
    end
    object qConsultaprevisao_entrega: TDateField
      FieldName = 'previsao_entrega'
    end
    object qConsultadata_venda: TDateTimeField
      FieldName = 'data_venda'
      Required = True
    end
    object qConsultadata_entrega: TDateField
      FieldName = 'data_entrega'
    end
    object StringField1: TStringField
      FieldName = 'status'
      Size = 2
    end
    object qConsultaobservacao: TMemoField
      FieldName = 'observacao'
      BlobType = ftMemo
    end
    object qConsultatotal_pedido: TCurrencyField
      FieldName = 'total_pedido'
    end
    object qConsultatotal_produtos: TCurrencyField
      FieldName = 'total_produtos'
    end
    object qConsultaconcluido: TBooleanField
      FieldName = 'concluido'
      Required = True
    end
    object qConsultaentregue: TBooleanField
      FieldName = 'entregue'
      Required = True
    end
    object qConsultaliquidado: TBooleanField
      FieldName = 'liquidado'
      Required = True
    end
  end
  object dsVenda: TUniDataSource
    DataSet = qVenda
    Left = 160
    Top = 424
  end
  object qRepresentante: TUniQuery
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
      '  FROM pessoas where inativo = false and representante = true')
    Left = 680
    Top = 421
  end
  object dsRepresentante: TUniDataSource
    DataSet = qRepresentante
    Left = 720
    Top = 421
  end
end
