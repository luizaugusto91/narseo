inherited frmCadPessoa: TfrmCadPessoa
  Caption = 'frmCadPessoa'
  ClientHeight = 509
  ClientWidth = 800
  ExplicitWidth = 806
  ExplicitHeight = 538
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 474
    Width = 800
    ExplicitTop = 474
    ExplicitWidth = 800
    DesignSize = (
      800
      35)
    inherited btnCancelar: TButton
      Left = 523
      HotImageIndex = 8
      ImageIndex = 8
      ExplicitLeft = 523
    end
    inherited btnSalvar: TButton
      Left = 616
      HotImageIndex = 58
      ImageIndex = 58
      ExplicitLeft = 616
    end
    inherited btnFechar: TButton
      Left = 709
      ExplicitLeft = 709
    end
  end
  inherited grpContent: TGroupBox
    Width = 790
    Height = 422
    ExplicitWidth = 790
    ExplicitHeight = 422
    DesignSize = (
      790
      422)
    object lblCNPJ: TLabel
      Left = 10
      Top = 53
      Width = 55
      Height = 15
      Alignment = taRightJustify
      Caption = 'CNPJ/CPF:'
      FocusControl = edtCNPJ
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCodigo: TLabel
      Left = 24
      Top = 24
      Width = 41
      Height = 15
      Caption = 'C'#243'digo:'
      FocusControl = edtCodigo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDataCadastro: TLabel
      Left = 445
      Top = 24
      Width = 94
      Height = 15
      Caption = 'Data do Cadastro:'
      FocusControl = edtDataCadastro
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFantasia: TLabel
      Left = 216
      Top = 82
      Width = 92
      Height = 15
      Alignment = taRightJustify
      Caption = 'Fantasia/Apelido:'
      FocusControl = edtFantasia
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblIE: TLabel
      Left = 32
      Top = 82
      Width = 33
      Height = 15
      Alignment = taRightJustify
      Caption = 'IE/RG:'
      FocusControl = edtIE
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblIM: TLabel
      Left = 20
      Top = 111
      Width = 45
      Height = 15
      Alignment = taRightJustify
      Caption = 'IM/OID:'
      FocusControl = edtIM
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNome: TLabel
      Left = 200
      Top = 53
      Width = 108
      Height = 15
      Alignment = taRightJustify
      Caption = 'Raz'#227'o Social/Nome:'
      FocusControl = edtNome
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNomeReduzido: TLabel
      Left = 219
      Top = 111
      Width = 89
      Height = 15
      Alignment = taRightJustify
      Caption = 'Nome Reduzido:'
      FocusControl = edtNomeReduzido
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTipoPessoa: TLabel
      Left = 226
      Top = 24
      Width = 82
      Height = 15
      Caption = 'Tipo de Pessoa:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbbTipoPessoa: TcxDBImageComboBox
      Left = 314
      Top = 21
      Hint = 'Define o tipo de pessoa como F'#205'SICA ou JUR'#205'DICA'
      DataBinding.DataField = 'tipopessoa'
      DataBinding.DataSource = ds
      Properties.Items = <
        item
          Description = 'PESSOA FIS'#205'CA'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'PESSOA JUR'#205'DICA'
          Value = 1
        end>
      TabOrder = 1
      OnEnter = grpContentEnter
      OnExit = cbbTipoPessoaExit
      OnMouseMove = imgHelpMouseMove
      Width = 125
    end
    object chbInativo: TcxDBCheckBox
      Left = 656
      Top = 21
      Hint = 
        'Informa se o cadastro encontra-se INATIVO para opera'#231#245'es no sist' +
        'ema.'
      Caption = 'Inativo ?'
      DataBinding.DataField = 'inativo'
      DataBinding.DataSource = ds
      TabOrder = 3
      OnEnter = grpContentEnter
      OnMouseEnter = imgHelpMouseEnter
      OnMouseMove = imgHelpMouseMove
      Width = 121
    end
    object edtCNPJ: TcxDBTextEdit
      Left = 71
      Top = 50
      Hint = 'Informa o CNPJ ou CPF.'
      DataBinding.DataField = 'cnpj'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      TabOrder = 4
      OnEnter = grpContentEnter
      OnExit = edtCNPJExit
      OnMouseEnter = imgHelpMouseEnter
      Width = 121
    end
    object edtCodigo: TcxDBSpinEdit
      Left = 71
      Top = 21
      Hint = 'C'#243'digo indice do registro.'
      DataBinding.DataField = 'codigo'
      DataBinding.DataSource = ds
      Properties.SpinButtons.Visible = False
      Style.Color = clBtnFace
      TabOrder = 0
      OnMouseEnter = imgHelpMouseEnter
      Width = 121
    end
    object edtDataCadastro: TcxDBDateEdit
      Left = 548
      Top = 21
      Hint = 'Data da inser'#231#227'o do cadastro no sistema.'
      DataBinding.DataField = 'datacadastro'
      DataBinding.DataSource = ds
      TabOrder = 2
      OnEnter = grpContentEnter
      OnMouseMove = imgHelpMouseMove
      Width = 102
    end
    object edtFantasia: TcxDBTextEdit
      Left = 314
      Top = 79
      Hint = 'Informa o nome FANTASIA ou APELIDO atribuido.'
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'fantasia'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      TabOrder = 7
      OnEnter = grpContentEnter
      OnKeyDown = edtFantasiaKeyDown
      OnMouseEnter = imgHelpMouseEnter
      Width = 466
    end
    object edtIE: TcxDBTextEdit
      Left = 71
      Top = 79
      Hint = 
        'Informa a INCRI'#199#195'O ESTADUAL ou RG.'#13#10'Caso seja PESSOA JUR'#205'DICA e ' +
        'n'#227'o possua IE, utilize ISENTO ou AUSENTE de acordo com o regime ' +
        'tributario.'
      DataBinding.DataField = 'ie'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      TabOrder = 6
      OnEnter = grpContentEnter
      OnMouseEnter = imgHelpMouseEnter
      Width = 121
    end
    object edtIM: TcxDBTextEdit
      Left = 71
      Top = 108
      Hint = 
        'Informa a INSCRI'#199#195'O MUNICIPAL ou OUTRO INDICE de registro utiliz' +
        'ado.'#13#10'Exemplos: OAB, CREA, CRO, CRM e outros.'
      DataBinding.DataField = 'im'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      TabOrder = 8
      OnEnter = grpContentEnter
      OnMouseEnter = imgHelpMouseEnter
      Width = 121
    end
    object edtNome: TcxDBTextEdit
      Left = 314
      Top = 50
      Hint = 
        'Informa o a RAZ'#195'O SOCIAL ou NOME da pessoal utilizada em documen' +
        'tos oficiais.'
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'nome'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      TabOrder = 5
      OnEnter = grpContentEnter
      OnMouseEnter = imgHelpMouseEnter
      Width = 466
    end
    object edtNomeReduzido: TcxDBTextEdit
      Left = 314
      Top = 108
      Hint = 
        'Informa um NOME REDUZIDO ou CURTO a ser utilizado por cadastros ' +
        'especiais.'#13#10'Este tipo de informa'#231#227'o aparece com maior frequencia' +
        ' para identificar usu'#225'rios na impress'#227'o de relat'#243'rios e outros.'
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'nomereduzido'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      TabOrder = 9
      OnEnter = grpContentEnter
      OnMouseEnter = imgHelpMouseEnter
      Width = 466
    end
    object grpInfo: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 137
      Width = 780
      Height = 280
      Margins.Top = 120
      Align = alClient
      Caption = ' Informa'#231#245'es '
      TabOrder = 10
      object PageControl: TcxPageControl
        AlignWithMargins = True
        Left = 5
        Top = 20
        Width = 770
        Height = 255
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = TabContato
        Properties.CustomButtons.Buttons = <>
        Properties.Style = 3
        ClientRectBottom = 255
        ClientRectRight = 770
        ClientRectTop = 25
        object TabContato: TcxTabSheet
          Caption = ' Contato '
          ImageIndex = 0
          object PageControlEndereco: TcxPageControl
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 764
            Height = 224
            Align = alClient
            TabOrder = 0
            Properties.ActivePage = TabPrincipal
            Properties.CustomButtons.Buttons = <>
            ClientRectBottom = 224
            ClientRectRight = 764
            ClientRectTop = 26
            object TabPrincipal: TcxTabSheet
              Caption = 'Principal'
              ImageIndex = 0
              DesignSize = (
                764
                198)
              object lblCEP: TLabel
                Left = 11
                Top = 14
                Width = 23
                Height = 15
                Caption = 'CEP:'
                FocusControl = edtCEP
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblLogradouro: TLabel
                Left = 147
                Top = 14
                Width = 67
                Height = 15
                Caption = 'Logradouro:'
                FocusControl = edtLogradouro
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblEndereco_Numero: TLabel
                Left = 643
                Top = 14
                Width = 17
                Height = 15
                Caption = 'N'#186':'
                FocusControl = edtEndereco_numero
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblReferencia: TLabel
                Left = 395
                Top = 43
                Width = 64
                Height = 15
                Caption = 'Refer'#234'ncia:'
                FocusControl = edtReferencia
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblComplemento: TLabel
                Left = 11
                Top = 43
                Width = 82
                Height = 15
                Caption = 'Complemento:'
                FocusControl = edtComplemento
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblBairro: TLabel
                Left = 11
                Top = 72
                Width = 37
                Height = 15
                Caption = 'Bairro:'
                FocusControl = edtBairro
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblCidade: TLabel
                Left = 11
                Top = 101
                Width = 57
                Height = 15
                Caption = 'Municipio:'
                FocusControl = edtCidade
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblSite: TLabel
                Left = 405
                Top = 130
                Width = 25
                Height = 15
                Caption = 'Site:'
                FocusControl = edtSite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblEmail: TLabel
                Left = 11
                Top = 130
                Width = 37
                Height = 15
                Caption = 'E-mail:'
                FocusControl = edtEmail
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblUF: TLabel
                Left = 678
                Top = 101
                Width = 18
                Height = 15
                Caption = 'UF:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblTel1: TLabel
                Left = 11
                Top = 159
                Width = 62
                Height = 15
                Caption = 'Telefone 1:'
                FocusControl = edtTel1
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblCelular: TLabel
                Left = 185
                Top = 159
                Width = 62
                Height = 15
                Caption = 'Telefone 2:'
                FocusControl = edtTel2
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblTel3: TLabel
                Left = 359
                Top = 159
                Width = 62
                Height = 15
                Caption = 'Telefone 3:'
                FocusControl = edtTel3
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblPais: TLabel
                Left = 343
                Top = 72
                Width = 24
                Height = 15
                Caption = 'Pais:'
                FocusControl = edtCidade
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object edtCEP: TcxDBTextEdit
                Left = 40
                Top = 11
                DataBinding.DataField = 'cep'
                DataBinding.DataSource = ds
                Properties.CharCase = ecUpperCase
                TabOrder = 0
                OnEnter = grpContentEnter
                OnMouseEnter = imgHelpMouseEnter
                Width = 72
              end
              object btnBuscarCEP: TButton
                Left = 126
                Top = 11
                Width = 23
                Height = 23
                Hint = 'Realiza a busca do CEP ou LOGRADOURO no servidor ONLINE.'
                Anchors = [akTop, akRight]
                ImageIndex = 59
                Images = ImageList16
                TabOrder = 1
                OnClick = btnBuscarCEPClick
                OnMouseEnter = imgHelpMouseEnter
              end
              object edtLogradouro: TcxDBTextEdit
                Left = 220
                Top = 11
                DataBinding.DataField = 'endereco'
                DataBinding.DataSource = ds
                Properties.CharCase = ecUpperCase
                TabOrder = 2
                OnEnter = grpContentEnter
                OnMouseEnter = imgHelpMouseEnter
                Width = 417
              end
              object edtEndereco_numero: TcxDBTextEdit
                Left = 666
                Top = 11
                DataBinding.DataField = 'endereco_numero'
                DataBinding.DataSource = ds
                Properties.CharCase = ecUpperCase
                TabOrder = 3
                OnEnter = grpContentEnter
                OnMouseEnter = imgHelpMouseEnter
                Width = 79
              end
              object edtReferencia: TcxDBTextEdit
                Left = 465
                Top = 40
                DataBinding.DataField = 'referencia'
                DataBinding.DataSource = ds
                Properties.CharCase = ecUpperCase
                TabOrder = 5
                OnEnter = grpContentEnter
                OnMouseEnter = imgHelpMouseEnter
                Width = 280
              end
              object edtComplemento: TcxDBTextEdit
                Left = 99
                Top = 40
                DataBinding.DataField = 'complemento'
                DataBinding.DataSource = ds
                Properties.CharCase = ecUpperCase
                TabOrder = 4
                OnEnter = grpContentEnter
                OnMouseEnter = imgHelpMouseEnter
                Width = 290
              end
              object edtBairro: TcxDBTextEdit
                Left = 54
                Top = 69
                DataBinding.DataField = 'bairro'
                DataBinding.DataSource = ds
                Properties.CharCase = ecUpperCase
                TabOrder = 6
                OnEnter = grpContentEnter
                OnMouseEnter = imgHelpMouseEnter
                Width = 283
              end
              object edtCidade: TcxDBSpinEdit
                Left = 74
                Top = 98
                DataBinding.DataField = 'cidade'
                DataBinding.DataSource = ds
                Properties.SpinButtons.Visible = False
                TabOrder = 9
                OnEnter = grpContentEnter
                OnMouseEnter = imgHelpMouseEnter
                Width = 69
              end
              object cbbCidade: TcxDBLookupComboBox
                Left = 149
                Top = 98
                DataBinding.DataField = 'cidade'
                DataBinding.DataSource = ds
                Properties.KeyFieldNames = 'codigo'
                Properties.ListColumns = <
                  item
                    Caption = 'Nome'
                    Width = 300
                    FieldName = 'cidade'
                  end
                  item
                    Caption = 'UF'
                    Width = 60
                    FieldName = 'uf'
                  end>
                Properties.ListSource = dsCidade
                TabOrder = 10
                OnEnter = grpContentEnter
                OnMouseMove = imgHelpMouseMove
                Width = 523
              end
              object edtSite: TcxDBTextEdit
                Left = 436
                Top = 127
                DataBinding.DataField = 'site'
                DataBinding.DataSource = ds
                Properties.CharCase = ecLowerCase
                TabOrder = 13
                OnEnter = grpContentEnter
                OnMouseEnter = imgHelpMouseEnter
                Width = 309
              end
              object edtEmail: TcxDBTextEdit
                Left = 54
                Top = 127
                DataBinding.DataField = 'email'
                DataBinding.DataSource = ds
                Properties.CharCase = ecLowerCase
                TabOrder = 12
                OnEnter = grpContentEnter
                OnMouseEnter = imgHelpMouseEnter
                Width = 345
              end
              object edtTel1: TcxDBTextEdit
                Left = 79
                Top = 156
                DataBinding.DataField = 'tel1'
                DataBinding.DataSource = ds
                TabOrder = 14
                OnEnter = grpContentEnter
                OnExit = edtTel1Exit
                OnMouseEnter = imgHelpMouseEnter
                Width = 100
              end
              object edtTel2: TcxDBTextEdit
                Left = 253
                Top = 156
                DataBinding.DataField = 'tel2'
                DataBinding.DataSource = ds
                TabOrder = 15
                OnEnter = grpContentEnter
                OnExit = edtTel2Exit
                OnMouseEnter = imgHelpMouseEnter
                Width = 100
              end
              object edtTel3: TcxDBTextEdit
                Left = 427
                Top = 156
                DataBinding.DataField = 'tel3'
                DataBinding.DataSource = ds
                TabOrder = 16
                OnEnter = grpContentEnter
                OnExit = edtTel3Exit
                OnMouseEnter = imgHelpMouseEnter
                Width = 100
              end
              object edtPais: TcxDBSpinEdit
                Left = 373
                Top = 69
                DataBinding.DataField = 'pais'
                DataBinding.DataSource = ds
                Properties.SpinButtons.Visible = False
                TabOrder = 7
                OnEnter = grpContentEnter
                OnMouseEnter = imgHelpMouseEnter
                Width = 50
              end
              object cbbPais: TcxDBLookupComboBox
                Left = 429
                Top = 69
                DataBinding.DataField = 'pais'
                DataBinding.DataSource = ds
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
                TabOrder = 8
                OnEnter = grpContentEnter
                OnMouseMove = imgHelpMouseMove
                Width = 316
              end
              object cbbUF: TcxDBImageComboBox
                Left = 702
                Top = 98
                DataBinding.DataField = 'uf'
                DataBinding.DataSource = ds
                Properties.Items = <
                  item
                    Description = 'AC'
                    ImageIndex = 0
                    Value = 'AC'
                  end
                  item
                    Description = 'AL'
                    Value = 'AL'
                  end
                  item
                    Description = 'AP'
                    Value = 'AP'
                  end
                  item
                    Description = 'AM'
                    Value = 'AM'
                  end
                  item
                    Description = 'BA'
                    Value = 'BA'
                  end
                  item
                    Description = 'CE'
                    Value = 'CE'
                  end
                  item
                    Description = 'DF'
                    Value = 'DF'
                  end
                  item
                    Description = 'ES'
                    Value = 'ES'
                  end
                  item
                    Description = 'GO'
                    Value = 'GO'
                  end
                  item
                    Description = 'MA'
                    Value = 'MA'
                  end
                  item
                    Description = 'MT'
                    Value = 'MT'
                  end
                  item
                    Description = 'MS'
                    Value = 'MS'
                  end
                  item
                    Description = 'MG'
                    Value = 'MG'
                  end
                  item
                    Description = 'PR'
                    Value = 'PR'
                  end
                  item
                    Description = 'PB'
                    Value = 'PB'
                  end
                  item
                    Description = 'PA'
                    Value = 'PA'
                  end
                  item
                    Description = 'PE'
                    Value = 'PE'
                  end
                  item
                    Description = 'PI'
                    Value = 'PI'
                  end
                  item
                    Description = 'RJ'
                    Value = 'RJ'
                  end
                  item
                    Description = 'RN'
                    Value = 'RN'
                  end
                  item
                    Description = 'RS'
                    Value = 'RS'
                  end
                  item
                    Description = 'RO'
                    Value = 'RO'
                  end
                  item
                    Description = 'RR'
                    Value = 'RR'
                  end
                  item
                    Description = 'SC'
                    Value = 'SC'
                  end
                  item
                    Description = 'SE'
                    Value = 'SE'
                  end
                  item
                    Description = 'SP'
                    Value = 'SP'
                  end
                  item
                    Description = 'TO'
                    Value = 'TO'
                  end>
                TabOrder = 11
                OnEnter = grpContentEnter
                OnExit = cbbTipoPessoaExit
                OnMouseMove = imgHelpMouseMove
                Width = 43
              end
            end
            object TabCobranca: TcxTabSheet
              Caption = 'Cobran'#231'a'
              ImageIndex = 1
              DesignSize = (
                764
                198)
              object Label14: TLabel
                Left = 11
                Top = 72
                Width = 37
                Height = 15
                Caption = 'Bairro:'
                FocusControl = edtCOBbairro
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label15: TLabel
                Left = 185
                Top = 159
                Width = 62
                Height = 15
                Caption = 'Telefone 2:'
                FocusControl = edtCOBtel2
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label16: TLabel
                Left = 11
                Top = 14
                Width = 23
                Height = 15
                Caption = 'CEP:'
                FocusControl = edtCOBcep
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label17: TLabel
                Left = 11
                Top = 101
                Width = 57
                Height = 15
                Caption = 'Municipio:'
                FocusControl = edtCOBcidade
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label18: TLabel
                Left = 11
                Top = 43
                Width = 82
                Height = 15
                Caption = 'Complemento:'
                FocusControl = edtCOBcomplemento
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label20: TLabel
                Left = 644
                Top = 14
                Width = 17
                Height = 15
                Caption = 'N'#186':'
                FocusControl = edtCOBendereco_numero
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label21: TLabel
                Left = 147
                Top = 14
                Width = 67
                Height = 15
                Caption = 'Logradouro:'
                FocusControl = edtCOBendereco
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label22: TLabel
                Left = 401
                Top = 43
                Width = 64
                Height = 15
                Caption = 'Referencia:'
                FocusControl = edtCOBreferencia
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label24: TLabel
                Left = 11
                Top = 159
                Width = 62
                Height = 15
                Caption = 'Telefone 1:'
                FocusControl = edtCOBtel1
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label25: TLabel
                Left = 359
                Top = 159
                Width = 62
                Height = 15
                Caption = 'Telefone 3:'
                FocusControl = edtCOBtel3
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label28: TLabel
                Left = 678
                Top = 101
                Width = 18
                Height = 15
                Caption = 'UF:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label19: TLabel
                Left = 11
                Top = 130
                Width = 24
                Height = 15
                Caption = 'Pais:'
                FocusControl = edtCidade
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Button2: TButton
                Left = 126
                Top = 11
                Width = 23
                Height = 23
                Anchors = [akTop, akRight]
                ImageIndex = 59
                Images = ImageList16
                TabOrder = 1
              end
              object edtCOBbairro: TcxDBTextEdit
                Left = 54
                Top = 69
                DataBinding.DataField = 'bairro'
                DataBinding.DataSource = dsEndCob
                Properties.CharCase = ecUpperCase
                TabOrder = 6
                OnEnter = grpContentEnter
                OnExit = grpContentExit
                Width = 691
              end
              object edtCOBcep: TcxDBTextEdit
                Left = 40
                Top = 11
                DataBinding.DataField = 'cep'
                DataBinding.DataSource = dsEndCob
                Properties.CharCase = ecUpperCase
                TabOrder = 0
                OnEnter = grpContentEnter
                OnExit = grpContentExit
                Width = 72
              end
              object edtCOBcidade: TcxDBSpinEdit
                Left = 74
                Top = 98
                DataBinding.DataField = 'cidade'
                DataBinding.DataSource = dsEndCob
                Properties.SpinButtons.Visible = False
                TabOrder = 7
                OnEnter = grpContentEnter
                OnExit = grpContentExit
                Width = 80
              end
              object edtCOBcomplemento: TcxDBTextEdit
                Left = 99
                Top = 40
                DataBinding.DataField = 'complemento'
                DataBinding.DataSource = dsEndCob
                Properties.CharCase = ecUpperCase
                TabOrder = 4
                OnEnter = grpContentEnter
                OnExit = grpContentExit
                Width = 296
              end
              object edtCOBendereco_numero: TcxDBTextEdit
                Left = 667
                Top = 11
                DataBinding.DataField = 'endereco_numero'
                DataBinding.DataSource = dsEndCob
                Properties.CharCase = ecUpperCase
                TabOrder = 3
                OnEnter = grpContentEnter
                OnExit = grpContentExit
                Width = 78
              end
              object edtCOBendereco: TcxDBTextEdit
                Left = 220
                Top = 11
                DataBinding.DataField = 'endereco'
                DataBinding.DataSource = dsEndCob
                Properties.CharCase = ecUpperCase
                TabOrder = 2
                OnEnter = grpContentEnter
                OnExit = grpContentExit
                Width = 418
              end
              object edtCOBreferencia: TcxDBTextEdit
                Left = 471
                Top = 40
                DataBinding.DataField = 'referencia'
                DataBinding.DataSource = dsEndCob
                Properties.CharCase = ecUpperCase
                TabOrder = 5
                OnEnter = grpContentEnter
                OnExit = grpContentExit
                Width = 274
              end
              object edtCOBtel1: TcxDBTextEdit
                Left = 79
                Top = 156
                DataBinding.DataField = 'tel1'
                DataBinding.DataSource = dsEndCob
                Properties.CharCase = ecUpperCase
                TabOrder = 11
                OnEnter = grpContentEnter
                OnExit = grpContentExit
                Width = 100
              end
              object edtCOBtel2: TcxDBTextEdit
                Left = 253
                Top = 156
                DataBinding.DataField = 'tel2'
                DataBinding.DataSource = dsEndCob
                Properties.CharCase = ecUpperCase
                TabOrder = 12
                OnEnter = grpContentEnter
                OnExit = grpContentExit
                Width = 100
              end
              object edtCOBtel3: TcxDBTextEdit
                Left = 427
                Top = 156
                DataBinding.DataField = 'tel3'
                DataBinding.DataSource = dsEndCob
                Properties.CharCase = ecUpperCase
                TabOrder = 13
                OnEnter = grpContentEnter
                OnExit = grpContentExit
                Width = 100
              end
              object cbbCidadeCobranca: TcxDBLookupComboBox
                Left = 160
                Top = 98
                DataBinding.DataSource = dsEndCob
                Properties.CharCase = ecUpperCase
                Properties.KeyFieldNames = 'codigo'
                Properties.ListColumns = <
                  item
                    Caption = 'Nome'
                    Width = 300
                    FieldName = 'cidade'
                  end
                  item
                    Caption = 'UF'
                    Width = 60
                    FieldName = 'uf'
                  end>
                Properties.ListSource = dsCidade
                TabOrder = 8
                OnEnter = grpContentEnter
                OnExit = grpContentExit
                Width = 512
              end
              object edtCOBpais: TcxDBSpinEdit
                Left = 41
                Top = 127
                DataBinding.DataField = 'pais'
                DataBinding.DataSource = dsEndCob
                Properties.SpinButtons.Visible = False
                TabOrder = 10
                OnEnter = grpContentEnter
                Width = 50
              end
              object cbbcobuf: TcxDBImageComboBox
                Left = 702
                Top = 98
                DataBinding.DataField = 'uf'
                DataBinding.DataSource = dsEndCob
                Properties.Items = <
                  item
                    Description = 'AC'
                    ImageIndex = 0
                    Value = 'AC'
                  end
                  item
                    Description = 'AL'
                    Value = 'AL'
                  end
                  item
                    Description = 'AP'
                    Value = 'AP'
                  end
                  item
                    Description = 'AM'
                    Value = 'AM'
                  end
                  item
                    Description = 'BA'
                    Value = 'BA'
                  end
                  item
                    Description = 'CE'
                    Value = 'CE'
                  end
                  item
                    Description = 'DF'
                    Value = 'DF'
                  end
                  item
                    Description = 'ES'
                    Value = 'ES'
                  end
                  item
                    Description = 'GO'
                    Value = 'GO'
                  end
                  item
                    Description = 'MA'
                    Value = 'MA'
                  end
                  item
                    Description = 'MT'
                    Value = 'MT'
                  end
                  item
                    Description = 'MS'
                    Value = 'MS'
                  end
                  item
                    Description = 'MG'
                    Value = 'MG'
                  end
                  item
                    Description = 'PR'
                    Value = 'PR'
                  end
                  item
                    Description = 'PB'
                    Value = 'PB'
                  end
                  item
                    Description = 'PA'
                    Value = 'PA'
                  end
                  item
                    Description = 'PE'
                    Value = 'PE'
                  end
                  item
                    Description = 'PI'
                    Value = 'PI'
                  end
                  item
                    Description = 'RJ'
                    Value = 'RJ'
                  end
                  item
                    Description = 'RN'
                    Value = 'RN'
                  end
                  item
                    Description = 'RS'
                    Value = 'RS'
                  end
                  item
                    Description = 'RO'
                    Value = 'RO'
                  end
                  item
                    Description = 'RR'
                    Value = 'RR'
                  end
                  item
                    Description = 'SC'
                    Value = 'SC'
                  end
                  item
                    Description = 'SE'
                    Value = 'SE'
                  end
                  item
                    Description = 'SP'
                    Value = 'SP'
                  end
                  item
                    Description = 'TO'
                    Value = 'TO'
                  end>
                TabOrder = 9
                OnEnter = grpContentEnter
                OnExit = cbbTipoPessoaExit
                Width = 43
              end
              object cbbCOBpais: TcxDBLookupComboBox
                Left = 95
                Top = 127
                DataBinding.DataField = 'pais'
                DataBinding.DataSource = dsEndCob
                Properties.CharCase = ecUpperCase
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
                TabOrder = 14
                OnEnter = grpContentEnter
                Width = 650
              end
            end
            object TabEntrega: TcxTabSheet
              Caption = 'Entrega'
              ImageIndex = 2
              DesignSize = (
                764
                198)
              object Label1: TLabel
                Left = 11
                Top = 72
                Width = 37
                Height = 15
                Caption = 'Bairro:'
                FocusControl = edtENTbairro
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label2: TLabel
                Left = 185
                Top = 159
                Width = 62
                Height = 15
                Caption = 'Telefone 2:'
                FocusControl = edtENTtel2
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label3: TLabel
                Left = 11
                Top = 14
                Width = 23
                Height = 15
                Caption = 'CEP:'
                FocusControl = edtENTcep
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label4: TLabel
                Left = 11
                Top = 101
                Width = 57
                Height = 15
                Caption = 'Municipio:'
                FocusControl = edtENTcidade
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label5: TLabel
                Left = 11
                Top = 43
                Width = 82
                Height = 15
                Caption = 'Complemento:'
                FocusControl = edtENTcomplemento
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label7: TLabel
                Left = 643
                Top = 14
                Width = 17
                Height = 15
                Caption = 'N'#186':'
                FocusControl = edtENTendereco_numero
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label8: TLabel
                Left = 147
                Top = 14
                Width = 67
                Height = 15
                Caption = 'Logradouro:'
                FocusControl = edtENTendereco
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label9: TLabel
                Left = 401
                Top = 43
                Width = 64
                Height = 15
                Caption = 'Referencia:'
                FocusControl = edtENTreferencia
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label11: TLabel
                Left = 11
                Top = 159
                Width = 62
                Height = 15
                Caption = 'Telefone 1:'
                FocusControl = edtENTtel1
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label12: TLabel
                Left = 359
                Top = 159
                Width = 62
                Height = 15
                Caption = 'Telefone 3:'
                FocusControl = edtENTtel3
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label13: TLabel
                Left = 678
                Top = 101
                Width = 18
                Height = 15
                Caption = 'UF:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label6: TLabel
                Left = 11
                Top = 130
                Width = 24
                Height = 15
                Caption = 'Pais:'
                FocusControl = edtCidade
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Button1: TButton
                Left = 126
                Top = 11
                Width = 23
                Height = 23
                Anchors = [akTop, akRight]
                ImageIndex = 59
                Images = ImageList16
                TabOrder = 1
              end
              object edtENTbairro: TcxDBTextEdit
                Left = 54
                Top = 69
                DataBinding.DataField = 'bairro'
                DataBinding.DataSource = dsEndEntrega
                Properties.CharCase = ecUpperCase
                TabOrder = 6
                OnEnter = grpContentEnter
                OnExit = grpContentExit
                Width = 691
              end
              object edtENTcep: TcxDBTextEdit
                Left = 40
                Top = 11
                DataBinding.DataField = 'cep'
                DataBinding.DataSource = dsEndEntrega
                Properties.CharCase = ecUpperCase
                TabOrder = 0
                OnEnter = grpContentEnter
                OnExit = grpContentExit
                Width = 72
              end
              object edtENTcidade: TcxDBSpinEdit
                Left = 74
                Top = 98
                DataBinding.DataField = 'cidade'
                DataBinding.DataSource = dsEndEntrega
                Properties.SpinButtons.Visible = False
                TabOrder = 7
                OnEnter = grpContentEnter
                OnExit = grpContentExit
                Width = 80
              end
              object edtENTcomplemento: TcxDBTextEdit
                Left = 99
                Top = 40
                DataBinding.DataField = 'complemento'
                DataBinding.DataSource = dsEndEntrega
                Properties.CharCase = ecUpperCase
                TabOrder = 4
                OnEnter = grpContentEnter
                OnExit = grpContentExit
                Width = 296
              end
              object edtENTendereco_numero: TcxDBTextEdit
                Left = 666
                Top = 11
                DataBinding.DataField = 'endereco_numero'
                DataBinding.DataSource = dsEndEntrega
                Properties.CharCase = ecUpperCase
                TabOrder = 3
                OnEnter = grpContentEnter
                OnExit = grpContentExit
                Width = 79
              end
              object edtENTendereco: TcxDBTextEdit
                Left = 220
                Top = 11
                DataBinding.DataField = 'endereco'
                DataBinding.DataSource = dsEndEntrega
                Properties.CharCase = ecUpperCase
                TabOrder = 2
                OnEnter = grpContentEnter
                OnExit = grpContentExit
                Width = 417
              end
              object edtENTreferencia: TcxDBTextEdit
                Left = 471
                Top = 40
                DataBinding.DataField = 'referencia'
                DataBinding.DataSource = dsEndEntrega
                Properties.CharCase = ecUpperCase
                TabOrder = 5
                OnEnter = grpContentEnter
                OnExit = grpContentExit
                Width = 274
              end
              object edtENTtel1: TcxDBTextEdit
                Left = 79
                Top = 156
                DataBinding.DataField = 'tel1'
                DataBinding.DataSource = dsEndEntrega
                Properties.CharCase = ecUpperCase
                TabOrder = 12
                OnEnter = grpContentEnter
                OnExit = grpContentExit
                Width = 100
              end
              object edtENTtel2: TcxDBTextEdit
                Left = 253
                Top = 156
                DataBinding.DataField = 'tel2'
                DataBinding.DataSource = dsEndEntrega
                Properties.CharCase = ecUpperCase
                TabOrder = 13
                OnEnter = grpContentEnter
                OnExit = grpContentExit
                Width = 100
              end
              object edtENTtel3: TcxDBTextEdit
                Left = 427
                Top = 156
                DataBinding.DataField = 'tel3'
                DataBinding.DataSource = dsEndEntrega
                Properties.CharCase = ecUpperCase
                TabOrder = 14
                OnEnter = grpContentEnter
                OnExit = grpContentExit
                Width = 100
              end
              object cbbCidadeEntrega: TcxDBLookupComboBox
                Left = 160
                Top = 98
                DataBinding.DataSource = dsEndEntrega
                Properties.CharCase = ecUpperCase
                Properties.KeyFieldNames = 'codigo'
                Properties.ListColumns = <
                  item
                    Caption = 'Nome'
                    Width = 300
                    FieldName = 'cidade'
                  end
                  item
                    Caption = 'UF'
                    Width = 60
                    FieldName = 'uf'
                  end>
                Properties.ListSource = dsCidade
                TabOrder = 8
                OnEnter = grpContentEnter
                OnExit = grpContentExit
                Width = 512
              end
              object edtENTpais: TcxDBSpinEdit
                Left = 41
                Top = 127
                DataBinding.DataField = 'pais'
                DataBinding.DataSource = dsEndEntrega
                Properties.SpinButtons.Visible = False
                TabOrder = 10
                OnEnter = grpContentEnter
                Width = 50
              end
              object cbbENTpais: TcxDBLookupComboBox
                Left = 97
                Top = 127
                DataBinding.DataField = 'pais'
                DataBinding.DataSource = dsEndEntrega
                Properties.CharCase = ecUpperCase
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
                TabOrder = 11
                OnEnter = grpContentEnter
                Width = 648
              end
              object cbbentuf: TcxDBImageComboBox
                Left = 702
                Top = 98
                DataBinding.DataField = 'uf'
                DataBinding.DataSource = dsEndEntrega
                Properties.Items = <
                  item
                    Description = 'AC'
                    ImageIndex = 0
                    Value = 'AC'
                  end
                  item
                    Description = 'AL'
                    Value = 'AL'
                  end
                  item
                    Description = 'AP'
                    Value = 'AP'
                  end
                  item
                    Description = 'AM'
                    Value = 'AM'
                  end
                  item
                    Description = 'BA'
                    Value = 'BA'
                  end
                  item
                    Description = 'CE'
                    Value = 'CE'
                  end
                  item
                    Description = 'DF'
                    Value = 'DF'
                  end
                  item
                    Description = 'ES'
                    Value = 'ES'
                  end
                  item
                    Description = 'GO'
                    Value = 'GO'
                  end
                  item
                    Description = 'MA'
                    Value = 'MA'
                  end
                  item
                    Description = 'MT'
                    Value = 'MT'
                  end
                  item
                    Description = 'MS'
                    Value = 'MS'
                  end
                  item
                    Description = 'MG'
                    Value = 'MG'
                  end
                  item
                    Description = 'PR'
                    Value = 'PR'
                  end
                  item
                    Description = 'PB'
                    Value = 'PB'
                  end
                  item
                    Description = 'PA'
                    Value = 'PA'
                  end
                  item
                    Description = 'PE'
                    Value = 'PE'
                  end
                  item
                    Description = 'PI'
                    Value = 'PI'
                  end
                  item
                    Description = 'RJ'
                    Value = 'RJ'
                  end
                  item
                    Description = 'RN'
                    Value = 'RN'
                  end
                  item
                    Description = 'RS'
                    Value = 'RS'
                  end
                  item
                    Description = 'RO'
                    Value = 'RO'
                  end
                  item
                    Description = 'RR'
                    Value = 'RR'
                  end
                  item
                    Description = 'SC'
                    Value = 'SC'
                  end
                  item
                    Description = 'SE'
                    Value = 'SE'
                  end
                  item
                    Description = 'SP'
                    Value = 'SP'
                  end
                  item
                    Description = 'TO'
                    Value = 'TO'
                  end>
                TabOrder = 9
                OnEnter = grpContentEnter
                OnExit = cbbTipoPessoaExit
                Width = 43
              end
            end
            object TabResponsavel: TcxTabSheet
              Caption = ' Responsavel Juridico '
              ImageIndex = 3
            end
          end
        end
        object TabObsercacao: TcxTabSheet
          Caption = ' Observa'#231#245'es '
          ImageIndex = 1
          object grp1: TGroupBox
            Left = 0
            Top = 0
            Width = 770
            Height = 230
            Align = alClient
            TabOrder = 0
            object lblDataNasc: TLabel
              Left = 10
              Top = 12
              Width = 153
              Height = 15
              Caption = 'Data Abertura/Nascimento:'
              FocusControl = edtDataNasc
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblSexo: TLabel
              Left = 296
              Top = 12
              Width = 31
              Height = 15
              Caption = 'Sexo:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edtDataNasc: TcxDBDateEdit
              Left = 169
              Top = 9
              DataBinding.DataField = 'datanascimento'
              DataBinding.DataSource = ds
              TabOrder = 0
              OnEnter = grpContentEnter
              Width = 121
            end
            object grpAlerta: TGroupBox
              AlignWithMargins = True
              Left = 5
              Top = 36
              Width = 760
              Height = 78
              Align = alBottom
              Caption = ' Alerta '
              TabOrder = 1
              object mmAlerta: TcxDBMemo
                AlignWithMargins = True
                Left = 5
                Top = 20
                Align = alClient
                Properties.ScrollBars = ssVertical
                TabOrder = 0
                OnEnter = grpContentEnter
                Height = 53
                Width = 750
              end
            end
            object grpObservacoes: TGroupBox
              AlignWithMargins = True
              Left = 5
              Top = 120
              Width = 760
              Height = 105
              Align = alBottom
              Caption = ' Observa'#231#245'es Gerais '
              TabOrder = 2
              object mmObservacoes: TcxDBMemo
                AlignWithMargins = True
                Left = 5
                Top = 20
                Align = alClient
                Properties.ScrollBars = ssVertical
                TabOrder = 0
                OnEnter = grpContentEnter
                Height = 80
                Width = 750
              end
            end
            object cbbimgSexo: TcxDBImageComboBox
              Left = 333
              Top = 9
              DataBinding.DataField = 'sexo'
              DataBinding.DataSource = ds
              Properties.Items = <
                item
                  Description = 'MASCULINO'
                  ImageIndex = 0
                  Value = 'M'
                end
                item
                  Description = 'FEMININO'
                  Value = 'F'
                end>
              TabOrder = 3
              OnEnter = grpContentEnter
              Width = 121
            end
          end
        end
        object TabPerfil: TcxTabSheet
          ImageIndex = 2
          TabVisible = False
        end
      end
    end
  end
  inherited pnlHelp: TPanel
    Width = 791
    ExplicitWidth = 791
    inherited mmoHelp: TMemo
      Width = 744
      ExplicitWidth = 744
    end
  end
  inherited ds: TUniDataSource
    Left = 224
    Top = 464
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO pessoas'
      
        '  (empresa, datacadastro, nome, fantasia, nomereduzido, tipopess' +
        'oa, cnpj, ie, im, datanascimento, sexo, endereco, endereco_numer' +
        'o, complemento, referencia, bairro, cep, cidade, uf, pais, tel1,' +
        ' tel2, tel3, email, site, obs, alerta, cliente, colaborador, for' +
        'necedor, representante, transportadora, inativo)'
      'VALUES'
      
        '  (:empresa, :datacadastro, :nome, :fantasia, :nomereduzido, :ti' +
        'popessoa, :cnpj, :ie, :im, :datanascimento, :sexo, :endereco, :e' +
        'ndereco_numero, :complemento, :referencia, :bairro, :cep, :cidad' +
        'e, :uf, :pais, :tel1, :tel2, :tel3, :email, :site, :obs, :alerta' +
        ', :cliente, :colaborador, :fornecedor, :representante, :transpor' +
        'tadora, :inativo)')
    SQLDelete.Strings = (
      'DELETE FROM pessoas'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE pessoas'
      'SET'
      
        '  empresa = :empresa, datacadastro = :datacadastro, nome = :nome' +
        ', fantasia = :fantasia, nomereduzido = :nomereduzido, tipopessoa' +
        ' = :tipopessoa, cnpj = :cnpj, ie = :ie, im = :im, datanascimento' +
        ' = :datanascimento, sexo = :sexo, endereco = :endereco, endereco' +
        '_numero = :endereco_numero, complemento = :complemento, referenc' +
        'ia = :referencia, bairro = :bairro, cep = :cep, cidade = :cidade' +
        ', uf = :uf, pais = :pais, tel1 = :tel1, tel2 = :tel2, tel3 = :te' +
        'l3, email = :email, site = :site, obs = :obs, alerta = :alerta, ' +
        'cliente = :cliente, colaborador = :colaborador, fornecedor = :fo' +
        'rnecedor, representante = :representante, transportadora = :tran' +
        'sportadora, inativo = :inativo'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM pessoas'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT empresa, datacadastro, nome, fantasia, nomereduzido, tipo' +
        'pessoa, cnpj, ie, im, datanascimento, sexo, endereco, endereco_n' +
        'umero, complemento, referencia, bairro, cep, cidade, uf, pais, t' +
        'el1, tel2, tel3, email, site, obs, alerta, cliente, colaborador,' +
        ' fornecedor, representante, transportadora, inativo FROM pessoas'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM pessoas'
      ''
      ') t')
    SQL.Strings = (
      'SELECT '#9'ps.codigo, '
      #9'ps.empresa, '
      #9'ps.datacadastro, '
      #9'ps.nome, '
      #9'ps.fantasia, '
      #9'ps.nomereduzido, '
      #9'ps.tipopessoa, '
      #9'ps.cnpj, '
      #9'ps.ie, '
      #9'ps.im, '
      #9'ps.datanascimento, '
      #9'ps.sexo, '
      #9'ps.endereco, '
      #9'ps.endereco_numero, '
      #9'ps.complemento, '
      #9'ps.referencia, '
      #9'ps.bairro, '
      #9'ps.cep, '
      #9'ps.cidade, '
      #9'ps.uf, '
      #9'ps.pais, '
      #9'ps.tel1, '
      #9'ps.tel2, '
      #9'ps.tel3, '
      #9'ps.email, '
      #9'ps.site, '
      #9'ps.obs, '
      #9'ps.alerta, '
      #9'ps.cliente, '
      #9'ps.colaborador, '
      #9'ps.fornecedor, '
      #9'ps.representante, '
      #9'ps.transportadora, '
      #9'ps.inativo'
      '  FROM pessoas ps'
      ' WHERE ps.codigo = :codigo;')
    Left = 184
    Top = 464
    object qConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qConsultaempresa: TIntegerField
      FieldName = 'empresa'
    end
    object qConsultadatacadastro: TDateField
      FieldName = 'datacadastro'
    end
    object qConsultanome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 250
    end
    object qConsultafantasia: TStringField
      DisplayLabel = 'Fantasia'
      FieldName = 'fantasia'
      Required = True
      Size = 250
    end
    object qConsultanomereduzido: TStringField
      DisplayLabel = 'Nome Reduzido'
      FieldName = 'nomereduzido'
      Size = 30
    end
    object qConsultatipopessoa: TIntegerField
      DisplayLabel = 'Tipo de Pessoa'
      FieldName = 'tipopessoa'
      Required = True
    end
    object qConsultacnpj: TStringField
      DisplayLabel = 'CNPJ/CPF'
      FieldName = 'cnpj'
      Required = True
      Size = 50
    end
    object qConsultaie: TStringField
      DisplayLabel = 'IE/RG'
      FieldName = 'ie'
      Required = True
      Size = 50
    end
    object qConsultaim: TStringField
      FieldName = 'im'
      Size = 50
    end
    object qConsultadatanascimento: TDateField
      FieldName = 'datanascimento'
    end
    object qConsultasexo: TStringField
      FieldName = 'sexo'
      Size = 1
    end
    object qConsultaendereco: TStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'endereco'
      Required = True
      Size = 250
    end
    object qConsultaendereco_numero: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'endereco_numero'
      Required = True
      FixedChar = True
    end
    object qConsultacomplemento: TStringField
      FieldName = 'complemento'
      Size = 100
    end
    object qConsultareferencia: TStringField
      FieldName = 'referencia'
      Size = 150
    end
    object qConsultabairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Required = True
      Size = 200
    end
    object qConsultacep: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      Required = True
      EditMask = '00000\-999;0;_'
      Size = 15
    end
    object qConsultacidade: TIntegerField
      DisplayLabel = 'Municipio'
      FieldName = 'cidade'
      Required = True
    end
    object qConsultauf: TStringField
      DisplayLabel = 'UF'
      FieldName = 'uf'
      Required = True
      Size = 2
    end
    object qConsultapais: TIntegerField
      DisplayLabel = 'Pais'
      FieldName = 'pais'
      Required = True
    end
    object qConsultatel1: TStringField
      FieldName = 'tel1'
      EditMask = '!\(99\) 0000-00000;0;_'
    end
    object qConsultatel2: TStringField
      FieldName = 'tel2'
      EditMask = '!\(99\) 0000-00000;0;_'
    end
    object qConsultatel3: TStringField
      FieldName = 'tel3'
      EditMask = '!\(99\) 0000-00000;0;_'
    end
    object qConsultaemail: TStringField
      FieldName = 'email'
      Size = 60
    end
    object qConsultasite: TStringField
      FieldName = 'site'
      Size = 60
    end
    object qConsultaobs: TMemoField
      FieldName = 'obs'
      BlobType = ftMemo
    end
    object qConsultaalerta: TStringField
      FieldName = 'alerta'
      Size = 255
    end
    object qConsultacliente: TBooleanField
      FieldName = 'cliente'
    end
    object qConsultacolaborador: TBooleanField
      FieldName = 'colaborador'
    end
    object qConsultafornecedor: TBooleanField
      FieldName = 'fornecedor'
    end
    object qConsultarepresentante: TBooleanField
      FieldName = 'representante'
    end
    object qConsultatransportadora: TBooleanField
      FieldName = 'transportadora'
    end
    object qConsultainativo: TBooleanField
      DefaultExpression = 'False'
      FieldName = 'inativo'
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 30408844
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000002020B100C0C4C70131376AF151581BF151580BF1414
          75AF0D0D4B7002020B1000000000000000000000000000000000000000000000
          0000000000000B0B4C701616A0EF0F0FACFF0F0FB6FF1212BFFF1818C6FF1D1D
          C7FF1E1EC0FF1C1CA3EF0D0D4A70000000000000000000000000000000000000
          000010106C9F1616ACFF0707B2FF1717C1FF5050D2FF5F5FD3FF6666D6FF6363
          DFFF3F3FE0FF2D2DE2FF2424BDFF1313699F0000000000000000000000000B0B
          4D703A3ABFFF1212B8FF2222BFFF4B4BC3FF2222719F09093650090936502323
          709F6767D8FF4040ECFF3B3BF2FF2424BDFF0D0D4A700000000002020B102424
          ABEF3030C2FF0909B4FF1C1C90CF050521300000000000000000000000000D0D
          51602A2ADEFF3131E6FF4B4BEDFF2E2EE3FF1C1CA2EF02020B10090942604949
          C6FF0C0CB5FF1414B0FF0505213000000000000000000000000009094D601F1F
          D2FF2424D8FF2A2ADEFF7070DCFF4242E1FF1E1EBDFF0B0B40600F0F6E9F6060
          CFFF1111B5FF10106C9F000000000000000000000000060649601515C8FF1A1A
          CDFF1F1FD2FF0D0D51602323709F6767E0FF1D1DC5FF12126B9F121284BF6E6E
          D5FF3737BFFF242460800000000000000000040447600E0EBFFF1111C3FF1515
          C8FF09094D600000000010104D707C7CDEFF1717C4FF151580BF121284BF7171
          D6FF4040C2FF2323608000000000020245600808B9FF0B0BBCFF0E0EBFFF0606
          4960000000000000000010104D706F6FD9FF1212BDFF151581BF0E0E6E9F6969
          D2FF4444C6FF13136E9F0B0B47602F2FC2FF2323C0FF1313BCFF040447600000
          000000000000000000002222719F5050D1FF1010B4FF11116B9F090943605C5C
          CEFF4E4EC9FF3232BEFF3838C4FF3939C4FF3232C3FF0B0B4760000000000000
          000000000000050521305E5EC9FF3535C9FF1D1DB0FF0A0A416001010B102525
          ACEF7070D5FF4444C7FF4040C6FF3838C4FF0B0B476000000000000000000000
          0000050521303737AFEF4747CAFF2727BCFF1818A1EF02020B10000000000A0A
          4E704747C5FF6A6AD3FF4444C7FF3737BFFF13136E9F0E0E4E700E0E4F701313
          6E9F2D2DB8FF3737C3FF3939C4FF1F1FB0FF0B0B4C7000000000000000000000
          00000E0E6E9F4747C5FF7878D9FF4F4FC9FF4444C6FF3D3DC1FF3B3BC0FF3E3E
          C4FF3D3DC5FF5F5FD2FF3B3BBFFF10106C9F0000000000000000000000000000
          0000000000000A0A4E702525ACEF6464D2FF7373D6FF7373D7FF7070D7FF6A6A
          D4FF6060CFFF2626ACEF0B0B4D70000000000000000000000000000000000000
          0000000000000000000001010B100A0A4E70101079AF121284BF121284BF1010
          79AF0B0B4D7002020B1000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000000019591C8035AA3AEF37A13CDF0C230E300000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000186B1A9F44BB4AFFA9EEB2FF90E299FF329537CF0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000001068119F38B53DFFA0E8A9FFA0EEACFFB5F5BFFF72D37AFF1F5C
          2280000000000000000000000000000000000000000000000000000000000000
          00000864099F46BB4BFFA0E6A9FF8EE59AFF84E691FF9DEFA9FFAFF3B9FF4ABE
          50FF0B220C300000000000000000000000000000000000000000000000000160
          019F3BB53FFF98E0A1FF84DD8FFF7ADE87FFA8ECB2FF99ECA5FFACF3B7FF97E6
          9FFF2D9332CF00000000000000000000000000000000000000000055008F34B1
          38FF90DB99FF79D685FF7FDA8BFF9FE6A8FF79D480FFA9EDB3FF91EB9EFFB2F3
          BCFF6CD074FF1C5B1E8000000000000000000000000000000000009700FF89D6
          92FF70CF7BFF75D380FF97E0A0FF42B947FF13A315FF82D889FF9DEAA8FF92EA
          9FFFA7EDB1FF43BB48FF0A220B30000000000000000000000000009600FF7ED0
          86FF85D58FFF86D68EFF2FAF32FF0461049F0428054025AB28FFA3E8ACFF87E4
          94FFA1EBACFF8CDF94FF2C9C30DF030B041000000000000000000054008F21A5
          24FF44B649FF11A013FF0056008F000000000000000009640A9F58C45EFF9CE5
          A6FF7ADE88FFA5EAAEFF62C969FF1B641E8F000000000000000000000000001C
          003000390060001D0030000000000000000000000000010A01100D960EEF89DA
          92FF87DE93FF80DD8CFF98E2A1FF3BB640FF0C2C0D4000000000000000000000
          0000000000000000000000000000000000000000000000000000033B04602FAF
          32FF97E0A0FF6BD478FF8CDD96FF7DD485FF26992ADF030B0310000000000000
          0000000000000000000000000000000000000000000000000000000000000676
          07BF67C96EFF89DA93FF5ACB68FF94DE9DFF57C25DFF18621A8F000000000000
          000000000000000000000000000000000000000000000000000000000000011D
          01300FA010FF85D58DFF66CC72FF66CC72FF87D790FF26AC2AFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000024D02803FB543FF88D591FF6FCD79FF89D691FF24AC2AFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000A0010028702DF4CBA52FF66C56DFF4CBA51FF137C15BF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000001300200160019F067606BF0964099F010A0110}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000091A33502059AAFF174079FF000000570000004D00000021000000000000
          000000000000000000000000000000000000000000000000000000000000040B
          15221D529DEF235FB1FF163C72FF000000430000003E0000003A000000260000
          0008000000000000000000000000000000000000000000000000000000001744
          84D3215EB1FF2964B4FF15396DFF0000002E00000029000000230000001E0000
          00180000000500000000000000000000000000000000000000002360B3FF1E54
          A0FF2564B7FF326EBCFF14386AFF000000380000002E00000024000000180000
          00092360B3FF00000000000000000000000000000000000000002564B7FF2159
          A6FF296ABDFF3B77C2FF133565FF000000380000002E00000024000000180000
          00090E8544FF007300FF00000000000000000000000000000000647388FF245E
          AAFF2C6FC2FF406EA7FF394A62FF000000380000002E0000002400000018005F
          00A4009900FF007300FF000000000000000000000000000000002A6ABEFF2763
          AFFF2F74C8FF5A7696FF4E5F77FF000000380000002E000000240039006F0099
          00FF6BC970FF007300FF007300FF007300FF007300FF007300FF2C6DC1FF2966
          B4FF3279CDFF5491D5FF143667FF000000380000002E00390077009900FF57C0
          5BFF4ABC4FFF58C35EFF5FC666FF66CA6EFF75D07DFF007300FF2D70C3FF2B6A
          B7FF347DD0FF5C99DBFF143667FF000000380000002E009900FF7ECE80FF42B8
          46FF36B43BFF3EB844FF46BC4CFF50C157FF66CA6EFF007300FF2F72C6FF2D6C
          BAFF3780D3FF64A0E0FF143667FF000000380000002E00390077009900FF80CF
          82FF71CA74FF6CC870FF77CD7CFF7ED082FF68C96EFF007300FF3074C8FF2E6E
          BCFF3882D6FF61A0E1FF143667FF000000380000002E000000240039006F0099
          00FF84D086FF009900FF009900FF009900FF009900FF009900FF66768BFF2F70
          BEFF3F88D9FF89BFEEFF234970BF000000380000002E0000002400000018005F
          00A4009900FF009900FF000000000000000000000000000000003176CAFF3374
          C0FF77B2E8FF557692BF00010146000000380000002E00000024000000180000
          0009128C4CFF009900FF000000000000000000000000000000003277CBFF4C8C
          CFFF3C71A7DE0001014600010146000000380000002E00000024000000180000
          00093277CBFF00000000000000000000000000000000000000003277CBFF3277
          CBFF3277CBFF3277CBFF3277CBFF3277CBFF3277CBFF3277CBFF3277CBFF3277
          CBFF3277CBFF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000000000050000000B000000130000001E000000230000
          00180000000F0000000800000002000000000000000000000000000000000000
          000000000000000000040000000A0000000F217F4FFF217F4FFF217F4FFF217F
          4FFF000000120000000E00000009000000010000000000000000000000000000
          000000000000000000000000000000000003217F4FFF2FB873FF2FB873FF217F
          4FFF000000050000000200000000000000000000000000000000000000000000
          000000000000000000000000000000000000217F4FFF2FB873FF2FB873FF217F
          4FFF000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000217F4FFF2FB873FF2FB873FF217F
          4FFF000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000217F4FFF2FB873FF2FB873FF217F
          4FFF00000000000000000000000000000000000000000000000000000000217F
          4FFF217F4FFF217F4FFF217F4FFF217F4FFF217F4FFF31B975FF31B975FF217F
          4FFF217F4FFF217F4FFF217F4FFF217F4FFF217F4FFF0000000000000000217F
          4FFF3BBE7CFF3BBE7CFF3BBE7CFF3BBE7CFF3BBE7CFF3BBE7CFF3BBE7CFF3BBE
          7CFF3BBE7CFF3BBE7CFF3BBE7CFF3BBE7CFF217F4FFF0000000000000000217F
          4FFF45C383FF45C383FF45C383FF45C383FF45C383FF45C383FF45C383FF45C3
          83FF45C383FF45C383FF45C383FF45C383FF217F4FFF0000000000000000217F
          4FFF217F4FFF217F4FFF217F4FFF217F4FFF217F4FFF4FC88BFF4FC88BFF217F
          4FFF217F4FFF217F4FFF217F4FFF217F4FFF217F4FFF00000000000000000000
          000000000000000000000000000000000000217F4FFF59CD92FF59CD92FF217F
          4FFF000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000217F4FFF63D29AFF63D29AFF217F
          4FFF000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000217F4FFF6CD7A1FF6CD7A1FF217F
          4FFF000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000217F4FFF76DCA8FF76DCA8FF217F
          4FFF000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000217F4FFF217F4FFF217F4FFF217F
          4FFF000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
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
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000040000000900000009000000090000000900000009000000090000
          0009000000090000000900000009000000040000000000000000000000000000
          000200000015000000290000002C0000002C0000002C0000002C0000002C0000
          002C0000002C0000002C00000029000000150000000200000000000000000000
          000400000019000A0046002D00A3004500E4004F00FF0000002C0000002C0000
          002C0000002C0000002C0000002A000000190000000400000000000000000000
          0001001A0050005300F605750EFF0A8C1BFF005701FF00000003000000030000
          0003000000030000000300000003000000030000000100000000000000000007
          0012005700ED07861AFF099220FF0E9A28FF026203FF00000000000000000000
          000000000000000D0024000D0024000000000000000000000000000000000039
          008D048013FF15A939FF13A737FF0C8F21FF016A03FF00000000000000000000
          0000001700390A7514F00C7817F0001700390000000000000000000000000060
          00D811A435FF13AB3CFF089222FF005800C6000D001E00000000000000000025
          00540E8518F810A233FF10A233FF149125F9022B035900000000000000000077
          00F61CBA4DFF1EBE50FF02850EFF001A003600000000000000000036006F037F
          05FF0D9B27FF13B244FF13B244FF0D9B27FF08880FFF0036006F00000000007F
          00F626C95CFF27CA5EFF008502FF000200030000000000000000000000000000
          0000008501FF27CA5EFF27CA5EFF008400FF0000000000000000000000000078
          00D825CA5BFF23CB5EFF0A9E16FF000C0015000000000000000000000000000A
          0012079912FF26CD60FF27CD60FF008900F60000000000000000000000000059
          009614BB43FF1ECC61FF2ACE5AFF036805A9001E003300040006000B00120058
          009319BE44FF1CCB60FF18C354FF008300DB000000000000000000000000001E
          003001A001FC2AD568FF1ED166FF31D765FF13B82EFF06A80CFF07A911FF1BC4
          48FF37DE72FF2DD86CFF01B12FFF005D00930000000000000000000000000000
          0000005B008A03B628FF2AD86BFF25D76CFF28D96DFF37DF72FF36DF72FF22D6
          6BFF32DC6FFF08C24CFF00A500F9001800240000000000000000000000000000
          0000000000000061008D00B512FF1ACD50FF36DE6EFF41E576FF38E173FF21D5
          64FF02BF3AFF00AC00F9003E005A000000000000000000000000000000000000
          000000000000000000000022003000690093009200CC00B400FC00B600FF009C
          00DB006D0099001E002A00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000B07E55FFB07E
          55FFB07E55FFB07E55FFB07E55FFB07E55FFB07E55FFB07E55FFB07E55FFB07E
          55FFB07E55FFB07E55FFB07E55FFB07E55FF0000000000000000B28056FFFFFF
          FEFFFFF8F3FFFFF7F1FFFFF6EEFFFFF5EDFFFFFEFBFF8EAF82FF429B4EFFFFF6
          EBFFFFEFE1FFFFEDE0FFFFF8ECFFB07E55FF0000000000000000B48257FFFFFA
          F6FFFEF2EBFFFEF1E8FFFFF2EAFFFFF1E9FF569051FF96DBA7FF429B4EFFFFF2
          EAFFFFECDFFFFFE9DBFFFFF4E9FFB07E55FF0000000000000000B78458FFFFFB
          F7FFFEF3EDFFFFF9F6FFDCDCC9FF45924BFF9BE5AAFF9FEAADFF5FB26BFF419B
          50FF419B50FF3F994EFF3D974CFF409C50FF4D9F5AFF429B4EFFB98759FFFFFC
          F9FFFFF9F6FF93B38BFF57A663FFACF3BAFF88E293FF79D987FF7CDA8CFF77D5
          88FF6CCE7FFF62C675FF57BF6DFF4EB765FF8CDBA1FF429B4EFFBC895AFFFFFC
          F8FFFFFAF7FF93B48CFF57A662FFACF3BAFF88E395FF7BDC88FF80DD8EFF7AD9
          8AFF70D181FF65C879FF5AC16FFF51B967FF8DDCA2FF429B4EFFBE8B5BFFFFFC
          F8FFFEF5EFFFFFFCFAFFDCDFCFFF45924BFF9DE5ACFFA3EEB1FF61B26DFF449B
          50FF439B51FF429B4EFF3F994EFF429D50FF4D9E58FF429B4EFFC08D5CFFFFFB
          F8FFFEF5EFFFFEF6F0FFFFF8F4FFFFF8F5FF579354FF97DBA7FF429B4EFFFFFB
          FAFFFFF5EDFFFFF2EAFFFFFAF4FFB07E55FF0000000000000000C3905EFFFFFB
          F8FFFEF5EFFFFEF6F0FFFEF6F0FFFFF6F1FFFFFFFFFF8AAD82FF429B4EFFFFF7
          F1FFFEEFE7FFFEEEE3FFFFF4ECFFB07E55FF0000000000000000C5925FFFFFFB
          F8FFFEF5EFFFFEF6F0FFFEF6F0FFFEF6F0FFFEF6F0FFFFFAF6FFFFF8F3FFFEF3
          ECFFFEF2E8FFFEEFE6FFFFF7EEFFB07E55FF0000000000000000C89460FFFFFB
          F8FFFEF5EFFFFEF6F0FFFEF6F0FFFEF6F0FFFEF6F0FFFEF6F0FFFEF5EFFFFEF4
          EEFFFEF3ECFFFEF1E8FFFFF7F2FFB07E55FF0000000000000000CA9661FFFFFC
          FBFFFEF7F2FFFEF7F3FFFEF8F3FFFEF8F4FFFFF8F4FFFFF8F5FFFFF9F5FFFFF8
          F4FFFFF7F3FFFFF5F0FFFFFBF9FFB07E55FF0000000000000000CC9962FFFFFC
          FBFFF7E5CAFFF6E3C7FFF5DDC2FFF4DABDFFF1D5B7FFF2D2B3FFF0D0B1FFF0D1
          B2FFF0CFB1FFF0D0AFFFFFFCFBFFB07E55FF0000000000000000CF9B63FFFFFC
          FBFFEFD4A3FFEDCE9AFFEBC590FFE9BB85FFE5B37CFFE5AC73FFE3A86EFFE4A8
          6EFFE4A96EFFE4A96FFFFFFCFBFFB07E55FF0000000000000000D19D64FFFFFC
          FBFFFFFCFBFFFFFCFBFFFFFCFBFFFFFCFBFFFFFCFBFFFFFCFBFFFFFCFBFFFFFC
          FBFFFFFCFBFFFFFCFBFFFFFCFBFFB07E55FF0000000000000000D4A168FFD19D
          64FFCE9A63FFCB9862FFC89560FFC6925FFFC3905EFFC08D5CFFBD8B5BFFBB88
          5AFFB88558FFB58357FFB28056FFB3835CFF0000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000090909465252
          52B5181818DE171717DD171717B10404043A0000000000000000000000000000
          00000707073D333333AF282828DB131313DC171717B508080846202020F67B7B
          7BFF232323FF1C1C1CFF222222FF101010DF0000000000000000000000000000
          00001B1A1AE44B4B4BFF313131FF161616FF222222FF171717F2151515CB7F7F
          7FE0464646EC505050EC2F2F2FE00E0E0EB70000000000000000000000000000
          0000161616BE6C6C6CDF484848EB535252ED464646E3111111C31E1E1EC3CDCD
          CDFF666666FF8D8D8DFF808080FF1A1A1AB30000000000000000000000000000
          00001C1C1CB9CDCDCDFF666666FF818080FF858585FF1E1E1EBF10101051BDBD
          BDFF5E5E5EF8626161E75E5E5EE20D0D0D460000000000000000000000000000
          00000F0F0F4A949494DB474747E2797978F9838383FF1010104D111111652A2A
          2AD4595959FB141414FD191919FC191919FD0A0A0A8C3C3C3CD1212121D01616
          1695282828FE4C4C4CFC141414FD1A1A1AFA262626D50A0A0A59121212A64747
          47E67E7E7EF9676767FF8A8A8AFF606060FC161616CF303030DE1B1B1BDD1919
          19D48A8A8AFB9D9D9DFF666666FF555555F9292929E60E0E0E9A16161686B1B1
          B1FFB5B5B5FF6D6D6DFF908F8FFF808080FF2323239E232323AA191919A62121
          21A1BDBDBDFFA8A8A8FF6E6E6EFF888888FF7F7F7FFF1A1A1A8012121258A7A7
          A7FFBDBDBDFF6B6B6BFF908F8FFF838383FF2424248C232323A4181818A02121
          2190BDBDBDFFA8A8A8FF6E6E6EFF8A8989FF7F7F7FFF151515520D0D0D439D9D
          9DFFC5C5C5FF696969FF8E8D8DFF868686FF2626268C232323A4181818A02121
          2190BDBDBDFFA8A8A8FF6E6E6EFF8B8B8BFF7D7D7DFF0F0F0F3D0909092E9191
          91FFC8C8C8FF525252FF6A6969FF737373FF3E3E3EE4565656E1262626E04242
          42E5979797FF8E8E8EFF575757FF838383FF7A7A7AFF0A0A0A280807072F4645
          45EA7F7F7FE0202020DA525252E8282828E61C1C1CC0464646D1232323CD2121
          21C24E4E4EE62D2D2DE71F1F1FD9383838E1414141EB070707260101010A1212
          1289191919BA151515D2828282EC1A1A1AE11A1A1AC0515151D6212121D52A2A
          2AC1292929E2161616ED141414D1191919BA1111118701010107000000000000
          00000000000011101064888888C6343434C7272727B700000000010101044E4E
          4EBB373737C72B2B2BC60D0D0D5A000000000000000000000000000000000000
          0000000000000E0E0E67858585E0202020E51F1F1FBF00000000010101073735
          35C52D2D2DE51F1F1FDF0B0B0B59000000000000000000000000000000000000
          0000000000000504042D6A6A6AB9161616BA1010108C00000000000000001716
          168E1F1F1FBA131313B804040429000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000060000
          0004000000000000002C00000029000000240000001C0000002C000000290000
          00240000001C0000001500000000000000000000000000000000000000000000
          00200000002C0004094C063387C30841B5F2063DBCFF063EBEFF073EBDFF0840
          B1F0062C72B900000041000000390000002C0000002000000000000000000000
          000003183D4E0842B8F30748C8FF0850CFFF0851D0FF0952CFFF0851D0FF084F
          CFFF0745C4FF0841AFE5020F2630000000000000000000000000000000000422
          546A0846C2FE0851D0FF0951CCFF0D53CDFF306CD4FF477CD9FF2564D2FF0D53
          CCFF0951CCFF084ECDFF0845BFFA0314303D0000000000000000010A181E0947
          BFF90B55D2FF0B51CBFF0353D7FF044ECBFFABACACFFCCCDCDFFFFFFFFFFC3D5
          F3FF2D6AD3FF0A51CBFF0B53CFFF0845B6EC0002040500000000073686AA0D55
          D1FF3374DAFF60A0F0FF0555D9FF0857D9FF044ECBFFABACACFFCCCDCDFFFFFF
          FFFFEBF1FBFF2D6AD3FF0A52CCFF0D52CCFF062C6B8700000000094BBDF0135E
          D6FF0D54CFFF044ECBFF2E7EE5FF0B59DAFF0D5BDAFF044ECBFFABACACFFCCCD
          CDFFFFFFFFFFB0C7EFFF0D54CEFF135CD2FF0944A7D3000000000F58D0FF1660
          D7FF3B74D6FFFFFFFFFF044ECBFF3281E6FF105EDCFF1361DDFF044ECBFFABAC
          ACFFCCCDCDFFF6F9FDFF0E54CDFF1660D5FF0B50C1F100000000135FD4FF1864
          DBFF4C80DAFFFFFFFFFFFFFFFFFF044ECBFF3886E8FF1664DDFF1967DFFF044E
          CBFFABACACFFCCCDCDFF175ACFFF1963DAFF115ACCFB000000001460D6FF2471
          E2FF2867D3FFE0E0E0FFFFFFFFFFFFFFFFFF044ECBFF3E8AEBFF1C69E0FF206C
          E0FF044ECBFFABACACFF0E55CFFF2470E0FF0F58C4EF000000000C51B4DA2D7A
          E6FF105CD7FFB2BDD0FFE0E0E0FFFFFFFFFFFFFFFFFF044ECBFF4390ECFF226E
          E1FF2470E2FF044ECBFF105BD6FF2A76E1FF0A479DBF0000000007336F852774
          E2FF2273E9FF2868D5FFC0C4CAFFE0E0E0FFFFFFFFFFFFFFFFFF044ECBFF4994
          EDFF2671E2FF2873E3FF2573E8FF216FDDFF052248570000000001050B0D105F
          C9EE3985ECFF1A6BE5FF1B60D3FFA5ADB9FFAFB1B2FFB4B5B5FFB2B6BCFF044E
          CBFF73AFF5FF1B6BE5FF3581E8FF0C53AFD10000000000000000000000000317
          30391A6BD8F93F8CEEFF297AEDFF1563DFFF125DD8FF1059D3FF125DD8FF1563
          DFFF3E89EFFF3C89EBFF1664CAEC020C191E0000000000000000000000000000
          0000021021270F54ACCB3784EAFF4591F0FF559EF5FF529CF5FF559FF5FF4691
          F0FF3382E7FF0C4895B001081215000000000000000000000000000000000000
          00000000000000010303062A59690F4FA1BD2073D8F82779E1FF1F6ED0F00D4A
          98B30520424E0000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000007458
          1BEA685323FF685323FF685323FF685323FF685323FF685323FF685323FF6853
          23FF74581BEA000000000000000000000000000000000000000000000000715B
          27FFB09558FFB1975CFFB2995EFFB2995FFFB2995FFFB2995FFFB2995FFFB196
          5AFF715B27FF7A6536FF7A6536FF796536FF6D5621ED00000000000000007C63
          2BFFBFA058FFB0892EFFB08930FFB18A31FFB28B33FFB28C34FFB28C34FFC1A2
          5CFF7C632BFFC0A25DFFC0A25DFFBE9F59FF79602AFF0000000000000000866C
          30FFC8A75CFFBC953AFFBD963CFFBE973FFFBE9840FFBF9941FFBF9942FFCAAA
          61FF866C30FFB99034FFB99135FFC9AA62FF846A2FFF00000000000000009074
          35FFD0AE60FF9E7A29FF9E7B2BFF9D7B2CFF9E7C2EFF9E7D2FFF9E7D2FFFD2B1
          65FF907435FFCCAE6AFFCDAF6BFFD1B167FF8F7435FF00000000000000009A7C
          3AFFD8B463FFC29631FFC29734FFC39836FFC49938FFC49A39FFC49A39FFD9B7
          69FF9A7C3AFFA47F2AFFA47F2BFFDAB86CFF9B7D3BFF0000000000000000A685
          3FFFDFBA66FFDAB04FFFDBB152FFDBB254FFDCB356FFDCB357FFDCB357FFE1BE
          6DFFA6853FFFDAAE4AFFDAAF4CFFE1BF71FFA88840FF0000000000000000B08F
          44FFE6C06AFFB6903BFFB6913EFFB69240FFB69341FFB79342FFB79443FFE7C3
          71FFB08F44FFE3C37BFFE3C37BFFE9C676FFB39246FF0000000000000000B694
          48FFE9C46EFFD9AC47FFD9AD4AFFD9AF4DFFDAB04FFFDAB051FFDAB051FFEAC7
          75FFB69448FFB7923DFFB7923EFFEBC97BFFB8964AFF0000000000000000B896
          4AFFEAC571FFE8BF63FFE8C167FFE9C26AFFE9C36CFFE9C36DFFE9C46EFFEBC8
          79FFB8964AFFE7BF61FFE8BF63FFECCA7EFFBA984CFF0000000000000000BA98
          4CFFEAC674FFBA984BFFBA9A4FFFBB9A51FFBB9C54FFBB9C55FFBB9C56FFECCA
          7DFFBA984CFFE2C685FFE7CB89FFE4C479FFBC9A4FFF0000000000000000BB99
          4EFFEAC775FFDBB45AFFDCB65FFFDDB863FFDDB865FFDDBA68FFDEBA69FFECCB
          7FFFBB994EFFB89544FFBF9D51FFBF9D51FFAE8A3BE30000000000000000BD9B
          50FFE9C36CFFEED08BFFF0D597FFF0D69AFFF0D79DFFF1D89FFFEFD496FFEAC6
          74FFBD9B50FFDBAD45FFC19F53FF00000000000000000000000000000000BB98
          4AF7C5A660FFC6A964FFBB9D59FFBDA367FFBDA46AFFBCA061FFC6A865FFC6A7
          60FFC19D4CFFC19F53FFAF8D3DE3000000000000000000000000000000000000
          000000000000C19F53FFD8AB44FFDCB65FFFDDB863FFD9AE4CFFC19F53FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000BD9A4CF7C3A157FFC4A359FFC4A359FFC3A157FFBD9A4CF70000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000002020B100C0C4C70131376AF151581BF151580BF1414
          75AF0D0D4B7002020B1000000000000000000000000000000000000000000000
          0000000000000B0B4C701616A0EF0F0FACFF0F0FB6FF1212BFFF1818C6FF1D1D
          C7FF1E1EC0FF1C1CA3EF0D0D4A70000000000000000000000000000000000000
          000010106C9F1616ACFF0707B2FF1717C1FF5050D2FF5F5FD3FF6666D6FF6363
          DFFF3F3FE0FF2D2DE2FF2424BDFF1313699F0000000000000000000000000B0B
          4D703A3ABFFF1212B8FF2222BFFF4B4BC3FF2222719F09093650090936502323
          709F6767D8FF4040ECFF3B3BF2FF2424BDFF0D0D4A700000000002020B102424
          ABEF3030C2FF0909B4FF1C1C90CF050521300000000000000000000000000D0D
          51602A2ADEFF3131E6FF4B4BEDFF2E2EE3FF1C1CA2EF02020B10090942604949
          C6FF0C0CB5FF1414B0FF0505213000000000000000000000000009094D601F1F
          D2FF2424D8FF2A2ADEFF7070DCFF4242E1FF1E1EBDFF0B0B40600F0F6E9F6060
          CFFF1111B5FF10106C9F000000000000000000000000060649601515C8FF1A1A
          CDFF1F1FD2FF0D0D51602323709F6767E0FF1D1DC5FF12126B9F121284BF6E6E
          D5FF3737BFFF242460800000000000000000040447600E0EBFFF1111C3FF1515
          C8FF09094D600000000010104D707C7CDEFF1717C4FF151580BF121284BF7171
          D6FF4040C2FF2323608000000000020245600808B9FF0B0BBCFF0E0EBFFF0606
          4960000000000000000010104D706F6FD9FF1212BDFF151581BF0E0E6E9F6969
          D2FF4444C6FF13136E9F0B0B47602F2FC2FF2323C0FF1313BCFF040447600000
          000000000000000000002222719F5050D1FF1010B4FF11116B9F090943605C5C
          CEFF4E4EC9FF3232BEFF3838C4FF3939C4FF3232C3FF0B0B4760000000000000
          000000000000050521305E5EC9FF3535C9FF1D1DB0FF0A0A416001010B102525
          ACEF7070D5FF4444C7FF4040C6FF3838C4FF0B0B476000000000000000000000
          0000050521303737AFEF4747CAFF2727BCFF1818A1EF02020B10000000000A0A
          4E704747C5FF6A6AD3FF4444C7FF3737BFFF13136E9F0E0E4E700E0E4F701313
          6E9F2D2DB8FF3737C3FF3939C4FF1F1FB0FF0B0B4C7000000000000000000000
          00000E0E6E9F4747C5FF7878D9FF4F4FC9FF4444C6FF3D3DC1FF3B3BC0FF3E3E
          C4FF3D3DC5FF5F5FD2FF3B3BBFFF10106C9F0000000000000000000000000000
          0000000000000A0A4E702525ACEF6464D2FF7373D6FF7373D7FF7070D7FF6A6A
          D4FF6060CFFF2626ACEF0B0B4D70000000000000000000000000000000000000
          0000000000000000000001010B100A0A4E70101079AF121284BF121284BF1010
          79AF0B0B4D7002020B1000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          200000000000000400000000000000000000000000000000000004030206110E
          0A1B110F0A1C110F0A1C110F0A1C110F0A1C110F0A1C110F0A1C110F0A1C110F
          0A1C110F0A1C110F0A1C110F0A1C110F0A1C110E0A1B03030205836F4CD49E88
          5EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E88
          5EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF816F4BD19E885EFF9E88
          5EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E88
          5EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E88
          5EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E88
          5EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E88
          5EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E88
          5EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E88
          5EFF9E885EFF9E885EFF9E885EFF9E885EFF8B7A52E43B33235F3B33235F907C
          56E89E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF806E
          4DD269593EA9675A3EA8675A3EA8675A3EA852473185675A3EA866573CA45449
          3288675A3EA8675A3EA8675A3EA8695B3FAA836F4CD49E885EFF2D271B495F52
          399A806E4CCE816F4DD0816F4DD0816F4DD067593DA6675A3EA866573CA46959
          3EA9816F4DD0816F4DD0816F4DD0806E4CCE5E513897322B1D50786746C19E88
          5EFF9E885EFF9E885EFF9E885EFF9E885EFF937D56ED2722173F282318419580
          58F09E885EFF9E885EFF9E885EFF9E885EFF9E885EFF746445BB9E885EFF9E88
          5EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E88
          5EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9A845DFC9E885EFF9E88
          5EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E88
          5EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9A845DFC9E885EFF9E88
          5EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E88
          5EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9A845DFC6F5F42B39580
          5AF495805AF495805AF495805AF495805AF495805AF495805AF495805AF49580
          5AF495805AF495805AF495805AF495805AF495805AF46C5D41AF000000000000
          0000000000000000000000000000443A286D0706040C00000000000000000907
          050E4239276B0000000000000000000000000000000000000000000000000000
          00000000000000000000000000006A5B3EAB806E4DD27E6D4ACC7E6D4ACC8371
          4ED366573DA50000000000000000000000000000000000000000000000000000
          00000000000000000000000000000202010313110B1F14110C2014110C201311
          0B1F010101020000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000001134688E1D58
          B1F21D58B1F21D58B1F21D58B1F21D58B1F21D58B1F21134688E000000000000
          00000000000000000000000000000000000000000000000000002160B5F244A4
          FFFF0686FFFF0686FFFF0686FFFF0686FFFF44A4FFFF2160B5F2000000000000
          00000000000000000000000000000000000000000000000000002569BAF244AF
          FFFF0895FFFF0D97FFFF1098FFFF1199FFFF4CB2FFFF2569BAF26C6C6CFF0000
          00006C6C6CFF000000006C6C6CFF000000006C6C6CFF000000002A72C0F244BA
          FFFF17A9FFFF3CB7FFFF54C0FFFF58C1FFFF82D1FFFF2A72C0F2000000000000
          00000000000000000000000000000000000000000000000000002E7BC4F273D3
          FFFF60CDFFFF8CD2F7FDA8D9F5FDADDAF5FDB9DEF5FD2666A2C86C6C6CFF0000
          00000000000000000000000000000000000000000000000000003183C8F2D0F2
          FFFFCCF1FFFF569CD3F53787C9F23787C9F23787C9F215375465000000000000
          00000000000000000000000000000000000000000000000000001F50778E3488
          CBF23487CAF11E4F768D020407080204070802040708000000006C6C6CFF0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000006C6C6CFF0000
          00000000000000000000000000000000000000000000000000001134688E1D58
          B1F21D58B1F21D58B1F21D58B1F21D58B1F21D58B1F21134688E000000000000
          00000000000000000000000000000000000000000000000000002160B5F244A4
          FFFF0686FFFF0686FFFF0686FFFF0686FFFF44A4FFFF2160B5F26C6C6CFF0000
          00000000000000000000000000000000000000000000000000002569BAF244AF
          FFFF0794FFFF0A96FFFF0C97FFFF0D97FFFF49B1FFFF2569BAF2000000000000
          00006C6C6CFF000000006C6C6CFF000000006C6C6CFF000000002A72C0F244BA
          FFFF15A8FFFF34B4FFFF48BCFFFF4CBDFFFF78CDFFFF2A72C0F26C6C6CFF0000
          00000000000000000000000000000000000000000000000000002E7BC4F273D3
          FFFF5DCCFFFF8AD5FAFEA8DDF9FEAEDEF9FEBCE3F9FE296EAFD8000000000000
          00000000000000000000000000000000000000000000000000003183C8F2D0F2
          FFFFCCF1FFFF60A1D6F5438ECDF3448ECDF3448ECDF3183F61756C6C6CFF0000
          00000000000000000000000000000000000000000000000000001F50778E3488
          CBF23488CBF21F50778E050C1216050C1216050C121600000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000000019591C8035AA3AEF37A13CDF0C230E300000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000186B1A9F44BB4AFFA9EEB2FF90E299FF329537CF0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000001068119F38B53DFFA0E8A9FFA0EEACFFB5F5BFFF72D37AFF1F5C
          2280000000000000000000000000000000000000000000000000000000000000
          00000864099F46BB4BFFA0E6A9FF8EE59AFF84E691FF9DEFA9FFAFF3B9FF4ABE
          50FF0B220C300000000000000000000000000000000000000000000000000160
          019F3BB53FFF98E0A1FF84DD8FFF7ADE87FFA8ECB2FF99ECA5FFACF3B7FF97E6
          9FFF2D9332CF00000000000000000000000000000000000000000055008F34B1
          38FF90DB99FF79D685FF7FDA8BFF9FE6A8FF79D480FFA9EDB3FF91EB9EFFB2F3
          BCFF6CD074FF1C5B1E8000000000000000000000000000000000009700FF89D6
          92FF70CF7BFF75D380FF97E0A0FF42B947FF13A315FF82D889FF9DEAA8FF92EA
          9FFFA7EDB1FF43BB48FF0A220B30000000000000000000000000009600FF7ED0
          86FF85D58FFF86D68EFF2FAF32FF0461049F0428054025AB28FFA3E8ACFF87E4
          94FFA1EBACFF8CDF94FF2C9C30DF030B041000000000000000000054008F21A5
          24FF44B649FF11A013FF0056008F000000000000000009640A9F58C45EFF9CE5
          A6FF7ADE88FFA5EAAEFF62C969FF1B641E8F000000000000000000000000001C
          003000390060001D0030000000000000000000000000010A01100D960EEF89DA
          92FF87DE93FF80DD8CFF98E2A1FF3BB640FF0C2C0D4000000000000000000000
          0000000000000000000000000000000000000000000000000000033B04602FAF
          32FF97E0A0FF6BD478FF8CDD96FF7DD485FF26992ADF030B0310000000000000
          0000000000000000000000000000000000000000000000000000000000000676
          07BF67C96EFF89DA93FF5ACB68FF94DE9DFF57C25DFF18621A8F000000000000
          000000000000000000000000000000000000000000000000000000000000011D
          01300FA010FF85D58DFF66CC72FF66CC72FF87D790FF26AC2AFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000024D02803FB543FF88D591FF6FCD79FF89D691FF24AC2AFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000A0010028702DF4CBA52FF66C56DFF4CBA51FF137C15BF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000001300200160019F067606BF0964099F010A0110}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000002D261B486E5E41B13E3525645D4F37964F442F7F4C412D7A5F53
          399B3B33235F716042B62A241943000000000000000000000000000000000000
          0000000000002E281C4B403726683D3425623F3626663E3525643D3525643F36
          26663D342562403726682D271B49000000000000000000000000000000000000
          0000483E2B745B4E3693574B348C574B348C574B348C574B348C574B348C574B
          348C574B348C574B348C5C4F3794453C297000000000000000002B2519453028
          1C4C5A4E3692806E4DD29E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E88
          5EFF9E885EFF9E885EFF816F4DD05C4F37942D271B492A241943736245BA4138
          2769574B348C9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E88
          5EFF9E885EFF9E885EFF9E885EFF574B348C40372668716042B63C3424613E35
          2565574B348C9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E88
          5EFF9E885EFF9E885EFF9E885EFF574B348C3D3425623B33235F62543A9E4037
          2668574B348C9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E88
          5EFF9E885EFF9E885EFF9E885EFF574B348C3F3626665F53399B4D432E7D3F36
          2566574B348C8F7A56E94239276A4D432E7D96815BF6453C29707D6A49C98674
          50D9453C297040372668937D56ED574B348C3D3525644C412D7A514530823F36
          2566574B348C907C56E8443A286D54473287978459F72722173F3D3524636C5D
          3FAE6C5E41B063553BA0907C56E8574B348C3E3525644F442F7F5F5238993F37
          2567574B348C9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E88
          5EFF9E885EFF9E885EFF9E885EFF574B348C3F3626665D4F37963F3626663E35
          2565574B348C9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E88
          5EFF9E885EFF9E885EFF9E885EFF574B348C3D3425623E3525646F6143B54138
          2769574B348C9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E88
          5EFF9E885EFF9E885EFF9E885EFF574B348C403726686E5E41B12E271B4A3129
          1C4E5A4D359184724FD59E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E88
          5EFF9E885EFF9E885EFF806E4DD25B4E36932E281C4B2D261B48000000000000
          00004A3F2C775A4D3591574B348C574B348C574B348C574B348C574B348C574B
          348C574B348C574B348C5A4E3692483E2B740000000000000000000000000000
          000000000000312A1D4F413827693E3525653F3725673F3625663F3625664037
          26683E3525654138276930281C4C000000000000000000000000000000000000
          0000000000002E281C4B716042B63F3626665F523899514530824D432E7D6254
          3A9E3C342461736245BA2B251945000000000000000000000000}
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
          0000091A33502059AAFF174079FF000000570000004D00000021000000000000
          000000000000000000000000000000000000000000000000000000000000040B
          15221D529DEF235FB1FF163C72FF000000430000003E0000003A000000260000
          0008000000000000000000000000000000000000000000000000000000001744
          84D3215EB1FF2964B4FF15396DFF0000002E00000029000000230000001E0000
          00180000000500000000000000000000000000000000000000002360B3FF1E54
          A0FF2564B7FF326EBCFF14386AFF000000380000002E00000024000000180000
          00092360B3FF00000000000000000000000000000000000000002564B7FF2159
          A6FF296ABDFF3B77C2FF133565FF000000380000002E00000024000000180000
          00090E8544FF007300FF00000000000000000000000000000000647388FF245E
          AAFF2C6FC2FF406EA7FF394A62FF000000380000002E0000002400000018005F
          00A4009900FF007300FF000000000000000000000000000000002A6ABEFF2763
          AFFF2F74C8FF5A7696FF4E5F77FF000000380000002E000000240039006F0099
          00FF6BC970FF007300FF007300FF007300FF007300FF007300FF2C6DC1FF2966
          B4FF3279CDFF5491D5FF143667FF000000380000002E00390077009900FF57C0
          5BFF4ABC4FFF58C35EFF5FC666FF66CA6EFF75D07DFF007300FF2D70C3FF2B6A
          B7FF347DD0FF5C99DBFF143667FF000000380000002E009900FF7ECE80FF42B8
          46FF36B43BFF3EB844FF46BC4CFF50C157FF66CA6EFF007300FF2F72C6FF2D6C
          BAFF3780D3FF64A0E0FF143667FF000000380000002E00390077009900FF80CF
          82FF71CA74FF6CC870FF77CD7CFF7ED082FF68C96EFF007300FF3074C8FF2E6E
          BCFF3882D6FF61A0E1FF143667FF000000380000002E000000240039006F0099
          00FF84D086FF009900FF009900FF009900FF009900FF009900FF66768BFF2F70
          BEFF3F88D9FF89BFEEFF234970BF000000380000002E0000002400000018005F
          00A4009900FF009900FF000000000000000000000000000000003176CAFF3374
          C0FF77B2E8FF557692BF00010146000000380000002E00000024000000180000
          0009128C4CFF009900FF000000000000000000000000000000003277CBFF4C8C
          CFFF3C71A7DE0001014600010146000000380000002E00000024000000180000
          00093277CBFF00000000000000000000000000000000000000003277CBFF3277
          CBFF3277CBFF3277CBFF3277CBFF3277CBFF3277CBFF3277CBFF3277CBFF3277
          CBFF3277CBFF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000121205651717
          0687171706871717068717170687171706871717068717170687171706871717
          06871717068717170687171706871717068712120565000000001D1D0C81F9F9
          E9FFF3F3E2FFF3F3E2FFF3F3E2FFF3F3E2FFF3F3E2FFF3F3E2FFF3F3E2FFF3F3
          E2FFF3F3E2FFF3F3E2FFF3F3E2FFF9F9E9FF1D1D0C81000000002525147AF4F4
          E4FFFFCC44FFFECB43FFECD286FFD9D9C8FFE0E0D0FF0A8107FF0A8107FF0A81
          07FFDCDCCCFFCECEBDFFCDCDBCFFF4F4E4FF2525147A0000000028281677F5F5
          E6FFFFCC44FFFFEE88FFECD286FFF5F5EEFFF5F5EEFF1D9416FF27DE16FF1D94
          16FFF5F5EEFFF5F5EEFFCDCDBCFFF5F5E6FF282816770000000029291875F6F6
          E9FFFFCC44FFFECB43FFECD286FFD9D9C8FFE2E2D3FF269D1CFF31E020FF269D
          1CFFDEDECFFFCECEBDFFCDCDBCFFF6F6E9FF29291875000000002A2A1973F7F7
          EBFFFFCC44FFFFEE88FFECD286FFF7F7F1FFF7F7F1FF2BA220FF3CE32BFF2BA2
          20FFF7F7F1FFF7F7F1FFCDCDBCFFF7F7EBFF2A2A1973000000002C2C1B72F8F8
          EEFFFFCC44FFFECB43FFECD286FFD9D9C8FFE4E4D7FF30A724FF4AE539FF30A7
          24FFE0E0D3FFCECEBDFFCDCDBCFFF8F8EEFF2C2C1B72000000002D2D1C70F9F9
          F1FFFFCC44FFFFEE88FFECD286FFF9F9F5FFF9F9F5FF35AC28FF57E846FF35AC
          28FFF9F9F5FFF9F9F5FFCDCDBCFFF9F9F1FF2D2D1C70000000002E2E1D6EFBFB
          F4FFFFCC44FFFECB43FFECD286FFD9D9C8FFE7E7DBFF39B02BFF63EA52FF39B0
          2BFFE3E3D7FFCECEBDFFCDCDBCFFFBFBF4FF2E2E1D6E000000002F2F1E6DFCFC
          F7FFFFCC44FFFFEE88FFECD286FFFCFCFAFFFCFCFAFF3DB42EFF6EED5DFF3DB4
          2EFFFCFCFAFFFCFCFAFFCDCDBCFFFCFCF7FF2F2F1E6D0000000030301F6BFDFD
          F9FFFFCC44FFFECB43FFF5CE64FFEAD184FFF1E4BDFF41B831FF76EE65FF41B8
          31FFEDE0B9FFDFC679FFDEC578FFFDFDF9FF30301F6B000000003131206AFEFE
          FCFFFFCC44FFFFEE88FFFDCA42FFFCEB85FFFBF3BFFF44BB33FF44BB33FF44BB
          33FFF6EEBAFFEFDE78FFEFBC34FFFEFEFCFF3131206A0000000032322168FFFF
          FEFFFFCC44FFFECB43FFFDCA42FFFBC840FFFAD05FFFFBE7B0FFFDF5E0FFFAE5
          AEFFF4CA5AFFF0BD35FFEFBC34FFFFFFFEFF323221680000000032322267FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBE9C8FF2BA220FFCBE9
          C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF323222670000000026261A4D3333
          2266333322663333226633332266333322660F120C1A40B730FF38A12AE040B7
          30FF0F120C1A33332266333322663333226626261A4D00000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          20000000000000040000000000000000000000000000000000003C3C3C8E6666
          66F2666666F23C3C3C8E00000000000000000000000000000000000000000000
          00000000000002020203CCCCF5FF12189CFF12189CFFCCCCF5FF686868F2EDED
          EDFFEDEDEDFF686868F23D3D3D8E000000000000000000000000000000000000
          000002020203CCCCF5FF12189CFF2A4BE3FF3333B5FF5454EDFF6B6B6BF2EFEF
          EFFF737373FFF1F1F1FF6B6B6BF23F3F3F8E0000000000000000000000000202
          0203CCCCF5FF12189CFF2A4BE3FF3333B5FF6D9EEFFF5454EDFF4141418E6F6F
          6FF2F4F4F4FFFDFDFDFFF2F2F2FF6F6F6FF24141418E0000000006060609CCCC
          F5FF12189CFF2A4BE3FF3333B5FF6D9EEFFF5454EDFFCCCCF5FF000000004343
          438E737373F2F4F4F4FFFDFDFDFFF3F3F3FF737373F246464691CCCCF5FF1218
          9CFF2A4BE3FF3333B5FF6D9EEFFF5454EDFFCCCCF5FF00000000000000000000
          00004646468E777777F2F5F5F5FFFEFEFEFFF2F2F2FFCCCCF5FF12189CFF2A4B
          E3FF3333B5FF6D9EEFFF5454EDFFCCCCF5FF0000000000000000000000000000
          0000000000004848488E7A7A7AF2F6F6F6FFFEFEFEFF12189CFF2A4BE3FF3333
          B5FF6D9EEFFF5454EDFFCCCCF5FF000000000000000000000000000000000000
          000000000000000000004B4B4B8E7F7F7FF2DBDBDBFF3C3CBEFF3333B5FF6D9E
          EFFF5454EDFFCCCCF5FF00000000000000000000000000000000000000000000
          0000000000000000000000000000878787C7737373FFBCBCBCFF3C3CBEFF5454
          EDFFCCCCF5FF838383F2838383F24D4D4D8E0000000000000000000000000000
          0000000000000000000060606080737373FFBCBCBCFF737373FFDCDCDCFFFDFD
          FDFFF7F7F7FFF7F7F7FFF7F7F7FF878787F24F4F4F8E00000000000000000000
          00000000000060606080737373FFBCBCBCFF737373FF898989C78B8B8BF2F8F8
          F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FF8B8B8BF25151518E000000000000
          000060606080737373FFBCBCBCFF737373FF60606080000000008E8E8EF2F9F9
          F9FFF9F9F9FFF9F9F9FF8E8E8EF28E8E8EF2F9F9F9FF8E8E8EF2000000006060
          6080737373FFBCBCBCFF737373FF606060800000000000000000929292F2FAFA
          FAFFFAFAFAFF929292F25656568E5656568E929292F25656568E979797FF9999
          99FFBCBCBCFF737373FF606060800000000000000000000000005757578E9595
          95F2FBFBFBFF959595F25757578E000000000000000000000000A6A6A6FFFFFF
          FFFFAEAEAEFF6060608000000000000000000000000000000000000000005959
          598E989898F2FCFCFCFF989898F2000000000000000000000000B9B9B9FFB3B3
          B3FFC8C8C8FF0000000000000000000000000000000000000000000000000000
          00005A5A5A8E9A9A9AF25A5A5A8E000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000171717243A3A
          3A5B4A4A4A73535353815B5B5B8D5B5B5B8E6364639B6465649D6465649D6364
          639B5B5B5B8E5B5B5B8D535353814A4A4A733A3A3A5B171717240909090F1C1C
          1C2C2727273E3030304C343434523B3C3B5E3A3D3B5F4F64579A47554D843B3D
          3C5F3B3C3B5E343434523030304C2727273E1C1C1C2C0909090F000000000000
          0000000000000000000000000001000000020B1C113135AE62FC309856DD0101
          0103000000010000000100000000000000000000000000000000000000000000
          00000000000000000000030B071619593381299051CF32B065FE31AD62F92480
          49B9154C2B6F0104020900000000000000000000000000000000000000000000
          000000000000061A0F2A29A561E62EB76BFD2EB76CFE2EB76CFE2EB76CFE2EB7
          6BFD2DB66BFC249155CA0105030B000000000000000000000000000000000000
          0000000000011B7B4BA82ABD72FD27B26CEF15603A812ABD72FD27AF6AEA114F
          2F692ABE72FD2ABD72FD114E2F6B000000000000000000000000000000000000
          00000000000118774A9E25C078FA0E482D5F082A1A3D26C379FD23B570EA0621
          152B27C37AFD27C47AFD1A754A98000000010000000000000000000000000000
          0000000000000002010403100A1E0001010207281A3D22C980FD22C57DF71FB5
          73E223CB81FE29CA82FD195D3E74000000000000000000000000000000000000
          0000000000000000000103120C1C12764D911CBC79E720CE85FE20CF86FE20CF
          86FE36D38FFD2E9767B301050309000000000000000000000000000000000000
          000000000000031A112619BE7DE71ED18AFD21D48CFE1ED38BFE25D08BF82E8C
          62A10E3A28470000000100000000000000000000000000000000000000000000
          0000000000010F7951921BD58EFD20D690FD259D6CB61BD78FFE19C484E90003
          0204063020430421163200000000000000000000000000000000000000000000
          000000000001168259991AD791FD18CB89ED073927431AD792FD18C786EA0C62
          41731AD690FC1DD08CF50106040C000000000000000000000000000000000000
          000000000000062F203C33D997F91AD993FD17BE80DE1ADA93FE1AD791FC1AD9
          93FD1DD894FD2BB37CCE00010102000000000000000000000000000000000000
          000000000000000000010C46305335C28ADE3ADE9DFD1ED993FE22DB95FE39D9
          98F72A9268A603120C1900000000000000000000000000000000000000000000
          0000000000000000000000000000000101030B432E571CD892FD1BC988EB0209
          070E000000010000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000020E0A192DBA82D51F9164A70000
          0001000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000C130F0D96DA0000263E000000000000000000000000000000000000
          0000000000000100263F0E0D94D700000A100000000000000000000000000000
          0C131512ABEB2821D2FF1F1AC3FB0000263E0000000000000000000000000000
          00000100263F201AC4FC2821D2FF1510A8E800000A100000000000000B121411
          ADEA2720D6FF2720D6FF2720D6FF1F19C6FB0000263E00000000000000000000
          263F1F19C7FC2720D6FF2720D6FF2720D6FF130FAAE800000A100F0B9DDB261F
          DAFF261FDAFF261FDAFF261FDAFF261FDAFF1E19CAFB0000263E0000273F1E19
          CBFC261FDAFF261FDAFF261FDAFF261FDAFF261FDAFF0D0C99D701012A441F18
          CEFC261EDDFF261EDDFF261EDDFF261EDDFF261EDDFF1E18CDFC1E18CDFC261E
          DDFF261EDDFF261EDDFF261EDDFF261EDDFF1E18CDFC0000273F000000000101
          2A451E18D2FC251DE1FF251DE1FF251DE1FF251DE1FF251DE1FF251DE1FF251D
          E1FF251DE1FF251DE1FF251DE1FF1D17D0FC0000273F00000000000000000000
          000001012B461D18D3FC241DE5FF241DE5FF241DE5FF241DE5FF241DE5FF241D
          E5FF241DE5FF241DE5FF1D17D2FC0000273F0000000000000000000000000000
          00000000000001012D471D17D6FC241CE9FF241CE9FF241CE9FF241CE9FF241C
          E9FF241CE9FF1D16D4FC0000273F000000000000000000000000000000000000
          00000000000002022941231FD6FC2722EBFF2722EBFF2722EBFF2722EBFF2722
          EBFF2722EBFF1F1BD6FC0000273F000000000000000000000000000000000000
          0000030329413434D9FC4343EEFF3E3EEDFF3636EDFF3030ECFF2F2FECFF2F2F
          ECFF2F2FECFF2F2FECFF2323D8FB0101253D0000000000000000000000000303
          2941393CDAFC4A4EEFFF4A4EEFFF4A4EEFFF4A4EEFFF494DEFFF4348EEFF3F43
          EEFF3C40EDFF393EEDFF383DEDFF2A2ED8FB0202263E00000000030329413E46
          DAFC515AF0FF515AF0FF515AF0FF515AF0FF515AF0FF3E46DAFC4047DCFC515A
          F0FF515AF0FF515AF0FF515AF0FF515AF0FF4048DBFB0202263D252CABDE5766
          F1FF5766F1FF5766F1FF5766F1FF5766F1FF4450DBFC0303294103042F484551
          DDFC5766F1FF5766F1FF5766F1FF5766F1FF5766F1FF242BA7DA00000C133743
          C0ED5E70F1FF5E70F1FF5E70F1FF495ADBFC0303294100000000000000000404
          2E474B5CDDFC5E70F1FF5E70F1FF5E70F1FF3540BFEB00000B12000000000000
          0C133B48C1ED657CF1FF4F64DCFC030429410000000000000000000000000000
          000004042C455065DDFC657CF1FF3747BFEB00000B1200000000000000000000
          000000000C132D39ABDE03042941000000000000000000000000000000000000
          00000000000004042C452F3BABDD00000B120000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000180000
          001C0000001B05163C64113FB5FF05153D6300000016000000100000000F0000
          001705153D65113FB5FF05163C640000001B0000001A00000016000000000000
          000005163C521140B6FF035AE8FF1141B7FF05163C5200000000000000000516
          3C521141B7FF035AE8FF1140B7FF05163C520000000000000000000000000516
          3C521042B9FF035AE8FF0048CFFF035AE8FF1142B9FF05163C5205163C521041
          B9FF035AE8FF0048CFFF035AE8FF035AE8FF05163C520000000005163C521044
          BCFF035AE8FF0048CFFF0450D4FF0048CFFF035AE8FF1044BBFF1043BCFF035A
          E8FF0048CFFF044FD5FF0048CFFF044FD4FF1043BCFF05163C521046BFFF035A
          E8FF0048CFFF0653D7FF0653D7FF0652D7FF0048CFFF035AE8FF035AE8FF0048
          CFFF0652D7FF0653D7FF0652D7FF0048CFFF035AE8FF0F46BFFF05163C520E48
          C2FF0856DAFF0856D9FF0856D9FF0856D9FF0856D9FF0856DAFF0856DAFF0856
          D9FF0856D9FF0856DAFF0956D9FF0856D9FF0F48C2FF05163C52000000000516
          3C520E4BC6FF0B59DCFF0B5ADCFF0B5ADCFF0A59DCFF0A5ADCFF0A59DCFF0A59
          DCFF0A59DCFF0A59DCFF0A5ADCFF0E4BC5FF05163C5200000000000000000000
          000005163C520E4DC9FF0D5DDFFF0D5DDFFF0C5DDFFF0C5DDFFF0C5DDFFF0D5D
          DFFF0C5DDFFF0D5DDFFF0D4DCAFF05163C520000000000000000000000000000
          0000031D47520C4FCDFF0F60E1FF0E60E2FF0F61E2FF0F60E2FF0F61E2FF0F61
          E2FF0F61E2FF0F61E2FF0D4FCDFF031D4752000000000000000000000000031D
          47520C52D0FF1164E4FF1164E5FF1164E5FF1164E5FF1164E5FF1164E5FF1164
          E4FF1164E4FF1164E4FF1164E5FF0D52D0FF031D475200000000031D47520C54
          D4FF1368E7FF1368E7FF1367E7FF1367E8FF1368E7FF1367E7FF1368E8FF1367
          E7FF1368E8FF1367E7FF1368E7FF1367E7FF0B54D4FF031D47520B56D7FF3A88
          F0FF156AEAFF156BEAFF156AEAFF156AEAFF156BEAFF94C3FBFF94C3FBFF156A
          EAFF156AE9FF156AEAFF156BEAFF156AEAFF4590F2FF0B56D7FF031D47520B58
          DAFF539CF5FF166DECFF176EECFF176DECFF64A9F7FF0B58DAFF0B58D9FF64A9
          F7FF176DECFF176DECFF166DECFF539CF5FF0B58DAFF031D475200000000031D
          47520A5ADDFF539CF5FF1870EEFF64A9F7FF0A59DCFF031D4752031D47520A5A
          DCFF64A9F7FF186FEDFF539CF5FF0A5ADCFF031D475200000000000000000000
          0000031D47520A5BDEFF94C3FBFF0A5BDEFF031D47520000000000000000031D
          47520A5BDEFF94C3FBFF0A5BDEFF031D47520000000000000000000000000000
          000000000000031D47520A5BDEFF031D47520000000000000000000000000000
          0000031D47520A5BDEFF031D4752000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000584C348E917D
          54EA978459F7766646BF1D19112E0D0B08156A5B3EAB967F57F2938159F16959
          3EA90B0A07121E1A1230776748C2978459F78F7A56E9574B348C806E4CCE9E88
          5EFF9E885EFF9E885EFF2621163D0807050D9A845DFC9E885EFF9E885EFF9C86
          5DFB0605040A292318429E885EFF9E885EFF9E885EFF7C6C4ACA221D14376657
          3CA48B7753E03D3524630303020500000000322B1D50796947C4786746C1302A
          1D4E00000000040302063F3625658D7754E363553BA0211C1435000000007160
          42B69B855EFE16130D24000000000000000001010102927B57EB8D7953E70101
          0001000000000000000019160F299E885EFF6C5E41B00000000000000000574B
          348D8F7A56E90908060F0000000000000000000000007B6A49C6766646BF0000
          000000000000000000000C0A0713927B57EB5447328700000000000000000000
          0000241F153A1E1A1231000000000000000000000000241F153A231E15380000
          000000000000000000001F1B1232231E15390000000000000000000000000000
          00002E271B4A322B1D500000000000000000000000002E281C4B2D271B490000
          00000000000000000000332C1E522D261B480000000000000000000000000000
          000000000000322B1E512D261B482D261B482D261B483C3424613B33235F2D26
          1B482D261B482D261B48322B1D50000000000000000000000000000000000000
          000000000000000000000000000004030206322B1D504D432F7D4D422E7C312A
          1D4F030302050000000000000000000000000000000000000000000000000000
          000000000000000000001D19112E8B7753E09E885EFF97825AF397825AF39E88
          5EFF887750DF1B17102B00000000000000000000000000000000000000000000
          000000000000000000000F0D09199E885EFF9E885EFF4D432E7D4C422D7B9E88
          5EFF9E885EFF0D0B081500000000000000000000000000000000000000000000
          000000000000000000000000000084724FD5927F56EF1A16102B18140E269381
          59F1816F4BD10000000000000000000000000000000000000000000000000000
          00000000000000000000000000000101010219150E275F53399B5E5138971814
          0E26010101020000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003830215A9E885EFF9E885EFF352D
          1F55000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000473D2A739E885EFF9E885EFF443B
          296E000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000014120C218D7754E38A7952E21310
          0B1E000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000103F78931C6E
          D1FF1C6ED1FF1C6ED1FF1C6ED1FF1C6ED1FF1C6ED1FF1C6ED1FF1C6ED1FF1C6E
          D1FF1C6ED1FF1C6ED1FF1C6ED1FF1C6ED1FF0C305B6F00000000797F7CFFA9AB
          A9FF94DBFDFF6CB9EFFF6CB9EFFF6CB9EFFF6CB9EFFF6CB9EFFF6CB9EFFF6CB9
          EFFF6CB9EFFF6CB9EFFF6CB9EFFF97DBFDFF11427E9A0A264959797F7CFFBFC0
          C0FF1C6ED1FF94DBFDFF6FBEF6FF6FBEF6FF6FBEF6FF6FBEF6FF6FBEF6FF6FBE
          F6FF6FBEF6FF6FBEF6FF6FC3FDFF6FC3FDFF97DBFDFF1C6ED1FF797F7CFFE2E3
          E3FF1658A8D577B1CDF76FC3FDFF6FC3FDFF6FC3FDFF6FC3FDFF6FC3FDFF6FC3
          FDFF6FC3FDFF6FC3FDFF6FC3FDFF6FC3FDFFA3DFFDFF1C6ED1FF797F7CFFCECE
          CEFF7FA0C8FF1658A8D494DBFDFF6FC3FDFF6FC3FDFF6FC3FDFF6FC3FDFF6FC3
          FDFF6FC3FDFF6FC3FDFF6FC3FDFF6FC3FDFFA3DFFDFF1C6ED1FF797F7CFFE2E3
          E3FF9EB8D9FF1A68C7F494DBFDFF6FC3FDFF6FC3FDFF6FC3FDFF6FC3FDFF6FC3
          FDFF6FC3FDFF6FC3FDFF6FC3FDFF6FC3FDFFB0E4FEFF1C6ED1FF797F7CFFCECE
          CEFFCBCCCCFF1C6ED1FF94DBFDFF6FC3FDFF6FC3FDFF6FC3FDFF6FC3FDFF6FC3
          FDFF6FC3FDFF6FC3FDFF6FC3FDFF6FC3FDFFB0E4FEFF1C6ED1FF7C827FFFE2E3
          E3FFE9E9E9FF1C6ED1FF94DBFDFF94DBFDFF94DBFDFF94DBFDFF94DBFDFF94DB
          FDFF94DBFDFF94DBFDFF94DBFDFF94DBFDFFB8E8FFFF1C6ED1FF808482FFCECE
          CEFFD6D7D7FF387DD2FF1C6ED1FF1C6ED1FF1C6ED1FF1C6ED1FF1C6ED1FF1C6E
          D1FF1C6ED1FF1C6ED1FF1C6ED1FF1C6ED1FF1C6ED1FF1C6ED1FF808482FFE2E3
          E3FFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFB
          FBFFFBFBFBFFFBFBFBFFFBFBFBFF7D8080FF0000000000000000838785FFCECE
          CEFFE2E3E3FFE2E3E3FFE2E3E3FFE2E3E3FFE2E3E3FFE2E3E3FFE2E3E3FFE2E3
          E3FFE2E3E3FFE2E3E3FFE2E3E3FF7D8080FF0000000000000000888C8AFFE2E3
          E3FFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFB
          FBFFFBFBFBFFFBFBFBFFFBFBFBFF7D8080FF00000000000000008A8E8CFFCECE
          CEFFE2E3E3FFE2E3E3FFE2E3E3FFE2E3E3FFE2E3E3FFE2E3E3FFE2E3E3FF7D80
          80FF7D8080FF7D8080FF7D8080FF2F31308F00000000000000008C908EFFE2E3
          E3FFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFF7D8080FF1D1E
          1E59000000000000000000000000000000000000000000000000292B2A7F7D80
          80FF7D8080FF7D8080FF7D8080FF7D8080FF7D8080FF7D8080FF262827670000
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
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          20000000000000040000000000000000000000000000000000000A0A0A2C6565
          65CA1A1A1A5B00000000000000160000003F00000070000000A7000000B50000
          00850000005400000020000000010000000000000000000000003E3E3E893D3D
          3D669E9E9EF41414144B0A030212542A1586864E25C4A6652DEEA96730EF925F
          36CC664025930C060514000000000000000000000000000000001B1B1B299696
          96EE474848FF7A7A7AFC8A5A3AF2BF814BFFBE804DFFC28A5DFFB97644FFB46E
          34FFB97336FFA86834EC371D1055000000000000000000000000000000001D1D
          1D2A858585FE323433FF7F7D7BFF905A3DFFB97D5BFFB4724DFFB67652FFAE6A
          43FFA3572EFFA85E35FFA95D2DFF3E1E10640000000000000000000000000F04
          031D98593FF3929291FF3D3F3EFF807D7AFF955A2FFFB16B37FFB57342FFB97A
          50FFBC825CFFAD6741FF9F512BFF964B28F11007041D00000000000000005F26
          1BAA984428FFA46039FF9C9B99FF4A4B4AFF797470FFA16834FFB8763CFFB571
          3AFFB26D39FFB97C55FFB3734FFF9D4D29FF632B18A800000000000000008032
          22E69D4D29FFAF693AFFBA7F4FFFA3A19CFF595A5AFF716A63FF8B5E2FFFAD72
          39FFB6733AFFB67445FFB06B42FFAA6443FF883E23E6000000000C0302198F3A
          26FFA1532CFFBB7D4DFFBF8040FFC48D49FFA9A59DFF8D8E8DFF71716FFF6E6A
          66FF5A4A3BFFB47748FFAD6739FFA45831FFA05537FF0E05031917050430903B
          29FFA3562EFFBF834FFFC78C45FFD09A4BFFD19E4FFFB4B3B0FF686B69FFA0A0
          A0FFA6A7A6FF715A48FFAD6534FFA85F39FF9F5336FF1D0D0832030100068730
          23F9AE6B4AFFC28750FFCE974AFFD9A751FFDCAB53FF9E9582FFD2D3D2FFE1E1
          E1FFAC9880FFA18C7AFFAC6434FFBA8164FFA25C44FA0907070C000000007C3B
          36D4C18E7CFFC89567FFD7A75DFFE2B557FFE4B858FFC3A569FFDBDCDCFFD2D0
          CEFF755633FFB57139FFA96032FFA05331FF8A5140D403030303000000004320
          1E72BA857DFFC7987AFFDCB47FFFECC972FFEAC15CFFE0B256FFBDB9B1FFD6D7
          D7FFC3B8ACFFAF6936FFA3562EFF984729FF3E1C156A00000000000000000000
          00008F605DCEBE8C81FFCB9C7AFFE0BC83FFE3BE73FFD9AB60FFCF9D5DFFC49B
          73FFB7794BFFAC643EFFA05436FF6B2E20B90000000000000000000000000000
          00000F06061CA17470DEBC8982FFC39079FFC5926AFFBD7F4AFFBA7C4DFFAF6A
          40FFA15430FF943F24FF6B2416C80C0302190000000000000000000000000000
          0000030303030F0E0D106E4C499CB68581FAB98680FFAE7163FF913C27FF8B32
          1EFF812719F73B0D097901000003000000000000000000000000000000000000
          00000000000000000000050505050907070C2E1D1B46502F2D7D4B2926791B08
          0635030100060000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          200000000000000400000000000000000000000000000000000000000000BF83
          10FFBC8D2DFFBC8D2DFFBC8D2DFFBC8D2DFFBC8D2DFF00000000000000000000
          0000000000000000000000000000000000000000000000000000D19929FFD6E5
          E8FFD2E2E5FFD1E1E4FFD0DFE2FFCEDDE0FFCBDADDFFBF8310FF000000000000
          0000000000000000000000000000000000000000000000000000D19929FFD6E5
          E8FFD6E5E8FFD4E3E6FFD2E1E4FFD0E0E3FFCEDDE0FFBF8310FF000000000000
          0000000000000000000000000000000000000000000000000000D19929FFD7A1
          2FFFD7A12FFFD2E1E4FFD2E1E4FFBF8310FFBF8310FFBF8310FF000000000000
          0000000000000000000000000000000000000000000000000000D19929FF8566
          33FFA47321FFA47321FFA47321FFA47321FF856633FF856633FF000000000000
          0000000000000000000000000000000000000000000000000000E0A947FF8566
          33FF9F7021FFA47321FFA47321FF856633FFCEDDE0FFCEDDE0FFCEDDE0FFCEDD
          E0FFCEDDE0FFCEDDE0FFCEDDE0FFCEDDE0FFCEDDE0FF00000000E0A947FF8566
          33FF9C6E21FFA47321FF856633FFD3E1E4FFCEDDE0FFDBE8EBFFDBE8EBFFDBE8
          EBFFDBE8EBFFDBE8EBFFDBE8EBFFDBE8EBFFDBE8EBFFCEDDE0FFE5B158FF8566
          33FF986C25FFD3E1E4FFD3E1E4FFD0DFE2FFAA7729FFBA8129FFBD8429FF966B
          29FFF2A20BFFF2A20BFFF2A20BFFB37E29FFDBE8EBFFCEDDE0FFE5B158FF8566
          33FF916B2BFF8F692AFFD2E2E5FFD1E1E4FFAA7729FFAF7B29FFBD8429FF9067
          28FFC98A1BFFF2A20BFFC98A1BFFA97729FFDBE8EBFFCEDDE0FFEDBF74FF8566
          33FF8B682FFF8F692AFF8F692AFFD2E2E5FFAA7729FFF2A20BFFAE7C2CFF8E65
          28FF966B27FF966B27FFA47329FF9F7128FFDBE8EBFFCEDDE0FFF0C580FF8566
          33FF856633FF88662DFF88662DFFD5E4E7FFC5CAC2FFAB7A2CFFAB7A2CFF8E65
          28FFF2A20BFF966B27FFF2A20BFF9F7128FFDBE8EBFFCEDDE0FF00000000F0C5
          80FFE0B160FFE0A947FFE0A947FFD7E5E8FFD4E3E6FFD2E2E5FFD4E3E6FF8E65
          28FF966B29FF946A28FF966B27FF966B27FFDBE8EBFFCEDDE0FF000000000000
          0000000000000000000000000000D9E7E9FFD6E5E8FFD4E3E6FFD4E3E6FF8E65
          28FFF2A20BFF996D28FFF2A20BFF966B27FFDBE8EBFFCEDDE0FF000000000000
          0000000000000000000000000000DAE8EBFFD8E6E9FFD4E3E6FFD4E3E6FF8F66
          28FF916828FF916828FF946A28FF9A6D21FFDBE8EBFFCEDDE0FF000000000000
          0000000000000000000000000000DCE9ECFFD9E7EAFFD7E5E8FFD4E3E6FFB3A6
          87FF916828FF916828FF916828FFB3A687FFC7D5D8FFCEDDE0FF000000000000
          000000000000000000000000000000000000DBE8EBFFD8E6E9FFD5E4E7FFD2E2
          E5FFD0E0E3FFCFDEE1FFCDDCDFFFCAD9DBFFC7D5D8FF00000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000091A33502059AAFF174079FF000000570000004D00000021000000000000
          000000000000000000000000000000000000000000000000000000000000040B
          15221D529DEF235FB1FF163C72FF000000430000003E0000003A000000260000
          0008000000000000000000000000000000000000000000000000000000001744
          84D3215EB1FF2964B4FF15396DFF0000002E00000029000000230000001E0000
          00180000000500000000000000000000000000000000000000002360B3FF1E54
          A0FF2564B7FF326EBCFF14386AFF000000380000002E00000024000000180000
          00092360B3FF00000000000000000000000000000000000000002564B7FF2159
          A6FF296ABDFF3B77C2FF133565FF000000380000002E00000024000000180000
          00090E8544FF007300FF00000000000000000000000000000000647388FF245E
          AAFF2C6FC2FF406EA7FF394A62FF000000380000002E0000002400000018005F
          00A4009900FF007300FF000000000000000000000000000000002A6ABEFF2763
          AFFF2F74C8FF5A7696FF4E5F77FF000000380000002E000000240039006F0099
          00FF6BC970FF007300FF007300FF007300FF007300FF007300FF2C6DC1FF2966
          B4FF3279CDFF5491D5FF143667FF000000380000002E00390077009900FF57C0
          5BFF4ABC4FFF58C35EFF5FC666FF66CA6EFF75D07DFF007300FF2D70C3FF2B6A
          B7FF347DD0FF5C99DBFF143667FF000000380000002E009900FF7ECE80FF42B8
          46FF36B43BFF3EB844FF46BC4CFF50C157FF66CA6EFF007300FF2F72C6FF2D6C
          BAFF3780D3FF64A0E0FF143667FF000000380000002E00390077009900FF80CF
          82FF71CA74FF6CC870FF77CD7CFF7ED082FF68C96EFF007300FF3074C8FF2E6E
          BCFF3882D6FF61A0E1FF143667FF000000380000002E000000240039006F0099
          00FF84D086FF009900FF009900FF009900FF009900FF009900FF66768BFF2F70
          BEFF3F88D9FF89BFEEFF234970BF000000380000002E0000002400000018005F
          00A4009900FF009900FF000000000000000000000000000000003176CAFF3374
          C0FF77B2E8FF557692BF00010146000000380000002E00000024000000180000
          0009128C4CFF009900FF000000000000000000000000000000003277CBFF4C8C
          CFFF3C71A7DE0001014600010146000000380000002E00000024000000180000
          00093277CBFF00000000000000000000000000000000000000003277CBFF3277
          CBFF3277CBFF3277CBFF3277CBFF3277CBFF3277CBFF3277CBFF3277CBFF3277
          CBFF3277CBFF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000161616FF425472FF00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000161616FFA6B1C1FF3D4E6AFF000000000000000000000000000000000000
          000005050538000000A1161616FF161616FF161616FF161616FF161616FF1616
          16FF161616FFB2BBC8FF566C91FF323E55FF0000000000000000000000000000
          0000040404A19EA4ADFFAFB8C6FFACB3C3FFAFB8C6FFAFB8C6FFAFB8C6FFAFB8
          C6FFAFB8C6FFDADFE4FF566C91FF566C91FF161616FF00000000000000000000
          0000161616FFE1E5E9FF161616FF161616FF161616FF161616FF161616FF1616
          16FF161616FFDADDE4FF566C91FF3D4E6AFF0000000000000000000000000000
          0000161616FFDFE4E8FF161616FF000000000000000000000000000000000000
          0000161616FFE0E3E9FF3B4B66FF000000000000000000000000000000000000
          0000161616FFE1E5E9FF161616FF000000000000000000000000000000000000
          0000383838FF606B85FF00000000000000000000000000000000000000000000
          0000161616FFE1E5E9FF161616FF000000000000000000000000000000000000
          0000161616FF3B4B66FF00000000000000000000000000000000000000000000
          0000161616FFE1E5E9FF161616FF000000000000000000000000000000000000
          0000161616FF7A89A1FF37455EFF000000000000000000000000000000000000
          0000161616FFE1E5E9FF161616FF161616FF161616FF161616FF161616FF1616
          16FF161616FFA0AABBFF566C91FF37455EFF0000000000000000000000000000
          0000151515F0D6DADEF39AA3B4F6AAB3C1F8AEB7C4FDAFB8C6FFAFB8C6FFAFB8
          C6FFACB3C3FFC6CBD6FF566C91FF566C91FF161616FF00000000000000000000
          0000101010BAA9ACAFBF111111C8121212D4141414E6151515F8161616FE1616
          16FF161616FFE1E5E9FF566C91FF35425AFF0000000000000000000000000000
          00000B0B0B84747779840B0B0B85000000000000000000000000000000000000
          00001E1E1EFFEEF1F3FF37455EFF000000000000000000000000000000000000
          0000070707534A4B4D5407070754000000000000000000000000000000000000
          0000161616FF3D4E6AFF00000000000000000000000000000000000000000000
          00000404042B2526262A0404042A000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000001C19191A1C0000001D000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000001010102161616452C2C2C89343434A73333339F2424
          24720A0A0A210000000000000000000000000000000000000000000000000000
          00000000000012121238434343D4515151FF515151FF515151FF515151FF5151
          51FF4E4E4EFC3131319B0404040C000000000000000000000000000000000000
          00001818184D404040CD515151FF515151FF515151FF515151FF4E4E4EFC1919
          194E434343D2515151FF424242CF050505100000000000000000000000000A0A
          0A213333339F0A0A0A21515151FF515151FF515151FF515151FF363636A90000
          00000D0D0D293D3D3DC1494949ED383838AF0000000000000000000000003030
          30980D0D0D2A393939B5515151FF515151FF515151FF515151FF333333A10000
          0000000000002F2F2F93454545E0515151FF1414143E000000000303030A3838
          38B13A3A3AB6515151FF515151FF515151FF515151FF515151FF1B1B1B550000
          0000000000001E1E1E5E515151FF515151FF3232329C00000000111111365151
          51FF515151FF515151FF515151FF414141D30F0F0F2F161616460303030B0000
          00000000000003030309434343D2515151FF424242D100000000161616445050
          50FB515151FF515151FF515151FF1A1A1A530000000000000000000000000000
          0000000000001E1E1E60212121674C4C4CEF393939B3000000000F0F0F304949
          49ED515151FF515151FF515151FF2B2B2B880000000000000000000000000000
          0000060606130D0D0D290D0D0D29111111363232329D00000000020202053838
          38B44B4B4BF3515151FF515151FF515151FF242424710B0B0B23292929823E3E
          3EC3333333A00000000000000000070707172C2C2C8B00000000000000002C2C
          2C8A30303097515151FF515151FF515151FF2323236F24242470363636A92020
          20662727277B0B0B0B22000000002A2A2A830E0E0E2B00000000000000000606
          0612474747DF515151FE515151FF515151FF404040C81B1B1B56070707150101
          01030101010400000001121212392C2C2C8A0000000000000000000000000000
          00000F0F0F2F383838B0343434A5515151FF464646DC4C4C4CF61919194F0505
          05110505050F1B1B1B543333339F010101040000000000000000000000000000
          0000000000000909091C3232329D4C4C4CEF515151FF515151FF4C4C4CEE4242
          42CF404040D02323236F00000001000000000000000000000000000000000000
          00000000000000000000000000000909091D1E1E1E5F2727277B252525741717
          1748020202070000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          20000000000000040000000000000000000000000000000000000000000F0000
          0032000000330000003300000033000000330000003300000033000000330000
          0022000000000000000000000000000000000000000000000000331B066FA553
          0CFBA7530BFFA7520AFFA85208FFB25000FF59777FFF2990CBFF3091C7FF2264
          88BB000000330000000000000000000000000000000000000000B25F18FFD899
          5DFFE3A971FFE3A870FFE4A76EFFEEA666FF219BE3FF4DC0F9FF69D1FEFF60C3
          EDFF3697CDFF000000330000003300000033000000320000000FC27937FFEAC0
          97FFE1A261FFE19F5CFFE29D58FFE89D54FFC2A278FF2293D5FF6DD1FBFF82E0
          FFFF5FC1EDFF2988BDFF2D8DC2FF3191C9FF328AA2FB10251D6FCF8D4FFFF1D6
          BCFFF0B776FFF0B97BFFF6F9FDFFEEEFF0FFFBB973FFCFB58AFF2190D1FF69D0
          FAFF6ED7FDFF54C1F2FF59C7F8FF58C5F8FF3DA2DCFF368FA7FFD08843FFF1DB
          C5FFFBE6CEFFFFF8EAFFFFFEFEFFF6F5F3FFF2E4D2FFFFE9C9FFD2C8BAFF248B
          C8FF6FD5FDFF6ED2FBFF71D5FDFF72D7FFFF70D4FDFF399BD4FF0B07040DB072
          34D0EEBA86FFAFC7CEFF5D9FC3FF3C7CA0FF768488FFFBBA82FFBE9340FF228A
          CAFF82E0FFFF82E1FFFF2F73B3FF3074B4FF87E6FFFF399DD4FF000000000000
          000023170A28819596EA67A3C4FF5089A9FF5E7370FFA5CAA1FF91E8C4FF278F
          CFFF75D8FEFF7ADEFFFF3A7CB7FF3C7DB8FF7ADEFFFF3CA1D7FF000000000000
          0000040A0E3F78BDE2FF7FC0E3FF71AFD2FF5A97BFFF26756EE269BCA1FF5CA9
          CAFF44ABDFFF6BD6FCFF6DD5FAFF6CD2FAFF4EB4E5FF26618197000000000000
          0000012859EAA7EFFFFF8ED1F0FF7EBFDEFF76B3D5FF001B4BD8030B08125991
          9DE853A5D4FF359DD5FF44ACE1FF3FA6DDFF2661809400000000000000000000
          00000A3A6AFF69AACEFF79B3D6FF8CCCECFF80BFE0FF072356FF0000002980BF
          E0FF83BFE0FF74ADCCFF5C9DC2FF020506350000000000000000000000000000
          0000114374FF2D77A9FF4E89B7FF517AA5FF334F7BFF0D2C5CFF032750D6A8EF
          FFFF8FD1EFFF7FBEDDFF77B3D4FF052551E90000000000000000000000000000
          0000103D6DFC287BAEFF418ABAFF407CABFF254A77FF0D2D58E30A3B6BFF69AB
          CEFF79B5D6FF8CCCEBFF81C0E0FF0B2B5AFF0000000000000000000000000000
          000002090F22134777FB1E6293FF1D5787FF123E6CF701020408114474FF2D78
          A9FF4E89B7FF517AA5FF33507BFF103160FF0000000000000000000000000000
          0000000000000000000000000000010407100000000000000000113D6BF9287B
          AEFF4089BAFF407CABFF244A77FF103365FC0000000000000000000000000000
          000000000000000000000000000000000000000000000000000002080F211246
          77FC1D5F91FF1C5786FF123F6FFC020910220000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000B07E55FFB07E
          55FFB07E55FFB07E55FFB07E55FFB07E55FFB07E55FFB07E55FFB07E55FFB07E
          55FFB07E55FFB07E55FFB07E55FFB07E55FF0000000000000000B28056FFFFFF
          FEFFFFF8F3FFFFF7F1FFFFF6EEFFFFF5EDFFFFFEFBFF8EAF82FF429B4EFFFFF6
          EBFFFFEFE1FFFFEDE0FFFFF8ECFFB07E55FF0000000000000000B48257FFFFFA
          F6FFFEF2EBFFFEF1E8FFFFF2EAFFFFF1E9FF569051FF96DBA7FF429B4EFFFFF2
          EAFFFFECDFFFFFE9DBFFFFF4E9FFB07E55FF0000000000000000B78458FFFFFB
          F7FFFEF3EDFFFFF9F6FFDCDCC9FF45924BFF9BE5AAFF9FEAADFF5FB26BFF419B
          50FF419B50FF3F994EFF3D974CFF409C50FF4D9F5AFF429B4EFFB98759FFFFFC
          F9FFFFF9F6FF93B38BFF57A663FFACF3BAFF88E293FF79D987FF7CDA8CFF77D5
          88FF6CCE7FFF62C675FF57BF6DFF4EB765FF8CDBA1FF429B4EFFBC895AFFFFFC
          F8FFFFFAF7FF93B48CFF57A662FFACF3BAFF88E395FF7BDC88FF80DD8EFF7AD9
          8AFF70D181FF65C879FF5AC16FFF51B967FF8DDCA2FF429B4EFFBE8B5BFFFFFC
          F8FFFEF5EFFFFFFCFAFFDCDFCFFF45924BFF9DE5ACFFA3EEB1FF61B26DFF449B
          50FF439B51FF429B4EFF3F994EFF429D50FF4D9E58FF429B4EFFC08D5CFFFFFB
          F8FFFEF5EFFFFEF6F0FFFFF8F4FFFFF8F5FF579354FF97DBA7FF429B4EFFFFFB
          FAFFFFF5EDFFFFF2EAFFFFFAF4FFB07E55FF0000000000000000C3905EFFFFFB
          F8FFFEF5EFFFFEF6F0FFFEF6F0FFFFF6F1FFFFFFFFFF8AAD82FF429B4EFFFFF7
          F1FFFEEFE7FFFEEEE3FFFFF4ECFFB07E55FF0000000000000000C5925FFFFFFB
          F8FFFEF5EFFFFEF6F0FFFEF6F0FFFEF6F0FFFEF6F0FFFFFAF6FFFFF8F3FFFEF3
          ECFFFEF2E8FFFEEFE6FFFFF7EEFFB07E55FF0000000000000000C89460FFFFFB
          F8FFFEF5EFFFFEF6F0FFFEF6F0FFFEF6F0FFFEF6F0FFFEF6F0FFFEF5EFFFFEF4
          EEFFFEF3ECFFFEF1E8FFFFF7F2FFB07E55FF0000000000000000CA9661FFFFFC
          FBFFFEF7F2FFFEF7F3FFFEF8F3FFFEF8F4FFFFF8F4FFFFF8F5FFFFF9F5FFFFF8
          F4FFFFF7F3FFFFF5F0FFFFFBF9FFB07E55FF0000000000000000CC9962FFFFFC
          FBFFF7E5CAFFF6E3C7FFF5DDC2FFF4DABDFFF1D5B7FFF2D2B3FFF0D0B1FFF0D1
          B2FFF0CFB1FFF0D0AFFFFFFCFBFFB07E55FF0000000000000000CF9B63FFFFFC
          FBFFEFD4A3FFEDCE9AFFEBC590FFE9BB85FFE5B37CFFE5AC73FFE3A86EFFE4A8
          6EFFE4A96EFFE4A96FFFFFFCFBFFB07E55FF0000000000000000D19D64FFFFFC
          FBFFFFFCFBFFFFFCFBFFFFFCFBFFFFFCFBFFFFFCFBFFFFFCFBFFFFFCFBFFFFFC
          FBFFFFFCFBFFFFFCFBFFFFFCFBFFB07E55FF0000000000000000D4A168FFD19D
          64FFCE9A63FFCB9862FFC89560FFC6925FFFC3905EFFC08D5CFFBD8B5BFFBB88
          5AFFB88558FFB58357FFB28056FFB3835CFF0000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000002C00000029000000240000001C0000002C0000
          0029000000240000001C00000015000000000000000000000000000000020000
          0000000000200000002C0A07064C91654DC3C08464F2C48462FFC68664FFC585
          63FFBA8162F0795642B900000041000000390000002C00000020000000000000
          000000000000422F244EC28666F3D49370FFE09E79FFE3A17CFFE4A17CFFE3A0
          7BFFDE9C78FFCF8E6CFFBA8162E5291D16300000000000000000000000000000
          00005A40316ACD8E6CFEE19F7AFFE19E79FFDE9B77FFE09D79FFE29F7AFFE09D
          79FFDE9B76FFE19E7AFFDC9A76FFCA8B6AFA34251D3D00000000000000001A12
          0E1ECC8E6CF9E4A37FFFE09D78FFE4A17DFFE8A580FFF2D0ADFFF4D8B5FFF2CF
          ACFFE8A580FFE3A07CFFDF9C78FFE0A07BFFC28868EC04030205000000009167
          4FAAE1A27DFFE2A17CFFE7A580FFE8A681FFE8A680FFEECDBBFFF3F3F3FFEDC7
          B2FFE8A580FFE8A580FFE7A47FFFE2A07BFFDA9B79FF7353408700000000CB90
          6FF0E8AA86FFE7A681FFE9A983FFE9A883FFE9A883FFF0D0BDFFF6F6F6FFEFC9
          B4FFE9A782FFE9A781FFE9A681FFE5A47FFFE5A784FFB48063D3130E0B16E0A3
          7FFFE9AD89FFEBAC87FFEBAC86FFEBAB86FFEAAB86FFF2D3C0FFF9F9F9FFF1CC
          B7FFEAAA84FFEAA984FFEAA984FFE9A983FFE9AC88FFD19574F1261C162BE5AA
          86FFECB38FFFECB08AFFECAF8AFFECAF89FFECAE89FFF4D6C4FFFCFCFCFFF2CF
          BAFFEBAD88FFEBAC87FFEBAC87FFEBAC86FFECB08CFFDDA280FB110D0A13E7AD
          8AFFF2BE9AFFEEB38EFFEEB38EFFEEB38DFFEDB28DFFF6D9C6FFFFFFFFFFF5D2
          BDFFEDB08BFFECB08BFFECB08AFFECAF8AFFF1BB98FFD79D7DEF00000000C791
          73DBF5C3A0FFEFB792FFEFB791FFEFB691FFEFB691FFE0A582FFDCA381FFE3A9
          85FFEEB48FFFEEB48EFFEEB38EFFEEB38EFFF3BF9DFFAD7F64BF000000007A5A
          4785F2BE9BFFF5C39EFFF1BA95FFF1BA94FFECB48FFFF6D4BDFFFEFAF7FFF5D2
          BAFFECB38DFFF0B892FFEFB792FFF5C29DFFF0B995FF503B2F57000000000C09
          070DDEA684EFF9CBA9FFF3C09BFFF2BD97FFEBB48FFFFAE3D3FFFFFFFFFFF9E2
          D1FFEBB48EFFF1BB96FFF3BF99FFF7C8A6FFC19073D100000000000000000000
          000035282039EBB491F9FBCFADFFF7C7A3FFF3C09AFFECB590FFEAB38DFFEAB3
          8DFFF2BF99FFF7C7A3FFFBCDABFFE0A988ED1C15111E00000000000000000000
          000000000000251B1627C09073CCF9C9A6FFFCD1AFFFFCD7B9FFFBD8BAFFFCD7
          B9FFFCD1AFFFF8C6A4FFA77D64B1140F0C150000000000000000000000000000
          000000000000000000000302020362493A69B3876CBEECB794F8F4BF9CFFE6B1
          90F1A97F66B449362B4E00000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000330000
          0033000000330000003300000033000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000002F76B6FF2E73
          B4FF2F73B3FF3073B4FF3077B6FF000000330000000000000000000000000000
          00000000000000000000000000000000000000000000000000002F75B5FF4FC8
          FCFF4DC3F8FF4DC4F8FF3887C5FF3378B6FF0000000000000000000000000000
          00000000000000000000000000000000000000000000000000002D6BA6E83B92
          CEFF4DC1F6FF4CBFF4FF4DC3F8FF3176B5FF0000003300000033000000000000
          0000000000000000000000000000000000000000000000000000000000002B69
          A0E23E92CCFF53C6F8FF53C5F8FF2F72B0FF3377B5FF357BB9FF000000330000
          0000000000000000000000000000000000000000000000000000000000000000
          00002C69A1E24294CDFF5ECCFCFF5CCBFAFF5ECDFDFF3174B3FF357AB7FF0000
          003300000033000000310000001A000000000000000000000000000000000000
          0000000000002D6AA0E24597CFFF67D2FCFF65CFFAFF67D2FCFF57B2E2FF3578
          B4FF377AB6FF3878B2F91D415F9C0000002E0000000000000000000000000000
          000000000000000000002E69A0E04999CFFF72D5FDFF5FC6F8FF48B2F4FF4EB7
          F7FF4FB9F9FF44ABF0FF3D8CCBFF3674A8EC0000001A00000000000000000000
          00000000000000000000000000003376B4FF6DD1FEFF58BDF6FF75D5FBFF79D8
          FCFF7AD9FCFF77D8FEFF5DC5FCFF3F8FCCFF1E425F9B00000000000000000000
          00000000000000000000000000003578B5FF62CAFEFF81DCFEFF7FDBFDFF80DC
          FFFF81DEFFFF82DFFFFF85E1FFFF5ABFF6FF3C80B9FF00000000000000000000
          00000000000000000000000000003B7FBAFF6FD5FFFF7CDAFDFF7CDAFDFF70CA
          F1FF4C97CBFF4C98CCFF73CEF4FF71D9FFFF3C7EB8FF00000000000000000000
          00000000000000000000000000003A80BCFF74DBFFFF77D8FCFF78DAFEFF4A96
          CBFF060E151D070E151D4D99CEFF77E0FFFF3D7FBAFF00000000000000000000
          0000000000000000000000000000387BB8FF6FD3F8FF73D9FCFF73DAFDFF4A97
          CCFF00000033000000334D9BCFFF73D7FBFF3F82BBFF00000000000000000000
          00000000000000000000000000001F415F824B99CEFF71DBFFFF6FD8FDFF66C8
          F0FF4B99CDFF4D9ACFFF69CEF5FF4F9ED1FF2143608200000000000000000000
          0000000000000000000000000000000000003673A8E64A99CEFF67CEF6FF6EDB
          FFFF6FDDFFFF69D3F9FF4E9ED1FF3A77AAE70000000000000000000000000000
          0000000000000000000000000000000000000000000020435F823E80BAFF3F80
          BAFF3F81BAFF3F82BBFF21436082000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000040405231616
          19B31B181ED719191ED819191ED819191ED819191ED819191ED819191ED81919
          1ED819191ED819191ED819191ED81B181ED7161619B1040405201A171BCE0A09
          0B4E0302041608080A3F08080A4108080A41080809400808093F0808093F0808
          093F0808093F0808093F0807083C020202130B0A0C5519171BC71D1C1EE40303
          03171D1C1EE4201F24FF201F24FF201F24FF201F24FF201F24FF201F24FF201F
          24FF201F24FF201F24FF201F24FF1A1920E0020203121D1C1EE41D1C1EE40B0B
          0C58201F24FF201F24FF201F24FF201F24FF201F24FF201F24FF201F24FF201F
          24FF131215960A090B4D18171BBC201F24FF0B0A0C541D1C1EE41D1C1EE40C0B
          0D5C201F24FF1E1D21ED1313169A1D1C1EE4201F24FF201F24FF201F24FF1C1B
          1DDC000000000000000003030317201F24FF0B0B0C581D1C1EE41D1C1EE40C0B
          0D5C201F24FF0C0B0D5C0000000008080942201F24FF201F24FF201F24FF1D1D
          1FEB0101010A000000000606072F201F24FF0B0B0C581D1C1EE41D1C1EE40C0B
          0D5C201F24FF11101386000000000D0D0F6B201F24FF201F24FF201F24FF201F
          24FF19191ED1121215931D1A21E7201F24FF0B0B0C581D1C1EE41D1C1EE40C0B
          0D5C201F24FF201F24FF1E1D1FEC201F24FF201F24FF201F24FF201F24FF201F
          24FF201F24FF201F24FF201F24FF201F24FF0B0B0C581D1C1EE41D1C1EE40C0B
          0D5C201F24FF1B1A21E8151417A4151317A51D1C20E6201F24FF201F24FF201F
          24FF201F24FF201F24FF201F24FF201F24FF0B0B0D591D1C1EE41D1C1EE40707
          083B11101384010101080000000000000000010101051210148C201F24FF201F
          24FF201F24FF201F24FF201F24FF201F24FF080809421D1C1EE41D1C1EE40000
          00000000000000000000000000000000000000000000000000000B0A0C561A17
          1BCE201F24FD1D1C21F818171BBC08080942000000001D1C1EE41D1C1EE40000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000002000000010000000000000000000000001D1C1EE40F0E10740000
          0000000000000000000000000000010001040101010500000000000000000000
          000000000000000000000000000000000000000000000F0E1176000000000000
          00000000000000000000050405251B1A21E91E1D22EE0606072F000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000D0D0F68201F24FF201F24FF0F0E1177000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000303031518171BBD18181CC30403041C000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000000000050000000B000000130000001E000000230000
          00180000000F0000000800000002000000000000000000000000000000000000
          000000000000000000040000000A0000000F217F4FFF217F4FFF217F4FFF217F
          4FFF000000120000000E00000009000000010000000000000000000000000000
          000000000000000000000000000000000003217F4FFF2FB873FF2FB873FF217F
          4FFF000000050000000200000000000000000000000000000000000000000000
          000000000000000000000000000000000000217F4FFF2FB873FF2FB873FF217F
          4FFF000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000217F4FFF2FB873FF2FB873FF217F
          4FFF000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000217F4FFF2FB873FF2FB873FF217F
          4FFF00000000000000000000000000000000000000000000000000000000217F
          4FFF217F4FFF217F4FFF217F4FFF217F4FFF217F4FFF31B975FF31B975FF217F
          4FFF217F4FFF217F4FFF217F4FFF217F4FFF217F4FFF0000000000000000217F
          4FFF3BBE7CFF3BBE7CFF3BBE7CFF3BBE7CFF3BBE7CFF3BBE7CFF3BBE7CFF3BBE
          7CFF3BBE7CFF3BBE7CFF3BBE7CFF3BBE7CFF217F4FFF0000000000000000217F
          4FFF45C383FF45C383FF45C383FF45C383FF45C383FF45C383FF45C383FF45C3
          83FF45C383FF45C383FF45C383FF45C383FF217F4FFF0000000000000000217F
          4FFF217F4FFF217F4FFF217F4FFF217F4FFF217F4FFF4FC88BFF4FC88BFF217F
          4FFF217F4FFF217F4FFF217F4FFF217F4FFF217F4FFF00000000000000000000
          000000000000000000000000000000000000217F4FFF59CD92FF59CD92FF217F
          4FFF000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000217F4FFF63D29AFF63D29AFF217F
          4FFF000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000217F4FFF6CD7A1FF6CD7A1FF217F
          4FFF000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000217F4FFF76DCA8FF76DCA8FF217F
          4FFF000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000217F4FFF217F4FFF217F4FFF217F
          4FFF000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
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
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          20000000000000040000000000000000000000000000000000000000000F0000
          0032000000330000003300000033000000330000003300000033000000320000
          000F000000000000000000000000000000000000000000000000331B066FA553
          0CFBA7530BFFA7520AFFA7520AFFA7520AFFA7520AFFA7530BFFA7530BFB3519
          036D000000000000000200000000000000000000000000000000B25F18FFD899
          5DFFE3A971FFE3A870FFE3A770FFE3A770FFE3A870FFE4A971FFDA995DFFBF5D
          11FF000000330206053D0000003300000033000000320000000FC27937FFEAC0
          97FFE1A261FFE19F5CFFE19D59FFE19D59FFE19F5DFFE1A261FFECC097FFC868
          1BFF268272FF34856FFF337E6CFF337E6CFF337D6AFB1026206FCF8D4FFFF1D6
          BCFFF0B776FFF0BA7BFFF5FAFDFFEBEFF2FFF0B979FFF1B877FFF5D7BDFFD272
          24FF45AE88FF4BA980FF55AE86FF56AF87FF50A583FF338270FFD08843FFF2DB
          C5FFFAE6CEFFFFF8EAFFFFFEFEFFF6F5F3FFF0E4D3FFFFE7CEFFFAD9C1FFC580
          34FF45AC87FF4EAB83FF39A275FF3EA577FF75C4A2FF318472FF0B07040DB072
          34D0EEBA86FFAFC7CEFF5D9FC3FF3C7CA0FF768488FFF8B983FFB28F47FF44AD
          7AFFFDFAFCFFF6EFEFFF3BAF81FF35AF7CFF95DABEFF308674FF000000000000
          000023170A28819596EA67A3C5FF5089A9FF5E7370FFA4C9A1FF87E4C5FFD5F4
          E7FFFFFFFDFFFFF5F2FFC6DFCFFF93E4C5FF9ADDC6FF308876FD000000000000
          0000040A0E3F78BDE2FF7FC0E3FF71AFD2FF5A97BFFF26756EE263B9A1FF99C8
          D7FF63A0C2FF437C9FFF5D8693FF68BAA4FF257163D00308070E000000000000
          0000012859EAA7EFFFFF8ED1F0FF7EBFDEFF76B3D5FF001B4BD8030B08125591
          9FE86CA3C3FF548AA9FF2C6473EA071612280000000000000000000000000000
          00000A3A6AFF69AACEFF79B3D6FF8CCCECFF80BFE0FF072356FF000000297FBF
          E1FF81C0E2FF72B0D1FF5F99BFFF060A0E3F0000000000000000000000000000
          0000114374FF2D77A9FF4E89B7FF517AA5FF334F7BFF0D2C5CFF032750D6A8EF
          FFFF8FD1F0FF7FBFDEFF76B4D5FF052755EA0000000000000000000000000000
          0000103D6DFC287BAEFF418ABAFF407CABFF254A77FF0D2D58E30A3B6BFF69AB
          CEFF79B5D6FF8CCCECFF81C0E0FF0B2B5BFF0000000000000000000000000000
          000002090F22134777FB1E6193FF1D5787FF123E6CF701020408114474FF2D78
          A9FF4E89B7FF517AA5FF33507BFF103160FF0000000000000000000000000000
          0000000000000000000000000000010407100000000000000000113D6BF9287B
          AEFF4089BAFF407CABFF244A77FF103365FC0000000000000000000000000000
          000000000000000000000000000000000000000000000000000002080F211246
          77FC1D5F91FF1C5786FF123F6FFC020910220000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0023000000330000003300000033000000330000003300000033000000330000
          0033000000330000003300000033000000230000000000000000000000006054
          44C08A7861FF897760FF887761FF887760FF887760FF88765EFF88765EFF8876
          5EFF88765EFF89775FFF8A7860FF605444C00000000000000000000000008A78
          60FFAF9B8AFFA89585FFA59486FFA49486FFA69382FFA48F7BFFA28D78FFA28D
          78FFA48F7BFFA89380FFAF9B8AFF8A7860FF0000000000000000000000008977
          60FFAF9C8BFFA19080FFFFB63CFFFFB53BFF9C8B7AFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF9F8C78FFAE9B8AFF897760FF0000000000000000000000008977
          5FFFB29F8EFFA38E79FFA69078FFA59077FF9F8973FF96806AFF927B65FF927B
          65FF967F6AFF9D8874FFB19E8DFF89775FFF0000000000000000000000008977
          5FFFB6A390FFA68E73FF0034FBFF0033FAFFA2896DFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF9A8470FFB5A290FF89775FFF0000000000000000000000008977
          5FFFB7A595FF9D8973FFA08C72FFA08B71FF9A856EFF907B64FF8C765FFF8C76
          5FFF907A64FF97836DFFB6A494FF89775FFF0000000000000000000000008876
          5FFFB9A798FF968571FFFFB83CFFFFB73CFF92806CFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF937F69FFB9A796FF88765FFF0000000000000000000000008876
          5EFFBDAC9BFF98846CFF9C876CFF9B866CFF958168FF8C765EFF887158FF8771
          58FF8B755EFF917D67FFBBAA9BFF88765EFF0000000000000000000000008876
          5EFFC0AE9EFF998466FF0036FDFF0035FCFF967F61FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF8B7860FFBDAC9CFF88765EFF0000000000000000000000008876
          5EFFC2B2A2FF927F66FF968266FF968266FF907C63FF87735AFF97836EFFB7A6
          93FFB9A896FFBCAC9BFFBFAF9FFF88755EFF0000000000000000000000008875
          5EFFC4B4A5FF8A7966FFFFB940FFFFB93FFF887763FFFFFFFFFFBDAD9BFF9684
          6FFF7E6A51FF7E6A50FFC2B2A2FF88755EFF0000000000000000000000008775
          5EFFC6B7A9FF877762FF877867FF877967FF887863FF86735CFFC3B3A3FF7E6B
          52FFF6FAFEFFFFFFFFFFAA9A87FF5C5040AC0000000000000000000000008775
          5EFFC8BAAAFF85735BFF87755EFF87755EFF87755DFF847259FFC6B7A7FF7D6A
          50FFFFFFFFFFA99682FF584B3CA7000000000000000000000000000000008876
          5FFFCCBEAFFFCBBDAEFFCCBDAFFFCCBEAFFFCCBDAFFFCBBCAEFFC9BBACFFC9BA
          ABFFAE9D8AFF574A3BA600000000000000000000000000000000000000008170
          5BEF88765EFF87755DFF87755DFF87755DFF87755DFF87755DFF87755DFF8775
          5DFF7E6C56EA0000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000020202032525
          2533464646606565658A848484B4A3A3A3DEBBBBBBFFBBBBBBFFBBBBBBFFBBBB
          BBFF9C9C9CD5808080AE63636387464646602525253304040406000000000000
          00000000000000000000050F0B181A563C872C8E63DE32A372FF32A372FF2C8E
          63DE1B583E8A050F0B1800000000000000000000000000000000000000000000
          00000000000010382857309F71F344BE90FF49CFA2FF43D2A4FF43D2A4FF49CF
          A2FF44BE90FF30A173F6113A295A000000000000000000000000000000000000
          00001039285736AF7FFF4DD0A4FF39D1A3FF2DCF9EFF28CE9CFF28CE9CFF2DCF
          9EFF39D1A3FF4DD0A4FF36AF7FFF103B2A5A0000000000000000000000000410
          0B182BA375F34FD2A6FF36D1A2FF26CF9CFF237755FF23694AFF23694AFF2371
          51FF26CF9CFF36D1A2FF4FD2A6FF2BA375F305120D1B0000000000000000155A
          408446C598FF41D4A6FF29D09EFF21CF9CFF228964FF23694AFF23694AFF2286
          61FF21CF9CFF29D09EFF41D4A7FF45C598FF155A408400000000000000001F8F
          67CF54D5ACFF35D3A3FF27D19EFF23D19DFF239E74FF23694AFF23694AFF239C
          73FF23D19DFF27D19EFF37D3A3FF54D6ABFF1F8F67CF000000000000000021AB
          7CF35CDEB5FF35D4A3FF28D29FFF27D29FFF26B386FF23694AFF23694AFF26B3
          86FF27D29FFF29D29FFF35D4A3FF5CDDB4FF22AD7DF600000000000000001FB3
          81F963E2BAFF3CD6A8FF2BD4A2FF2AD4A2FF27AC81FF23694AFF23694AFF28B1
          85FF2AD4A2FF2BD4A2FF3CD7A8FF61E0B8FF1FB381F900000000000000001897
          6ECF60DEB6FF4BDCAFFF32D6A5FF2ED6A4FF247150FF23694AFF23694AFF2473
          52FF2ED6A4FF32D6A5FF4BDCAFFF5FDEB6FF18976ECF00000000000000000E62
          478446D2A6FF62E4BBFF41DAACFF33D8A7FF247150FF23694AFF23694AFF2475
          54FF33D8A7FF41DAACFF62E4BBFF47D3A7FF0E6247840000000000000000020E
          0A1219B385ED6BE5BFFF62E4BCFF4ADEB0FF34B389FF246D4DFF246E4EFF35B7
          8CFF4ADEB0FF62E4BCFF6BE5BFFF19B385ED020E0A1200000000000000000000
          000006392A4B23C695FC6EE8C2FF70EAC4FF60E5BCFF57E2B8FF57E2B8FF60E5
          BCFF70EAC4FF6EE8C2FF23C695FC073B2C4E0000000000000000000000000000
          000000000000042A1F3614A87DD946D9ADFF69E7C1FF7EF0CDFF7EF0CDFF69E7
          C1FF46D9ADFF14AA7FDC0530243F000000000000000000000000000000000000
          00000000000000000000010705090856406F0D8562AB11AC7FDE11AC7FDE0D85
          62AB085941720107050900000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000034200D398E59239DBF782FD3DB8A36F2BC762ED08956
          22972E1D0B330000000000000000000000000000000000000000000000000000
          000000000000744A1E80DF983DF4EDC14EFAF3CF53FDF6D957FFF3D053FDEDC0
          4DFADE963CF371491D7D00000000000000000000000000000000000000000000
          0000714A1E7DE5AC47F6F4D259FEE8B149F9E09B3EF5DA8F3AF2E09B3EF5E8B1
          49F9F4D25AFEE4A845F66E481D7A000000000000000000000000000000003D29
          1144DF9F43F4F4CF5FFEE1A043F5795121862B1D0C30000000002B1D0C307951
          2186E1A043F5F4D05FFEDD9B41F331210D360000000000000000000000009869
          2BA8EFC75EFBE8B450F9714E207D000000000000000000000000000000000000
          000076522283E8B652F9EDC35CFA8B60289A000000000000000003020103D99C
          41F2F6D46DFFDDA347F41C14081F000000000000000000000000000000000000
          00001C14081FDDA347F4F5D26CFEC78E3BDE00000000000000000F0B0511DCA4
          48F3F8D671FFD79D43EF00000000000000000000000000000000000000000000
          000005040206D99F44F2F8D874FFD99E43F2000000000000000003020103D9A4
          47F2F8DA79FFDCA94CF3120D0614000000008152218EDB8C38F28152218E0000
          00001C15091FDEAC4FF4F6D777FEC59440DB0000000000000000000000009170
          30A2F0CE72FBE8C369F86951237500000000DA933CF2F9E366FFDA933CF20000
          000069512375E9C66DF8EDCB6FFA84662C94000000000000000000000000382C
          143FDDB354F4F9E38DFED9AD4EF208060309D99B41F2F7D96FFFD99B41F20806
          0309D9AD4EF2F7E18CFDDBB052F32B220F300000000000000000000000000000
          000069542575E4C165F6DAB252F30A08030BD9A346F2FADD7EFFD9A346F20806
          0309D9B150F2E2BE62F566522472000000000000000000000000000000000000
          0000000000003F3417470A08040B00000000D8AB4BF2FDE792FFD8AB4BF20000
          000008070309382E153F00000000000000000000000000000000000000000000
          000000000000000000000000000000000000D7B14FF2FFEE9EFFD7B14FF20000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000007E6B308ED7B652F27E6B308E0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000F1FBFFFF78CFF8FF6BC9FCFF78CFF8FFF9DA9BFFFFD47AFFFFD47AFFFFD4
          7AFFFFD171FFFFD171FFFFD171FFFFFAF2FF0000000000000000000000000000
          0000C5F1FFFF24BEFDFF24BEFDFF9BB09DFFFFC255FFFFC255FFFFC255FFFFBE
          49FFFFBE49FFFFBB3FFFFFC13DFFFFEDCCFF0000000000000000F1FBFFFFC5F1
          FFFFA8EAFFFF17C3FDFF2AB9F5FFCABF84FFFFC765FFF8B852FFF8B852FFFFC2
          55FFFFC255FFFFBE49FFFFBE49FFF9DA9BFFFFEDCCFFFFFAF2FF56DCFFFF19D1
          FFFF38D5FFFF09C8FEFF2BC1E7FFEBB862FFFFCA6EFF78B9B3FF58B9C4FFCBAC
          67FFFFC255FFFFC255FFFFC255FFFFBE49FFFFC13DFFFFD171FFB8EEFFFFA8EA
          FFFFA8EAFFFF62D9FEFF09C8FEFF58B9C4FFEBB862FF78B9B3FF17C3FDFF2AB9
          F5FF9BB09DFFEBB559FFFFC255FFFFBE49FFFFBB3FFFFFC765FF68E0FFFF46D9
          FFFF68E0FFFFB8EEFFFFA8EAFFFF0DCCFEFF08ADF5FF09C8FEFF17C3FDFF17C3
          FDFF24BEFDFFCABF84FFFFC255FFFFC255FFFFBB3FFFFFCA6EFF46D9FFFF19D1
          FFFF38D5FFFF0DCCFEFFB8EEFFFF62D9FEFF1E31D3FF09C8FEFF09C8FEFF09C8
          FEFF2AB9F5FFCABF84FFFFC765FFFFC255FFFFBE49FFFFCA6EFF56DCFFFF2CD3
          FFFF46D9FFFF0DCCFEFF56DCFFFFA8EAFFFF1E31D3FF08ADF5FF02CBFFFF09C8
          FEFF2BC1E7FFEBB862FFFFC765FFFFC255FFFFBE49FFFFCA6EFF68E0FFFF38D5
          FFFF46D9FFFF2CD3FFFF46D9FFFF98B6F0FF1E31D3FF127AE6FF02CBFFFF02CB
          FFFF09C8FEFF58B9C4FFE5AE54FFE5AE54FF9BB09DFF9BB09DFF8CE6FFFF68E0
          FFFF68E0FFFF56DCFFFF62D9FEFF4862E8FF2E41DAFF2E41DAFF2AB9F5FF2CD3
          FFFF2CD3FFFF3CCEFEFF3CCEFEFF49C9FEFF56BFFCFF86D0FDFF8CE6FFFF68E0
          FFFF68E0FFFF46D9FFFF3F77EBFF3C53E2FF2E41DAFF2E41DAFF275ADEFF02CB
          FFFF02CBFFFF09C8FEFF17C3FDFF24BEFDFF2AB9F5FF6BC9FCFF8CE6FFFF7BE2
          FFFF7BE2FFFF57CAFDFF4862E8FF4862E8FF3C53E2FF2E41DAFF2E41DAFF2AB9
          F5FF38D5FFFF38D5FFFF3CCEFEFF49C9FEFF57CAFDFF86D0FDFFA8EAFFFF8CE6
          FFFF8CE6FFFF6BC9FCFF4862E8FF4862E8FF3C53E2FF3C53E2FF2E41DAFF98B6
          F0FFD2F3FFFFD2F3FFFFD2F3FFFFD2F3FFFFD2F3FFFFE3F8FFFFF9FEFFFFE3F8
          FFFFD2F3FFFF7BE2FFFF5083F1FF4862E8FF4862E8FF3C53E2FF275ADEFF09C8
          FEFF02CBFFFF02CBFFFF09C8FEFF8CE6FFFFC8EEFEFFF1FBFFFF000000000000
          0000E3F8FFFF8CE6FFFF7BE2FFFF789EF4FF5083F1FF3984EDFF17C3FDFF0DCC
          FEFF02CBFFFF02CBFFFF09C8FEFFC5F1FFFF0000000000000000000000000000
          0000F9FEFFFFA8EAFFFFA8EAFFFFC5F1FFFF7BE2FFFF68E0FFFF56DCFFFF46D9
          FFFF46D9FFFF46D9FFFF56DCFFFFF1FBFFFF0000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000A0806212C22188D2C21188C0B09
          0623000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000605031435291DA80907051C08060418362A
          1EAB060403120000000000000000000000000000000000000000000000000000
          00000000000000000000000000000A080620241C14740A0806200A080620241C
          14740807051B0000000000000000000000000000000000000000000000000000
          000000000000000000000000000001010104553E1D8E6247209C6247209C5941
          1E93020101060000000000000000000000000000000000000000000000000000
          00000000000000000000000000001A13072062461C771C1409291C1409295E44
          1A7223190A2A0000000000000000000000000000000000000000000000000000
          000000000000000000000403010579562292060402070A0806200A0806200403
          01057B5822950705020900000000000000000000000000000000000000000000
          000000000000000000006B4C1E811B14082100000000100D0934100C09330000
          0000150F06197252208B00000000000000000000000000000000000000000000
          0000000000001E150824543C1866000000000C090726100D09340F0C08310A08
          0621000000004A351559291E0C32000000000000000000000000000000000000
          000000000000513A17621912071E000000000101010400000000000000000100
          0002000000000E0A04115E441A72000000000000000000000000000000000000
          000000000000513A17621A12071F000000000000000000000000000000000000
          0000000000000E0A04115E431A71000000000000000000000000000000000000
          0000000000001D150823543C1866000000000000000000000000000000000000
          00000000000049341458291D0B31000000000000000000000000000000000000
          000000000000000000006C4D1E821711061C0000000000000000000000000000
          0000110C051471511F8800000000000000000000000000000000000000000000
          000000000000000000000604020771512089473314560A07030C0806020A422F
          13507252208B0806020A00000000000000000000000000000000000000000000
          0000000000000000000000000000000000002B1F0C3460451B7462461B762F22
          0D39000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000002C1E14477B5437C7683701C72514
          0047000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000009F6B47FF9F6B47FF854701FF8547
          01FF000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000009F6B47FF9F6B47FF854701FF8547
          01FF000000000000000000000000000000000000000000000000000000002C1E
          14477B5437C7683701C72514004700000000A1714FFAA37759FC976330FC8D56
          1EFA000000002C1E14477B5437C7683701C72514004700000000000000009F6B
          47FF9F6B47FF854701FF854701FF00000000322620479F6B47FF894702FF3226
          2047000000009F6B47FF9F6B47FF854701FF854701FF00000000000000009F6B
          47FF9F6B47FF854701FF854701FF391E006D020100049F6B47FF894702FF0202
          0104442E1E6D9F6B47FF9F6B47FF854701FF854701FF0000000000000000A171
          4FFAAB7E67FAA67A57FA8E5922FC935B22FB703C01D6976033FF8F5115FF855A
          3CD6A17053FBA07250FCAB7E67FAA67A57FA8D561EFA00000000000000003226
          20478C6C59C78C6C59C75E483B85A17762E0A67752FC8E5316FFA3704EFFAF7E
          65FCA17762E05E483B858C6C59C78C6C59C73226204700000000000000002C1E
          14477B5437C7683701C72E1A05545F412C99A97C5FFEA4714FFF93551BFF9965
          33FC502C0499322112547B5437C7683701C72514004700000000000000009F6B
          47FF9F6B47FF854701FF9D6843FFA67759FCB3836DFC9F6B47FF894702FFB281
          6AFC986432FC884B09FF9F6B47FF854701FF854701FF00000000000000009F6B
          47FF9F6B47FF854701FFA47149FF926B5ACB291F19399F6B47FF894702FF291F
          1939926B5ACBA97756FF9F6B47FF854701FF854701FF0000000000000000A171
          4FFAAB7E67FAA67A57FA8D561EFA000000002C1E14479F6B47FF864701FF2514
          004700000000A1714FFAAB7E67FAA67A57FA8D561EFA00000000000000003226
          20478C6C59C78C6C59C732262047000000009F6B47FF9F6B47FF854701FF8547
          01FF00000000322620478C6C59C78C6C59C73226204700000000000000000000
          0000000000000000000000000000000000009F6B47FF9F6B47FF854701FF8547
          01FF000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000A1714FFAAB7E67FAA67A57FA8D56
          1EFA000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000322620478C6C59C78C6C59C73226
          2047000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000DFEDE9FFE1EF
          EBFFE2F0ECFFE3F0EDFFE3F0EDFFE3F0EDFFE3F1EDFFE3F1EDFFE3F1EDFFE3F1
          EDFFE3F1EDFFE3F0EDFFE3F0EDFFE2F0ECFFE1EFEBFFDFEDE9FFE1EFEBFF4059
          4FFF425A50FF425A51FF425A51FF425A51FF435B51FF445C52FF445C52FF435B
          52FF435B51FF435B51FF425B51FF425A50FF40594FFFE1EFEBFFE2F0ECFF425A
          51FFE7F4F1FFE8F4F1FFE7F4F1FFE7F4F1FFE0EEE9FFADC2BAFFB5CAC1FFE9F6
          F3FFE9F6F3FFE9F6F2FFE0EEE9FFE7F5F1FF425A50FFE2F0ECFFE3F1EDFF435B
          51FFE0EDE9FF789588FF91AA9FFFE8F4F1FF799689FF618173FF7B978CFFD7E6
          E2FF556D63FF7F938BFFBACFC8FFE0EEE9FF435B51FFE3F0EDFFE3F1EDFF435B
          52FF92ABA0FF9FCEC1FF89B2A6FFB4C8BFFF608072FF9DB4ABFFC1D2CCFF5167
          5FFF667B73FF475F55FFC0D2CCFFB5CAC1FF435B51FFE3F0EDFFE3F1EDFF435B
          51FFE0EDE9FF789487FF91AA9FFFE8F4F1FFC4D6CFFFA2B3ADFF465E55FF95A7
          A0FFC9DAD5FF92A59EFF50675FFFE0EDE9FF4D655BFFE3F0ECFFE3F0ECFF425A
          51FFE8F5F1FFE8F4F1FFE8F4F1FFDEEBE8FF788C84FF50665EFFC0D1CBFFC7D9
          D3FFA1CFC2FF9CB3AAFF6F847CFF6E837BFFBDCEC9FFE2EFECFFE2EFECFF425A
          50FF445C52FF96A9A2FFCAD8D5FF586F66FF6E837BFFC0D2CCFFD9E7E3FFCFDF
          DAFFA0B7ADFF89A497FFD7E5E0FF475F55FF748982FFE1EFEBFFE1EEEBFFE5F2
          EFFFE8F5F1FFA0B2ACFF455D53FF97A8A3FFD0E0DBFF618173FF608072FFB5CA
          C1FFE9F5F2FFBFD0CAFF4E655CFF637971FFD0DFDAFFE0EEEAFF2D302F33D8E7
          E2FE73897FFF4F665DFFBFD1CBFFE9F6F3FFC7D9D3FF618072FF618173FFC7D9
          D3FF96A8A2FF435B52FF93A59FFFC5D1CDDD0D0E0E0F000000004347464C8CA0
          99FF465E54FFCDDAD7FFA1B9AFFF8FBBAEFF9FB6ADFFC8D9D3FFA7BCB4FF778B
          83FF4D635BFFBBCDC7FF838A889300000000000000000000000000000000848B
          8994768A82FF647971FF89A497FF90BCAFFFBED1CAFFCBD8D5FF586E66FF6B80
          78FFD9E8E3FF4043424800000000000000000000000000000000000000000000
          0000BFCDC8E2576E65FF8C9F99FFEAF6F3FF9DAEA8FF435B52FF93A59FFFC6D2
          CEDE0E0F0F100000000000000000000000000000000000000000000000000000
          00000E0F0F10C5D4D1FF4C645BFF687D74FF4D645BFFBBCDC7FF838A88930000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000414544498CA198FF465E55FFD9E8E3FF40434348000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000089918F9BBDCAC7EE1112121300000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000F00000066020202AA010101D3000000E4000000E10000
          00CA000000980000004600000007000000000000000000000000000000000000
          00020303037E0B0A0BF5040404FF0F0E0FFF0E0E0EFF080808FF020202FF0000
          00FF000000FF090909FF00000054000000000000000000000000000000000808
          08B1171617FF0E0D0EFF0D0D29FF181717FF181718FF141414FF0A090AFF0404
          04FF000000FF0E0E0EFF00000057000000000000000000000000000000001414
          14E31B1A1BFF1B1A1BFF100F79FF21202EFF313031FF1D1C1DFF131213FF1515
          15FF020102FF101010FF00000041000000000000000100000000000000001716
          17C11E1D1EFF414144FF3C37C4FF575686FF333032FF363536FF1D1C1DFF2322
          23FF0A0A0AFF141414FF0000001D000000000000000000000000000000000E0D
          0E78262426FF545352FF615EC1FF5A57ACFF4E4D4CFF2E2C2EFF272627FF1918
          19FF2E2E2EFF080808D300000000000000000000000000000000000000000000
          0004131313A3444242FF7486BAFF5D7FC4FFB9C1CCFF333132FF2A292AFF3838
          38FF1E1E1ECE0000002300000000000000000000000000000000000000000000
          0000000000002A3C599D6DA2F3FF6B9BE6FF5E91E2FF808998FF181718F50908
          0964000000000000000000000000000000000000000000000000000000000000
          0000000101026591D4E07AABF5FF77AAF5FF79A9F2FF6F93CAF00D0D0D2B0000
          0000000000000000000000000000000000000000000000000000000000000000
          00001721314489B7FAFF8CB8FAFF8AB7F9FF84B2F8FF5173A6CF0101010C0000
          0000000000000000000000000000000000000000000000000000000000000000
          00002F3F5B6C9AC2FDFF9EC5FEFF9CC3FDFF94BDFCFF8AB8FDFF1B212BB80000
          0000000000000000000000000000000000000000000000000000000000000000
          000038486070B4D2FFFFB3D1FFFFACCDFFFFA2C8FFFF576F93FF27303DFF0000
          0010000000000000000000000000000000000000000000000000000000000000
          00002D394B5EC4DCFFFFCCE0FFFFBED7FFFFABCFFFFF283039FF0A0A0AFF0101
          011D000000000000000000000000000000000000000000000000000000000000
          00001318204694A5BFFFA4B2CAFFADC2E0FF839AB9FF2F302FFF1A1A1AFC0000
          0005000000000000000000000000000000000000000000000000000000000000
          00000E0E0E7C414140FF4F4E4EFF535352FF525252FF444444FF202020B40000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000A0A0A38343434B6535353E44A4A4AE1232323A70101010F0000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000001700000027000000320000004000000040000000400000
          00400000001A0000001A00000000000000000000000000000000000000000000
          0000000000000000000000000015359F70FF359F70FF359F70FF359F70FF359F
          70FF0000000F0002010400020206000101020000000000000000000000000000
          0000000000000000000000000000359F70FF3DD7A8FF3DD7A8FF3DD7A8FF359F
          70FF000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000033A172FF14CB95FF14CA94FF14CA95FF33A2
          72FF000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000002FA575FF18CC96FF17CC97FF17CC97FF2FA5
          75FF000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000002BA978FF1BCE99FF1BCE99FF1BCD99FF2BA9
          79FF0000000000000000000000000000000005150F1D0000000026AD7CFF26AD
          7CFF26AE7CFF26AD7CFF27AD7CFF26AE7DFF20D09CFF20D09BFF1FD09CFF26AE
          7CFF27AE7CFF27AD7CFF26AD7CFF26AD7CFF26AD7CFF0000000022B280FF2FD3
          A2FF23D19EFF23D29EFF23D19EFF24D19EFF23D29EFF24D19EFF24D29EFF23D1
          9EFF24D19EFF24D29EFF23D29EFF37D4A5FF22B280FF000000001CB784FF39D5
          A6FF28D4A0FF27D4A0FF27D3A1FF28D3A0FF28D4A0FF28D3A1FF28D3A0FF28D3
          A1FF28D3A0FF28D3A0FF28D3A1FF3ED5A7FF1CB784FF0000000018BB88FFF5F9
          F7FF91F9D9FF91F9D9FF91F9D9FFF5F9F7FF30D8A6FF2CD5A3FF2FD7A5FFF5F9
          F7FF91F9D9FF91F9D9FF91F9D9FFF5F9F7FF18BB88FF0000000014BF8BFF14BF
          8BFF14C08BFF14BF8CFF14BF8BFF14BF8BFF37DAAAFF30D7A5FF3EDEAEFF14BF
          8BFF14BF8BFF14BF8BFF14BF8CFF14BF8BFF14BF8BFF00000000000000000000
          000000000000000000000000000010C38EFF40DFAFFF33D9A8FF48E2B3FF10C2
          8EFF000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000EC590FF4AE3B4FF36D9A9FF4FE6B7FF0EC5
          90FF000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000EC590FF50E6B7FF39DBABFF56E9BBFF0EC5
          90FF000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000EC590FFF5F9F7FF91F9D9FFF5F9F7FF0EC5
          90FF000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000EC590FF0EC590FF0EC590FF0EC590FF0EC5
          90FF000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000096EEFFFE8E8E8FFEAEAEAFFEBEBEBFFEBEBEBFFECECECFFEDED
          EDFFEDEDEDFFE9E9E9FF096EEFFF000000000000000000000000000000000000
          0000000000000557E0FFE9E9E9FFF1F1F1FFF3F3F3FFF5F5F5FFF7F7F7FFFAFA
          FAFFFCFCFCFFEDEDEDFF0557E0FF0000000000000000000000006C7376FF6C73
          76FF1F1F1FBF013DCFFFE9E9E9FFEDEDEDFFF0F0F0FFF2F2F2FFF4F4F4FFF6F6
          F6FFF8F8F8FFECECECFF013DCFFF1F1F1FBF6C7376FF6C7376FF7D7D7DFFAEAE
          AEFF2A2A2AFF000000FFE8E8E8FFEAEAEAFFECECECFFEFEFEFFFF1F1F1FFF3F3
          F3FFF5F5F5FFEBEBEBFF000000FF2A2A2AFFAEAEAEFF7D7D7DFFA4A4A4FFE8E8
          E8FF4D4D4DFF1A1A1AFFA3A3A3FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3
          A3FFA3A3A3FFA3A3A3FF1A1A1AFF4D4D4DFFE8E8E8FFA4A4A4FFB2B2B2FFEAEA
          EAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFB2B2B2FFBFBFBFFFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFBFBFBFFFCDCDCDFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDCDCDFFDADADAFFE8E8
          E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8
          E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFDADADAFFB7B9B9FFB7B9
          B9FFB7B9B9FFB7B9B9FFB7B9B9FFB7B9B9FFB7B9B9FFB7B9B9FFB7B9B9FFB7B9
          B9FFB7B9B9FFB7B9B9FFB7B9B9FFB7B9B9FFB7B9B9FFB5B7B7FF000000000000
          000000000000002FBAFFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7
          D7FFD7D7D7FFD7D7D7FF002FBAFF000000000000000000000000000000000000
          000000000000013ED0FFE8E8E8FFF5F5F5FFF2F2F2FFEFEFEFFFEDEDEDFFEAEA
          EAFFE8E8E8FFE8E8E8FF013ED0FF000000000000000000000000000000000000
          0000000000000558E1FFE8E8E8FFF8F8F8FFF6F6F6FFF3F3F3FFF0F0F0FFEDED
          EDFFEAEAEAFFE8E8E8FF0558E1FF000000000000000000000000000000000000
          000000000000096FF0FFE8E8E8FFFCFCFCFFF9F9F9FFF6F6F6FFF4F4F4FFF1F1
          F1FFEEEEEEFFE8E8E8FF096FF0FF000000000000000000000000000000000000
          0000000000000A72F2FFE8E8E8FFFEFEFEFFFDFDFDFFFAFAFAFFF7F7F7FFF4F4
          F4FFF1F1F1FFE8E8E8FF0A72F2FF000000000000000000000000000000000000
          00000000000000000000E8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8
          E8FFE8E8E8FFE8E8E8FF00000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000320000
          0040000000400000004000000040000000400000004000000040000000400000
          00400000004000000040000000400000004000000040000000324D80B1FF4D7F
          B0FF4E80B1FF4E7FB0FF4E7FB1FF4E7FB0FF4E80B1FF4E7FB1FF4E80B0FF4D80
          B0FF4E7FB0FF4D80B1FF4E7FB1FF4D80B1FF4E80B0FF4E7FB1FF4E81B2FF6195
          CAFF5487BAFF5789BDFF598CC0FF5B8FC2FF5D91C5FF5F93C8FF6295CBFF6296
          CBFF6598CEFF669AD0FF669AD0FF669BD0FF679AD0FF4F80B1FF5082B3FF679B
          D2FF5689BDFF578ABEFF598DC1FF5B8FC3FF5E91C7FF6094C9FF6297CBFF6297
          CCFF6698CFFF689CD2FF679CD2FF679CD2FF689CD1FF4F81B3FF5083B4FF6CA0
          D5FF6094C9FF5A8DC1FF5D90C4FF5F92C7FF6194C9FF6498CCFF6499CDFF669A
          CFFF699DD2FF689DD3FF699CD2FF699DD2FF689DD3FF5082B4FF5284B6FF70A4
          DAFF6A9FD4FF5D90C6FF5D90C6FF6093C9FF6296CDFF6599D0FF6499D0FF679B
          D3FF6BA0D7FF6BA0D7FF6BA0D7FF6BA0D7FF6BA0D7FF5286B7FF5385B7FF6DA2
          D8FF6FA2DAFF699DD4FF6195CBFF6397CDFF7E8CA1FF669AD0FF699DD5FF7E8C
          A1FF6DA1D9FF70A4DBFF6FA2DAFF6CA1D8FF6DA1D9FF5487B8FF5486B8FF6CA1
          D8FF6EA2D9FF6EA2D9FF6B9FD6FF679CD2FF7E8CA1FF7E8CA1FF7E8CA1FF7E8C
          A1FF6EA2DAFF6FA3DBFF74A8DEFF6EA2DAFF6EA2DAFF5588BAFF5588BAFF6DA2
          DAFF6FA3DAFF6DA2DAFF6EA2DAFF6EA2DAFF7E8CA1FF7E8CA1FF7E8CA1FF7E8C
          A1FF6FA4DBFF6FA4DCFF78ACE1FF74A8DEFF6FA4DBFF568ABBFF578ABCFF70A6
          DCFF70A5DDFF70A5DDFF70A6DCFF70A5DDFF7E8CA1FF7E8CA1FF7E8CA1FF7E8C
          A1FF71A5DDFF70A5DDFF77ABE0FF7BAFE4FF71A6DDFF588ABDFF598CBEFF72A7
          DEFF72A7DEFF72A6DEFF72A7DEFF72A7DEFF7E8CA1FF7E8CA1FF7E8CA1FF7E8C
          A1FF71A7DDFFE0E0E0FFD8DDE2FFBAD4EAFF75AAE0FF598CBDFF598DBEFF73A8
          DFFF73A8DEFF73A8DFFF73A7DFFF73A8DFFF7E8CA1FF7E8CA1FF7E8CA1FF7E8C
          A1FF73A8DEFFE0E0E0FFDCDFE1FFB2D1ECFF81B4E7FF598CBEFF5A8DBFFF73A8
          E0FF74A8E0FF74A9DFFF74A9E0FF73A8E0FF7E8CA1FF7E8CA1FF7E8CA1FF7E8C
          A1FF74A9E0FF74A8E0FF74A8DFFF89BDEDFF89BDEDFF5D90C2FF5A8DBFFF94C7
          F4FF94C7F4FF94C7F4FF94C7F4FF94C7F4FFC0C8D5FFC0C8D5FFC0C8D5FFC0C8
          D5FF94C7F4FF94C7F4FF94C7F4FF94C7F4FF94C7F4FF5A8DBFFF000000005A8D
          BFFF82B5E5FF82B5E5FF82B5E5FF82B5E5FFB3BBC8FFB3BBC8FFB3BBC8FFB3BB
          C8FF82B5E5FF82B5E5FF82B5E5FF82B5E5FF5A8DBFFF425C7582000000002D3E
          4F5870A3D4FF70A3D4FF70A3D4FF70A3D4FF849AB3FF849AB3FF849AB3FF849A
          B3FF70A3D4FF70A3D4FF70A3D4FF70A3D4FF547493A4090D1012}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000002726262F404B50933E4447821818
          171C000000000000000000000000000000000000000000000000000000000000
          00000000000027272835415058A023526AF20C567AFF18688DFF044E72FF023A
          5DFF194259EC3B464B8C1A1919200000000000000000000000001616171F334A
          55A926607AF8176186FF27739AFF3781A3FF4181A0FF4284A3FF2E6C8BFF2C6D
          8EFF246A8CFF0B597EFF044367FF154860F0283741940B0B0B0D0F2B38AB4291
          B9FF448AAAFF4A87A9FF498AA7FF4989A7FF4689AAFF4B8BABFF316F8DFF3475
          90FF397C9BFF397C99FF387999FF2E7696FF26799FFF00080D6C162D36985AA5
          C9FF4B8FADFF4D8FADFF4D8FADFF4D8FADFF4D90B0FF5091B1FF337493FF4082
          A0FF2D637CFF245366FF35708CFF3E809DFF4796BCFF020A0E59182E369361AF
          D3FF5397B3FF5496B6FF5496B6FF5496B6FF5699B9FF5997BDFF397D9BFF3D7D
          9AFF2E5C70FF35728BFF2D607DFF3C7590FF53A4CBFF030C0E551A2E36936AB6
          DDFF5D9CBEFF5C9CBEFF5D9CBEFF5C9CBEFF5D9DBFFF65A4C3FF4384A0FF4083
          9FFF38728CFF3A7591FF386B86FF2D5C72FF5BAAD2FF040B0D531C2D399175BE
          E8FF61A2C5FF5E9EC1FF5C9CBFFF63A4C6FF63A5C7FF6BAACFFF4686A4FF5096
          B8FF37687DFF306176FF27495BFF3C718BFF65B4DEFF030A0C511D2E368F7DCA
          F0FF64A5C6FF6CAFCBFF71B1CEFF66A9CAFF68AFCFFF75B3D5FF498CA9FF4E93
          B8FF5DA2C4FF3D7189FF2E5B70FF427E98FF6DC3E9FF05090B501D2E379081D0
          F5FF6FADD3FFA5E9FFFF8BCDE9FF68A6CEFF71B1D7FF7AB8DCFF5192B1FF5398
          B8FF5E9FC1FF5898B7FF5898B6FF41738AFF70C1E7FF050A0D501D2E388F8ED8
          FAFF77B7D9FF7CC3E6FF77C1E4FF73B2D6FF74B5DDFF80BADCFF528AAFFF4E8E
          B2FF5999BCFF5E9FC4FF63A4C6FF5FA3C6FF78C6ECFF04080B501E303B9892D8
          FFFF81BFE5FF6DB1D8FF7AB8DDFF94D3EDFF9ADEFCFF9BE4FFFF92DFFAFF83C3
          E0FF6AA7C7FF5D99BCFF5F9DBFFF5E9FC1FF73C1EAFF0206095A415E707993D6
          F5FF8FCFECFF91CDEAFF76B8DEFF5BA7D2FF59A5D1FF6AB4DBFF7CC4E4FF82D1
          ECFF8BD6EFFF89D1EBFF84CBE8FF7ABEDBFF7EC4E4FF1F313A48000000000000
          00000F191D212B47535E578EA6BF78BCD7FC74BEDAFF78B9DBFF64A7CDFF5D9F
          CCFF5396C3F347788FAA253C464E090F12140000000000000000000000000000
          00000000000000000000000000000B1215181E333A43416D7F92365B69780D17
          1B20010204050000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000201010107010101070000
          0002000000000000000000000000000000000000000000000000000000000000
          00000000000000000000070708193238437E7D8086C6586E9ADE2C509ADC2A43
          75BA1E25326C0505051200000000000000000000000000000000000000000000
          0000000000011A1F2B5C2B59B8EC8AA6DFFFECEBEAFFE9E8E7FFA8B7D5FF4572
          CEFF2A62D5FF2D519BDB14161A43000000000000000000000000000000000000
          00001B2231632A61D2FC5C86DAFFE8EAEFFFF1F0F0FFEEEDEDFFEBEAEAFFB5C1
          D9FF2B61D1FF2A62D5FF2B5ABAF014161A430000000000000000000000000A0B
          0E27285FCAF52F6BDCFFDFE6F3FFF8F7F7FFF5F5F5FFF2F2F2FFA9BEE4FF7E9F
          DFFF2F65D3FF2A62D5FF2A62D5FF2D519BDB050505120000000000000000233A
          659C2668E0FF2C70E5FFDFE9F9FFFBFBFBFFE5EBF6FF95B6EDFF276BE2FF2767
          DEFF2864D8FF2962D5FF2A62D5FF2A62D5FF1E25326C0000000001010104275F
          C3EA246DE7FF3075E5FF70A4F3FF74A7F4FF3E84F1FF2272EFFF236FEBFF256C
          E5FF2767DEFF2963D7FF2E64D4FF4A75CEFF364B76BF0000000204050618256C
          E4FE4483E7FF699AE3FF2D7AEFFF4A89E8FF2B7BF4FF2678F4FF2273F1FF236F
          EBFF256BE3FF2766DBFF99B1E3FFEAEAEBFF969CA6E3010101070506081D2770
          E8FF91B3E8FF4688EDFF5690EAFF3A84F5FF3984F5FF317FF5FF2678F4FF2272
          EFFF246DE7FF2668DFFFB2C5EBFFF4F4F4FFB8B7B7E501010107010101062F71
          DDF5BECFE8FF6EA0EAFF7AA4E5FF478CF6FF458BF6FF3984F5FF2B7BF4FF2274
          F1FF236EE9FF2669E0FF9EB8EBFFF9F9F9FF959595C900000002000000002A4F
          8CB5F4F5F7FFF6F6F5FFE9EBEFFF699AE5FF478CF6FF3A84F5FF2C7CF4FF2274
          F2FF236EE9FF2669E0FF7699DDFFF3F5FAFF4848498100000000000000001017
          2243D6E3F7FEFAF9F9FFF8F7F7FFF2F2F3FF8CADE1FF4B8BEBFF2879F4FF2272
          F0FF246DE8FF2B6BDFFFACBAD6FF4268B6EC0708081900000000000000000000
          0000334B6F96F3F7FCFFFBFBFBFFC8D9F2FFF5F5F6FF6EA0EBFF2473EDFF2370
          ECFF256BE4FF7296D7FFE9E8E8FC2A2B2D5F0000000000000000000000000000
          00000101010447577096F8F9FCFEABC5ECFFC5D5ECFF689AE6FFB9CBE8FF437D
          DFFF467DE0FF9DB0D1F637373767000000010000000000000000000000000000
          000000000000000000001C1F2443758092B5E8E9EBF6D0DDF0FFCAD6EBFE2B60
          C2EA525B6D9D1010102900000000000000000000000000000000000000000000
          000000000000000000000000000000000000020202070A0A0A1E070708190101
          0104000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000294F638E4587A8F24587A8F24587A8F24587A8F24587A8F24587
          A8F24587A8F24587A8F24587A8F24587A8F2294F638E00000000000000000000
          0000000000004688A9F292D6F2FF81CBEDFF81CBEDFF81CBEDFF81CBEDFF81CB
          EDFF81CBEDFF81CBEDFF81CBEDFF92D6F2FF4688A9F200000000000000005050
          468E898978F28C8F80FE909484FF8F9384FF8F9384FF8F9384FF8F9384FF8F93
          84FF8F9384FF8F9384FF89AAAFFF92D6F2FF488AABF200000000000000008B8B
          79F2E9E9DAFFE9E9DAFFE9E9DAFFE9E9DAFFE9E9DAFFE9E9DAFFE9E9DAFFE9E9
          DAFFE9E9DAFFE9E9DAFF919586FF92D6F2FF4B8CADF200000000000000008D8D
          7CF2EAEADCFFBBBBABFFBBBBABFFBBBBABFFBBBBABFFBBBBABFFBBBBABFFBBBB
          ABFFBBBBABFFEAEADCFF949888FF92D6F2FF4D8DAFF200000000000000009191
          80F2EBEBDEFFEBEBDEFFEBEBDEFFEBEBDEFFEBEBDEFFEBEBDEFFEBEBDEFFEBEB
          DEFFEBEBDEFFEBEBDEFF989C8CFF93D6F2FF5090B1F200000000000000009595
          84F2EDEDE1FFBBBBABFFBBBBABFFBBBBABFFBBBBABFFBBBBABFFBBBBABFFBBBB
          ABFFBBBBABFFEDEDE1FF9C9F90FF94D6F2FF5393B3F200000000000000009999
          89F2EFEFE4FFEFEFE4FFEFEFE4FFEFEFE4FFEFEFE4FFEFEFE4FFEFEFE4FFEFEF
          E4FFEFEFE4FFEFEFE4FFA0A395FF94D6F2FF5595B5F200000000000000009D9D
          8DF2F1F1E7FFBBBBABFFBBBBABFFBBBBABFFBBBBABFFBBBBABFFBBBBABFFBBBB
          ABFFBBBBABFFF1F1E7FFA3A79AFF95D6F2FF5898B8F20000000000000000A1A1
          91F2F3F3EAFFF3F3EAFFF3F3EAFFF3F3EAFFF3F3EAFFF3F3EAFFF3F3EAFFF3F3
          EAFFF3F3EAFFF3F3EAFFA8AC9DFF95D6F2FF5B9BBAF20000000000000000A5A5
          96F2F5F5EDFFBBBBABFFBBBBABFFBBBBABFFBBBBABFFBBBBABFFBBBBABFFBBBB
          ABFFBBBBABFFF5F5EDFFADB0A2FFA1DDF5FF5D9DBCF20000000000000000AAAA
          9BF2F7F7F0FFF7F7F0FFF7F7F0FFF7F7F0FFF7F7F0FFF7F7F0FFF7F7F0FFF7F7
          F0FFF7F7F0FFF7F7F0FFB3B6A7FFB8EDFCFF609EBEF20000000000000000AEAE
          9EF2F9F9F3FFBBBBABFFBBBBABFFBBBBABFFBBBBABFFF9F9F3FFF9F9F3FFF9F9
          F3FFF9F9F3FFF9F9F3FFB2B5A8FE62A0C0F2395E708E0000000000000000B1B1
          A2F2FAFAF5FFFAFAF5FFFAFAF5FFFAFAF5FFFAFAF5FFFAFAF5FFFAFAF5FFFAFA
          F5FFFAFAF5FFFAFAF5FFB1B1A2F2000000000000000000000000000000006969
          618EB3B3A5F2B3B3A5F2B3B3A5F2B3B3A5F2B3B3A5F2B3B3A5F2B3B3A5F2B3B3
          A5F2B3B3A5F2B3B3A5F26969618E000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000161616223D3D
          3D5F4D4D4D77555555845D5D5D915D5D5D906666669F686667A0686668A06666
          669F5D5D5D905D5D5D91555555844D4D4D773D3D3D5F161616220808080D2020
          202D2C2C2C3F3636364E3A3A3A5343424261423F415F454946713E46416C3B39
          3B59423F4161393939533636364E2C2C2C3F2020202D0909090D000000000000
          0000000000000000000000000000000000000000000011371F512BB15CFF174B
          2A6B000000000000000000000000000000000000000000000000000000000000
          0000000000000000000008221330217F47AA2DA95DE631AE61F632B264FF31B2
          63FF2CA55DE60B2D193B00000000000000000000000000000000000000000000
          00000000000019794A902AC175FF2AC075FF29C075FF28BF74FF29BF75FF29C0
          75FF25BE72FF37AD71D300000000000000000000000000000000000000000000
          000014754C8323CC83FF22CC83FF1FCB81FF19CA80FF2DD38BFF21CD82FF1ECA
          81FF31C786F1060D0910299B56D91C663A80000000000000000000000000041A
          122419D98FFF1AD48CFF15D38AFF32BD85D61D3429360307050A21C383E325D5
          8FFA060E0A0F1F9B59D52BBC70FF2DC274FF000000000000000000000000020E
          0913257E5B8A2EC68DDE31BB87CE0000000000000000000000001D855E851223
          1B240000000030C980F725C57AFF27C77BFF0C40284F00000000000000001A55
          2F7121733EAB1445286007170E1D000000000000000000000000000000000000
          000000000000258D5F9E1FCC82FF21CD84FF116A447800000000000000002591
          54BB2FB66BFF2FB66AFF2DB568FF35C473FF06110B1900000000000000000000
          000000000000149260A51DD38BFF1CD28AFF136A467200000000000000001E9A
          5FB826C57AFF26C57AFF24C378FF1A4A33550000000000000000000000010A59
          3B6302120C161BD890FE1AD890FF19D990FF0B32223A000000000000000017A1
          68B81CCF85FF1FD087FF1FD087FF127F519500000000000000000000000025E8
          A0FF18DB93FF19DA93FF18D992FF29C98CDF00000000000000000000000026B8
          7EC036B783CC17D58EFF1BD78FFF1BD78FFF139965AA052C1D37000000001D95
          67A818DA93FF1ADB94FF18DB93FF14BD7FDD0837263B00000000000000000206
          04090000000030B480C213D890FF18DA93FF19DA93FF1ADC94FF13B479CF0D40
          2D4A16DA92FF16DA92FF1BDB94FF33BE88CC0821182300000000000000000000
          0000000000000000000034B381BD1BDC94FF15D992FF17DA92FF16DA92FF0108
          05092CE39DFF32D898ED164C374E000000000000000000000000000000000000
          0000000000000000000000000000123A2A422C936BA52FBC85D632CE91E9061F
          152505150E210000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000040000000900000009000000090000000900000009000000090000
          0009000000090000000900000009000000040000000000000000000000000000
          000200000015000000290000002C0000002C0000002C0000002C0000002C0000
          002C0000002C0000002C00000029000000150000000200000000000000000000
          000400000019000A0046002D00A3004500E4004F00FF0000002C0000002C0000
          002C0000002C0000002C0000002A000000190000000400000000000000000000
          0001001A0050005300F605750EFF0A8C1BFF005701FF00000003000000030000
          0003000000030000000300000003000000030000000100000000000000000007
          0012005700ED07861AFF099220FF0E9A28FF026203FF00000000000000000000
          000000000000000D0024000D0024000000000000000000000000000000000039
          008D048013FF15A939FF13A737FF0C8F21FF016A03FF00000000000000000000
          0000001700390A7514F00C7817F0001700390000000000000000000000000060
          00D811A435FF13AB3CFF089222FF005800C6000D001E00000000000000000025
          00540E8518F810A233FF10A233FF149125F9022B035900000000000000000077
          00F61CBA4DFF1EBE50FF02850EFF001A003600000000000000000036006F037F
          05FF0D9B27FF13B244FF13B244FF0D9B27FF08880FFF0036006F00000000007F
          00F626C95CFF27CA5EFF008502FF000200030000000000000000000000000000
          0000008501FF27CA5EFF27CA5EFF008400FF0000000000000000000000000078
          00D825CA5BFF23CB5EFF0A9E16FF000C0015000000000000000000000000000A
          0012079912FF26CD60FF27CD60FF008900F60000000000000000000000000059
          009614BB43FF1ECC61FF2ACE5AFF036805A9001E003300040006000B00120058
          009319BE44FF1CCB60FF18C354FF008300DB000000000000000000000000001E
          003001A001FC2AD568FF1ED166FF31D765FF13B82EFF06A80CFF07A911FF1BC4
          48FF37DE72FF2DD86CFF01B12FFF005D00930000000000000000000000000000
          0000005B008A03B628FF2AD86BFF25D76CFF28D96DFF37DF72FF36DF72FF22D6
          6BFF32DC6FFF08C24CFF00A500F9001800240000000000000000000000000000
          0000000000000061008D00B512FF1ACD50FF36DE6EFF41E576FF38E173FF21D5
          64FF02BF3AFF00AC00F9003E005A000000000000000000000000000000000000
          000000000000000000000022003000690093009200CC00B400FC00B600FF009C
          00DB006D0099001E002A00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000090909465252
          52B5181818DE171717DD171717B10404043A0000000000000000000000000000
          00000707073D333333AF282828DB131313DC171717B508080846202020F67B7B
          7BFF232323FF1C1C1CFF222222FF101010DF0000000000000000000000000000
          00001B1A1AE44B4B4BFF313131FF161616FF222222FF171717F2151515CB7F7F
          7FE0464646EC505050EC2F2F2FE00E0E0EB70000000000000000000000000000
          0000161616BE6C6C6CDF484848EB535252ED464646E3111111C31E1E1EC3CDCD
          CDFF666666FF8D8D8DFF808080FF1A1A1AB30000000000000000000000000000
          00001C1C1CB9CDCDCDFF666666FF818080FF858585FF1E1E1EBF10101051BDBD
          BDFF5E5E5EF8626161E75E5E5EE20D0D0D460000000000000000000000000000
          00000F0F0F4A949494DB474747E2797978F9838383FF1010104D111111652A2A
          2AD4595959FB141414FD191919FC191919FD0A0A0A8C3C3C3CD1212121D01616
          1695282828FE4C4C4CFC141414FD1A1A1AFA262626D50A0A0A59121212A64747
          47E67E7E7EF9676767FF8A8A8AFF606060FC161616CF303030DE1B1B1BDD1919
          19D48A8A8AFB9D9D9DFF666666FF555555F9292929E60E0E0E9A16161686B1B1
          B1FFB5B5B5FF6D6D6DFF908F8FFF808080FF2323239E232323AA191919A62121
          21A1BDBDBDFFA8A8A8FF6E6E6EFF888888FF7F7F7FFF1A1A1A8012121258A7A7
          A7FFBDBDBDFF6B6B6BFF908F8FFF838383FF2424248C232323A4181818A02121
          2190BDBDBDFFA8A8A8FF6E6E6EFF8A8989FF7F7F7FFF151515520D0D0D439D9D
          9DFFC5C5C5FF696969FF8E8D8DFF868686FF2626268C232323A4181818A02121
          2190BDBDBDFFA8A8A8FF6E6E6EFF8B8B8BFF7D7D7DFF0F0F0F3D0909092E9191
          91FFC8C8C8FF525252FF6A6969FF737373FF3E3E3EE4565656E1262626E04242
          42E5979797FF8E8E8EFF575757FF838383FF7A7A7AFF0A0A0A280807072F4645
          45EA7F7F7FE0202020DA525252E8282828E61C1C1CC0464646D1232323CD2121
          21C24E4E4EE62D2D2DE71F1F1FD9383838E1414141EB070707260101010A1212
          1289191919BA151515D2828282EC1A1A1AE11A1A1AC0515151D6212121D52A2A
          2AC1292929E2161616ED141414D1191919BA1111118701010107000000000000
          00000000000011101064888888C6343434C7272727B700000000010101044E4E
          4EBB373737C72B2B2BC60D0D0D5A000000000000000000000000000000000000
          0000000000000E0E0E67858585E0202020E51F1F1FBF00000000010101073735
          35C52D2D2DE51F1F1FDF0B0B0B59000000000000000000000000000000000000
          0000000000000504042D6A6A6AB9161616BA1010108C00000000000000001716
          168E1F1F1FBA131313B804040429000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          002C000000330000003300000033000000330000003300000033000000330000
          0033000000330000003300000033000000330000003000000000000000009167
          3EE1A57340FFA3703CFFA3703BFFA4703CFFA5703CFFA4703BFFA3703BFFA270
          3AFFA2703AFFA2703AFFA3703BFFA57340FF9E7243F20000000000000000A573
          40FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA57340FF0000000000000000A370
          3CFFFFFFFFFFFFFFFFFFFFFFFFFFA6D6CBFF008863FFDFEFECFFFFFFFFFFFFFD
          FFFFFDFCFDFFFDFCFDFFFEFEFFFFFFFFFFFFA3703CFF0000000000000000A370
          3CFFFFFFFFFFFFFFFFFF80C5B2FF00895EFF008C62FF008F66FFDEECE8FFFFFC
          FFFFFCF9F9FFF9F7F7FFF9F9FAFFFFFFFFFFA3703BFF0000000000000000A571
          3DFFFFFFFFFF56B898FF008E5CFF009263FF019463FF009161FF019364FFDCEA
          E5FFFFFBFDFFFAF7F7FFF7F7F7FFFFFFFFFFA3703BFF0000000000000000A672
          3DFFFFFFFFFF008F56FF00945EFF089966FF55B794FF00945DFF00945EFF0398
          62FFA1D3C0FFFFF8FBFFF8F5F6FFFEFFFFFFA3703CFF0000000000000000A772
          3EFFFFFFFFFF009251FF00995DFFDAE7E1FFFFFBFFFF59B994FF009657FF0098
          5BFF009456FFA1D2BEFFFFF6FBFFFFFFFFFFA4713CFF0000000000000000A672
          3DFFFFFFFFFF009750FFD0E2D9FFFBF1F4FFF7F0F1FFFFF4F8FF8FCCB2FF0099
          54FF009B5AFF009754FF9DD3BDFFFFFFFFFFA5713DFF0000000000000000A571
          3CFFFFFFFFFFF6EEF1FFF2ECEDFFEDEAEAFFECE9E9FFF0EBEBFFFCEFF3FF9ED1
          BAFF009C51FF009E56FF009A4DFFFFFFFFFFA6723EFF0000000000000000A471
          3CFFFCFFFFFFE9E7E7FFE8E6E5FFE7E6E5FFE7E6E5FFE8E6E5FFECE8E8FFF8EB
          F0FF9BD1B7FF009F4DFF009E4BFFFFFFFFFFA7723EFF0000000000000000A471
          3CFFFCFFFFFFE5E3E3FFE5E2E1FFE5E3E2FFE5E3E2FFE5E3E2FFE6E3E2FFEAE4
          E5FFF5E8ECFF95CEB0FF009D3EFFFFFFFFFFA6723DFF0000000000000000A471
          3DFFFEFFFFFFE1E1E1FFE1E0E0FFE2E0E0FFE2E0E0FFE2E0E0FFE2E0E0FFE2E0
          E1FFE6E2E2FFECE3E6FFEEE4E9FFFFFFFFFFA5723DFF0000000000000000A674
          40FFFFFFFFFFF5F8FEFFF5F8FDFFF5F8FDFFF5F8FDFFF5F8FDFFF5F8FDFFF5F8
          FDFFF5F8FDFFF6F8FEFFF7F9FFFFFFFFFFFFA67440FF0000000000000000835E
          38C5A67440FFA4723DFFA4723DFFA4723DFFA4723DFFA4723DFFA4723DFFA472
          3DFFA4723DFFA4723DFFA4723DFFA67440FF9E7243EF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000D0F282D2C3281923F49BDD54754D8F64754D7F53F48
          B9D32B317F8F0D0E252A00000000000000000000000000000000000000000000
          000014151C20A4A9CEEA4D59E1FF4C57E2FF4C57E2FF4C57E2FF4C57E2FF4C57
          E2FF4C57E2FF4C57DFFE2B318090020206070000000000000000000000000D0E
          161ACCCCD1FEDEDEDDFFCCCDE2FF4D59E1FF4C57E2FF4C57E2FF4C57E2FF4C57
          E2FF4C57E2FF4C57E2FF4C57E2FF373FA5BA0202060700000000000000009192
          C6DEE6E5E4FFD4D2CFFFDEDEDDFFCCCDE2FF4E58E1FF4C57E2FF4C57E2FF4C57
          E2FF4C57E2FF4C57E2FF4C57E2FF4C57E2FF2B318191000000000E102B30535E
          E4FFC3C5E8FFE6E5E4FFD4D2CFFFDFDFDFFFDDDDE2FFB6B9E0FFB8BCE0FF9BA0
          DFFF515BE2FF4C57E2FF4C57E2FF4C57E2FF4C57DFFE0D0E252A2C3486974C57
          E2FF535DE4FFC2C5E8FFE7E6E5FFE4E4E4FFE1E1E1FFE1E1E1FFE1E1E1FFE1E1
          E1FFDEDFE2FF6F77E0FF4C57E2FF4C57E2FF4C57E2FF2B317F8F4148BFD94C57
          E2FF4C57E2FF545FE4FFD3D3E9FFEDEDEDFFE6E6E6FFE1E1E1FFE1E1E1FFE1E1
          E1FFE1E1E1FFDCDCE2FF4C57E1FF4C57E2FF4C57E2FF3F48B9D34B53DEFA4C57
          E2FF4C57E2FF4C57E2FF969BE3FFEDEDEDFFEDEDEDFFE1E1E6FFC1C3E3FFDCDC
          E3FFE1E1E1FFE1E1E1FF8088E0FF4C57E2FF4C57E2FF4754D7F54B53DEFA4C57
          E2FF4C57E2FF4C57E2FF999EE2FFEDEDEDFFEDEDEDFFA6AAE4FF4C57E2FF5963
          E3FFDBDCE3FFE1E1E1FF999FE1FF4C57E2FF4C57E2FF4754D8F6404BC0DB4C57
          E2FF4C57E2FF4C57E2FF858BE2FFEDEDEDFFEDEDEDFFCCCEE7FF545EE1FF4C57
          E2FF5B66E3FFDBDCE3FF727AE2FF4C57E2FF4C57E2FF3F49BDD52E3488994C57
          E2FF4C57E2FF4C57E2FF545FE4FFD7D8EAFFEDEDEDFFEDEDEDFFCBCDE7FF5660
          E0FF4C57E2FF4E59E2FF4C57E2FF4C57E2FF4C57E2FF2C3281920F112D334C57
          E2FF4C57E2FF4C57E2FF4C57E2FF6A74E4FFD2D3EAFFEDEDEDFFEDEDEDFFCED1
          E8FF4E59E2FF4C57E2FF4C57E2FF4C57E2FF4C57E2FF0D0F282D000000002F36
          8B9D4C57E2FF4C57E2FF4C57E2FF4C57E2FF4E59E2FF7F86E5FF8F95E5FF757D
          E5FF4C57E2FF4C57E2FF4C57E2FF4C57E2FF2C33839500000000000000000303
          090A3943ADC34C57E2FF4C57E2FF4C57E2FF4C57E2FF4C57E2FF4C57E2FF4C57
          E2FF4C57E2FF4C57E2FF4C57E2FF3940A9BF0203070800000000000000000000
          00000303090A2F368B9D4C57E2FF4C57E2FF4C57E2FF4C57E2FF4C57E2FF4C57
          E2FF4C57E2FF4C57E2FF2D348798030308090000000000000000000000000000
          000000000000000000000F112D332E348899404BC0DB4B53DEFA4B53DEFA4148
          BFD92C3486970E102B3000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0023000000330000003300000033000000330000003300000033000000330000
          0033000000330000003300000033000000230000000000000000000000004837
          2BC0664F3DFF664E3CFF664D3BFF664E3CFF664E3CFF664E3CFF664E3CFF664E
          3CFF664D3BFF664E3CFF664F3DFF48372BC00000000000000000000000006F5B
          49FF8D8270FF8C806EFF8D816FFF8E826FFF8F8370FF908470FF8F8370FF8E82
          70FF8D816FFF8C816FFF8E8371FF664E3CFF000000000000000000000000725D
          4BFFA19482FF857967FF867A68FF897D6AFF78644EFF634F43FF78644EFF897D
          6AFF867A68FF857967FFA29583FF644C3AFF0000000000000000000000007762
          50FFB6A795FF938775FF908370FF735B46FF634D3DFF002CBFFF6B4F33FF6E57
          43FF8E7F6DFF948876FFB7A997FF634B39FF0000000000000000000000006952
          40FFB7A997FFAEA391FF6A5240FF664C36FF5F535DFF0021D6FF90785EFF644C
          37FF664E3CFFAFA492FFB9A997FF644C3AFF0000000000000000000000000D0A
          082168513FF9A28F7DFF887461FF634831FFDACBB5FF083CD7FFD9CBB6FF6349
          33FF796351FFA3907EFF604C3CE40E0B08220000000000000000000000000000
          00000000000022191359523B29DF5F3F26FFC9D6E7FF0012C8FFD5D9D2FF6447
          2FFF5A4432E01C15104500000000000000000000000000000000000000000000
          000000000000000000000000000038454E7374B3CFFF619FBCFF3B7794FF3641
          4872000000010000000000000000000000000000000000000000000000000000
          0000000000000000001B000000334A809FD083C9EBFF504139FF524842FF3A3B
          3CBE010101360000001B00000000000000000000000000000000000000000000
          000000000000171517A01C1515FF73B7DFFF8ED3F4FF81C5E8FF75BADFFF5A8D
          ADFF534F4DFF1A191B9F00000000000000000000000000000000000000000000
          000000000000494647FF463D3BFF82CDF2FFA0E5FFFF8ED1F1FF82C5E6FF5996
          BFFF47403EFF494647FF00000000000000000000000000000000000000000000
          00000000000032313182595450FF2A5C83FF356E9DFF6698BFFF76B1D5FF5175
          94FF585451FF3130308200000000000000000000000000000000000000000000
          00000000000000000000595552FF3D6A87FF408CC0FF548FBEFF3E6B9CFF394B
          66FF585553FF0000000000000000000000000000000000000000000000000000
          0000000000000000000034333297565656FF417396FF427BA2FF42627FFF5555
          54FF343432970000000000000000000000000000000000000000000000000000
          000000000000000000000000000034333297595552FF595451FF595553FF3434
          3297000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000001B00000022020B083002090729000000160000
          0010000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000001904140F4F1E916CF40A32256E000000350000
          00330000002C0000002200000019000000000000000000000000000000000000
          0000000000000000000004110D1D1D8F6AEC2CCB9FFE1E9C75F30A3426560000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000030E0B181C8D69E928C99DFD20D2A6FF28D0A4FF1D906DEF0310
          0C1B000000000000000000000000000000000000000000000000000000000000
          0000020C09141C8B68E625CDA1FB20D2A6FFFFFFFFFF1FD1A6FF24BB91FC187A
          5BC8000100010000000000000000000000000000000000000000000000000209
          07101B8966E223CA9FF920D2A6FF2EDAB0FF29AA83FF2EDAB0FF21D2A7FF1EA1
          7AF30E46347400000000000000000000000000000000000000000107050C1C8A
          66E421C89DF61FD1A6FF42E1BBFF1F9C73EF1968509D1E9C73F12EDAB0FF22CF
          A4FF1D9470F10519132A0000000000000000000000000000000032A582FF2EDA
          B0FF21D0A5FF7CF2D6FF22A478F008271D3A000000000C3B2B581E9E74F12EDA
          B0FF20C398FE1C8966DC010403060000000000000000000000000B241D3832A5
          82FF8DF8E0FF29AC83F50A3023430000000000000000000000000A33264C1E9E
          75F01FCB9FFF1FAC84F4135D4591000000000000000000000000000000000B24
          1D3832A582FF08291E390000000000000000000000000000000000000000092D
          214320A278F01FC89CFF1FA078F108281E3F0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000008261C3922A278EF20C195FF219B73E8020A070F00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000721193122A479ED21B287FB197456AE00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000061C142923A178EB25AC7FFF0C3A2B58000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000517112223A177EA24A57AF5000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000004130E1C229C74E3000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000030F0B16}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000403E3953B1AD9EE8B2AA9FE73B39344C000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000043413C57B1AB9CE5252421302D2B283AB1AB9CE5000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000043413C57B1AB9CE5201F1D2A0000000026252231B2AA9FE7000000000000
          000000000000312F2B3F837F75ABB1AD9EE8C3BCAEFCB1AD9EE8837F75AA5E5B
          547AB1AB9CE5201F1D2A0000000021201E2BB1AB9CE5403E3953000000000303
          030476716A99ABA599DD4D4B45641514131B020202031615131C504D47679791
          87C4201F1D2A0000000022211E2CB2AA9FE643413C5700000000000000007671
          6A998C877DB5120F08157C560282D49103DEEFA503FCD39203DD7B5502810906
          00090000000022211E2CB2AA9FE643413C57000000000000000031302C40AAA4
          98DC120E0714C08602CAA06F02A7281C002A04030004291C012BA37102AABF85
          02C8090600099A9389C75E5B547A000000000000000000000000857F77AC4C4A
          44637E570284A06F02A70000000000000000000000000000000000000000A371
          02AA7B550281504D4767837F75AA000000000000000000000000B5ADA2EA1313
          1119D59403E0261B00280000000000000000000000000000000000000000291C
          012BD39203DD1615131CB1AD9EE8000000000000000000000000C1BDAFFD0201
          0102F0A803FD0403000400000000000000000000000000000000000000000403
          0004EFA503FC02020203C3BCAEFC000000000000000000000000B5ADA2EA1312
          1118D69303E1281C002A0000000000000000000000000000000000000000281C
          002AD49103DE1514131BB1AD9EE8000000000000000000000000868177AD4B48
          43617F580285A06F02A70000000000000000000000000000000000000000A06F
          02A77C5602824D4B4564837F75AB00000000000000000000000034322E43A8A2
          96DA120E0614C18702CBA06F02A7281C002A04030004261B0028A06F02A7C086
          02CA120F0815ABA599DD312F2B3F000000000000000000000000000000007975
          6C9D8A857CB3120E06147F580285D69303E1F0A803FDD59403E07E570284120E
          07148C877DB576716A9900000000000000000000000000000000000000000303
          030479756C9DA8A296DA4B4843611312111802010102131311194C4A4463A7A1
          95DB76716A990303030400000000000000000000000000000000000000000000
          00000000000034322E43868177ADB5ADA2EAC1BDAFFDB5ADA2EA857F77AC3130
          2C40000000000000000000000000000000000000000000000000}
      end>
  end
  object qCidade: TUniQuery
    Tag = 7100
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT'#9'cd.codigo, '
      #9'cd.cidade, '
      #9'cd.uf'
      '  FROM  cidades cd'
      ' ORDER BY cidade ASC;')
    DetailFields = 'pessoa'
    Left = 648
    Top = 144
  end
  object dsCidade: TUniDataSource
    DataSet = qCidade
    Left = 696
    Top = 144
  end
  object qPais: TUniQuery
    Tag = 7100
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT codigo, pais'
      '  FROM paises;')
    DetailFields = 'pessoa'
    Left = 552
    Top = 144
  end
  object dsPais: TUniDataSource
    DataSet = qPais
    Left = 600
    Top = 144
  end
  object qSQL: TUniQuery
    Connection = Connection.Conn
    SQL.Strings = (
      'select 1')
    Left = 752
    Top = 8
  end
  object qEndCobranca: TUniQuery
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
      'SELECT pec.codigo, '
      #9'pec.pessoa, '
      #9'pec.endereco, '
      #9'pec.endereco_numero, '
      #9'pec.complemento, '
      #9'pec.referencia, '
      #9'pec.bairro, '
      #9'pec.cep, '
      #9'pec.cidade, '
      #9'pec.uf, '
      #9'pec.pais, '
      #9'pec.tel1, '
      #9'pec.tel2, '
      #9'pec.tel3'
      '   FROM pessoa_endereco_cobranca pec'
      '  WHERE pec.pessoa = :codigo ;')
    MasterSource = ds
    MasterFields = 'codigo'
    DetailFields = 'pessoa'
    Left = 632
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = 0
      end>
    object qEndCobrancacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qEndCobrancapessoa: TIntegerField
      FieldName = 'pessoa'
      Required = True
    end
    object qEndCobrancaendereco: TStringField
      FieldName = 'endereco'
      Required = True
      Size = 250
    end
    object qEndCobrancaendereco_numero: TStringField
      FieldName = 'endereco_numero'
      Required = True
      FixedChar = True
    end
    object qEndCobrancacomplemento: TStringField
      FieldName = 'complemento'
      Size = 100
    end
    object qEndCobrancareferencia: TStringField
      FieldName = 'referencia'
      Size = 150
    end
    object qEndCobrancabairro: TStringField
      FieldName = 'bairro'
      Required = True
      Size = 200
    end
    object qEndCobrancacep: TStringField
      FieldName = 'cep'
      Required = True
      EditMask = '00000\-999;0;_'
      Size = 15
    end
    object qEndCobrancacidade: TIntegerField
      FieldName = 'cidade'
      Required = True
    end
    object qEndCobrancauf: TStringField
      FieldName = 'uf'
      Required = True
      Size = 2
    end
    object qEndCobrancapais: TIntegerField
      FieldName = 'pais'
      Required = True
    end
    object qEndCobrancatel1: TStringField
      FieldName = 'tel1'
    end
    object qEndCobrancatel2: TStringField
      FieldName = 'tel2'
    end
    object qEndCobrancatel3: TStringField
      FieldName = 'tel3'
    end
  end
  object dsEndCob: TUniDataSource
    DataSet = qEndCobranca
    Left = 296
    Top = 464
  end
  object qEndEntrega: TUniQuery
    Tag = 7100
    SQLInsert.Strings = (
      'INSERT INTO pessoa_endereco_entrega'
      
        '  (pessoa, endereco, endereco_numero, complemento, referencia, b' +
        'airro, cep, cidade, uf, pais, tel1, tel2, tel3)'
      'VALUES'
      
        '  (:pessoa, :endereco, :endereco_numero, :complemento, :referenc' +
        'ia, :bairro, :cep, :cidade, :uf, :pais, :tel1, :tel2, :tel3)')
    SQLDelete.Strings = (
      'DELETE FROM pessoa_endereco_entrega'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE pessoa_endereco_entrega'
      'SET'
      
        '  pessoa = :pessoa, endereco = :endereco, endereco_numero = :end' +
        'ereco_numero, complemento = :complemento, referencia = :referenc' +
        'ia, bairro = :bairro, cep = :cep, cidade = :cidade, uf = :uf, pa' +
        'is = :pais, tel1 = :tel1, tel2 = :tel2, tel3 = :tel3'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM pessoa_endereco_entrega'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT pessoa, endereco, endereco_numero, complemento, referenci' +
        'a, bairro, cep, cidade, uf, pais, tel1, tel2, tel3 FROM pessoa_e' +
        'ndereco_entrega'
      'WHERE'
      '  codigo = :P_1_codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM pessoa_endereco_entrega'
      ''
      ') t')
    Connection = Connection.Conn
    SQL.Strings = (
      'SELECT pee.codigo,'
      #9'pee.pessoa,'
      #9'pee.endereco,'
      #9'pee.endereco_numero,'
      #9'pee.complemento,'
      #9'pee.referencia,'
      #9'pee.bairro,'
      #9'pee.cep,'
      #9'pee.cidade,'
      #9'pee.uf,'
      #9'pee.pais,'
      #9'pee.tel1,'
      #9'pee.tel2,'
      #9'pee.tel3'
      '   FROM pessoa_endereco_entrega pee'
      '  WHERE pee.pessoa = :codigo ;')
    MasterSource = ds
    MasterFields = 'codigo'
    DetailFields = 'pessoa'
    Left = 696
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
        Value = 0
      end>
    object qEndEntregacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qEndEntregapessoa: TIntegerField
      FieldName = 'pessoa'
      Required = True
    end
    object qEndEntregaendereco: TStringField
      FieldName = 'endereco'
      Required = True
      Size = 250
    end
    object qEndEntregaendereco_numero: TStringField
      FieldName = 'endereco_numero'
      Required = True
      FixedChar = True
    end
    object qEndEntregacomplemento: TStringField
      FieldName = 'complemento'
      Size = 100
    end
    object qEndEntregareferencia: TStringField
      FieldName = 'referencia'
      Size = 150
    end
    object qEndEntregabairro: TStringField
      FieldName = 'bairro'
      Required = True
      Size = 200
    end
    object qEndEntregacep: TStringField
      FieldName = 'cep'
      Required = True
      EditMask = '00000\-999;0;_'
      Size = 15
    end
    object qEndEntregacidade: TIntegerField
      FieldName = 'cidade'
      Required = True
    end
    object qEndEntregauf: TStringField
      FieldName = 'uf'
      Required = True
      Size = 2
    end
    object qEndEntregapais: TIntegerField
      FieldName = 'pais'
      Required = True
    end
    object qEndEntregatel1: TStringField
      FieldName = 'tel1'
    end
    object qEndEntregatel2: TStringField
      FieldName = 'tel2'
    end
    object qEndEntregatel3: TStringField
      FieldName = 'tel3'
    end
  end
  object dsEndEntrega: TUniDataSource
    DataSet = qEndEntrega
    Left = 328
    Top = 464
  end
end