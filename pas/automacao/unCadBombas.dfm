inherited frmCadBombas: TfrmCadBombas
  Caption = 'Cadastro de Bombas'
  ClientHeight = 409
  ClientWidth = 490
  ExplicitWidth = 496
  ExplicitHeight = 438
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 374
    Width = 490
    TabOrder = 2
    ExplicitTop = 334
    ExplicitWidth = 490
    inherited btnCancelar: TButton
      Left = 213
      ExplicitLeft = 213
    end
    inherited btnSalvar: TButton
      Left = 306
      Top = 4
      ExplicitLeft = 306
      ExplicitTop = 4
    end
    inherited btnFechar: TButton
      Left = 399
      ExplicitLeft = 399
    end
  end
  inherited grpContent: TGroupBox
    Width = 480
    Height = 323
    ExplicitLeft = 303
    ExplicitTop = 222
    ExplicitWidth = 480
    ExplicitHeight = 323
    object Label1: TLabel
      Left = 111
      Top = 24
      Width = 58
      Height = 15
      Caption = 'Descri'#231#227'o:'
      FocusControl = edtDescricao
    end
    object lblCodigo: TLabel
      Left = 10
      Top = 24
      Width = 41
      Height = 15
      Caption = 'C'#243'digo:'
      FocusControl = edtCodigo
    end
    object lblFabricante: TLabel
      Left = 10
      Top = 53
      Width = 62
      Height = 15
      Caption = 'Fabricante:'
      FocusControl = edtFabricante
    end
    object lblModelo: TLabel
      Left = 10
      Top = 82
      Width = 45
      Height = 15
      Caption = 'Modelo:'
      FocusControl = edtModelo
    end
    object lblNSerie: TLabel
      Left = 298
      Top = 82
      Width = 46
      Height = 15
      Caption = 'N'#186' Serie:'
      FocusControl = edtNSerie
    end
    object cbbFabricante: TcxDBLookupComboBox
      Left = 134
      Top = 50
      DataBinding.DataField = 'fabricante'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      Properties.KeyFieldNames = 'codigo'
      Properties.ListColumns = <
        item
          Caption = 'Descri'#231#227'o'
          Width = 300
          FieldName = 'descricao'
        end>
      Properties.ListSource = dsFabricante
      TabOrder = 3
      Width = 336
    end
    object cbbModelo: TcxDBLookupComboBox
      Left = 117
      Top = 79
      DataBinding.DataField = 'modelo'
      DataBinding.DataSource = ds
      Enabled = False
      Properties.CharCase = ecUpperCase
      Properties.KeyFieldNames = 'codigo'
      Properties.ListColumns = <
        item
          Caption = 'Descri'#231#227'o'
          Width = 260
          FieldName = 'descricao'
        end>
      Properties.ListSource = dsModelo
      TabOrder = 5
      Width = 175
    end
    object chbInativo: TcxDBCheckBox
      Left = 10
      Top = 107
      Caption = 'Inativo?'
      DataBinding.DataField = 'inativo'
      DataBinding.DataSource = ds
      TabOrder = 7
      Width = 121
    end
    object edtCodigo: TcxDBSpinEdit
      Left = 57
      Top = 21
      DataBinding.DataField = 'codigo'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      Style.Color = clBtnFace
      TabOrder = 0
      Width = 48
    end
    object edtDescricao: TcxDBTextEdit
      Left = 175
      Top = 21
      DataBinding.DataField = 'descricao'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      Width = 295
    end
    object edtFabricante: TcxDBSpinEdit
      Left = 78
      Top = 50
      DataBinding.DataField = 'fabricante'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 2
      Width = 50
    end
    object edtModelo: TcxDBSpinEdit
      Left = 61
      Top = 79
      DataBinding.DataField = 'modelo'
      DataBinding.DataSource = ds
      Enabled = False
      Properties.SpinButtons.Visible = False
      TabOrder = 4
      Width = 50
    end
    object edtNSerie: TcxDBTextEdit
      Left = 350
      Top = 79
      DataBinding.DataField = 'nr_serie'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      TabOrder = 6
      Width = 120
    end
    object grpBicos: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 125
      Width = 470
      Height = 193
      Align = alBottom
      Caption = ' Bicos '
      TabOrder = 8
      ExplicitTop = 85
      object pnlbottonSub: TPanel
        Left = 2
        Top = 157
        Width = 466
        Height = 34
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        Visible = False
        object lblBico: TLabel
          Left = 3
          Top = 9
          Width = 27
          Height = 15
          Caption = 'Bico:'
        end
        object lblTanque: TLabel
          Left = 92
          Top = 9
          Width = 42
          Height = 15
          Caption = 'Tanque:'
        end
        object btnCancel: TButton
          Left = 416
          Top = 7
          Width = 22
          Height = 22
          ImageIndex = 1
          Images = ImageList16
          TabOrder = 4
          OnClick = btnCancelClick
        end
        object btnConfirm: TButton
          Left = 441
          Top = 7
          Width = 22
          Height = 22
          ImageIndex = 0
          Images = ImageList16
          TabOrder = 3
          OnClick = btnConfirmClick
        end
        object cbbTanque: TcxDBLookupComboBox
          Left = 196
          Top = 6
          DataBinding.DataField = 'tanque'
          DataBinding.DataSource = dsSub
          Properties.KeyFieldNames = 'codigo'
          Properties.ListColumns = <
            item
              Caption = 'Descri'#231#227'o'
              Width = 200
              FieldName = 'nome'
            end>
          Properties.ListSource = dsTanques
          TabOrder = 2
          Width = 214
        end
        object edtTanque: TcxDBSpinEdit
          Left = 140
          Top = 6
          DataBinding.DataField = 'tanque'
          DataBinding.DataSource = dsSub
          Properties.Nullstring = '0'
          Properties.SpinButtons.Visible = False
          TabOrder = 1
          Width = 50
        end
        object edtNLogico: TcxDBTextEdit
          Left = 36
          Top = 6
          DataBinding.DataField = 'nr_bico'
          DataBinding.DataSource = dsSub
          Properties.CharCase = ecUpperCase
          TabOrder = 0
          Width = 50
        end
      end
      object Grid: TcxGrid
        AlignWithMargins = True
        Left = 5
        Top = 20
        Width = 435
        Height = 134
        Align = alClient
        TabOrder = 1
        object View: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsSub
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object ColViewID: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'codigo'
            Visible = False
            Options.Editing = False
            Width = 60
          end
          object ColViewNumero: TcxGridDBColumn
            Caption = 'Bico'
            DataBinding.FieldName = 'nr_bico'
            Options.Editing = False
          end
          object ColViewNLogico: TcxGridDBColumn
            Caption = 'N'#186' Logico'
            DataBinding.FieldName = 'nr_logico'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.CharCase = ecUpperCase
            Width = 120
          end
          object ColViewTanque: TcxGridDBColumn
            Caption = 'Tanque'
            DataBinding.FieldName = 'tanque_descricao'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'nome'
            Properties.ListColumns = <
              item
                Caption = 'Descri'#231#227'o'
                FieldName = 'nome'
              end>
            Properties.ListSource = dsTanques
            Width = 200
          end
        end
        object Master: TcxGridLevel
          GridView = View
        end
      end
      object pnlTool: TPanel
        Left = 443
        Top = 17
        Width = 25
        Height = 140
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 2
        object btnAdd: TButton
          Left = 0
          Top = 3
          Width = 22
          Height = 21
          ImageIndex = 3
          Images = ImageList16
          TabOrder = 0
          OnClick = btnAddClick
        end
        object btnRemove: TButton
          Left = 0
          Top = 29
          Width = 22
          Height = 22
          ImageIndex = 4
          Images = ImageList16
          TabOrder = 1
          OnClick = btnRemoveClick
        end
        object btnReload: TButton
          Left = 0
          Top = 56
          Width = 22
          Height = 22
          ImageIndex = 5
          Images = ImageList16
          TabOrder = 2
          OnClick = btnReloadClick
        end
      end
    end
  end
  inherited pnlHelp: TPanel
    Width = 481
    TabOrder = 1
    ExplicitWidth = 481
    inherited mmoHelp: TMemo
      Width = 434
      ExplicitWidth = 434
    end
  end
  inherited ds: TUniDataSource
    Left = 384
    Top = 0
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO bombas'
      '  (descricao, inativo, fabricante, nr_serie, modelo)'
      'VALUES'
      '  (:descricao, :inativo, :fabricante, :nr_serie, :modelo)')
    SQLDelete.Strings = (
      'DELETE FROM bombas'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE bombas'
      'SET'
      
        '  descricao = :descricao, inativo = :inativo, fabricante = :fabr' +
        'icante, nr_serie = :nr_serie, modelo = :modelo'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM bombas'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT descricao, inativo, fabricante, nr_serie, modelo FROM bom' +
        'bas'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM bombas'
      ''
      ') t')
    SQL.Strings = (
      'SELECT '#9'bb.codigo, '
      #9'bb.descricao, '
      #9'bb.inativo, '
      #9'bb.fabricante, '
      #9'bb.modelo,'
      #9'bb.nr_serie'
      '  FROM '#9'bombas bb'
      ' WHERE  bb.codigo = :codigo;')
    Left = 344
    Top = 0
    object qConsultacodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
    end
    object qConsultadescricao: TStringField
      FieldName = 'descricao'
      Size = 160
    end
    object qConsultainativo: TBooleanField
      FieldName = 'inativo'
    end
    object qConsultafabricante: TIntegerField
      FieldName = 'fabricante'
      OnValidate = qConsultafabricanteValidate
    end
    object qConsultamodelo: TIntegerField
      FieldName = 'modelo'
    end
    object qConsultanr_serie: TStringField
      FieldName = 'nr_serie'
      Size = 160
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 300
  end
  object qBicos: TUniQuery
    Tag = 7100
    SQLInsert.Strings = (
      'INSERT INTO bicos'
      '  (bomba, tanque, nr_bico, nr_logico, nr_ilha, empresa, inativo)'
      'VALUES'
      
        '  (:bomba, :tanque, :nr_bico, :nr_logico, :nr_ilha, :empresa, :i' +
        'nativo)')
    SQLDelete.Strings = (
      'DELETE FROM bicos'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE bicos'
      'SET'
      
        '  bomba = :bomba, tanque = :tanque, nr_bico = :nr_bico, nr_logic' +
        'o = :nr_logico, nr_ilha = :nr_ilha, empresa = :empresa, inativo ' +
        '= :inativo'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM bicos'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT bomba, tanque, nr_bico, nr_logico, nr_ilha, empresa, inat' +
        'ivo FROM bicos'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM bicos'
      ''
      ') t')
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT '#9'bc.codigo, '
      #9'bc.bomba, '
      #9'bc.tanque as tanque,'
      #9'tq.nome as tanque_descricao, '
      #9'bc.nr_bico, '
      #9'bc.nr_logico,'
      #9'bc.nr_ilha, '
      #9'bc.empresa, '
      #9'bc.inativo'
      '  FROM bicos bc'
      '  LEFT OUTER JOIN deposito tq on tq.codigo = bc.tanque'
      ' WHERE bc.bomba = :codigo;')
    MasterSource = ds
    Left = 80
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = 0
      end>
    object qBicoscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qBicosbomba: TIntegerField
      FieldName = 'bomba'
    end
    object qBicostanque: TIntegerField
      FieldName = 'tanque'
    end
    object qBicostanque_descricao: TStringField
      FieldName = 'tanque_descricao'
      ReadOnly = True
      Size = 45
    end
    object qBicosnr_bico: TStringField
      FieldName = 'nr_bico'
      Size = 10
    end
    object qBicosnr_logico: TStringField
      FieldName = 'nr_logico'
      Size = 10
    end
    object qBicosnr_ilha: TStringField
      FieldName = 'nr_ilha'
      Size = 10
    end
    object qBicosempresa: TIntegerField
      FieldName = 'empresa'
    end
    object qBicosinativo: TBooleanField
      FieldName = 'inativo'
    end
  end
  object dsSub: TUniDataSource
    DataSet = qBicos
    Left = 128
    Top = 232
  end
  object qFabricante: TUniQuery
    Tag = 7100
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT '#9'bf.codigo, '
      #9'bf.descricao'
      '  FROM '#9'bomba_fabricante bf;')
    Left = 328
    Top = 168
    object qFabricantecodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
    end
    object qFabricantedescricao: TStringField
      FieldName = 'descricao'
      Size = 160
    end
  end
  object dsFabricante: TUniDataSource
    DataSet = qFabricante
    Left = 376
    Top = 168
  end
  object qModelo: TUniQuery
    Tag = 7100
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT '#9'bm.codigo, '
      #9'bm.fabricante, '
      #9'bm.descricao'
      '  FROM bomba_modelo bm'
      ' where bm.fabricante = :codigo;')
    DetailFields = 'fabricante'
    Left = 216
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = nil
      end>
    object qModelocodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
    end
    object qModelofabricante: TIntegerField
      FieldName = 'fabricante'
      Required = True
    end
    object qModelodescricao: TStringField
      FieldName = 'descricao'
      Size = 160
    end
  end
  object dsModelo: TUniDataSource
    DataSet = qModelo
    Left = 264
    Top = 112
  end
  object qTanques: TUniQuery
    Tag = 7100
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT '#9'dp.codigo, '
      #9'dp.nome, '
      #9'dp.quantidade'
      '  FROM deposito dp'
      ' where dp.liquido = true;')
    Left = 184
    Top = 232
  end
  object dsTanques: TUniDataSource
    DataSet = qTanques
    Left = 248
    Top = 232
  end
end
