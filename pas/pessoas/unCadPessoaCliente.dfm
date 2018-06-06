inherited frmCadPessoaCliente: TfrmCadPessoaCliente
  Caption = 'Cadastro de Pessoas - Clientes'
  OnCreate = FormCreate
  ExplicitTop = 8
  PixelsPerInch = 96
  TextHeight = 15
  inherited grpContent: TGroupBox
    inherited cbbTipoPessoa: TcxDBImageComboBox
      ExplicitHeight = 23
    end
    inherited chbInativo: TcxDBCheckBox
      ExplicitHeight = 23
    end
    inherited edtCNPJ: TcxDBTextEdit
      ExplicitHeight = 23
    end
    inherited edtCodigo: TcxDBSpinEdit
      ExplicitHeight = 23
    end
    inherited edtDataCadastro: TcxDBDateEdit
      ExplicitHeight = 23
    end
    inherited edtFantasia: TcxDBTextEdit
      ExplicitHeight = 23
    end
    inherited edtIE: TcxDBTextEdit
      ExplicitHeight = 23
    end
    inherited edtIM: TcxDBTextEdit
      ExplicitHeight = 23
    end
    inherited edtNome: TcxDBTextEdit
      ExplicitHeight = 23
    end
    inherited edtNomeReduzido: TcxDBTextEdit
      ExplicitHeight = 23
    end
    inherited grpInfo: TGroupBox
      ExplicitTop = 137
      ExplicitHeight = 280
      inherited PageControl: TcxPageControl
        ExplicitHeight = 255
        inherited TabContato: TcxTabSheet
          ExplicitTop = 25
          ExplicitWidth = 770
          ExplicitHeight = 230
          inherited PageControlEndereco: TcxPageControl
            ExplicitHeight = 224
            inherited TabPrincipal: TcxTabSheet
              inherited edtCEP: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited btnBuscarCEP: TButton
                HotImageIndex = 59
              end
              inherited edtLogradouro: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtEndereco_numero: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtReferencia: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtComplemento: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtBairro: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtCidade: TcxDBSpinEdit
                ExplicitHeight = 23
              end
              inherited cbbCidade: TcxDBLookupComboBox
                ExplicitHeight = 23
              end
              inherited edtSite: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtEmail: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtTel1: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtTel2: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtTel3: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtPais: TcxDBSpinEdit
                ExplicitHeight = 23
              end
              inherited cbbPais: TcxDBLookupComboBox
                ExplicitHeight = 23
              end
              inherited cbbUF: TcxDBImageComboBox
                ExplicitHeight = 23
              end
            end
            inherited TabCobranca: TcxTabSheet
              inherited Button2: TButton
                HotImageIndex = 59
              end
              inherited edtCOBbairro: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtCOBcep: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtCOBcidade: TcxDBSpinEdit
                ExplicitHeight = 23
              end
              inherited edtCOBcomplemento: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtCOBendereco_numero: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtCOBendereco: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtCOBreferencia: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtCOBtel1: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtCOBtel2: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtCOBtel3: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited cbbCidadeCobranca: TcxDBLookupComboBox
                ExplicitHeight = 23
              end
              inherited edtCOBpais: TcxDBSpinEdit
                ExplicitHeight = 23
              end
              inherited cbbcobuf: TcxDBImageComboBox
                ExplicitHeight = 23
              end
              inherited cbbCOBpais: TcxDBLookupComboBox
                ExplicitHeight = 23
              end
            end
            inherited TabEntrega: TcxTabSheet
              inherited Button1: TButton
                HotImageIndex = 59
              end
              inherited edtENTbairro: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtENTcep: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtENTcidade: TcxDBSpinEdit
                ExplicitHeight = 23
              end
              inherited edtENTcomplemento: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtENTendereco_numero: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtENTendereco: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtENTreferencia: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtENTtel1: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtENTtel2: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited edtENTtel3: TcxDBTextEdit
                ExplicitHeight = 23
              end
              inherited cbbCidadeEntrega: TcxDBLookupComboBox
                ExplicitHeight = 23
              end
              inherited edtENTpais: TcxDBSpinEdit
                ExplicitHeight = 23
              end
              inherited cbbENTpais: TcxDBLookupComboBox
                ExplicitHeight = 23
              end
              inherited cbbentuf: TcxDBImageComboBox
                ExplicitHeight = 23
              end
            end
            inherited TabResponsavel: TcxTabSheet
              ExplicitLeft = 4
              ExplicitTop = 26
              ExplicitWidth = 756
              ExplicitHeight = 194
            end
          end
        end
        inherited TabObsercacao: TcxTabSheet
          ExplicitTop = 25
          ExplicitWidth = 770
          ExplicitHeight = 230
          inherited grp1: TGroupBox
            ExplicitHeight = 230
            inherited edtDataNasc: TcxDBDateEdit
              ExplicitHeight = 23
            end
            inherited grpAlerta: TGroupBox
              ExplicitTop = 36
            end
            inherited grpObservacoes: TGroupBox
              ExplicitTop = 120
            end
            inherited cbbimgSexo: TcxDBImageComboBox
              ExplicitHeight = 23
            end
          end
        end
        inherited TabPerfil: TcxTabSheet
          Caption = 'Modulo Web'
          ExplicitTop = 25
          ExplicitWidth = 770
          ExplicitHeight = 230
          object grpModuloWeb: TGroupBox
            Left = 0
            Top = 0
            Width = 770
            Height = 230
            Align = alClient
            Caption = ' Usu'#225'rios registrador para o cliente '
            TabOrder = 0
            object GridWeb: TcxGrid
              AlignWithMargins = True
              Left = 8
              Top = 20
              Width = 760
              Height = 202
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
              object ViewWeb: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                DataController.DataSource = ds
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.Indicator = True
              end
              object MasterWeb: TcxGridLevel
                GridView = ViewWeb
              end
            end
          end
        end
        object TabFinanceiro: TcxTabSheet
          Caption = ' Financeiro '
          ImageIndex = 3
          object PageControlFinanceiro: TcxPageControl
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 764
            Height = 224
            Align = alClient
            TabOrder = 0
            Properties.ActivePage = TabFinanceiroContas
            Properties.CustomButtons.Buttons = <>
            ClientRectBottom = 220
            ClientRectLeft = 4
            ClientRectRight = 760
            ClientRectTop = 26
            object TabFinanceiroContas: TcxTabSheet
              Caption = ' Contas Bancarias '
              ImageIndex = 0
              object GridContas: TcxGrid
                AlignWithMargins = True
                Left = 6
                Top = 3
                Width = 716
                Height = 185
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
                object ViewContas: TcxGridDBTableView
                  Navigator.Buttons.CustomButtons = <>
                  DataController.DataSource = dsContas
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsSelection.CellSelect = False
                  OptionsView.ColumnAutoWidth = True
                  OptionsView.GroupByBox = False
                  OptionsView.Indicator = True
                  Styles.Content = StyleItemAtivo
                  Styles.Header = StyleHeader
                  object ViewContascodigo: TcxGridDBColumn
                    Caption = '#ID'
                    DataBinding.FieldName = 'codigo'
                    Visible = False
                    Width = 50
                  end
                  object ViewContaspessoa: TcxGridDBColumn
                    DataBinding.FieldName = 'pessoa'
                    Visible = False
                  end
                  object ViewContasbanco: TcxGridDBColumn
                    Caption = 'Banco'
                    DataBinding.FieldName = 'banco'
                    Width = 200
                  end
                  object ViewContastipo_conta: TcxGridDBColumn
                    Caption = 'Tipo'
                    DataBinding.FieldName = 'tipo_conta'
                    PropertiesClassName = 'TcxImageComboBoxProperties'
                    Properties.Items = <
                      item
                        Description = 'Conta Poupan'#231'a'
                        ImageIndex = 0
                        Value = 'CP'
                      end
                      item
                        Description = 'Conta Corrente'
                        Value = 'CC'
                      end>
                    Width = 100
                  end
                  object ViewContasagencia_num: TcxGridDBColumn
                    Caption = 'Agencia'
                    DataBinding.FieldName = 'agencia_num'
                    Width = 60
                  end
                  object ViewContasagencia_cod: TcxGridDBColumn
                    Caption = 'Digito'
                    DataBinding.FieldName = 'agencia_cod'
                    Width = 40
                  end
                  object ViewContasconta_num: TcxGridDBColumn
                    Caption = 'Conta'
                    DataBinding.FieldName = 'conta_num'
                    Width = 60
                  end
                  object ViewContasconta_cod: TcxGridDBColumn
                    Caption = 'Digito'
                    DataBinding.FieldName = 'conta_cod'
                    Width = 40
                  end
                  object ViewContasconta_principal: TcxGridDBColumn
                    Caption = 'Principal'
                    DataBinding.FieldName = 'conta_principal'
                    Width = 50
                  end
                  object ViewContasconta_inativa: TcxGridDBColumn
                    Caption = 'Inativa'
                    DataBinding.FieldName = 'conta_inativa'
                    Width = 50
                  end
                end
                object MasterContas: TcxGridLevel
                  GridView = ViewContas
                end
              end
              object pnlContasACT: TPanel
                Left = 722
                Top = 0
                Width = 34
                Height = 194
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 1
                DesignSize = (
                  34
                  194)
                object btnContasADD: TButton
                  Left = 4
                  Top = 3
                  Width = 27
                  Height = 27
                  Anchors = [akTop, akRight]
                  HotImageIndex = 3
                  ImageIndex = 3
                  ImageMargins.Left = 2
                  Images = ImageList16
                  TabOrder = 0
                  OnClick = btnContasADDClick
                end
                object btnContasEDT: TButton
                  Left = 4
                  Top = 36
                  Width = 27
                  Height = 27
                  Anchors = [akTop, akRight]
                  HotImageIndex = 24
                  ImageIndex = 24
                  ImageMargins.Left = 2
                  Images = ImageList16
                  TabOrder = 1
                  OnClick = btnContasEDTClick
                end
                object btnContasRMV: TButton
                  Left = 4
                  Top = 69
                  Width = 27
                  Height = 27
                  Anchors = [akTop, akRight]
                  HotImageIndex = 4
                  ImageIndex = 4
                  ImageMargins.Left = 2
                  Images = ImageList16
                  TabOrder = 2
                  OnClick = btnContasRMVClick
                end
                object btnContasAtualizar: TButton
                  Left = 4
                  Top = 102
                  Width = 27
                  Height = 27
                  Anchors = [akTop, akRight]
                  HotImageIndex = 5
                  ImageIndex = 5
                  ImageMargins.Left = 2
                  Images = ImageList16
                  TabOrder = 3
                  OnClick = btnContasAtualizarClick
                end
              end
            end
            object TabFinanceiroMovimentacao: TcxTabSheet
              Caption = ' Movimenta'#231#227'o '
              ImageIndex = 1
              object GridMovimentacao: TcxGrid
                AlignWithMargins = True
                Left = 6
                Top = 3
                Width = 750
                Height = 185
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
                object ViewMovimentacao: TcxGridDBTableView
                  Navigator.Buttons.CustomButtons = <>
                  DataController.DataSource = dsMovimentacao
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
                  Styles.Header = StyleHeader
                  object ViewMovimentacaocodigo: TcxGridDBColumn
                    Caption = '#ID'
                    DataBinding.FieldName = 'codigo'
                    Width = 50
                  end
                  object ViewMovimentacaopedido: TcxGridDBColumn
                    Caption = 'Pedido'
                    DataBinding.FieldName = 'pedido'
                    Width = 60
                  end
                  object ViewMovimentacaocd_cliente: TcxGridDBColumn
                    DataBinding.FieldName = 'cd_cliente'
                    Visible = False
                  end
                  object ViewMovimentacaocd_representante: TcxGridDBColumn
                    DataBinding.FieldName = 'cd_representante'
                    Visible = False
                  end
                  object ViewMovimentacaorepresentante: TcxGridDBColumn
                    Caption = 'Representante'
                    DataBinding.FieldName = 'representante'
                    Width = 200
                  end
                  object ViewMovimentacaodata_venda: TcxGridDBColumn
                    Caption = 'Data'
                    DataBinding.FieldName = 'data_venda'
                    Width = 80
                  end
                  object ViewMovimentacaodata_entrega: TcxGridDBColumn
                    Caption = 'Entrega'
                    DataBinding.FieldName = 'data_entrega'
                    Width = 80
                  end
                  object ViewMovimentacaostatus: TcxGridDBColumn
                    Caption = 'Status'
                    DataBinding.FieldName = 'status'
                    PropertiesClassName = 'TcxImageComboBoxProperties'
                    Properties.Items = <
                      item
                        Description = 'CANCELADO'
                        ImageIndex = 0
                        Value = 'C'
                      end
                      item
                        Description = 'FECHADO'
                        Value = 'F'
                      end
                      item
                        Description = 'PENDENTE'
                        Value = 'P'
                      end>
                    Width = 80
                  end
                  object ViewMovimentacaototal_pedido: TcxGridDBColumn
                    Caption = 'Total Venda'
                    DataBinding.FieldName = 'total_pedido'
                    Width = 80
                  end
                  object ViewMovimentacaototal_produtos: TcxGridDBColumn
                    Caption = 'Total Produtos'
                    DataBinding.FieldName = 'total_produtos'
                    Width = 80
                  end
                  object ViewMovimentacaocupom: TcxGridDBColumn
                    Caption = 'Cupom'
                    DataBinding.FieldName = 'cupom'
                    Width = 60
                  end
                  object ViewMovimentacaonota: TcxGridDBColumn
                    Caption = 'Nota'
                    DataBinding.FieldName = 'nota'
                    Width = 60
                  end
                  object ViewMovimentacaoconcluido: TcxGridDBColumn
                    Caption = 'Concluido'
                    DataBinding.FieldName = 'concluido'
                    Width = 50
                  end
                  object ViewMovimentacaoentregue: TcxGridDBColumn
                    Caption = 'Entregue'
                    DataBinding.FieldName = 'entregue'
                    Width = 50
                  end
                  object ViewMovimentacaoliquidado: TcxGridDBColumn
                    Caption = 'Liquidado'
                    DataBinding.FieldName = 'liquidado'
                    Width = 50
                  end
                end
                object MasterMovimentacao: TcxGridLevel
                  GridView = ViewMovimentacao
                end
              end
            end
            object TabFinanceiroSaldos: TcxTabSheet
              Caption = ' Saldos '
              ImageIndex = 2
              object GridSaldos: TcxGrid
                AlignWithMargins = True
                Left = 6
                Top = 3
                Width = 716
                Height = 185
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
                object ViewSaldos: TcxGridDBTableView
                  Navigator.Buttons.CustomButtons = <>
                  DataController.DataSource = dsSaldos
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
                  Styles.Header = StyleHeader
                  object ViewSaldoscodigo: TcxGridDBColumn
                    Caption = '#ID'
                    DataBinding.FieldName = 'codigo'
                    Width = 50
                  end
                  object ViewSaldospessoa: TcxGridDBColumn
                    DataBinding.FieldName = 'pessoa'
                    Visible = False
                  end
                  object ViewSaldosdata_registro: TcxGridDBColumn
                    Caption = 'Data'
                    DataBinding.FieldName = 'data_registro'
                    Width = 80
                  end
                  object ViewSaldostipo_receita: TcxGridDBColumn
                    Caption = 'Receita'
                    DataBinding.FieldName = 'tipo_receita'
                    PropertiesClassName = 'TcxImageComboBoxProperties'
                    Properties.Items = <
                      item
                        Description = 'CREDITO'
                        ImageIndex = 0
                        Value = 0
                      end
                      item
                        Description = 'DEBITO'
                        Value = 1
                      end>
                    Width = 120
                  end
                  object ViewSaldosvalor: TcxGridDBColumn
                    Caption = 'Valor'
                    DataBinding.FieldName = 'valor'
                    Width = 80
                  end
                  object ViewSaldosliquidado: TcxGridDBColumn
                    Caption = 'Liquidado'
                    DataBinding.FieldName = 'liquidado'
                    Width = 70
                  end
                  object ViewSaldosparcial: TcxGridDBColumn
                    Caption = 'Parcial'
                    DataBinding.FieldName = 'parcial'
                    Width = 60
                  end
                  object ViewSaldosorigem: TcxGridDBColumn
                    Caption = 'Origem'
                    DataBinding.FieldName = 'origem'
                    Width = 60
                  end
                  object ViewSaldosdescricao: TcxGridDBColumn
                    Caption = 'Descri'#231#227'o'
                    DataBinding.FieldName = 'descricao'
                    Width = 300
                  end
                  object ViewSaldosmovimento: TcxGridDBColumn
                    Caption = 'Movimenta'#231#227'o'
                    DataBinding.FieldName = 'movimento'
                    Width = 60
                  end
                  object ViewSaldosobservacao: TcxGridDBColumn
                    DataBinding.FieldName = 'observacao'
                    Visible = False
                  end
                end
                object MasterSaldos: TcxGridLevel
                  GridView = ViewSaldos
                end
              end
              object pnlSaldoACT: TPanel
                Left = 722
                Top = 0
                Width = 34
                Height = 194
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 1
                DesignSize = (
                  34
                  194)
                object btnADD: TButton
                  Left = 4
                  Top = 3
                  Width = 27
                  Height = 27
                  Anchors = [akTop, akRight]
                  HotImageIndex = 3
                  ImageIndex = 3
                  ImageMargins.Left = 2
                  Images = ImageList16
                  TabOrder = 0
                  OnClick = btnADDClick
                end
                object btnEDT: TButton
                  Left = 4
                  Top = 36
                  Width = 27
                  Height = 27
                  Anchors = [akTop, akRight]
                  HotImageIndex = 24
                  ImageIndex = 24
                  ImageMargins.Left = 2
                  Images = ImageList16
                  TabOrder = 1
                  OnClick = btnEDTClick
                end
                object btnRMV: TButton
                  Left = 4
                  Top = 69
                  Width = 27
                  Height = 27
                  Anchors = [akTop, akRight]
                  HotImageIndex = 4
                  ImageIndex = 4
                  ImageMargins.Left = 2
                  Images = ImageList16
                  TabOrder = 2
                  OnClick = btnRMVClick
                end
                object btnAtualizar: TButton
                  Left = 4
                  Top = 102
                  Width = 27
                  Height = 27
                  Anchors = [akTop, akRight]
                  HotImageIndex = 5
                  ImageIndex = 5
                  ImageMargins.Left = 2
                  Images = ImageList16
                  TabOrder = 3
                  OnClick = btnAtualizarClick
                end
              end
            end
          end
        end
        object TabVendas: TcxTabSheet
          Caption = 'Vendas'
          ImageIndex = 3
          object PageControl1: TcxPageControl
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 764
            Height = 224
            Align = alClient
            TabOrder = 0
            Properties.ActivePage = TabRegrasPreco
            Properties.CustomButtons.Buttons = <>
            ExplicitLeft = 6
            ExplicitTop = 6
            ClientRectBottom = 220
            ClientRectLeft = 4
            ClientRectRight = 760
            ClientRectTop = 26
            object TabRegrasPreco: TcxTabSheet
              Caption = ' Regra de pre'#231'os '
              ImageIndex = 1
              DesignSize = (
                756
                194)
              object Grid: TcxGrid
                AlignWithMargins = True
                Left = 6
                Top = 34
                Width = 744
                Height = 154
                Margins.Left = 6
                Margins.Top = 34
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
                ExplicitLeft = 12
                ExplicitTop = 9
                ExplicitHeight = 185
                object View: TcxGridDBTableView
                  Navigator.Buttons.CustomButtons = <>
                  DataController.DataSource = dsItens
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsSelection.CellSelect = False
                  OptionsView.ColumnAutoWidth = True
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
                  object ColumnMarkup_vista: TcxGridDBColumn
                    Caption = 'Markup a Vista'
                    DataBinding.FieldName = 'markup_vista'
                    Width = 80
                  end
                  object ColumnValor_vista: TcxGridDBColumn
                    Caption = 'Valor a Vista'
                    DataBinding.FieldName = 'valor_vista'
                    Width = 80
                  end
                  object ColumnMarkup_prazo: TcxGridDBColumn
                    Caption = 'Markup a Prazo'
                    DataBinding.FieldName = 'markup_prazo'
                    Width = 80
                  end
                  object ColumnValor_prazo: TcxGridDBColumn
                    Caption = 'Valor a Prazo'
                    DataBinding.FieldName = 'valor_prazo'
                    Width = 80
                  end
                end
                object Master: TcxGridLevel
                  GridView = View
                end
              end
              object btnRegrasINS: TButton
                Left = 6
                Top = 3
                Width = 27
                Height = 27
                Anchors = [akTop, akRight]
                HotImageIndex = 3
                ImageIndex = 3
                ImageMargins.Left = 2
                Images = ImageList16
                TabOrder = 1
                OnClick = btnRegrasINSClick
              end
              object btnRegrasRMV: TButton
                Left = 723
                Top = 3
                Width = 27
                Height = 27
                Anchors = [akTop, akRight]
                HotImageIndex = 4
                ImageIndex = 4
                ImageMargins.Left = 2
                Images = ImageList16
                TabOrder = 2
                OnClick = btnRegrasRMVClick
              end
              object btnRegrasEDT: TButton
                Left = 39
                Top = 3
                Width = 27
                Height = 27
                Anchors = [akTop, akRight]
                HotImageIndex = 24
                ImageIndex = 24
                ImageMargins.Left = 2
                Images = ImageList16
                TabOrder = 3
                OnClick = btnRegrasEDTClick
              end
              object btnRegrasSAV: TButton
                Left = 690
                Top = 3
                Width = 27
                Height = 27
                Anchors = [akTop, akRight]
                HotImageIndex = 1
                ImageIndex = 1
                ImageMargins.Left = 2
                Images = ImageList16
                TabOrder = 4
                OnClick = btnRegrasSAVClick
              end
              object cbbRegraPreco: TcxDBLookupComboBox
                Left = 203
                Top = 5
                DataBinding.DataField = 'regra'
                DataBinding.DataSource = dsRegrasPrecos
                Enabled = False
                Properties.KeyFieldNames = 'codigo'
                Properties.ListColumns = <
                  item
                    Caption = 'C'#243'digo'
                    Width = 60
                    FieldName = 'codigo'
                  end
                  item
                    Caption = 'Descri'#231#227'o'
                    Width = 240
                    FieldName = 'descricao'
                  end>
                Properties.ListFieldIndex = 1
                Properties.ListSource = dmPessoaClientes.dsRegras
                TabOrder = 5
                OnEnter = grpContentEnter
                OnMouseMove = imgHelpMouseMove
                Width = 448
              end
              object edtRegraPreco: TcxDBSpinEdit
                Left = 72
                Top = 5
                DataBinding.DataField = 'regra'
                DataBinding.DataSource = dsRegrasPrecos
                Enabled = False
                Properties.SpinButtons.Visible = False
                TabOrder = 6
                OnEnter = grpContentEnter
                OnMouseEnter = imgHelpMouseEnter
                Width = 125
              end
              object btnRegrasCNC: TButton
                Left = 657
                Top = 3
                Width = 27
                Height = 27
                Anchors = [akTop, akRight]
                HotImageIndex = 10
                ImageIndex = 10
                ImageMargins.Left = 2
                Images = ImageList16
                TabOrder = 7
                OnClick = btnRegrasCNCClick
              end
            end
            object TabRegistroVendas: TcxTabSheet
              Caption = ' Vendas realizadas '
              ImageIndex = 2
              object GridVendas: TcxGrid
                AlignWithMargins = True
                Left = 6
                Top = 3
                Width = 750
                Height = 185
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
                ExplicitTop = 9
                object ViewVendas: TcxGridDBTableView
                  Navigator.Buttons.CustomButtons = <>
                  DataController.DataSource = dsVendas
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsSelection.CellSelect = False
                  OptionsView.ColumnAutoWidth = True
                  OptionsView.Indicator = True
                  Styles.Content = StyleItemAtivo
                  Styles.Inactive = StyleItemInativo
                  Styles.Header = StyleHeader
                  object ColumnViewcodigo: TcxGridDBColumn
                    Caption = '#ID'
                    DataBinding.FieldName = 'codigo'
                    Width = 50
                  end
                  object ColumnViewfornecedor: TcxGridDBColumn
                    Caption = 'Cliente'
                    DataBinding.FieldName = 'cliente'
                    Visible = False
                    Width = 300
                  end
                  object ColumnViewrepresentante: TcxGridDBColumn
                    Caption = 'Representante'
                    DataBinding.FieldName = 'representante'
                    VisibleForCustomization = False
                    Width = 200
                  end
                  object ColumnViewdata_pedido: TcxGridDBColumn
                    Caption = 'Data'
                    DataBinding.FieldName = 'data_venda'
                    Width = 80
                  end
                  object ColumnViewprevisao_entrega: TcxGridDBColumn
                    Caption = 'Total'
                    DataBinding.FieldName = 'total_pedido'
                    Width = 100
                  end
                  object ColumnViewstatus: TcxGridDBColumn
                    Caption = 'Status'
                    DataBinding.FieldName = 'status'
                    Width = 100
                  end
                  object Column1: TcxGridDBColumn
                    DataBinding.FieldName = 'idstatus'
                    Visible = False
                  end
                end
                object MasterVendas: TcxGridLevel
                  GridView = ViewVendas
                end
              end
            end
          end
        end
      end
    end
  end
  inherited ds: TUniDataSource
    Left = 576
    Top = 95
  end
  inherited qConsulta: TUniQuery
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
      ' WHERE ps.cliente = true and ps.codigo = :codigo;')
    Left = 536
    Top = 95
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 6226412
  end
  inherited qCidade: TUniQuery
    Left = 456
  end
  inherited dsCidade: TUniDataSource
    Left = 680
    Top = 120
  end
  inherited qPais: TUniQuery
    Left = 624
    Top = 120
  end
  inherited dsPais: TUniDataSource
    Left = 680
    Top = 72
  end
  inherited dsEndEntrega: TUniDataSource
    Left = 360
  end
  object dsPerfil: TUniDataSource
    Left = 744
    Top = 72
  end
  object dsContas: TUniDataSource
    DataSet = qContas
    Left = 736
    Top = 200
  end
  object dsBanco: TUniDataSource
    Left = 744
    Top = 120
  end
  object qMovimentacao: TUniQuery
    Tag = 7100
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT codigo, '
      #9'pedido, '
      #9'cd_cliente, '
      #9'cd_representante, '
      #9'representante, '
      #9'data_venda, '
      #9'data_entrega, '
      #9'status, '
      #9'total_pedido, '
      #9'total_produtos, '
      #9'concluido, '
      #9'entregue, '
      #9'liquidado, '
      #9'cupom, nota'
      '   FROM vw_pessoa_movimentacao'
      '  WHERE cd_cliente = :codigo')
    MasterSource = ds
    MasterFields = 'codigo'
    DetailFields = 'cd_cliente'
    Left = 456
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = nil
      end>
  end
  object dsMovimentacao: TUniDataSource
    DataSet = qMovimentacao
    Left = 512
    Top = 200
  end
  object StyleRepository: TcxStyleRepository
    Left = 494
    Top = 65535
    PixelsPerInch = 96
    object StyleHeader: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
    end
    object StyleItemInativo: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
    end
    object StyleItemAtivo: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clNavy
    end
    object StylePendente: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object StyleConcluido: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clGreen
    end
    object StyleCancelado: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clGray
    end
    object StyleParcial: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TextColor = clMaroon
    end
    object StyleFechado: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clWindowText
    end
  end
  object qSaldos: TUniQuery
    Tag = 7100
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT codigo, '
      #9'pessoa, '
      #9'data_registro, '
      #9'tipo_receita, '
      #9'valor, '
      #9'parcial, '
      #9'origem, '
      #9'descricao, '
      #9'movimento,'
      #9'liquidado,'
      #9'observacao'
      '   FROM pessoa_saldo'
      '  WHERE pessoa = :codigo')
    MasterSource = ds
    MasterFields = 'codigo'
    DetailFields = 'pessoa'
    Left = 568
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = nil
      end>
  end
  object dsSaldos: TUniDataSource
    DataSet = qSaldos
    Left = 624
    Top = 200
  end
  object qContas: TUniQuery
    Tag = 7100
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT pc.codigo, '
      #9'pc.pessoa, '
      #9'pc.banco as cd_banco,'
      #9'b.nome as banco, '
      #9'pc.tipo_conta, '
      #9'pc.agencia_num, '
      #9'pc.agencia_cod, '
      #9'pc.conta_num, '
      #9'pc.conta_cod, '
      #9'pc.conta_principal, '
      #9'pc.conta_inativa'
      '   FROM pessoa_contabancaria pc'
      '   LEFT JOIN bancos b on b.codigo = pc.banco'
      '  WHERE pc.pessoa = :codigo')
    MasterSource = ds
    MasterFields = 'codigo'
    DetailFields = 'pessoa'
    Left = 680
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = nil
      end>
  end
  object qVendas: TUniQuery
    Tag = 7100
    SQLDelete.Strings = (
      'DELETE FROM pedido_compras'
      'WHERE'
      '  codigo = :Old_codigo')
    Connection = Connection.Conn
    Transaction = Connection.UniTransaction
    UpdateTransaction = Connection.UniTransaction
    SQL.Strings = (
      'SELECT vwv.codigo, '
      #9'vwv.empresa, '
      #9'vwv.pedido, '
      #9'vwv.cd_cliente, '
      #9'vwv.cliente, '
      #9'vwv.cd_representante, '
      #9'vwv.representante, '
      #9'vwv.data_registro, '
      #9'vwv.previsao_entrega, '
      #9'vwv.data_venda, '
      #9'vwv.data_entrega, '
      #9'vwv.idstatus, '
      #9'vwv.status, '
      #9'vwv.observacao, '
      #9'vwv.total_pedido, '
      #9'vwv.total_produtos, '
      #9'vwv.concluido, '
      #9'vwv.entregue, '
      #9'vwv.liquidado'
      '   FROM vw_vendas vwv'
      '  WHERE vwv.cd_cliente = :codigo'
      '  ORDER BY vwv.status, vwv.previsao_entrega;')
    MasterSource = ds
    MasterFields = 'codigo'
    DetailFields = 'cd_cliente'
    Left = 350
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = nil
      end>
  end
  object dsVendas: TUniDataSource
    DataSet = qVendas
    Left = 390
    Top = 200
  end
  object qRegrasPrecos: TUniQuery
    Tag = 7100
    SQLInsert.Strings = (
      'INSERT INTO pessoa_regras'
      '  (pessoa, regra)'
      'VALUES'
      '  (:pessoa, :regra)')
    SQLDelete.Strings = (
      'DELETE FROM pessoa_regras'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE pessoa_regras'
      'SET'
      '  pessoa = :pessoa, regra = :regra'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM pessoa_regras'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      'SELECT pessoa, regra FROM pessoa_regras'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM pessoa_regras'
      ''
      ') t')
    Connection = Connection.Conn
    Transaction = Connection.UniTransaction
    UpdateTransaction = Connection.UniTransaction
    SQL.Strings = (
      'SELECT codigo, pessoa, regra, data_inicio'
      '   FROM pessoa_regras'
      '  WHERE pessoa = :codigo')
    MasterSource = ds
    MasterFields = 'codigo'
    DetailFields = 'pessoa'
    AfterInsert = qRegrasPrecosAfterInsert
    AfterEdit = qRegrasPrecosAfterInsert
    AfterPost = qRegrasPrecosAfterPost
    AfterCancel = qRegrasPrecosAfterPost
    AfterDelete = qRegrasPrecosAfterDelete
    Left = 350
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = nil
      end>
  end
  object dsRegrasPrecos: TUniDataSource
    DataSet = qRegrasPrecos
    Left = 390
    Top = 248
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
      'SELECT pp.codigo,'
      #9'pp.regra, '
      #9'pp.produto as idproduto, '
      #9'pd.nome as produto,'
      #9'pc.categoria,'
      #9'pp.markup_vista, '
      #9'pp.valor_vista, '
      #9'pp.markup_prazo,'
      #9'pp.valor_prazo'
      '   FROM produto_precos pp'
      '   LEFT JOIN produtos pd on pd.codigo = pp.produto'
      '   LEFT JOIN produto_categorias pc on pc.codigo = pd.categoria'
      '  WHERE pp.regra = :regra'
      '  ORDER BY pc.categoria, pd.nome ASC;')
    MasterSource = dsRegrasPrecos
    MasterFields = 'regra'
    DetailFields = 'regra'
    Left = 456
    Top = 246
    ParamData = <
      item
        DataType = ftInteger
        Name = 'regra'
        ParamType = ptInput
        Value = nil
      end>
  end
  object dsItens: TUniDataSource
    DataSet = qItens
    Left = 496
    Top = 246
  end
end
