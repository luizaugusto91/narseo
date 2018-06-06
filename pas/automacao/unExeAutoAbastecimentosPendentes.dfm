inherited frmExeAutoAbastecimentosPendentes: TfrmExeAutoAbastecimentosPendentes
  Caption = 'Baixa - Abastecimentos Pendentes'
  ClientHeight = 257
  ClientWidth = 653
  KeyPreview = False
  ExplicitWidth = 659
  ExplicitHeight = 286
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 222
    Width = 653
    ExplicitTop = 222
    ExplicitWidth = 653
    inherited btnCancelar: TButton
      Left = 376
      ExplicitLeft = 376
    end
    inherited btnSalvar: TButton
      Left = 469
      ExplicitLeft = 469
    end
    inherited btnFechar: TButton
      Left = 562
      ExplicitLeft = 562
    end
  end
  inherited grpContent: TGroupBox
    Width = 643
    Height = 171
    ExplicitWidth = 643
    ExplicitHeight = 171
    object lblCodigo: TLabel
      Left = 10
      Top = 24
      Width = 41
      Height = 15
      Caption = 'C'#243'digo:'
      FocusControl = edtCodigo
    end
    object Label7: TLabel
      Left = 244
      Top = 82
      Width = 93
      Height = 15
      Caption = 'Encerrante Final:'
      FocusControl = edtencerrante_final
    end
    object Label6: TLabel
      Left = 10
      Top = 82
      Width = 101
      Height = 15
      Caption = 'Encerrante Inicial:'
      FocusControl = edtencerrante_inicial
    end
    object Label2: TLabel
      Left = 10
      Top = 53
      Width = 41
      Height = 15
      Caption = 'Bomba:'
      FocusControl = edtbomba
    end
    object Label1: TLabel
      Left = 183
      Top = 53
      Width = 27
      Height = 15
      Caption = 'Bico:'
      FocusControl = edtbico
    end
    object Label3: TLabel
      Left = 322
      Top = 53
      Width = 67
      Height = 15
      Caption = 'Quantidade:'
      FocusControl = edtquantidade
    end
    object Label4: TLabel
      Left = 494
      Top = 24
      Width = 30
      Height = 15
      Caption = 'Hora:'
      FocusControl = edthora
    end
    object Label5: TLabel
      Left = 353
      Top = 24
      Width = 29
      Height = 15
      Caption = 'Data:'
      FocusControl = edtdata
    end
    object Label8: TLabel
      Left = 111
      Top = 24
      Width = 70
      Height = 15
      Caption = 'Combustivel:'
      FocusControl = edtcombustivel
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
    object grpBaixa: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 104
      Width = 633
      Height = 62
      Align = alBottom
      Caption = ' Baixa de Abastecimento '
      TabOrder = 1
      object Label9: TLabel
        Left = 11
        Top = 29
        Width = 94
        Height = 15
        Caption = 'Placa do Veiculo:'
        FocusControl = edtplaca
      end
      object Label10: TLabel
        Left = 217
        Top = 29
        Width = 21
        Height = 15
        Caption = 'KM:'
        FocusControl = edtkm
      end
      object edtplaca: TcxDBTextEdit
        Left = 111
        Top = 26
        DataBinding.DataField = 'placa'
        DataBinding.DataSource = ds
        Properties.CharCase = ecUpperCase
        TabOrder = 0
        OnEnter = grpContentEnter
        OnExit = edtplacaExit
        Width = 100
      end
      object edtkm: TcxDBTextEdit
        Left = 244
        Top = 26
        DataBinding.DataField = 'km'
        DataBinding.DataSource = ds
        TabOrder = 1
        OnEnter = grpContentEnter
        Width = 100
      end
      object cbbTrocaOleo: TcxDBCheckBox
        Left = 350
        Top = 26
        Caption = 'Realizada troca de '#243'leo'
        DataBinding.DataField = 'troca_oleo'
        DataBinding.DataSource = ds
        TabOrder = 2
        Width = 187
      end
    end
    object edtencerrante_final: TcxDBCalcEdit
      Left = 343
      Top = 79
      DataBinding.DataField = 'encerrante_final'
      DataBinding.DataSource = ds
      Enabled = False
      StyleDisabled.BorderColor = clWindowFrame
      StyleDisabled.Color = clBtnFace
      StyleDisabled.TextColor = clWindowText
      TabOrder = 2
      Width = 121
    end
    object edtencerrante_inicial: TcxDBCalcEdit
      Left = 117
      Top = 79
      DataBinding.DataField = 'encerrante_inicial'
      DataBinding.DataSource = ds
      Enabled = False
      StyleDisabled.BorderColor = clWindowFrame
      StyleDisabled.Color = clBtnFace
      StyleDisabled.TextColor = clWindowText
      TabOrder = 3
      Width = 121
    end
    object edtbomba: TcxDBTextEdit
      Left = 57
      Top = 50
      DataBinding.DataField = 'bomba'
      DataBinding.DataSource = ds
      Enabled = False
      StyleDisabled.BorderColor = clWindowFrame
      StyleDisabled.Color = clBtnFace
      StyleDisabled.TextColor = clWindowText
      TabOrder = 4
      Width = 120
    end
    object edtbico: TcxDBTextEdit
      Left = 216
      Top = 50
      DataBinding.DataField = 'bico'
      DataBinding.DataSource = ds
      Enabled = False
      StyleDisabled.BorderColor = clWindowFrame
      StyleDisabled.Color = clBtnFace
      StyleDisabled.TextColor = clWindowText
      TabOrder = 5
      Width = 100
    end
    object edtquantidade: TcxDBCalcEdit
      Left = 395
      Top = 50
      DataBinding.DataField = 'quantidade'
      DataBinding.DataSource = ds
      Enabled = False
      StyleDisabled.BorderColor = clWindowFrame
      StyleDisabled.Color = clBtnFace
      StyleDisabled.TextColor = clWindowText
      TabOrder = 6
      Width = 100
    end
    object edtdata: TcxDBDateEdit
      Left = 388
      Top = 21
      DataBinding.DataField = 'data'
      DataBinding.DataSource = ds
      Enabled = False
      StyleDisabled.BorderColor = clWindowFrame
      StyleDisabled.Color = clBtnFace
      StyleDisabled.TextColor = clWindowText
      TabOrder = 7
      Width = 100
    end
    object edthora: TcxDBTimeEdit
      Left = 530
      Top = 21
      DataBinding.DataField = 'hora'
      DataBinding.DataSource = ds
      Enabled = False
      Properties.SpinButtons.Visible = False
      StyleDisabled.BorderColor = clWindowFrame
      StyleDisabled.Color = clBtnFace
      StyleDisabled.TextColor = clWindowText
      TabOrder = 8
      Width = 100
    end
    object edtcombustivel: TcxDBTextEdit
      Left = 187
      Top = 21
      DataBinding.DataField = 'combustivel'
      DataBinding.DataSource = ds
      Enabled = False
      StyleDisabled.BorderColor = clWindowFrame
      StyleDisabled.Color = clBtnFace
      StyleDisabled.TextColor = clWindowText
      TabOrder = 9
      Width = 160
    end
  end
  inherited pnlHelp: TPanel
    Width = 644
    ExplicitWidth = 644
    inherited mmoHelp: TMemo
      Width = 597
      ExplicitWidth = 597
    end
  end
  inherited ds: TUniDataSource
    Left = 432
  end
  inherited qConsulta: TUniQuery
    SQLUpdate.Strings = (
      'UPDATE abastecimento'
      'SET'
      '  placa = :placa, km = :km, troca_oleo = :troca_oleo'
      'WHERE'
      '  codigo = :Old_codigo')
    SQL.Strings = (
      'SELECT vw.codigo, '
      #9'vw.nr_logico, '
      #9'vw.idbico, '
      #9'vw.bico, '
      #9'vw.bomba, '
      #9'vw.quantidade, '
      #9'vw.preco_unitario, '
      #9'vw.valor, '
      #9'vw.data, '
      #9'vw.hora, '
      #9'vw.encerrante_inicial, '
      #9'vw.encerrante_final, '
      #9'vw.target_id, '
      #9'vw.punp_id, '
      #9'vw.processo_date, '
      #9'vw.km, '
      #9'vw.placa, '
      #9'vw.manual, '
      #9'vw.troca_oleo, '
      #9'vw.combustivel'
      '   FROM vw_abastecimentos vw'
      '  WHERE codigo = :codigo;')
    Left = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = nil
      end>
    object qConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qConsultanr_logico: TStringField
      FieldName = 'nr_logico'
      Size = 10
    end
    object qConsultaidbico: TIntegerField
      FieldName = 'idbico'
    end
    object qConsultabico: TStringField
      FieldName = 'bico'
      Size = 10
    end
    object qConsultabomba: TStringField
      FieldName = 'bomba'
      Size = 160
    end
    object qConsultaquantidade: TFloatField
      FieldName = 'quantidade'
    end
    object qConsultapreco_unitario: TFloatField
      FieldName = 'preco_unitario'
    end
    object qConsultavalor: TFloatField
      FieldName = 'valor'
    end
    object qConsultadata: TDateField
      FieldName = 'data'
    end
    object qConsultahora: TTimeField
      FieldName = 'hora'
    end
    object qConsultaencerrante_inicial: TFloatField
      FieldName = 'encerrante_inicial'
    end
    object qConsultaencerrante_final: TFloatField
      FieldName = 'encerrante_final'
    end
    object qConsultatarget_id: TIntegerField
      FieldName = 'target_id'
    end
    object qConsultapunp_id: TIntegerField
      FieldName = 'punp_id'
    end
    object qConsultaprocesso_date: TDateTimeField
      FieldName = 'processo_date'
    end
    object qConsultakm: TFloatField
      FieldName = 'km'
    end
    object qConsultaplaca: TStringField
      FieldName = 'placa'
      EditMask = '!LLL-9000;0;_'
      Size = 7
    end
    object qConsultamanual: TBooleanField
      FieldName = 'manual'
    end
    object qConsultatroca_oleo: TBooleanField
      FieldName = 'troca_oleo'
    end
    object qConsultacombustivel: TStringField
      FieldName = 'combustivel'
      Size = 45
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 348
  end
  object qSQL: TUniQuery
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT ft.codigo, '
      #9'ft.transportadora, '
      #9'ft.tipo, '
      #9'ft.placa, '
      #9'ft.identificacao, '
      #9'ft.automacao, '
      #9'ft.veiculo, '
      #9'ft.motorista, '
      #9'ft.ultimokm, '
      #9'ft.data_aquisicao, '
      #9'ft.data_ultimamanutencao, '
      #9'ft.data_venda, '
      #9'ft.data_ultimatrocaoleo, '
      #9'ft.observacao, '
      #9'ft.km_oleomotor, '
      #9'ft.km_oleocambio, '
      #9'ft.km_manutencao, '
      #9'ft.terceiro, '
      #9'ft.esporadico, '
      #9'ft.inativo'
      '   FROM frotas ft'
      '  WHERe inativo is false and placa = :placa;')
    Left = 504
    Top = 65533
    ParamData = <
      item
        DataType = ftString
        Name = 'placa'
        ParamType = ptInput
        Value = nil
      end>
  end
end
