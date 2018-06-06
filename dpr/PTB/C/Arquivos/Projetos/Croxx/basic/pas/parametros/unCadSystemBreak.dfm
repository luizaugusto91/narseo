inherited frmCadSystemBreak: TfrmCadSystemBreak
  Caption = 'Parada do sistema'
  ClientHeight = 275
  ClientWidth = 519
  ExplicitWidth = 525
  ExplicitHeight = 304
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 240
    Width = 519
    ExplicitTop = 240
    ExplicitWidth = 519
    inherited btnCancelar: TButton
      Left = 242
      ExplicitLeft = 242
    end
    inherited btnSalvar: TButton
      Left = 335
      ExplicitLeft = 335
    end
    inherited btnFechar: TButton
      Left = 428
      ExplicitLeft = 428
    end
  end
  inherited grpContent: TGroupBox
    Width = 509
    Height = 189
    ExplicitWidth = 509
    ExplicitHeight = 189
    object Label1: TLabel
      Left = 10
      Top = 24
      Width = 41
      Height = 15
      Caption = 'C'#243'digo:'
      FocusControl = edtcodigo
    end
    object Label2: TLabel
      Left = 111
      Top = 24
      Width = 41
      Height = 15
      Caption = 'Motivo:'
      FocusControl = edtmotivo
    end
    object Label3: TLabel
      Left = 256
      Top = 159
      Width = 105
      Height = 15
      Caption = 'Tempo em minutos:'
      FocusControl = edtexpectativa
    end
    object Label4: TLabel
      Left = 10
      Top = 159
      Width = 113
      Height = 15
      Caption = 'Hora para execu'#231#227'o:'
      FocusControl = edthora_execucao
    end
    object edtcodigo: TcxDBSpinEdit
      Left = 57
      Top = 21
      DataBinding.DataField = 'codigo'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      Style.Color = clBtnFace
      TabOrder = 0
      Width = 48
    end
    object edtmotivo: TcxDBSpinEdit
      Left = 158
      Top = 21
      DataBinding.DataField = 'motivo'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 1
      OnExit = grpContentExit
      Width = 50
    end
    object grpDescricao: TGroupBox
      Left = 10
      Top = 45
      Width = 488
      Height = 105
      Caption = ' Descri'#231#227'o '
      TabOrder = 3
      object mmodescricao: TcxDBMemo
        AlignWithMargins = True
        Left = 5
        Top = 20
        Align = alClient
        DataBinding.DataField = 'descricao'
        DataBinding.DataSource = ds
        TabOrder = 0
        OnExit = grpContentExit
        Height = 80
        Width = 478
      end
    end
    object edtexpectativa: TcxDBSpinEdit
      Left = 367
      Top = 156
      DataBinding.DataField = 'expectativa'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 5
      OnExit = grpContentExit
      Width = 107
    end
    object edthora_execucao: TcxDBTimeEdit
      Left = 129
      Top = 156
      DataBinding.DataField = 'hora_execucao'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      TabOrder = 4
      OnExit = grpContentExit
      Width = 121
    end
    object cbbmotivo: TcxDBLookupComboBox
      Left = 214
      Top = 21
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
      Width = 284
    end
  end
  inherited pnlHelp: TPanel
    Width = 510
    ExplicitWidth = 510
    inherited mmoHelp: TMemo
      Width = 463
      ExplicitWidth = 463
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
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = 0
      end>
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
