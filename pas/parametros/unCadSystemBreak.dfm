inherited frmCadSystemBreak: TfrmCadSystemBreak
  Caption = 'Parada do sistema'
  ClientHeight = 312
  ClientWidth = 588
  ExplicitWidth = 594
  ExplicitHeight = 341
  PixelsPerInch = 96
  TextHeight = 17
  inherited pnlBotton: TPanel
    Top = 277
    Width = 588
    ExplicitTop = 277
    ExplicitWidth = 588
    inherited btnCancelar: TButton
      Left = 310
      ExplicitLeft = 310
    end
    inherited btnSalvar: TButton
      Left = 403
      ExplicitLeft = 403
    end
    inherited btnFechar: TButton
      Left = 496
      ExplicitLeft = 496
    end
  end
  inherited grpContent: TGroupBox
    Left = 6
    Top = 57
    Width = 576
    Height = 220
    Margins.Left = 6
    Margins.Right = 6
    ExplicitLeft = 6
    ExplicitTop = 57
    ExplicitWidth = 576
    ExplicitHeight = 220
    object Label1: TLabel
      Left = 11
      Top = 27
      Width = 46
      Height = 17
      Caption = 'C'#243'digo:'
      FocusControl = edtcodigo
    end
    object Label2: TLabel
      Left = 126
      Top = 27
      Width = 44
      Height = 17
      Caption = 'Motivo:'
      FocusControl = edtmotivo
    end
    object Label3: TLabel
      Left = 290
      Top = 180
      Width = 115
      Height = 17
      Caption = 'Tempo em minutos:'
      FocusControl = edtexpectativa
    end
    object Label4: TLabel
      Left = 11
      Top = 180
      Width = 121
      Height = 17
      Caption = 'Hora para execu'#231#227'o:'
      FocusControl = edthora_execucao
    end
    object edtcodigo: TcxDBSpinEdit
      Left = 65
      Top = 24
      DataBinding.DataField = 'codigo'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      Style.Color = clBtnFace
      TabOrder = 0
      Width = 54
    end
    object edtmotivo: TcxDBSpinEdit
      Left = 179
      Top = 24
      DataBinding.DataField = 'motivo'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 1
      OnExit = grpContentExit
      Width = 57
    end
    object grpDescricao: TGroupBox
      Left = 11
      Top = 51
      Width = 553
      Height = 119
      Caption = ' Descri'#231#227'o '
      TabOrder = 3
      object mmodescricao: TcxDBMemo
        AlignWithMargins = True
        Left = 5
        Top = 22
        Align = alClient
        DataBinding.DataField = 'descricao'
        DataBinding.DataSource = ds
        TabOrder = 0
        OnExit = grpContentExit
        Height = 92
        Width = 543
      end
    end
    object edtexpectativa: TcxDBSpinEdit
      Left = 416
      Top = 177
      DataBinding.DataField = 'expectativa'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 5
      OnExit = grpContentExit
      Width = 121
    end
    object edthora_execucao: TcxDBTimeEdit
      Left = 146
      Top = 177
      DataBinding.DataField = 'hora_execucao'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 4
      OnExit = grpContentExit
      Width = 137
    end
    object cbbmotivo: TcxDBLookupComboBox
      Left = 243
      Top = 24
      DataBinding.DataField = 'motivo'
      DataBinding.DataSource = ds
      Properties.KeyFieldNames = 'codigo'
      Properties.ListColumns = <
        item
          Caption = 'Descri'#231#227'o'
          Width = 300
          FieldName = 'descricao'
        end>
      Properties.ListSource = dsMotivo
      TabOrder = 2
      OnExit = grpContentExit
      Width = 321
    end
  end
  inherited pnlHelp: TPanel
    Left = 6
    Top = 6
    Width = 577
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 5
    ExplicitLeft = 6
    ExplicitTop = 6
    ExplicitWidth = 577
    inherited mmoHelp: TMemo
      Left = 45
      Width = 525
      Margins.Left = 45
      ExplicitLeft = 45
      ExplicitWidth = 525
    end
  end
  inherited ds: TUniDataSource
    Left = 424
    Top = 8
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO system_break'
      '  (usuario, hora_execucao, motivo, descricao, expectativa)'
      'VALUES'
      '  (:usuario, :hora_execucao, :motivo, :descricao, :expectativa)')
    SQLUpdate.Strings = (
      'UPDATE system_break'
      'SET'
      
        '  usuario = :usuario, hora_execucao = :hora_execucao, motivo = :' +
        'motivo, descricao = :descricao, expectativa = :expectativa'
      'WHERE'
      '  codigo = :Old_codigo')
    SQL.Strings = (
      
        'SELECT codigo, usuario, data_registro, hora_registro, hora_execu' +
        'cao, '
      
        '       tempo_execucao, executada, motivo, descricao, data_retorn' +
        'o, hora_retorno, '
      '       expectativa'
      '  FROM system_break'
      ' WHERE codigo = :codigo;')
    Left = 384
    Top = 8
    object qConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qConsultausuario: TIntegerField
      FieldName = 'usuario'
      Required = True
    end
    object qConsultadata_registro: TDateField
      FieldName = 'data_registro'
    end
    object qConsultahora_registro: TTimeField
      FieldName = 'hora_registro'
    end
    object qConsultahora_execucao: TTimeField
      FieldName = 'hora_execucao'
    end
    object qConsultatempo_execucao: TIntegerField
      FieldName = 'tempo_execucao'
    end
    object qConsultaexecutada: TBooleanField
      FieldName = 'executada'
    end
    object qConsultamotivo: TIntegerField
      FieldName = 'motivo'
      Required = True
    end
    object qConsultadescricao: TMemoField
      FieldName = 'descricao'
      Required = True
      BlobType = ftMemo
    end
    object qConsultadata_retorno: TDateField
      FieldName = 'data_retorno'
    end
    object qConsultahora_retorno: TTimeField
      FieldName = 'hora_retorno'
    end
    object qConsultaexpectativa: TIntegerField
      FieldName = 'expectativa'
      Required = True
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 524628
  end
  object qMotivo: TUniQuery
    Tag = 7100
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT codigo, descricao, img, comando'
      '  FROM tipo_break;')
    Left = 224
    Top = 128
  end
  object dsMotivo: TUniDataSource
    DataSet = qMotivo
    Left = 264
    Top = 128
  end
end
