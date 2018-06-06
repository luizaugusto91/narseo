inherited frmCadPessoaTransportadora: TfrmCadPessoaTransportadora
  Caption = 'Cadastro de Pessoas - Transportadora'
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
          Caption = ' Frota '
          object grpFrota: TGroupBox
            Left = 0
            Top = 0
            Width = 770
            Height = 228
            Align = alClient
            Caption = ' Lista de veiculos vinculados '
            TabOrder = 0
            ExplicitLeft = 3
            ExplicitWidth = 185
            ExplicitHeight = 105
            object Grid: TcxGrid
              AlignWithMargins = True
              Left = 8
              Top = 20
              Width = 754
              Height = 200
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
              ExplicitLeft = 6
              ExplicitTop = 136
              ExplicitWidth = 758
              ExplicitHeight = 86
              object View: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                DataController.DataSource = dsFrota
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
                object Viewcodigo: TcxGridDBColumn
                  Caption = '#ID'
                  DataBinding.FieldName = 'codigo'
                  Width = 50
                end
                object Viewtipo: TcxGridDBColumn
                  Caption = 'Tipo'
                  DataBinding.FieldName = 'tipo'
                  Width = 80
                end
                object Viewplaca: TcxGridDBColumn
                  Caption = 'Placa'
                  DataBinding.FieldName = 'placa'
                  Width = 80
                end
                object Viewidentificacao: TcxGridDBColumn
                  Caption = 'Identifica'#231#227'o'
                  DataBinding.FieldName = 'identificacao'
                  Width = 80
                end
                object Viewveiculo: TcxGridDBColumn
                  Caption = 'Veiculo'
                  DataBinding.FieldName = 'veiculo'
                  Width = 160
                end
                object Viewmotorista: TcxGridDBColumn
                  Caption = 'Motorista'
                  DataBinding.FieldName = 'motorista'
                  Visible = False
                  Width = 300
                end
                object Viewultimokm: TcxGridDBColumn
                  Caption = 'KM'
                  DataBinding.FieldName = 'ultimokm'
                  Width = 80
                end
                object Viewterceiro: TcxGridDBColumn
                  Caption = 'Terceiro'
                  DataBinding.FieldName = 'terceiro'
                  Visible = False
                  Width = 50
                end
                object Viewesporadico: TcxGridDBColumn
                  Caption = 'Esporadico'
                  DataBinding.FieldName = 'esporadico'
                  Visible = False
                  Width = 50
                end
                object Viewinativo: TcxGridDBColumn
                  Caption = 'Inativo'
                  DataBinding.FieldName = 'inativo'
                  Width = 50
                end
              end
              object Master: TcxGridLevel
                GridView = View
              end
            end
          end
        end
      end
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  object qFrota: TUniQuery
    Tag = 7100
    SQLInsert.Strings = (
      'INSERT INTO pessoa_endereco_cobranca'
      
        '  (pessoa, endereco, endereco_numero, complemento, referencia, b' +
        'airro, cep, cidade, uf, pais, tel1, tel2, tel3)'
      'VALUES'
      
        '  (:pessoa, :endereco, :endereco_numero, :complemento, :referenc' +
        'ia, :bairro, :cep, :cidade, :uf, :pais, :tel1, :tel2, :tel3)')
    SQLDelete.Strings = (
      'DELETE FROM pessoa_endereco_cobranca'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE pessoa_endereco_cobranca'
      'SET'
      
        '  pessoa = :pessoa, endereco = :endereco, endereco_numero = :end' +
        'ereco_numero, complemento = :complemento, referencia = :referenc' +
        'ia, bairro = :bairro, cep = :cep, cidade = :cidade, uf = :uf, pa' +
        'is = :pais, tel1 = :tel1, tel2 = :tel2, tel3 = :tel3'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM pessoa_endereco_cobranca'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT pessoa, endereco, endereco_numero, complemento, referenci' +
        'a, bairro, cep, cidade, uf, pais, tel1, tel2, tel3 FROM pessoa_e' +
        'ndereco_cobranca'
      'WHERE'
      '  codigo = :P_1_codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM pessoa_endereco_cobranca'
      ''
      ') t')
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT ft.codigo, '
      #9'ft.transportadora, '
      #9'ft.tipo as cd_tipo,'
      #9'tf.descricao as tipo, '
      #9'ft.placa, '
      #9'ft.identificacao, '
      #9'ft.veiculo, '
      #9'ft.motorista as cd_motorista,'
      #9'ps.nome as motorista, '
      #9'ft.ultimokm, '
      #9'ft.terceiro, '
      #9'ft.esporadico, '
      #9'ft.inativo'
      '   FROM frotas ft'
      '   LEFT JOIN tipo_frota tf on tf.codigo = ft.tipo'
      '   LEFT JOIN pessoas ps on ps.codigo = ft.motorista'
      '  WHERE ft.transportadora = :codigo ;')
    Left = 432
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = 0
      end>
  end
  object dsFrota: TUniDataSource
    DataSet = qFrota
    Left = 480
    Top = 144
  end
  object StyleRepository: TcxStyleRepository
    Left = 718
    Top = 255
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
