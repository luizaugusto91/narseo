inherited frmCadPessoaFuncionario: TfrmCadPessoaFuncionario
  Caption = 'Cadastro de Pessoas - Colaboradores'
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
          Caption = ' Contrato  '
          ExplicitLeft = 31
          ExplicitTop = 29
          object grp2: TGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 51
            Width = 764
            Height = 174
            Align = alClient
            Caption = ' Detalhes do Contrato '
            TabOrder = 0
            ExplicitLeft = 280
            ExplicitTop = 48
            ExplicitWidth = 185
            ExplicitHeight = 105
            object lblNIS: TLabel
              Left = 12
              Top = 27
              Width = 84
              Height = 15
              Caption = 'N'#250'mero do NIS:'
              FocusControl = edtnumero_pis
            end
            object Label10: TLabel
              Left = 266
              Top = 27
              Width = 92
              Height = 15
              Caption = 'N'#250'mero da CTPS:'
              FocusControl = edtctps_numero
            end
            object Label23: TLabel
              Left = 491
              Top = 27
              Width = 30
              Height = 15
              Caption = 'S'#233'rie:'
              FocusControl = edtctps_serie
            end
            object Label29: TLabel
              Left = 648
              Top = 27
              Width = 66
              Height = 15
              Caption = 'UF Emiss'#227'o:'
              FocusControl = edtctps_uf
            end
            object Label30: TLabel
              Left = 12
              Top = 56
              Width = 81
              Height = 15
              Caption = 'Departamento:'
              FocusControl = edtdepartamento
            end
            object Label31: TLabel
              Left = 408
              Top = 56
              Width = 35
              Height = 15
              Caption = 'Cargo:'
              FocusControl = edtcargo
            end
            object Label32: TLabel
              Left = 50
              Top = 85
              Width = 43
              Height = 15
              Caption = 'Fun'#231#227'o:'
              FocusControl = edtfuncao
            end
            object lblSalario: TLabel
              Left = 505
              Top = 85
              Width = 43
              Height = 15
              Caption = 'Sal'#225'rio:'
              FocusControl = edtsalario
            end
            object Label33: TLabel
              Left = 28
              Top = 114
              Width = 64
              Height = 15
              Caption = 'Adminss'#227'o:'
              FocusControl = edtdata_admissao
            end
            object Label34: TLabel
              Left = 204
              Top = 114
              Width = 57
              Height = 15
              Caption = 'Demiss'#227'o:'
              FocusControl = edtdata_demissao
            end
            object Label35: TLabel
              Left = 373
              Top = 114
              Width = 87
              Height = 15
              Caption = 'Ultimo reajuste:'
              FocusControl = edtdata_ultimo_reajuste
            end
            object Label36: TLabel
              Left = 572
              Top = 114
              Width = 74
              Height = 15
              Caption = 'Ultima f'#233'rias:'
              FocusControl = edtdata_ultima_ferias
            end
            object Label37: TLabel
              Left = 342
              Top = 143
              Width = 118
              Height = 15
              Caption = 'Forma de pagamento:'
              FocusControl = cxDBSpinEdit1
            end
            object Label38: TLabel
              Left = 12
              Top = 143
              Width = 107
              Height = 15
              Caption = 'Tipo de Pagamento:'
              FocusControl = cxDBSpinEdit2
            end
            object edtnumero_pis: TcxDBSpinEdit
              Left = 102
              Top = 24
              DataBinding.DataField = 'numero_pis'
              DataBinding.DataSource = dsFuncionario
              Properties.SpinButtons.Visible = False
              TabOrder = 0
              OnEnter = grpContentEnter
              Width = 158
            end
            object edtctps_numero: TcxDBSpinEdit
              Left = 364
              Top = 24
              DataBinding.DataField = 'ctps_numero'
              DataBinding.DataSource = dsFuncionario
              Properties.SpinButtons.Visible = False
              TabOrder = 1
              OnEnter = grpContentEnter
              Width = 121
            end
            object edtctps_serie: TcxDBSpinEdit
              Left = 527
              Top = 24
              DataBinding.DataField = 'ctps_serie'
              DataBinding.DataSource = dsFuncionario
              Properties.SpinButtons.Visible = False
              TabOrder = 2
              OnEnter = grpContentEnter
              Width = 115
            end
            object edtctps_uf: TcxDBTextEdit
              Left = 720
              Top = 24
              DataBinding.DataField = 'ctps_uf'
              DataBinding.DataSource = dsFuncionario
              TabOrder = 3
              OnEnter = grpContentEnter
              Width = 32
            end
            object edtdepartamento: TcxDBSpinEdit
              Left = 99
              Top = 53
              DataBinding.DataField = 'departamento'
              DataBinding.DataSource = dsFuncionario
              Properties.SpinButtons.Visible = False
              TabOrder = 4
              OnEnter = grpContentEnter
              Width = 40
            end
            object edtcargo: TcxDBSpinEdit
              Left = 449
              Top = 53
              DataBinding.DataField = 'cargo'
              DataBinding.DataSource = dsFuncionario
              Properties.SpinButtons.Visible = False
              TabOrder = 5
              OnEnter = grpContentEnter
              Width = 40
            end
            object edtfuncao: TcxDBSpinEdit
              Left = 99
              Top = 82
              DataBinding.DataField = 'funcao'
              DataBinding.DataSource = dsFuncionario
              Properties.SpinButtons.Visible = False
              TabOrder = 6
              OnEnter = grpContentEnter
              Width = 40
            end
            object cbbDepartamento: TcxDBLookupComboBox
              Left = 145
              Top = 53
              DataBinding.DataField = 'departamento'
              DataBinding.DataSource = dsFuncionario
              Properties.KeyFieldNames = 'codigo'
              Properties.ListColumns = <
                item
                  Caption = 'C'#243'digo'
                  Width = 60
                  FieldName = 'codigo'
                end
                item
                  Caption = 'Nome'
                  Width = 240
                  FieldName = 'nome'
                end>
              Properties.ListFieldIndex = 1
              Properties.ListSource = dsDepartamento
              TabOrder = 7
              OnEnter = grpContentEnter
              Width = 257
            end
            object cbbCargo: TcxDBLookupComboBox
              Left = 495
              Top = 53
              DataBinding.DataField = 'cargo'
              DataBinding.DataSource = dsFuncionario
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
              Properties.ListSource = dsCargo
              TabOrder = 8
              OnEnter = grpContentEnter
              Width = 257
            end
            object cbbFuncao: TcxDBLookupComboBox
              Left = 145
              Top = 82
              DataBinding.DataField = 'funcao'
              DataBinding.DataSource = dsFuncionario
              Properties.KeyFieldNames = 'codigo'
              Properties.ListColumns = <
                item
                  Caption = 'CBO'
                  Width = 60
                  FieldName = 'cbo'
                end
                item
                  Caption = 'Descri'#231#227'o'
                  Width = 240
                  FieldName = 'descricao'
                end>
              Properties.ListFieldIndex = 1
              Properties.ListSource = dsFuncoes
              TabOrder = 9
              OnEnter = grpContentEnter
              Width = 354
            end
            object edtsalario: TcxDBCurrencyEdit
              Left = 554
              Top = 82
              DataBinding.DataField = 'salario'
              DataBinding.DataSource = dsFuncionario
              TabOrder = 10
              OnEnter = grpContentEnter
              Width = 198
            end
            object edtdata_admissao: TcxDBDateEdit
              Left = 98
              Top = 111
              DataBinding.DataField = 'data_admissao'
              DataBinding.DataSource = dsFuncionario
              TabOrder = 11
              OnEnter = grpContentEnter
              Width = 100
            end
            object edtdata_demissao: TcxDBDateEdit
              Left = 267
              Top = 111
              DataBinding.DataField = 'data_demissao'
              DataBinding.DataSource = dsFuncionario
              TabOrder = 12
              OnEnter = grpContentEnter
              Width = 100
            end
            object edtdata_ultimo_reajuste: TcxDBDateEdit
              Left = 466
              Top = 111
              DataBinding.DataField = 'data_ultimo_reajuste'
              DataBinding.DataSource = dsFuncionario
              TabOrder = 13
              OnEnter = grpContentEnter
              Width = 100
            end
            object edtdata_ultima_ferias: TcxDBDateEdit
              Left = 652
              Top = 111
              DataBinding.DataField = 'data_ultima_ferias'
              DataBinding.DataSource = dsFuncionario
              TabOrder = 14
              OnEnter = grpContentEnter
              Width = 100
            end
            object cxDBSpinEdit1: TcxDBSpinEdit
              Left = 466
              Top = 140
              DataBinding.DataField = 'forma_pagamento'
              DataBinding.DataSource = dsFuncionario
              Enabled = False
              Properties.SpinButtons.Visible = False
              TabOrder = 15
              OnEnter = grpContentEnter
              Width = 40
            end
            object cxDBSpinEdit2: TcxDBSpinEdit
              Left = 125
              Top = 140
              DataBinding.DataField = 'tipo_pagamento'
              DataBinding.DataSource = dsFuncionario
              Enabled = False
              Properties.SpinButtons.Visible = False
              TabOrder = 16
              OnEnter = grpContentEnter
              Width = 40
            end
            object cbbTipoPagamento: TcxDBLookupComboBox
              Left = 171
              Top = 140
              DataBinding.DataField = 'tipo_pagamento'
              DataBinding.DataSource = dsFuncionario
              Enabled = False
              Properties.KeyFieldNames = 'codigo'
              Properties.ListColumns = <
                item
                  Caption = 'C'#243'digo'
                  Width = 60
                  FieldName = 'codigo'
                end
                item
                  Caption = 'Pais'
                  Width = 240
                  FieldName = 'pais'
                end>
              Properties.ListFieldIndex = 1
              Properties.ListSource = dsPais
              TabOrder = 17
              OnEnter = grpContentEnter
              Width = 165
            end
            object cbbFormaPagamento: TcxDBLookupComboBox
              Left = 512
              Top = 140
              DataBinding.DataField = 'forma_pagamento'
              DataBinding.DataSource = dsFuncionario
              Enabled = False
              Properties.KeyFieldNames = 'codigo'
              Properties.ListColumns = <
                item
                  Caption = 'C'#243'digo'
                  Width = 60
                  FieldName = 'codigo'
                end
                item
                  Caption = 'Pais'
                  Width = 240
                  FieldName = 'pais'
                end>
              Properties.ListFieldIndex = 1
              Properties.ListSource = dsPais
              TabOrder = 18
              OnEnter = grpContentEnter
              Width = 240
            end
          end
          object rgTipoContrato: TcxDBRadioGroup
            AlignWithMargins = True
            Left = 3
            Top = 0
            Margins.Top = 0
            Align = alTop
            Caption = ' Tipo de Contrato '
            DataBinding.DataField = 'tipo_contrato'
            DataBinding.DataSource = dsFuncionario
            Properties.Columns = 3
            Properties.Items = <
              item
                Caption = 'CLT'
                Value = 0
              end
              item
                Caption = 'Pessoa Juridica'
                Value = 1
              end
              item
                Caption = 'Liberal'
                Value = 2
              end>
            TabOrder = 1
            Height = 45
            Width = 764
          end
        end
      end
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  object qFuncionario: TUniQuery
    Tag = 7100
    SQLInsert.Strings = (
      'INSERT INTO pessoa_funcionario'
      
        '  (pessoa, numero_pis, ctps_numero, ctps_serie, ctps_uf, departa' +
        'mento, cargo, funcao, salario, data_admissao, data_demissao, dat' +
        'a_ultimo_reajuste, data_ultima_ferias, forma_pagamento, tipo_pag' +
        'amento, tipo_contrato)'
      'VALUES'
      
        '  (:pessoa, :numero_pis, :ctps_numero, :ctps_serie, :ctps_uf, :d' +
        'epartamento, :cargo, :funcao, :salario, :data_admissao, :data_de' +
        'missao, :data_ultimo_reajuste, :data_ultima_ferias, :forma_pagam' +
        'ento, :tipo_pagamento, :tipo_contrato)')
    SQLDelete.Strings = (
      'DELETE FROM pessoa_funcionario'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE pessoa_funcionario'
      'SET'
      
        '  pessoa = :pessoa, numero_pis = :numero_pis, ctps_numero = :ctp' +
        's_numero, ctps_serie = :ctps_serie, ctps_uf = :ctps_uf, departam' +
        'ento = :departamento, cargo = :cargo, funcao = :funcao, salario ' +
        '= :salario, data_admissao = :data_admissao, data_demissao = :dat' +
        'a_demissao, data_ultimo_reajuste = :data_ultimo_reajuste, data_u' +
        'ltima_ferias = :data_ultima_ferias, forma_pagamento = :forma_pag' +
        'amento, tipo_pagamento = :tipo_pagamento, tipo_contrato = :tipo_' +
        'contrato'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM pessoa_funcionario'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT pessoa, numero_pis, ctps_numero, ctps_serie, ctps_uf, dep' +
        'artamento, cargo, funcao, salario, data_admissao, data_demissao,' +
        ' data_ultimo_reajuste, data_ultima_ferias, forma_pagamento, tipo' +
        '_pagamento, tipo_contrato FROM pessoa_funcionario'
      'WHERE'
      '  codigo = :P_1_codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM pessoa_funcionario'
      ''
      ') t')
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT pf.codigo, '
      #9'pf.pessoa, '
      #9'pf.numero_pis, '
      #9'pf.ctps_numero, '
      #9'pf.ctps_serie, '
      #9'pf.ctps_uf, '
      #9'pf.departamento, '
      #9'pf.cargo, '
      #9'pf.funcao, '
      #9'pf.salario, '
      #9'pf.data_admissao, '
      #9'pf.data_demissao, '
      #9'pf.data_ultimo_reajuste, '
      #9'pf.data_ultima_ferias, '
      #9'pf.forma_pagamento, '
      #9'pf.tipo_pagamento, '
      #9'pf.tipo_contrato'
      '   FROM pessoa_funcionario pf'
      '  WHERE pf.pessoa = :codigo ;')
    MasterSource = ds
    MasterFields = 'codigo'
    DetailFields = 'pessoa'
    Left = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = 0
      end>
    object qFuncionariocodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
    end
    object qFuncionariopessoa: TIntegerField
      FieldName = 'pessoa'
      Required = True
    end
    object qFuncionarionumero_pis: TIntegerField
      FieldName = 'numero_pis'
    end
    object qFuncionarioctps_numero: TIntegerField
      FieldName = 'ctps_numero'
    end
    object qFuncionarioctps_serie: TIntegerField
      FieldName = 'ctps_serie'
    end
    object qFuncionarioctps_uf: TStringField
      FieldName = 'ctps_uf'
      FixedChar = True
      Size = 2
    end
    object qFuncionariodepartamento: TIntegerField
      FieldName = 'departamento'
    end
    object qFuncionariocargo: TIntegerField
      FieldName = 'cargo'
    end
    object qFuncionariofuncao: TIntegerField
      FieldName = 'funcao'
    end
    object qFuncionariosalario: TCurrencyField
      FieldName = 'salario'
    end
    object qFuncionariodata_admissao: TDateField
      FieldName = 'data_admissao'
    end
    object qFuncionariodata_demissao: TDateField
      FieldName = 'data_demissao'
    end
    object qFuncionariodata_ultimo_reajuste: TDateField
      FieldName = 'data_ultimo_reajuste'
    end
    object qFuncionariodata_ultima_ferias: TDateField
      FieldName = 'data_ultima_ferias'
    end
    object qFuncionarioforma_pagamento: TIntegerField
      FieldName = 'forma_pagamento'
    end
    object qFuncionariotipo_pagamento: TIntegerField
      FieldName = 'tipo_pagamento'
    end
    object qFuncionariotipo_contrato: TIntegerField
      FieldName = 'tipo_contrato'
    end
  end
  object dsFuncionario: TUniDataSource
    DataSet = qFuncionario
    Left = 376
  end
  object qDepartamento: TUniQuery
    Tag = 7100
    Connection = Connection.Conn
    SQL.Strings = (
      
        'SELECT codigo, nome, descricao, turno_inicio, turno_fim, respons' +
        'avel, '
      '       desativado'
      '  FROM departamentos;')
    DetailFields = 'pessoa'
    Left = 296
    Top = 144
  end
  object qCargo: TUniQuery
    Tag = 7100
    Connection = Connection.Conn
    SQL.Strings = (
      
        'SELECT codigo, descricao, salario_base, valor_hora_extra, seguro' +
        '_vida, '
      
        '       vale_transporte, cesta_basica, ticket, carga_horaria, car' +
        'ga_horaria_semana'
      '  FROM cargos;')
    DetailFields = 'pessoa'
    Left = 344
    Top = 144
  end
  object qFuncao: TUniQuery
    Tag = 7100
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT codigo, cbo, descricao'
      '  FROM pessoa_funcoes;')
    DetailFields = 'pessoa'
    Left = 392
    Top = 144
  end
  object dsDepartamento: TUniDataSource
    DataSet = qDepartamento
    Left = 296
    Top = 176
  end
  object dsCargo: TUniDataSource
    DataSet = qCargo
    Left = 344
    Top = 176
  end
  object dsFuncoes: TUniDataSource
    DataSet = qFuncao
    Left = 392
    Top = 176
  end
end
