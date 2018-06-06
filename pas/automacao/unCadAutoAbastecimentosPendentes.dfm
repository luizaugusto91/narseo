inherited frmCadAutoAbastecimentosPendentes: TfrmCadAutoAbastecimentosPendentes
  Caption = 'Manual - Abastecimentos Pendentes'
  ClientHeight = 234
  ClientWidth = 653
  ExplicitWidth = 659
  ExplicitHeight = 263
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 199
    Width = 653
    ExplicitTop = 199
    ExplicitWidth = 653
    inherited btnCancelar: TButton
      Left = 376
      ExplicitLeft = 376
    end
    inherited btnSalvar: TButton
      Left = 469
      Top = 4
      ExplicitLeft = 469
      ExplicitTop = 4
    end
    inherited btnFechar: TButton
      Left = 562
      ExplicitLeft = 562
    end
  end
  inherited grpContent: TGroupBox
    Width = 643
    Height = 148
    ExplicitWidth = 643
    ExplicitHeight = 148
    object lblCodigo: TLabel
      Left = 10
      Top = 24
      Width = 41
      Height = 15
      Caption = 'C'#243'digo:'
      FocusControl = edtCodigo
    end
    object Label3: TLabel
      Left = 428
      Top = 53
      Width = 67
      Height = 15
      Caption = 'Quantidade:'
      FocusControl = edtquantidade
    end
    object Label4: TLabel
      Left = 514
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
    object Label6: TLabel
      Left = 10
      Top = 53
      Width = 101
      Height = 15
      Caption = 'Encerrante Inicial:'
      FocusControl = edtencerrante_inicial
    end
    object Label7: TLabel
      Left = 223
      Top = 53
      Width = 93
      Height = 15
      Caption = 'Encerrante Final:'
      FocusControl = edtencerrante_final
    end
    object Label8: TLabel
      Left = 111
      Top = 24
      Width = 27
      Height = 15
      Caption = 'Bico:'
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
    object edtquantidade: TcxDBCalcEdit
      Left = 501
      Top = 50
      DataBinding.DataField = 'quantidade'
      DataBinding.DataSource = ds
      TabOrder = 6
      OnEnter = grpContentEnter
      Width = 129
    end
    object edthora: TcxDBTimeEdit
      Left = 550
      Top = 21
      DataBinding.DataField = 'hora'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 3
      OnEnter = grpContentEnter
      Width = 80
    end
    object edtdata: TcxDBDateEdit
      Left = 388
      Top = 21
      DataBinding.DataField = 'data'
      DataBinding.DataSource = ds
      TabOrder = 2
      OnEnter = grpContentEnter
      Width = 120
    end
    object edtencerrante_inicial: TcxDBCalcEdit
      Left = 117
      Top = 50
      DataBinding.DataField = 'encerrante_inicial'
      DataBinding.DataSource = ds
      TabOrder = 4
      OnEnter = grpContentEnter
      Width = 100
    end
    object edtencerrante_final: TcxDBCalcEdit
      Left = 322
      Top = 50
      DataBinding.DataField = 'encerrante_final'
      DataBinding.DataSource = ds
      TabOrder = 5
      OnEnter = grpContentEnter
      Width = 100
    end
    object grpBaixa: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 81
      Width = 633
      Height = 62
      Align = alBottom
      Caption = ' Baixa de Abastecimento '
      TabOrder = 7
      object Label9: TLabel
        Left = 11
        Top = 29
        Width = 94
        Height = 15
        Caption = 'Placa do Veiculo:'
      end
      object Label10: TLabel
        Left = 217
        Top = 29
        Width = 21
        Height = 15
        Caption = 'KM:'
      end
      object cbbTrocaOleo: TcxDBCheckBox
        Left = 350
        Top = 26
        Caption = 'Realizada troca de '#243'leo'
        DataBinding.DataField = 'troca_oleo'
        DataBinding.DataSource = ds
        Properties.ValueGrayed = 'False'
        TabOrder = 2
        Width = 187
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
      object edtkm: TcxDBCalcEdit
        Left = 244
        Top = 26
        DataBinding.DataField = 'km'
        DataBinding.DataSource = ds
        TabOrder = 1
        OnEnter = grpContentEnter
        Width = 100
      end
    end
    object cbbBico: TcxDBLookupComboBox
      Left = 144
      Top = 21
      DataBinding.DataField = 'bico'
      DataBinding.DataSource = ds
      Properties.KeyFieldNames = 'nr_logico'
      Properties.ListColumns = <
        item
          Caption = 'Descri'#231#227'o'
          FieldName = 'bico'
        end>
      Properties.ListSource = dsBico
      TabOrder = 1
      OnEnter = grpContentEnter
      Width = 203
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
    Left = 320
    Top = 0
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO abastecimento'
      
        '  (bico, quantidade, data, hora, encerrante_inicial, encerrante_' +
        'final, placa, km, troca_oleo)'
      'VALUES'
      
        '  (:bico, :quantidade, :data, :hora, :encerrante_inicial, :encer' +
        'rante_final, :placa, :km, :troca_oleo)')
    SQLDelete.Strings = (
      'DELETE FROM abastecimento'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE abastecimento'
      'SET'
      
        '  bico = :bico, quantidade = :quantidade, data = :data, hora = :' +
        'hora, encerrante_inicial = :encerrante_inicial, encerrante_final' +
        ' = :encerrante_final, placa = :placa, km = :km, troca_oleo = :tr' +
        'oca_oleo'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM abastecimento'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT bico, quantidade, data, hora, encerrante_inicial, encerra' +
        'nte_final, placa, km, troca_oleo FROM abastecimento'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM abastecimento'
      ''
      ') t')
    SQL.Strings = (
      'SELECT codigo, bico, quantidade, data, hora, troca_oleo,'
      
        '       encerrante_inicial, encerrante_final, processo_date, plac' +
        'a, km'
      '  FROM abastecimento'
      '  WHERE codigo = :codigo;')
    Left = 280
    Top = 0
    object qConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qConsultabico: TStringField
      FieldName = 'bico'
      Required = True
      Size = 10
    end
    object qConsultaquantidade: TFloatField
      FieldName = 'quantidade'
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
    object qConsultaprocesso_date: TDateTimeField
      FieldName = 'processo_date'
    end
    object qConsultaplaca: TStringField
      FieldName = 'placa'
      EditMask = '!LLL-9000;0;_'
      Size = 7
    end
    object qConsultakm: TFloatField
      FieldName = 'km'
    end
    object qConsultatroca_oleo: TBooleanField
      FieldName = 'troca_oleo'
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 244
  end
  object qBicos: TUniQuery
    Tag = 7100
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT '#9'bc.codigo, '
      #9'bc.bomba, '
      #9'(bc.nr_bico||'#39' - '#39'||tq.nome)::character varying(40) as bico,'
      #9'bc.tanque as tanque,'
      #9'tq.nome as tanque_descricao, '
      #9'bc.nr_bico, '
      #9'bc.nr_logico,'
      #9'bc.nr_ilha, '
      #9'bc.empresa, '
      #9'bc.inativo'
      '  FROM bicos bc'
      '  LEFT OUTER JOIN deposito tq on tq.codigo = bc.tanque')
    Left = 384
    Top = 65534
  end
  object dsBico: TUniDataSource
    DataSet = qBicos
    Left = 432
    Top = 65534
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
