inherited frmCadPessoaTransportadora: TfrmCadPessoaTransportadora
  Caption = 'Cadastro de Pessoas - Transportadora'
  PixelsPerInch = 96
  TextHeight = 15
  inherited grpContent: TGroupBox
    ExplicitHeight = 422
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
      ExplicitTop = 139
      inherited PageControl: TcxPageControl
        inherited TabContato: TcxTabSheet
          ExplicitTop = 25
          ExplicitWidth = 770
          ExplicitHeight = 228
          inherited PageControlEndereco: TcxPageControl
            inherited TabPrincipal: TcxTabSheet
              inherited edtCEP: TcxDBTextEdit
                ExplicitHeight = 23
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
              ExplicitHeight = 192
            end
          end
        end
        inherited TabObsercacao: TcxTabSheet
          ExplicitTop = 25
          ExplicitWidth = 770
          ExplicitHeight = 228
          inherited grp1: TGroupBox
            inherited edtDataNasc: TcxDBDateEdit
              ExplicitHeight = 23
            end
            inherited cbbimgSexo: TcxDBImageComboBox
              ExplicitHeight = 23
            end
          end
        end
        inherited TabPerfil: TcxTabSheet
          Caption = ' Frota '
          ExplicitTop = 25
          ExplicitWidth = 770
          ExplicitHeight = 228
          object grpFrota: TGroupBox
            Left = 0
            Top = 0
            Width = 770
            Height = 228
            Align = alClient
            Caption = ' Lista de veiculos vinculados '
            TabOrder = 0
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
