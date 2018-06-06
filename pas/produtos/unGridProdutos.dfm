inherited frmGridProdutos: TfrmGridProdutos
  Tag = 2207
  Caption = 'Cadastro de Produtos'
  ClientHeight = 600
  ClientWidth = 1200
  ExplicitWidth = 1216
  ExplicitHeight = 639
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 541
    Width = 1200
    Visible = False
    ExplicitTop = 341
    inherited btnNovo: TButton
      Left = 719
      ExplicitLeft = 619
    end
    inherited btnVisualizar: TButton
      Left = 911
      ExplicitLeft = 811
    end
    inherited btnEditar: TButton
      Left = 1007
      ExplicitLeft = 907
    end
    inherited btnExcluir: TButton
      Left = 1103
      Enabled = False
      ExplicitLeft = 1003
    end
    object btnReplicar: TButton
      Left = 815
      Top = 5
      Width = 90
      Height = 30
      Anchors = [akTop, akRight]
      Caption = 'Replicar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      HotImageIndex = 0
      ImageIndex = 0
      ImageMargins.Left = 10
      Images = ImageList16
      ParentFont = False
      TabOrder = 4
      ExplicitLeft = 715
    end
  end
  inherited grpLista: TGroupBox
    Left = 7
    Top = 129
    Width = 1186
    Height = 412
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    ExplicitLeft = 7
    ExplicitTop = 129
    ExplicitWidth = 1086
    ExplicitHeight = 212
    inherited pnlFuncoes: TPanel
      Left = 846
      Height = 385
      Margins.Bottom = 7
      ExplicitLeft = 746
      ExplicitHeight = 185
    end
    inherited Grid: TcxGrid
      Left = 9
      Width = 837
      Height = 385
      Margins.Left = 7
      Margins.Bottom = 7
      ExplicitLeft = 9
      ExplicitWidth = 737
      ExplicitHeight = 185
      inherited View: TcxGridDBTableView
        OnDblClick = ViewDblClick
        object ColumnID: TcxGridDBColumn
          Caption = '#ID'
          DataBinding.FieldName = 'codigo'
          Width = 50
        end
        object ColumnDescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'nome'
          Width = 300
        end
        object ColumnSigla: TcxGridDBColumn
          Caption = 'Codigo Barras'
          DataBinding.FieldName = 'codigobarra'
          Visible = False
          Width = 60
        end
        object ColumnCategoria: TcxGridDBColumn
          Caption = 'Categoria'
          DataBinding.FieldName = 'categoria'
          Width = 100
        end
        object ColumnCodigoBarras: TcxGridDBColumn
          Caption = 'Codigo Barras'
          DataBinding.FieldName = 'codigobarras'
          Width = 80
        end
        object Columnmolde: TcxGridDBColumn
          Caption = 'Molde'
          DataBinding.FieldName = 'molde'
          Width = 60
        end
      end
    end
    inherited pnlFiltros: TPanel
      Left = 877
      Height = 385
      Margins.Right = 7
      Margins.Bottom = 7
      ExplicitLeft = 777
      ExplicitHeight = 185
      inherited GridFiltros: TcxGrid
        Height = 385
        Margins.Left = 7
        Margins.Bottom = 7
        ExplicitHeight = 185
      end
    end
  end
  inherited Ribbon: TdxRibbon
    Width = 1200
    inherited MTabRegistros: TdxRibbonTab
      Index = 0
    end
  end
  inherited stb: TStatusBar
    Top = 581
    Width = 1200
    ExplicitTop = 381
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited qConsulta: TUniQuery
    SQL.Strings = (
      'SELECT '#9'pd.codigo, '
      '        pd.nome,'
      #9'pd.nome as descricao,'
      #9'pd.codigobarras,'
      #9'pc.categoria,'
      #9'pd.molde'
      '  FROM produtos pd'
      '  LEFT JOIN produto_categorias pc on pc.codigo = pd.categoria'
      ' WHERE tipo = '#39'P'#39';')
  end
  inherited qInfo: TUniQuery
    ParamData = <
      item
        DataType = ftString
        Name = 'colunas'
        ParamType = ptInput
        Value = #39#39
      end
      item
        DataType = ftString
        Name = 'tabela'
        ParamType = ptInput
        Value = 'produtos'
      end>
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
      FloatClientHeight = 270
      ItemLinks = <
        item
          Visible = True
          ItemName = 'MnNovo'
        end
        item
          Visible = True
          ItemName = 'MnReplicar'
        end
        item
          Visible = True
          ItemName = 'MnVisualizar'
        end
        item
          Visible = True
          ItemName = 'MnEditar'
        end
        item
          Visible = True
          ItemName = 'MnExcluir'
        end>
    end
    inherited BarOutros: TdxBar
      DockedLeft = 272
      FloatClientWidth = 76
      FloatClientHeight = 21
    end
    inherited BarSistem: TdxBar
      DockedLeft = 350
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
    object MnReplicar: TdxBarLargeButton
      Caption = 'Replicar'
      Category = 0
      Hint = 'Replicar'
      Visible = ivAlways
      LargeGlyph.Data = {
        36100000424D3610000000000000360000002800000020000000200000000100
        2000000000000010000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000050000000E00000013000000130000
        0013000000130000001300000013000000130000001300000013000000130000
        00130000001300000013000000130000000E0000000500000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000E0000002B0000003A0000003A0000
        003A0000003A0000003A0000003A0000003A0000003A0000003A0000003A0000
        003A0000003A0000003A0000003A0000002B0000000E00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000AEAEAEFF8C8C8CFF878787FF878787FF8787
        87FF878787FF878787FF878787FF878787FF878787FF878787FF878787FF8787
        87FF878787FF878787FF878787FF0000003A0000001300000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000B6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF878787FF0000003A0000001300000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000B6B6B6FFFFFFFFFFF8F8F8FFF8F8F8FFF8F8
        F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8
        F8FFF8F8F8FFFFFFFFFF878787FF0000003A0000001300000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000B6B6B6FFFFFFFFFFF9F9F9FFF9F9F9FFF9F9
        F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9
        F9FFF9F9F9FFFFFFFFFF878787FF0000003A0000001300000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000B6B6B6FFFFFFFFFFFBFBFBFFFBFBFBFFFBFB
        FBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFB
        FBFFFBFBFBFFFFFFFFFF878787FF0000003A0000001300000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000B6B6B6FFFFFFFFFFFCFCFCFFDBCDBFFFDBCD
        BFFFDBCDBFFFDBCDBFFFDBCDBFFFDBCDBFFFDBCDBFFFDBCDBFFFDBCDBFFFDBCD
        BFFFFCFCFCFFFFFFFFFF878787FF0000003A0000001300000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000B6B6B6FFFFFFFFFFFDFDFDFFFDFDFDFFFDFD
        FDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFD
        FDFFFDFDFDFFFFFFFFFF878787FF0000003A0000001300000000000000000000
        0000000000050000000E00000013000000130000001300000013000000130000
        0013000000130000001300000013B6B6B6FFFFFFFFFFFDFDFDFFDBCDBFFFDBCD
        BFFFDBCDBFFFDBCDBFFFDBCDBFFFDBCDBFFFDBCDBFFFDBCDBFFFDBCDBFFFDBCD
        BFFFFDFDFDFFFFFFFFFF878787FF0000003A0000001300000000000000000000
        00000000000E0000002B0000003A0000003A0000003A0000003A0000003A0000
        003A0000003A0000003A0000003AB6B6B6FFFFFFFFFFFEFEFEFFFEFEFEFFFEFE
        FEFFFEFEFEFFD4CFCAFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
        FEFFFEFEFEFFFFFFFFFF878787FF0000003A0000001300000000000000000000
        0000AEAEAEFF8C8C8CFF878787FF878787FF878787FF878787FF878787FF8787
        87FF878787FF878787FF878787FFB6B6B6FFFFFFFFFFFEFEFEFFE9E6E4FFAE95
        7BFFAF8358FFAE8258FFA67C54FFA08772FFDFDBD7FFFEFEFEFFFEFEFEFFFEFE
        FEFFFEFEFEFFFFFFFFFF878787FF0000003A0000001300000000000000000000
        0000B6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB6B6B6FFFFFFFFFFFFFFFFFFBEAFA2FFB08B
        65FFC59866FFC99865FFBD8D60FF966F4EFFB2A59AFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF878787FF0000003A0000001300000000000000000000
        0000B6B6B6FFFFFFFFFFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8
        F8FFF8F8F8FFF8F8F8FFF8F8F8FFB6B6B6FFFFFFFFFFFFFFFFFFB9AA9EFF9974
        56FFA98562FFC7AB8BFFB08B65FF856346FFB0A399FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF878787FF0000003A0000001300000000000000000000
        0000B6B6B6FFFFFFFFFFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9
        F9FFF9F9F9FFF9F9F9FFF9F9F9FFB6B6B6FFFFFFFFFFFFFFFFFFF6F4F3FF9E85
        72FFCDCAC6FF7DB7E8FFC2C1C2FF8E7662FFF6F4F3FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF878787FF0000003A0000001300000000000000000000
        0000B6B6B6FFFFFFFFFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFB
        FBFFFBFBFBFFFBFBFBFFFBFBFBFFB6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF86BBE4FF70B6ECFF6CA7DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF8B8B8BFF0000003A0000001300000000000000000000
        0000B6B6B6FFFFFFFFFFFCFCFCFFDBCDBFFFDBCDBFFFDBCDBFFFDBCDBFFFDBCD
        BFFFDBCDBFFFDBCDBFFFDBCDBFFFB6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFB0D5
        F2FF7DC9F9FF7EC9F9FF66B7EFFFADCFEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF7F7F7FFEEEEEEFFABABABFF000000380000001200000000000000000000
        0000B6B6B6FFFFFFFFFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFD
        FDFFFDFDFDFFFDFDFDFFFDFDFDFFB6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFF96B3
        D0FF76AFDAFF9AD6FCFF64A7D6FF92AAC2FFFFFFFFFFEBEBEBFFE6E6E6FFDADA
        DAFFD9D9D9FFCECECEFFAEAEAEFF0000002C0000000D00000000000000000000
        0000B6B6B6FFFFFFFFFFFDFDFDFFDBCDBFFFDBCDBFFFDBCDBFFFDBCDBFFFDBCD
        BFFFDBCDBFFFDBCDBFFFDBCDBFFFB6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFC7D5
        E5FF92B7DBFF71ABDCFF548DC5FF9CAFC4FFFFFFFFFFE6E6E6FFFFFFFFFFFFFF
        FFFFF4F4F4FFC5C5C5FF939393D8000000160000000500000000000000000000
        0000B6B6B6FFFFFFFFFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFD4CFCAFFFEFE
        FEFFFEFEFEFFFEFEFEFFFEFEFEFFB6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFB8CDE5FF7F9DBEFF98AFC9FFF1F4F7FFFFFFFFFFE0E0E0FFFFFFFFFFF4F4
        F4FFD0D0D0FF939393D80B0B0B25000000050000000000000000000000000000
        0000B6B6B6FFFFFFFFFFFEFEFEFFE9E6E4FFAE957BFFAF8358FFAE8258FFA67C
        54FFA08772FFDFDBD7FFFEFEFEFFB6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E4E4FFF4F4F4FFCCCC
        CCFF939393D80B0B0B2600000005000000000000000000000000000000000000
        0000B6B6B6FFFFFFFFFFFFFFFFFFBEAFA2FFB08B65FFC59866FFC99865FFBD8D
        60FF966F4EFFB2A59AFFFFFFFFFFB6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D2D2FFCCCCCCFF9393
        93D80B0B0B280000000600000000000000000000000000000000000000000000
        0000B6B6B6FFFFFFFFFFFFFFFFFFB9AA9EFF997456FFA98562FFC7AB8BFFB08B
        65FF856246FFB0A399FFFFFFFFFFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6
        B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB3B3B3FFA9A9A9FFAAAAAAF02222
        223C000000060000000100000000000000000000000000000000000000000000
        0000B6B6B6FFFFFFFFFFFFFFFFFFF6F4F3FF9E8672FFCDCAC6FF7DB7E8FFC2C1
        C1FF8E7662FFF6F4F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8787
        87FF0000003A0000001300000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000B6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF86BBE4FF70B6ECFF6CA7
        DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B8B
        8BFF0000003A0000001300000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000B6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFB0D5F2FF7DC9F9FF7EC9F9FF66B7
        EFFFADCFEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFABAB
        ABFF000000380000001200000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000B6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFF96B3D0FF76AFDAFF9AD6FCFF64A7
        D6FF92AAC2FFFFFFFFFFE9E9E9FFE7E7E7FFE2E2E2FFDADADAFFCECECEFFAEAE
        AEFF0000002C0000000D00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000B6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFC7D5E5FF92B7DBFF71ABDCFF548D
        C5FF9CAFC4FFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFF4F4F4FFC5C5C5FF9393
        93D8000000160000000500000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000B6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8CDE5FF7F9DBEFF98AF
        C9FFF1F4F7FFFFFFFFFFE0E0E0FFFFFFFFFFF4F4F4FFD0D0D0FF939393D80B0B
        0B25000000050000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000B6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFE4E4E4FFF4F4F4FFCCCCCCFF939393D80B0B0B260000
        0005000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000B6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFD2D2D2FFCCCCCCFF939393D80B0B0B28000000060000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000B6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6
        B6FFB6B6B6FFB3B3B3FFA9A9A9FFAAAAAAF02222223C00000006000000010000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      OnClick = MnReplicarClick
    end
  end
end