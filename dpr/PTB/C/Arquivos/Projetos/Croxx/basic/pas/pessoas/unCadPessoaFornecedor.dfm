inherited frmCadPessoaFornecedor: TfrmCadPessoaFornecedor
  Caption = 'Cadastro de Pessoas - Fornecedores'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 15
  inherited grpContent: TGroupBox
    inherited grpInfo: TGroupBox
      inherited PageControl: TcxPageControl
        inherited TabContato: TcxTabSheet
          inherited PageControlEndereco: TcxPageControl
            inherited TabPrincipal: TcxTabSheet
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              inherited cbbUF: TcxDBImageComboBox
                ExplicitHeight = 21
              end
            end
            inherited TabCobranca: TcxTabSheet
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              inherited cbbcobuf: TcxDBImageComboBox
                ExplicitHeight = 21
              end
            end
            inherited TabEntrega: TcxTabSheet
              ExplicitWidth = 0
              ExplicitHeight = 0
              inherited cbbentuf: TcxDBImageComboBox
                ExplicitHeight = 21
              end
            end
          end
        end
        inherited TabPerfil: TcxTabSheet
          Caption = ' Produtos Comercializados '
          object grpFornecedores: TGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 764
            Height = 222
            Align = alClient
            Caption = ' Lista de Fornecedores '
            TabOrder = 0
            ExplicitLeft = 6
            ExplicitTop = 6
            object Grid: TcxGrid
              AlignWithMargins = True
              Left = 8
              Top = 20
              Width = 748
              Height = 154
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
              object View: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                DataController.DataSource = dsProdutos
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
                object ColumnFornecedor: TcxGridDBColumn
                  Caption = 'Produto'
                  DataBinding.FieldName = 'produto_nome'
                  Width = 180
                end
                object ColumnRepresentante: TcxGridDBColumn
                  Caption = 'Representante'
                  DataBinding.FieldName = 'nome_representante'
                  Width = 160
                end
                object ColumnUltimaCompra: TcxGridDBColumn
                  Caption = 'Ultima Compra'
                  DataBinding.FieldName = 'ultima_compra'
                  Width = 70
                end
                object ColumnPrecoCompra: TcxGridDBColumn
                  Caption = 'Pre'#231'o  de compra'
                  DataBinding.FieldName = 'preco_compra'
                  Width = 70
                end
                object ColumnTempoEntrega: TcxGridDBColumn
                  Caption = 'Tempo Entrega'
                  DataBinding.FieldName = 'tempo_entrega'
                  Width = 70
                end
                object ColumnMinimoCompra: TcxGridDBColumn
                  Caption = 'Minimo Compra'
                  DataBinding.FieldName = 'minimo_compra'
                  Width = 70
                end
              end
              object Master: TcxGridLevel
                GridView = View
              end
            end
            object pnl1: TPanel
              Left = 2
              Top = 180
              Width = 760
              Height = 40
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              DesignSize = (
                760
                40)
              object btnNovo: TButton
                Left = 472
                Top = 3
                Width = 90
                Height = 30
                Anchors = [akTop, akRight]
                Caption = 'Novo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                HotImageIndex = 3
                ImageIndex = 3
                ImageMargins.Left = 10
                Images = ImageList16
                ParentFont = False
                TabOrder = 0
                OnClick = btnNovoClick
              end
              object btnEditar: TButton
                Left = 568
                Top = 3
                Width = 90
                Height = 30
                Anchors = [akTop, akRight]
                Caption = 'Editar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                HotImageIndex = 9
                ImageIndex = 9
                ImageMargins.Left = 10
                Images = ImageList16
                ParentFont = False
                TabOrder = 1
                OnClick = btnEditarClick
              end
              object btnExcluir: TButton
                Left = 664
                Top = 3
                Width = 90
                Height = 30
                Anchors = [akTop, akRight]
                Caption = 'Excluir'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                HotImageIndex = 8
                ImageIndex = 8
                ImageMargins.Left = 10
                Images = ImageList16
                ParentFont = False
                TabOrder = 2
                OnClick = btnExcluirClick
              end
            end
          end
        end
      end
    end
  end
  inherited qConsulta: TUniQuery
    AfterOpen = qConsultaAfterOpen
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000010050521700C0C50AF0F0F60BF0F0F60BF0D0D
          4FAF050520700000001000000000000000000000000000000000000000000000
          00000000000004042170141496EF0E0EACFF0E0EB6FF1111BFFF1717C6FF1C1C
          C7FF1D1DC0FF1A1A99EF05052070000000000000000000000000000000000000
          00000909439F1515ACFF0606B2FF1616C1FF4F4FD2FF5E5ED3FF6565D6FF6262
          DFFF3E3EE0FF2C2CE2FF2323BDFF0B0B419F0000000000000000000000000404
          21703939BFFF1111B8FF2121BFFF4A4AC3FF1515469F02021050020210501515
          459F6666D8FF3F3FECFF3A3AF2FF2323BDFF0505207000000000000000102121
          A0EF2F2FC2FF0808B4FF161675CF000006300000000000000000000000000404
          1E602929DEFF3030E6FF4A4AEDFF2D2DE3FF1A1A98EF00000010030318604848
          C6FF0B0BB5FF1313B0FF0000063000000000000000000000000003031C601E1E
          D2FF2323D8FF2929DEFF6F6FDCFF4141E1FF1D1DBDFF040418600909449F5F5F
          CFFF1010B5FF0909439F00000000000000000000000002021B601414C8FF1919
          CDFF1E1ED2FF04041E601515459F6666E0FF1C1CC5FF0B0B429F0D0D63BF6D6D
          D5FF3636BFFF12123080000000000000000001011A600D0DBFFF1010C3FF1414
          C8FF03031C6000000000070721707B7BDEFF1616C4FF0F0F60BF0D0D63BF7070
          D6FF3F3FC2FF1111308000000000000019600707B9FF0A0ABCFF0D0DBFFF0202
          1B600000000000000000070721706E6ED9FF1111BDFF0F0F60BF0808449F6868
          D2FF4343C6FF0B0B449F04041A602E2EC2FF2222C0FF1212BCFF01011A600000
          000000000000000000001515469F4F4FD1FF0F0FB4FF0A0A429F030319605B5B
          CEFF4D4DC9FF3131BEFF3737C4FF3838C4FF3131C3FF04041A60000000000000
          000000000000000006305D5DC9FF3434C9FF1C1CB0FF03031860000000102222
          A1EF6F6FD5FF4343C7FF3F3FC6FF3737C4FF04041A6000000000000000000000
          0000000006303333A4EF4646CAFF2626BCFF161697EF00000010000000000404
          22704646C5FF6969D3FF4343C7FF3636BFFF0B0B449F06062270060622700B0B
          449F2C2CB8FF3636C3FF3838C4FF1E1EB0FF0404217000000000000000000000
          00000808449F4646C5FF7777D9FF4E4EC9FF4343C6FF3C3CC1FF3A3AC0FF3D3D
          C4FF3C3CC5FF5E5ED2FF3A3ABFFF0909439F0000000000000000000000000000
          000000000000040422702222A1EF6363D2FF7272D6FF7272D7FF6F6FD7FF6969
          D4FF5F5FCFFF2323A1EF04042170000000000000000000000000000000000000
          0000000000000000000000000010040422700A0A52AF0D0D63BF0D0D63BF0A0A
          52AF040421700000001000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000000000000C2C0E80319F36EF2F8D34DF020602300000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000E42109F43BB49FFA9EEB2FF90E299FF28792CCF0000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000009400A9F37B53CFFA0E8A9FFA0EEACFFB5F5BFFF71D379FF0F2E
          1180000000000000000000000000000000000000000000000000000000000000
          0000043E059F45BB4AFFA0E6A9FF8EE59AFF84E691FF9DEFA9FFAFF3B9FF49BE
          4FFF02060230000000000000000000000000000000000000000000000000003B
          009F3AB53EFF98E0A1FF84DD8FFF79DE87FFA8ECB2FF99ECA5FFACF3B7FF97E6
          9FFF247728CF0000000000000000000000000000000000000000002F008F33B1
          37FF90DB99FF78D685FF7EDA8BFF9FE6A8FF78D480FFA9EDB3FF91EB9EFFB2F3
          BCFF6BD073FF0E2D0F8000000000000000000000000000000000009700FF89D6
          92FF6FCF7AFF74D380FF97E0A0FF41B946FF12A314FF82D889FF9DEAA8FF92EA
          9FFFA7EDB1FF42BB47FF01060230000000000000000000000000009600FF7DD0
          86FF85D58FFF86D68EFF2EAF31FF023C029F010A014024AB27FFA3E8ACFF87E4
          94FFA1EBACFF8CDF94FF268829DF000000100000000000000000002E008F20A5
          23FF43B648FF10A012FF0030008F0000000000000000053E069F57C45DFF9CE5
          A6FF79DE88FFA5EAAEFF61C968FF0F37108F0000000000000000000000000005
          00300015006000050030000000000000000000000000000000100C8C0DEF89DA
          92FF87DE93FF80DD8CFF98E2A1FF3AB63FFF030B034000000000000000000000
          0000000000000000000000000000000000000000000000000000011601602EAF
          31FF97E0A0FF6AD477FF8CDD96FF7CD485FF218624DF00000010000000000000
          0000000000000000000000000000000000000000000000000000000000000458
          05BF66C96DFF89DA93FF59CB67FF94DE9DFF56C25CFF0D360E8F000000000000
          0000000000000000000000000000000000000000000000000000000000000005
          00300EA00FFF85D58DFF65CC71FF65CC71FF87D790FF25AC29FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000012601803EB542FF88D591FF6ECD78FF89D691FF23AC29FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000010017601DF4BBA51FF65C56CFF4BBA50FF0E5C0FBF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000020020003B009F045804BF053E059F00000010}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000002080F501F58AAFF163F78FF000000570000004D00000021000000000000
          0000000000000000000000000000000000000000000000000000000000000001
          02221B4C93EF225EB1FF153B71FF000000430000003E0000003A000000260000
          0008000000000000000000000000000000000000000000000000000000001238
          6DD3205DB1FF2863B4FF14386CFF0000002E00000029000000230000001E0000
          0018000000050000000000000000000000000000000000000000225FB3FF1D53
          A0FF2463B7FF316DBCFF133769FF000000380000002E00000024000000180000
          0009225FB3FF00000000000000000000000000000000000000002463B7FF2058
          A6FF2869BDFF3A76C2FF123464FF000000380000002E00000024000000180000
          00090D8543FF007200FF00000000000000000000000000000000637288FF235D
          AAFF2B6EC2FF3F6DA7FF384961FF000000380000002E0000002400000018003C
          00A4009900FF007200FF000000000000000000000000000000002969BEFF2662
          AFFF2E73C8FF597596FF4D5E76FF000000380000002E000000240018006F0099
          00FF6AC96FFF007200FF007200FF007200FF007200FF007200FF2B6CC1FF2865
          B4FF3178CDFF5391D5FF133566FF000000380000002E001A0077009900FF56C0
          5AFF49BC4EFF57C35DFF5EC665FF65CA6DFF74D07CFF007200FF2C6FC3FF2A69
          B7FF337CD0FF5B99DBFF133566FF000000380000002E009900FF7DCE80FF41B8
          45FF35B43AFF3DB843FF45BC4BFF4FC156FF65CA6DFF007200FF2E71C6FF2C6B
          BAFF3680D3FF63A0E0FF133566FF000000380000002E001A0077009900FF80CF
          82FF70CA73FF6BC86FFF76CD7BFF7DD082FF67C96DFF007200FF2F73C8FF2D6D
          BCFF3782D6FF60A0E1FF133566FF000000380000002E000000240018006F0099
          00FF84D086FF009900FF009900FF009900FF009900FF009900FF65758BFF2E6F
          BEFF3E88D9FF89BFEEFF1A3653BF000000380000002E0000002400000018003C
          00A4009900FF009900FF000000000000000000000000000000003075CAFF3273
          C0FF76B2E8FF3F586DBF00000046000000380000002E00000024000000180000
          0009118C4BFF009900FF000000000000000000000000000000003176CBFF4B8C
          CFFF346191DE0000004600000046000000380000002E00000024000000180000
          00093176CBFF00000000000000000000000000000000000000003176CBFF3176
          CBFF3176CBFF3176CBFF3176CBFF3176CBFF3176CBFF3176CBFF3176CBFF3176
          CBFF3176CBFF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000000000050000000B000000130000001E000000230000
          00180000000F0000000800000002000000000000000000000000000000000000
          000000000000000000040000000A0000000F207E4EFF207E4EFF207E4EFF207E
          4EFF000000120000000E00000009000000010000000000000000000000000000
          000000000000000000000000000000000003207E4EFF2EB872FF2EB872FF207E
          4EFF000000050000000200000000000000000000000000000000000000000000
          000000000000000000000000000000000000207E4EFF2EB872FF2EB872FF207E
          4EFF000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000207E4EFF2EB872FF2EB872FF207E
          4EFF000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000207E4EFF2EB872FF2EB872FF207E
          4EFF00000000000000000000000000000000000000000000000000000000207E
          4EFF207E4EFF207E4EFF207E4EFF207E4EFF207E4EFF30B974FF30B974FF207E
          4EFF207E4EFF207E4EFF207E4EFF207E4EFF207E4EFF0000000000000000207E
          4EFF3ABE7BFF3ABE7BFF3ABE7BFF3ABE7BFF3ABE7BFF3ABE7BFF3ABE7BFF3ABE
          7BFF3ABE7BFF3ABE7BFF3ABE7BFF3ABE7BFF207E4EFF0000000000000000207E
          4EFF44C383FF44C383FF44C383FF44C383FF44C383FF44C383FF44C383FF44C3
          83FF44C383FF44C383FF44C383FF44C383FF207E4EFF0000000000000000207E
          4EFF207E4EFF207E4EFF207E4EFF207E4EFF207E4EFF4EC88BFF4EC88BFF207E
          4EFF207E4EFF207E4EFF207E4EFF207E4EFF207E4EFF00000000000000000000
          000000000000000000000000000000000000207E4EFF58CD92FF58CD92FF207E
          4EFF000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000207E4EFF62D29AFF62D29AFF207E
          4EFF000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000207E4EFF6BD7A1FF6BD7A1FF207E
          4EFF000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000207E4EFF75DCA8FF75DCA8FF207E
          4EFF000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000207E4EFF207E4EFF207E4EFF207E
          4EFF000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000003000000070000000B0000000F00000013000000140000
          00110000000D0000000900000006000000020000000000000000000000000000
          0000000000050000000A0000000F000000150000001A0000001F000000220000
          001F0000001A00000015000000100000000A0000000400000000000000000000
          000000000000000000000000000300000006000000080000000A0000000B0000
          000A000000080000000600000003000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          A4FF0000A4FF0000A4FF0000A4FF0000A4FF0000A4FF0000A4FF0000A4FF0000
          A4FF0000A4FF0000A4FF0000A4FF0000A4FF0000A4FF00000000000000000000
          A4FF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000
          CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000A4FF00000000000000000000
          A4FF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000
          CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000A4FF00000000000000000000
          A4FF0000A4FF0000A4FF0000A4FF0000A4FF0000A4FF0000A4FF0000A4FF0000
          A4FF0000A4FF0000A4FF0000A4FF0000A4FF0000A4FF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000040000000900000009000000090000000900000009000000090000
          0009000000090000000900000009000000040000000000000000000000000000
          000200000015000000290000002C0000002C0000002C0000002C0000002C0000
          002C0000002C0000002C00000029000000150000000200000000000000000000
          00040000001900020046001C00A3003D00E4004E00FF0000002C0000002C0000
          002C0000002C0000002C0000002A000000190000000400000000000000000000
          000100080050004F00F604740DFF098C1AFF005600FF00000003000000030000
          0003000000030000000300000003000000030000000100000000000000000000
          0012005000ED068619FF08921FFF0D9A27FF016102FF00000000000000000000
          000000000000000100240001002400000000000000000000000000000000001F
          008D038012FF14A938FF12A736FF0B8F20FF006902FF00000000000000000000
          000000050039096D12F00B7015F0000500390000000000000000000000000051
          00D810A434FF12AB3BFF079221FF004400C60001001E0000000000000000000C
          00540D8117F80FA232FF0FA232FF138E23F9000E015900000000000000000072
          00F61BBA4CFF1DBE4FFF01850DFF0005003600000000000000000017006F027E
          04FF0C9B26FF12B243FF12B243FF0C9B26FF07880EFF0017006F00000000007A
          00F625C95BFF26CA5DFF008501FF000000030000000000000000000000000000
          0000008500FF26CA5DFF26CA5DFF008400FF0000000000000000000000000065
          00D824CA5AFF22CB5DFF099E15FF000000150000000000000000000000000000
          0012069911FF25CD5FFF26CD5FFF008400F60000000000000000000000000034
          009613BB42FF1DCC60FF29CE59FF014403A90005003300000006000000120032
          009318BE43FF1BCB5FFF17C353FF007000DB0000000000000000000000000005
          0030009E00FC29D567FF1DD165FF30D764FF12B82DFF05A80BFF06A910FF1AC4
          47FF36DE71FF2CD86BFF00B12EFF003500930000000000000000000000000000
          00000031008A02B627FF29D86AFF24D76BFF27D96CFF36DF71FF35DF71FF21D6
          6AFF31DC6EFF07C24BFF00A100F9000300240000000000000000000000000000
          0000000000000035008D00B511FF19CD4FFF35DE6DFF40E575FF37E172FF20D5
          63FF01BF39FF00A800F90015005A000000000000000000000000000000000000
          0000000000000000000000060030003C0093007500CC00B200FC00B600FF0086
          00DB004100990004002A00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000B07D54FFB07D
          54FFB07D54FFB07D54FFB07D54FFB07D54FFB07D54FFB07D54FFB07D54FFB07D
          54FFB07D54FFB07D54FFB07D54FFB07D54FF0000000000000000B28055FFFFFF
          FEFFFFF8F3FFFFF7F1FFFFF6EEFFFFF5EDFFFFFEFBFF8EAF82FF419B4DFFFFF6
          EBFFFFEFE1FFFFEDE0FFFFF8ECFFB07D54FF0000000000000000B48256FFFFFA
          F6FFFEF2EBFFFEF1E8FFFFF2EAFFFFF1E9FF559050FF96DBA7FF419B4DFFFFF2
          EAFFFFECDFFFFFE9DBFFFFF4E9FFB07D54FF0000000000000000B78457FFFFFB
          F7FFFEF3EDFFFFF9F6FFDCDCC9FF44924AFF9BE5AAFF9FEAADFF5EB26AFF409B
          4FFF409B4FFF3E994DFF3C974BFF3F9C4FFF4C9F59FF419B4DFFB98758FFFFFC
          F9FFFFF9F6FF93B38BFF56A662FFACF3BAFF88E293FF78D987FF7BDA8CFF76D5
          88FF6BCE7EFF61C674FF56BF6CFF4DB764FF8CDBA1FF419B4DFFBC8959FFFFFC
          F8FFFFFAF7FF93B48CFF56A661FFACF3BAFF88E395FF7ADC88FF80DD8EFF79D9
          8AFF6FD181FF64C878FF59C16EFF50B966FF8DDCA2FF419B4DFFBE8B5AFFFFFC
          F8FFFEF5EFFFFFFCFAFFDCDFCFFF44924AFF9DE5ACFFA3EEB1FF60B26CFF439B
          4FFF429B50FF419B4DFF3E994DFF419D4FFF4C9E57FF419B4DFFC08D5BFFFFFB
          F8FFFEF5EFFFFEF6F0FFFFF8F4FFFFF8F5FF569353FF97DBA7FF419B4DFFFFFB
          FAFFFFF5EDFFFFF2EAFFFFFAF4FFB07D54FF0000000000000000C3905DFFFFFB
          F8FFFEF5EFFFFEF6F0FFFEF6F0FFFFF6F1FFFFFFFFFF8AAD82FF419B4DFFFFF7
          F1FFFEEFE7FFFEEEE3FFFFF4ECFFB07D54FF0000000000000000C5925EFFFFFB
          F8FFFEF5EFFFFEF6F0FFFEF6F0FFFEF6F0FFFEF6F0FFFFFAF6FFFFF8F3FFFEF3
          ECFFFEF2E8FFFEEFE6FFFFF7EEFFB07D54FF0000000000000000C8945FFFFFFB
          F8FFFEF5EFFFFEF6F0FFFEF6F0FFFEF6F0FFFEF6F0FFFEF6F0FFFEF5EFFFFEF4
          EEFFFEF3ECFFFEF1E8FFFFF7F2FFB07D54FF0000000000000000CA9660FFFFFC
          FBFFFEF7F2FFFEF7F3FFFEF8F3FFFEF8F4FFFFF8F4FFFFF8F5FFFFF9F5FFFFF8
          F4FFFFF7F3FFFFF5F0FFFFFBF9FFB07D54FF0000000000000000CC9961FFFFFC
          FBFFF7E5CAFFF6E3C7FFF5DDC2FFF4DABDFFF1D5B7FFF2D2B3FFF0D0B1FFF0D1
          B2FFF0CFB1FFF0D0AFFFFFFCFBFFB07D54FF0000000000000000CF9B62FFFFFC
          FBFFEFD4A3FFEDCE9AFFEBC590FFE9BB85FFE5B37BFFE5AC72FFE3A86DFFE4A8
          6DFFE4A96DFFE4A96EFFFFFCFBFFB07D54FF0000000000000000D19D63FFFFFC
          FBFFFFFCFBFFFFFCFBFFFFFCFBFFFFFCFBFFFFFCFBFFFFFCFBFFFFFCFBFFFFFC
          FBFFFFFCFBFFFFFCFBFFFFFCFBFFB07D54FF0000000000000000D4A167FFD19D
          63FFCE9A62FFCB9861FFC8955FFFC6925EFFC3905DFFC08D5BFFBD8B5AFFBB88
          59FFB88557FFB58356FFB28055FFB3835BFF0000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000020202463939
          39B5141414DE131313DD0F0F0FB10000003A0000000000000000000000000000
          00000101013D222222AF222222DB101010DC101010B5020202461E1E1EF67A7A
          7AFF222222FF1B1B1BFF212121FF0D0D0DDF0000000000000000000000000000
          0000181717E44A4A4AFF303030FF151515FF212121FF151515F2101010CB6F6F
          6FE0404040EC494949EC292929E00A0A0AB70000000000000000000000000000
          0000101010BE5E5E5EDF424242EB4C4B4BED3E3E3EE30C0C0CC3161616C3CDCD
          CDFF656565FF8D8D8DFF808080FF121212B30000000000000000000000000000
          0000141414B9CDCDCDFF656565FF818080FF858585FF161616BF05050551BDBD
          BDFF5B5B5BF8585757E7525252E2030303460000000000000000000000000000
          00000404044A7F7F7FDB3E3E3EE2757574F9838383FF0404044D060606652222
          22D4575757FB131313FD181818FC181818FD0505058C303030D11A1A1AD00C0C
          0C95272727FE4A4A4AFC131313FD191919FA1F1F1FD5030303590B0B0BA63F3F
          3FE67A7A7AF9666666FF8A8A8AFF5E5E5EFC111111CF292929DE171717DD1414
          14D4888888FB9D9D9DFF656565FF525252F9242424E60808089A0B0B0B86B1B1
          B1FFB5B5B5FF6C6C6CFF908F8FFF808080FF1515159E171717AA101010A61414
          14A1BDBDBDFFA8A8A8FF6D6D6DFF888888FF7E7E7EFF0D0D0D8006060658A7A7
          A7FFBDBDBDFF6A6A6AFF908F8FFF838383FF1313138C161616A40F0F0FA01212
          1290BDBDBDFFA8A8A8FF6D6D6DFF8A8989FF7E7E7EFF06060652030303439D9D
          9DFFC5C5C5FF686868FF8E8D8DFF868686FF1414148C161616A40F0F0FA01212
          1290BDBDBDFFA8A8A8FF6D6D6DFF8B8B8BFF7C7C7CFF0303033D0101012E9191
          91FFC8C8C8FF515151FF696868FF727272FF373737E44B4B4BE1212121E03B3B
          3BE5979797FF8E8E8EFF565656FF838383FF797979FF010101280101012F3F3F
          3FEA6F6F6FE01B1B1BDA4A4A4AE8232323E6151515C0393939D11C1C1CCD1919
          19C2464646E6282828E71A1A1AD9313131E13B3B3BEB010101260000000A0909
          0989121212BA111111D2787878EC161616E1131313C0434343D61B1B1BD51F1F
          1FC1242424E2141414ED101010D1121212BA0808088700000007000000000000
          00000000000006060664696969C6282828C71B1B1BB700000000000000043838
          38BB2A2A2AC7212121C60404045A000000000000000000000000000000000000
          00000000000005050567757575E01C1C1CE5171717BF00000000000000072A28
          28C5282828E51B1B1BDF03030359000000000000000000000000000000000000
          0000000000000000002D4C4C4CB90F0F0FBA0808088C00000000000000000C0C
          0C8E161616BA0D0D0DB800000029000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000011131F008292ED008292EC0057
          629E001214210000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000A0C13007D8CE24EC1D0FD5BD3E1FF2FB1
          C2FA088B9BF6005D69A9000B0C14000000000000000000000000000000000000
          0000000000000000000000000000006E7BC535B1C1FA5FD8E7FF26CADFFF4ED4
          E5FF6DD9E7FF31B1C2FB007F8FE6001517260000000000000000000000000000
          00000000000000000000002529431996A5F66CDAE8FF10C5DCFF03C2DAFF03C2
          DAFF15C6DCFF5BD7E7FF56C7D5FE058797F10022273F00000000000000000000
          00000000000000000000017685D45ECFDDFF46DAEDFF18D0E7FF11CBE3FF07C4
          DCFF03C2DAFF03C2DAFF4CD3E4FF58CDDCFF048898F4000F111C000000000000
          000000000000000E101A108FA0F78BEDFBFF3CE5FCFF37E4FBFF2FDEF6FF23D7
          EEFF14CDE5FF04C3DBFF03C2DAFF56D6E6FF32B3C3FB005E69A8000000000000
          000000000000002F3A5F2DA9B8F58AEFFDFF5FEAFDFF61EBFDFF52E9FDFF3CE6
          FDFF2ADBF3FF18D0E7FF10C6DCFF49D2E4FF67D4E2FF018191E9000000000000
          000000040407001E88D71341ABFC84EAFBFF6BECFDFF84EFFDFF6DECFDFF52E9
          FDFF44E5FBFF65E3F3FF77DDEBFF49C0CEFE1A97A6F3008090EA000000000034
          3A5F008292EB289FB4F6284ABBFF1D38B8FF61D8F6FF63EAFDFF6CEBFDFF7DEE
          FDFF88EAF8FF44BAC9FA058B9AF7005B66A30023274000010102000000000031
          375A018898F64FC8D8FF68DCECFF336DC8FF0D1BABFF62B1D7FF72DCEAFF41B7
          C6F7098B9CF60159639F000F111B000000000000000000000000000000000000
          00000033448100879BFE41BDCDFF77DEEBFF1666AAF700308FE4017684D20041
          4977000B0D15000000000000000000000000000000000000000000010102002B
          4895014B7AF40B76B2FF0188A1FF32ADBDFE1C98A8F20021253D000000000000
          00000000000000000000000000000000000000000000000000000020356F034E
          80F40F7ABCFF107DC1FF014E7DF2006B7CCE008B9CFF00161929000000000000
          0000000000000000000000000000000000000000000000000000004572ED0C72
          B2FF107DC1FF0A6BA9FF003F69DA0001010200475082000A0C13000000000000
          000000000000000000000000000000000000000000000000000000426EE50A69
          A6FF0B6DABFF004776F500132044000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000111C3B0040
          6ADA00426DE30014214700000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00100000001600000024000000290000002C0000002200000000000000000000
          00000000000000000000000000000000000000000019000000220000002C0000
          003300010137080D18552A3655BB3C404EFF1F1F1FFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000108
          121D365B97F3516191FE546490FD6578A3FF424B5CFD00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000374
          BFFF0066ACF956729EFF8AA0CEFFA7C2E3FF576898F700000000000000000000
          00000000000000000000000000000000000000000000000000000376C1FF0076
          D4FF0275A9CC0190C4DAADC9E9FC6A7CA9FF35476DAE00000000000000000000
          000000000000000000000000000000000000000000000377C2FF0076D4FF0AB4
          EEFF02ADEAFF03ACE8FF28BFF7FE5576ABFD0719325000000000000000000000
          0000000000000000000000000000000000000478C2FF0076D4FF10BAF0FF02AD
          ECFF05B1ECFF24D3FFFF0083DBFC0661A0E20001010200000000000000000000
          00000000000000000000000000000478C2FF0076D4FF1CC1F4FF02B1F0FF05B2
          EFFF24D3FFFF0086E1FF037BC8FF000305080000000000000000000000000000
          00000000000000000000037CCAFF0076D4FF26C6F6FF02B3F1FF09B7F1FF24D3
          FFFF0086E1FF037BC9FF00000000000000000000000000000000000000000000
          00000E10263C5D6050FF0076D4FF26C6F6FF02B5F5FF0DBBF4FF98ECFFFF0086
          E1FF037BC9FF0000000000000000000000000000000000000000000000001C31
          7AAD636251FF99987BFF4C574AFF37A6CDFF10BEF6FF98ECFFFF0086E1FF037B
          CAFF00000000000000000000000000000000000000000000000002071017244D
          C2FF345CD9FF494D45FF46443DFFD6D7B3FF63C7E4FF0086E1FF037CCAFF0000
          0000000000000000000000000000000000000000000000000000142B677B254F
          C6FF3766DEFF3B66D9FFD5D7BBFFD4D4ACFF72725BFF0672C4FF000000000000
          0000000000000000000000000000000000000000000000000000000000002042
          A1DA3967DAFF9BA5EEFF414BB2FF72725BFF5F5E4EFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000306
          1016335BC1FDC0C8FFFF9BA5EEFF5A594AFF060A172500000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000010204061B3A94CB273A8FD1080916220000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object qProdutos: TUniQuery
    Tag = 7100
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT pdf.codigo, '
      #9'pdf.fornecedor,'
      #9'pdf.produto,'
      #9'pd.nome as produto_nome,'
      #9'pdf.representante, '
      #9'pr.nome as nome_representante,'
      #9'pdf.ultima_compra, '
      #9'pdf.preco_compra, '
      '        pdf.tempo_entrega,'
      '        pdf.minimo_compra'
      '   FROM produto_fornecedores pdf'
      '   LEFT JOIN produtos pd on pd.codigo = pdf.produto'
      '   LEFT JOIN pessoas pr on pr.codigo = pdf.representante'
      '  WHERE pdf.fornecedor = :codigo ;')
    MasterSource = ds
    AfterRefresh = qProdutosAfterRefresh
    Left = 384
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = nil
      end>
  end
  object dsProdutos: TUniDataSource
    DataSet = qProdutos
    Left = 424
    Top = 144
  end
  object StyleRepository: TcxStyleRepository
    Left = 358
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
      Font.Style = [fsBold]
    end
    object StyleItemAtivo: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
  end
end
