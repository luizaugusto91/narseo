inherited frmCadVendas: TfrmCadVendas
  Caption = 'Vendas'
  ClientHeight = 592
  ClientWidth = 911
  ExplicitWidth = 917
  ExplicitHeight = 621
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 557
    Width = 911
    ExplicitTop = 557
    ExplicitWidth = 915
    inherited btnCancelar: TButton
      Left = 634
      ExplicitLeft = 638
    end
    inherited btnSalvar: TButton
      Left = 727
      ExplicitLeft = 731
    end
    inherited btnFechar: TButton
      Left = 820
      ExplicitLeft = 824
    end
  end
  inherited grpContent: TGroupBox
    Width = 901
    Height = 505
    ExplicitWidth = 905
    ExplicitHeight = 505
    object grpProdutos: TGroupBox
      AlignWithMargins = True
      Left = 8
      Top = 140
      Width = 885
      Height = 217
      Margins.Left = 6
      Margins.Right = 6
      Align = alClient
      Caption = ' Produtos relacionados '
      TabOrder = 0
      ExplicitWidth = 889
      object Grid: TcxGrid
        AlignWithMargins = True
        Left = 8
        Top = 20
        Width = 835
        Height = 189
        Margins.Left = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 839
        object View: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsItens
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skSum
              Column = ColumnQuantidade
              DisplayText = 'Quantidade Total:'
            end
            item
              Kind = skSum
              FieldName = 'entrada'
              Column = ColumnEntregue
              DisplayText = 'Total Entregue:'
            end
            item
              Kind = skCount
              FieldName = 'produto'
              Column = ColumnProduto
              DisplayText = 'Total de Itens:'
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.Indicator = True
          Styles.Header = StyleHeader
          object ColumnID: TcxGridDBColumn
            Caption = '#ID'
            DataBinding.FieldName = 'codigo'
            Width = 50
          end
          object ColumnProduto: TcxGridDBColumn
            Caption = 'Produto'
            DataBinding.FieldName = 'produto'
            Width = 300
          end
          object ColumnCategoria: TcxGridDBColumn
            Caption = 'Categoria'
            DataBinding.FieldName = 'categoria'
            Visible = False
            GroupIndex = 0
            Width = 100
          end
          object ColumnQuantidade: TcxGridDBColumn
            Caption = 'Quantidade'
            DataBinding.FieldName = 'quantidade'
            Width = 80
          end
          object ColumnTotal: TcxGridDBColumn
            Caption = 'Total'
            DataBinding.FieldName = 'valor_total'
            Width = 80
          end
          object ColumnEntregue: TcxGridDBColumn
            Caption = 'Entregue'
            DataBinding.FieldName = 'entregue'
            Width = 80
          end
          object ColumnTotalEntregue: TcxGridDBColumn
            Caption = 'Total Entregue'
            DataBinding.FieldName = 'valor_entregue'
            Width = 80
          end
          object ColumnCancelado: TcxGridDBColumn
            Caption = 'Cancelado'
            DataBinding.FieldName = 'cancelado'
            Width = 60
          end
        end
        object Master: TcxGridLevel
          GridView = View
        end
      end
      object pnlACT: TPanel
        Left = 849
        Top = 17
        Width = 34
        Height = 198
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitLeft = 853
        DesignSize = (
          34
          198)
        object btnADD: TButton
          Left = 0
          Top = 3
          Width = 27
          Height = 27
          Anchors = [akTop, akRight]
          Enabled = False
          HotImageIndex = 3
          ImageIndex = 3
          ImageMargins.Left = 2
          Images = ImageList16
          TabOrder = 0
          OnClick = btnADDClick
        end
        object btnEDT: TButton
          Left = 0
          Top = 36
          Width = 27
          Height = 27
          Anchors = [akTop, akRight]
          Enabled = False
          HotImageIndex = 9
          ImageIndex = 9
          ImageMargins.Left = 2
          Images = ImageList16
          TabOrder = 1
          OnClick = btnEDTClick
        end
        object btnRMV: TButton
          Left = 0
          Top = 69
          Width = 27
          Height = 27
          Anchors = [akTop, akRight]
          Enabled = False
          HotImageIndex = 4
          ImageIndex = 4
          ImageMargins.Left = 2
          Images = ImageList16
          TabOrder = 2
          OnClick = btnRMVClick
        end
        object btnAtualizar: TButton
          Left = 0
          Top = 102
          Width = 27
          Height = 27
          Anchors = [akTop, akRight]
          Enabled = False
          HotImageIndex = 5
          ImageIndex = 5
          ImageMargins.Left = 2
          Images = ImageList16
          TabOrder = 3
          OnClick = btnAtualizarClick
        end
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 17
      Width = 897
      Height = 120
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitWidth = 901
      object lblCodigo: TLabel
        Left = 9
        Top = 11
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
        Left = 223
        Top = 11
        Width = 42
        Height = 15
        Caption = 'Cliente:'
        FocusControl = edtCliente
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 40
        Width = 86
        Height = 15
        Caption = 'Representante:'
        FocusControl = edtrepresentante
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 9
        Top = 69
        Width = 92
        Height = 15
        Caption = 'Data da registro:'
        FocusControl = edtdata_registro
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 246
        Top = 98
        Width = 83
        Height = 15
        Caption = 'Total da venda:'
        FocusControl = edttotal_pedido
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 273
        Top = 69
        Width = 113
        Height = 15
        Caption = 'Previs'#227'o de Entrega:'
        FocusControl = edtprevisao_entrega
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 498
        Top = 69
        Width = 92
        Height = 15
        Caption = 'Data da entrega:'
        FocusControl = edtdata_entrega
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 490
        Top = 40
        Width = 96
        Height = 15
        Caption = 'Status do pedido:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 110
        Top = 11
        Width = 41
        Height = 15
        Caption = 'Pedido:'
        FocusControl = cxDBSpinEdit1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbldata_venda: TLabel
        Left = 702
        Top = 69
        Width = 82
        Height = 15
        Caption = 'Data da venda:'
        FocusControl = edtdata_venda
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbltotal_produtos: TLabel
        Left = 9
        Top = 98
        Width = 105
        Height = 15
        Caption = 'Total dos Produtos:'
        FocusControl = edttotal_produtos
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtCodigo: TcxDBSpinEdit
        Left = 56
        Top = 8
        DataBinding.DataField = 'codigo'
        DataBinding.DataSource = ds
        Properties.SpinButtons.Visible = False
        Style.Color = clBtnFace
        TabOrder = 0
        Width = 48
      end
      object edtCliente: TcxDBSpinEdit
        Left = 271
        Top = 8
        DataBinding.DataField = 'cliente'
        DataBinding.DataSource = ds
        Properties.SpinButtons.Visible = False
        TabOrder = 1
        OnExit = grpContentExit
        Width = 50
      end
      object cbbCliente: TcxDBLookupComboBox
        Left = 327
        Top = 8
        DataBinding.DataField = 'cliente'
        DataBinding.DataSource = ds
        Properties.KeyFieldNames = 'codigo'
        Properties.ListColumns = <
          item
            Caption = 'Fantasia'
            Width = 300
            FieldName = 'fantasia'
          end>
        Properties.ListSource = dsCliente
        TabOrder = 2
        OnExit = grpContentExit
        Width = 564
      end
      object edtrepresentante: TcxDBSpinEdit
        Left = 100
        Top = 37
        DataBinding.DataField = 'representante'
        DataBinding.DataSource = ds
        Properties.SpinButtons.Visible = False
        TabOrder = 3
        OnExit = grpContentExit
        Width = 50
      end
      object cbbRepresentante: TcxDBLookupComboBox
        Left = 156
        Top = 37
        DataBinding.DataField = 'representante'
        DataBinding.DataSource = ds
        Properties.KeyFieldNames = 'codigo'
        Properties.ListColumns = <
          item
            Caption = 'Nome'
            Width = 300
            FieldName = 'nome'
          end>
        Properties.ListSource = dsRepresentante
        TabOrder = 4
        OnExit = grpContentExit
        Width = 328
      end
      object edtdata_registro: TcxDBDateEdit
        Left = 107
        Top = 66
        DataBinding.DataField = 'data_registro'
        DataBinding.DataSource = ds
        TabOrder = 5
        OnExit = grpContentExit
        Width = 160
      end
      object edttotal_pedido: TcxDBCurrencyEdit
        Left = 335
        Top = 95
        DataBinding.DataField = 'total_pedido'
        DataBinding.DataSource = ds
        Properties.ReadOnly = True
        TabOrder = 6
        OnExit = grpContentExit
        Width = 120
      end
      object edtprevisao_entrega: TcxDBDateEdit
        Left = 392
        Top = 66
        DataBinding.DataField = 'previsao_entrega'
        DataBinding.DataSource = ds
        TabOrder = 7
        OnExit = grpContentExit
        Width = 100
      end
      object edtdata_entrega: TcxDBDateEdit
        Left = 596
        Top = 66
        DataBinding.DataField = 'data_entrega'
        DataBinding.DataSource = ds
        TabOrder = 8
        OnExit = grpContentExit
        Width = 100
      end
      object cbbstatus: TcxDBImageComboBox
        Left = 592
        Top = 37
        DataBinding.DataField = 'status'
        DataBinding.DataSource = ds
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
        TabOrder = 9
        OnExit = grpContentExit
        Width = 299
      end
      object cxDBSpinEdit1: TcxDBSpinEdit
        Left = 157
        Top = 8
        DataBinding.DataField = 'pedido'
        DataBinding.DataSource = ds
        Properties.SpinButtons.Visible = False
        Style.Color = clBtnFace
        TabOrder = 10
        Width = 60
      end
      object edtdata_venda: TcxDBDateEdit
        Left = 790
        Top = 66
        DataBinding.DataField = 'data_venda'
        DataBinding.DataSource = ds
        TabOrder = 11
        Width = 101
      end
      object edttotal_produtos: TcxDBCurrencyEdit
        Left = 120
        Top = 95
        DataBinding.DataField = 'total_produtos'
        DataBinding.DataSource = ds
        TabOrder = 12
        Width = 120
      end
      object cbbconcluido: TcxDBCheckBox
        Left = 465
        Top = 95
        Caption = 'Concluido'
        DataBinding.DataField = 'concluido'
        DataBinding.DataSource = ds
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = [fsBold]
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 13
        Width = 121
      end
      object cbbentregue: TcxDBCheckBox
        Left = 592
        Top = 95
        Caption = 'Entregue'
        DataBinding.DataField = 'entregue'
        DataBinding.DataSource = ds
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = [fsBold]
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 14
        Width = 121
      end
      object cbbliquidado: TcxDBCheckBox
        Left = 702
        Top = 95
        Caption = 'Liquidado'
        DataBinding.DataField = 'liquidado'
        DataBinding.DataSource = ds
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = [fsBold]
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 15
        Width = 121
      end
    end
    object PageControl: TcxPageControl
      AlignWithMargins = True
      Left = 7
      Top = 363
      Width = 889
      Height = 135
      Margins.Left = 5
      Margins.Bottom = 5
      Align = alBottom
      TabOrder = 2
      Properties.ActivePage = TabFinanceiro
      Properties.CustomButtons.Buttons = <>
      ExplicitWidth = 893
      ClientRectBottom = 131
      ClientRectLeft = 4
      ClientRectRight = 885
      ClientRectTop = 26
      object TabFinanceiro: TcxTabSheet
        Caption = ' Pagamentos '
        ImageIndex = 0
        ExplicitWidth = 885
        object GridPagamentos: TcxGrid
          AlignWithMargins = True
          Left = 6
          Top = 3
          Width = 875
          Height = 96
          Margins.Left = 6
          Margins.Right = 0
          Margins.Bottom = 6
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitTop = 9
          object ViewPagamentos: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsPagamentos
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            Styles.Content = StyleItemAtivo
            Styles.Inactive = StyleItemInativo
            Styles.Header = StyleHeader
            object ViewPagamentoscodigo: TcxGridDBColumn
              Caption = '#ID'
              DataBinding.FieldName = 'codigo'
              Width = 50
            end
            object ViewPagamentosvenda: TcxGridDBColumn
              DataBinding.FieldName = 'venda'
              Visible = False
            end
            object ViewPagamentosforma: TcxGridDBColumn
              Caption = 'Forma pagamento'
              DataBinding.FieldName = 'forma'
              Width = 200
            end
            object ViewPagamentosnumero_parcela: TcxGridDBColumn
              Caption = 'Parcela'
              DataBinding.FieldName = 'numero_parcela'
              Width = 50
            end
            object ViewPagamentosvalor_parcela: TcxGridDBColumn
              Caption = 'Valor'
              DataBinding.FieldName = 'valor_parcela'
              Width = 80
            end
            object ViewPagamentostotal_parcelas: TcxGridDBColumn
              Caption = 'Parcelas'
              DataBinding.FieldName = 'total_parcelas'
              Width = 50
            end
            object ViewPagamentosvalor_total: TcxGridDBColumn
              Caption = 'Total'
              DataBinding.FieldName = 'valor_total'
            end
            object ViewPagamentosdata_regristro: TcxGridDBColumn
              DataBinding.FieldName = 'data_regristro'
              Visible = False
            end
            object ViewPagamentosdata_pagamento: TcxGridDBColumn
              Caption = 'Data pagamento'
              DataBinding.FieldName = 'data_pagamento'
            end
            object ViewPagamentosliquidado: TcxGridDBColumn
              Caption = 'Liquidado'
              DataBinding.FieldName = 'liquidado'
              Width = 80
            end
            object ViewPagamentoscaixa: TcxGridDBColumn
              DataBinding.FieldName = 'caixa'
              Visible = False
            end
            object ViewPagamentosusuario: TcxGridDBColumn
              DataBinding.FieldName = 'usuario'
              Visible = False
            end
            object ViewPagamentosfantasia: TcxGridDBColumn
              Caption = 'Operador'
              DataBinding.FieldName = 'fantasia'
              Width = 300
            end
          end
          object MasterPagamentos: TcxGridLevel
            GridView = ViewPagamentos
          end
        end
      end
      object TabContasReceber: TcxTabSheet
        Caption = ' Contas a Receber '
        ImageIndex = 1
        ExplicitWidth = 885
        object GridFinanceiro: TcxGrid
          AlignWithMargins = True
          Left = 6
          Top = 3
          Width = 875
          Height = 96
          Margins.Left = 6
          Margins.Right = 0
          Margins.Bottom = 6
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 879
          object ViewFinanceiro: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsContasReceber
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            Styles.Content = StyleItemAtivo
            Styles.Inactive = StyleItemInativo
            Styles.Header = StyleHeader
            object Viewcodigo: TcxGridDBColumn
              Caption = '#ID'
              DataBinding.FieldName = 'codigo'
              Width = 50
            end
            object Viewempresa: TcxGridDBColumn
              DataBinding.FieldName = 'empresa'
              Visible = False
            end
            object Viewdata_registro: TcxGridDBColumn
              DataBinding.FieldName = 'data_registro'
              Visible = False
            end
            object Viewdata_movimento: TcxGridDBColumn
              Caption = 'Data'
              DataBinding.FieldName = 'data_movimento'
              Width = 100
            end
            object Viewusuario: TcxGridDBColumn
              DataBinding.FieldName = 'usuario'
              Visible = False
            end
            object Viewcd_tipo_conta: TcxGridDBColumn
              DataBinding.FieldName = 'cd_tipo_conta'
              Visible = False
            end
            object Viewtipo_conta: TcxGridDBColumn
              Caption = 'Tipo'
              DataBinding.FieldName = 'tipo_conta'
              Width = 160
            end
            object Viewpessoa: TcxGridDBColumn
              Caption = 'Cliente'
              DataBinding.FieldName = 'pessoa'
              Visible = False
              Width = 300
            end
            object Viewdocumento: TcxGridDBColumn
              Caption = 'Documento'
              DataBinding.FieldName = 'documento'
              Width = 100
            end
            object Viewvenda: TcxGridDBColumn
              Caption = 'Venda'
              DataBinding.FieldName = 'venda'
              Visible = False
              Width = 50
            end
            object Viewvalor: TcxGridDBColumn
              Caption = 'Valor'
              DataBinding.FieldName = 'valor'
              Width = 100
            end
            object Viewparcela: TcxGridDBColumn
              Caption = 'Parcela'
              DataBinding.FieldName = 'parcela'
              Width = 80
            end
            object Viewtotal_parcelas: TcxGridDBColumn
              Caption = 'Parcelas'
              DataBinding.FieldName = 'total_parcelas'
              Width = 80
            end
            object Viewcd_tipo_pagamento: TcxGridDBColumn
              DataBinding.FieldName = 'cd_tipo_pagamento'
              Visible = False
            end
            object Viewtipo_pagamento: TcxGridDBColumn
              Caption = 'Pagamento'
              DataBinding.FieldName = 'tipo_pagamento'
              Width = 100
            end
            object Viewcentro_custo: TcxGridDBColumn
              DataBinding.FieldName = 'centro_custo'
              Visible = False
            end
            object Viewvencimento: TcxGridDBColumn
              Caption = 'Vencimento'
              DataBinding.FieldName = 'vencimento'
              Width = 100
            end
            object Viewvalor_corrigido: TcxGridDBColumn
              Caption = 'Corre'#231#227'o'
              DataBinding.FieldName = 'valor_corrigido'
              Width = 100
            end
            object Viewjuros_valor: TcxGridDBColumn
              DataBinding.FieldName = 'juros_valor'
              Visible = False
            end
            object Viewdesconto_valor: TcxGridDBColumn
              DataBinding.FieldName = 'desconto_valor'
              Visible = False
            end
            object Viewdata_recebimento: TcxGridDBColumn
              Caption = 'Data Recebimento'
              DataBinding.FieldName = 'data_recebimento'
              Width = 100
            end
            object Viewcd_pessoa: TcxGridDBColumn
              DataBinding.FieldName = 'cd_pessoa'
              Visible = False
            end
            object Viewdescricao: TcxGridDBColumn
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'descricao'
              Width = 200
            end
            object Viewstatus: TcxGridDBColumn
              Caption = 'Status'
              DataBinding.FieldName = 'status'
              Visible = False
              Width = 120
            end
            object Viewquitada: TcxGridDBColumn
              Caption = 'Quitado'
              DataBinding.FieldName = 'quitada'
              Width = 60
            end
            object Viewmulta: TcxGridDBColumn
              DataBinding.FieldName = 'multa'
              Visible = False
            end
            object Viewnfe: TcxGridDBColumn
              Caption = 'NF-e'
              DataBinding.FieldName = 'nfe'
              Width = 100
            end
          end
          object MasterFinanceiro: TcxGridLevel
            GridView = ViewFinanceiro
          end
        end
      end
      object TabObservacoes: TcxTabSheet
        Caption = ' Observa'#231#245'es '
        ImageIndex = 2
        object mmoobservacao: TcxDBMemo
          AlignWithMargins = True
          Left = 3
          Top = 3
          Align = alClient
          DataBinding.DataField = 'observacao'
          DataBinding.DataSource = ds
          Properties.CharCase = ecUpperCase
          TabOrder = 0
          OnEnter = grpContentEnter
          ExplicitLeft = 6
          ExplicitTop = 6
          Height = 99
          Width = 875
        end
      end
    end
  end
  inherited pnlHelp: TPanel
    Width = 902
    ExplicitWidth = 906
    inherited mmoHelp: TMemo
      Width = 855
      ExplicitWidth = 859
    end
  end
  inherited ds: TUniDataSource
    Left = 192
    Top = 464
  end
  inherited qConsulta: TUniQuery
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
      #9'liquidado,'
      '        fechar,'
      '        cupom'
      '   FROM vendas'
      '  WHERE codigo = :codigo;')
    Left = 152
    Top = 464
    object qConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qConsultaempresa: TIntegerField
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
    object qConsultadata_registro: TDateTimeField
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
    object qConsultastatus: TStringField
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
    object qConsultafechar: TBooleanField
      FieldName = 'fechar'
      Required = True
    end
    object qConsultacupom: TIntegerField
      FieldName = 'cupom'
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 30408812
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
    Left = 240
    Top = 461
  end
  object dsRepresentante: TUniDataSource
    DataSet = qRepresentante
    Left = 280
    Top = 461
  end
  object qCliente: TUniQuery
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
      '  FROM pessoas where inativo = false and cliente = true')
    Left = 456
    Top = 461
  end
  object dsCliente: TUniDataSource
    DataSet = qCliente
    Left = 496
    Top = 461
  end
  object StyleRepository: TcxStyleRepository
    Left = 654
    Top = 463
    PixelsPerInch = 96
    object StyleHeader: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
    end
    object StyleItemInativo: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
    end
    object StyleItemAtivo: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clNavy
    end
  end
  object qItens: TUniQuery
    Tag = 7100
    SQLInsert.Strings = (
      'INSERT INTO venda_itens'
      
        '  (valor_unitario, desconto_unitario, acrescimo_unitario, quanti' +
        'dade, desconto_total, acrescimo_total, valor_total, entregue, ca' +
        'ncelado)'
      'VALUES'
      
        '  (:valor_unitario, :desconto_unitario, :acrescimo_unitario, :qu' +
        'antidade, :desconto_total, :acrescimo_total, :valor_total, :entr' +
        'egue, :cancelado)')
    SQLDelete.Strings = (
      'DELETE FROM venda_itens'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE venda_itens'
      'SET'
      
        '  valor_unitario = :valor_unitario, desconto_unitario = :descont' +
        'o_unitario, acrescimo_unitario = :acrescimo_unitario, quantidade' +
        ' = :quantidade, desconto_total = :desconto_total, acrescimo_tota' +
        'l = :acrescimo_total, valor_total = :valor_total, entregue = :en' +
        'tregue, cancelado = :cancelado'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM venda_itens'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT valor_unitario, desconto_unitario, acrescimo_unitario, qu' +
        'antidade, desconto_total, acrescimo_total, valor_total, entregue' +
        ', cancelado FROM venda_itens'
      'WHERE'
      '  codigo = :P_1_codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM venda_itens'
      ''
      ') t')
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT pci.codigo, '
      #9'pci.venda, '
      #9'pd.nome as produto, '
      #9'pci.valor_unitario, '
      #9'pci.quantidade, '
      #9'pci.valor_total, '
      #9'pci.entregue, '
      '        pci.valor_entregue,'
      #9'pci.cancelado,'
      #9'pc.categoria'
      '   FROM venda_itens pci'
      '   LEFT JOIN produtos pd on pd.codigo = pci.produto'
      '   LEFT JOIN produto_categorias pc on pc.codigo = pd.categoria'
      '  WHERE pci.venda = :codigo'
      '  ORDER BY pc.categoria, pd.nome ASC;')
    MasterSource = ds
    MasterFields = 'codigo'
    DetailFields = 'venda'
    AfterRefresh = qItensAfterRefresh
    Left = 552
    Top = 456
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = nil
      end>
  end
  object dsItens: TUniDataSource
    DataSet = qItens
    Left = 592
    Top = 456
  end
  object qSQL: TUniQuery
    Connection = Connection.Conn
    SQL.Strings = (
      'select calc_vendas(:venda);')
    Left = 352
    Top = 456
    ParamData = <
      item
        DataType = ftInteger
        Name = 'venda'
        ParamType = ptInput
        Value = nil
      end>
  end
  object qContasReceber: TUniQuery
    Tag = 7100
    Connection = Connection.Conn
    Transaction = Connection.UniTransaction
    UpdateTransaction = Connection.UniTransaction
    SQL.Strings = (
      'SELECT codigo, '
      #9'empresa, '
      #9'data_registro, '
      #9'data_movimento, '
      #9'usuario, '
      #9'cd_tipo_conta, '
      #9'tipo_conta, '
      #9'documento, '
      #9'descricao, '
      #9'venda, '
      #9'valor, '
      #9'parcela, '
      #9'total_parcelas, '
      #9'cd_tipo_pagamento, '
      #9'tipo_pagamento, '
      #9'centro_custo, '
      #9'vencimento, '
      #9'valor_corrigido, '
      #9'juros_valor, '
      #9'desconto_valor, '
      #9'data_recebimento, '
      #9'cd_pessoa, '
      #9'pessoa, '
      #9'status, '
      #9'quitada, '
      #9'multa, '
      #9'nfe'
      '   FROM vw_contas_receber;')
    MasterSource = ds
    MasterFields = 'codigo'
    DetailFields = 'venda'
    Left = 78
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = nil
      end>
  end
  object dsContasReceber: TUniDataSource
    DataSet = qContasReceber
    Left = 142
    Top = 280
  end
  object tmrFechamento: TTimer
    Enabled = False
    OnTimer = tmrFechamentoTimer
    Left = 341
    Top = 288
  end
  object qPagamentos: TUniQuery
    Tag = 7100
    Connection = Connection.Conn
    Transaction = Connection.UniTransaction
    UpdateTransaction = Connection.UniTransaction
    SQL.Strings = (
      'SELECT vd.codigo, '
      #9'vd.venda, '
      #9'tp.descricao as forma,'
      #9'vd.valor_parcela, '
      #9'vd.numero_parcela, '
      #9'vd.valor_total, '
      #9'vd.total_parcelas, '
      #9'vd.data_regristro, '
      #9'vd.data_pagamento, '
      #9'vd.liquidado, '
      #9'vd.caixa, '
      #9'vd.usuario,'
      #9'ps.fantasia'
      '   FROM venda_pagamentos vd'
      '   left JOIN tipo_pagamentos tp on tp.codigo = vd.forma'
      '   LEFT join pessoas ps on ps.codigo = vd.usuario'
      '  WHERE venda = :codigo;')
    MasterSource = ds
    MasterFields = 'codigo'
    DetailFields = 'venda'
    Left = 78
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = nil
      end>
  end
  object dsPagamentos: TUniDataSource
    DataSet = qPagamentos
    Left = 142
    Top = 336
  end
end
