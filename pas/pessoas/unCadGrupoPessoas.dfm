inherited frmCadGrupoPessoas: TfrmCadGrupoPessoas
  Caption = 'Grupo de Pessoas'
  ClientHeight = 369
  ClientWidth = 541
  ExplicitWidth = 547
  ExplicitHeight = 398
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 334
    Width = 541
    ExplicitTop = 334
    ExplicitWidth = 541
    inherited btnCancelar: TButton
      Left = 264
      ExplicitLeft = 264
    end
    inherited btnSalvar: TButton
      Left = 357
      ExplicitLeft = 357
    end
    inherited btnFechar: TButton
      Left = 450
      ExplicitLeft = 450
    end
  end
  inherited grpContent: TGroupBox
    Width = 531
    Height = 282
    ExplicitWidth = 531
    ExplicitHeight = 282
    object lblCodigo: TLabel
      Left = 10
      Top = 24
      Width = 41
      Height = 15
      Caption = 'C'#243'digo:'
      FocusControl = edtCodigo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDescricao: TLabel
      Left = 111
      Top = 24
      Width = 57
      Height = 15
      Caption = 'Descri'#231#227'o:'
      FocusControl = edtDescricao
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
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
      Left = 174
      Top = 21
      DataBinding.DataField = 'nome'
      DataBinding.DataSource = ds
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      Width = 352
    end
    object grpConfiguracoes: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 107
      Width = 521
      Height = 170
      Align = alBottom
      Caption = ' Configura'#231#245'es do Grupo '
      TabOrder = 3
      object lblMotivoBloqueio: TLabel
        Left = 10
        Top = 140
        Width = 43
        Height = 15
        Caption = 'Motivo:'
        FocusControl = edtMotivoBloqueio
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTabelaPreco: TLabel
        Left = 10
        Top = 24
        Width = 95
        Height = 15
        Caption = 'Tabela de pre'#231'os:'
        FocusControl = edtTabelaPreco
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPrecosFatura: TLabel
        Left = 10
        Top = 53
        Width = 133
        Height = 15
        Caption = 'Tabela de pre'#231'os Fatura:'
        FocusControl = edtPrecosFatura
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblFormaPgto: TLabel
        Left = 10
        Top = 82
        Width = 125
        Height = 15
        Caption = 'Forma de Pgto Padr'#227'o:'
        FocusControl = edtFormaPgto
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblLimite: TLabel
        Left = 10
        Top = 111
        Width = 98
        Height = 15
        Caption = 'Limite de cr'#233'dito:'
        FocusControl = edtLimite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object chbBloqueado: TcxDBCheckBox
        Left = 240
        Top = 108
        Caption = 'Bloqueado?'
        DataBinding.DataField = 'bloqueado'
        DataBinding.DataSource = ds
        Style.TextStyle = [fsBold]
        TabOrder = 7
        Width = 95
      end
      object edtMotivoBloqueio: TcxDBTextEdit
        Left = 59
        Top = 137
        DataBinding.DataField = 'mot_bloq'
        DataBinding.DataSource = ds
        Properties.CharCase = ecUpperCase
        TabOrder = 8
        Width = 448
      end
      object edtTabelaPreco: TcxDBSpinEdit
        Left = 111
        Top = 21
        DataBinding.DataField = 'tabela_preco'
        DataBinding.DataSource = ds
        Enabled = False
        Properties.SpinButtons.Visible = False
        TabOrder = 0
        Width = 48
      end
      object edtPrecosFatura: TcxDBSpinEdit
        Left = 149
        Top = 50
        DataBinding.DataField = 'tabela_preco_fatura'
        DataBinding.DataSource = ds
        Enabled = False
        Properties.SpinButtons.Visible = False
        TabOrder = 2
        Width = 48
      end
      object edtFormaPgto: TcxDBSpinEdit
        Left = 141
        Top = 79
        DataBinding.DataField = 'forma_pgto'
        DataBinding.DataSource = ds
        Enabled = False
        Properties.SpinButtons.Visible = False
        TabOrder = 4
        Width = 48
      end
      object edtLimite: TcxDBCalcEdit
        Left = 114
        Top = 108
        DataBinding.DataField = 'limite'
        DataBinding.DataSource = ds
        TabOrder = 6
        Width = 120
      end
      object cbbTabelaPrecos: TcxDBLookupComboBox
        Left = 165
        Top = 21
        Enabled = False
        Properties.ListColumns = <>
        TabOrder = 1
        Width = 342
      end
      object cbbTabelaFatura: TcxDBLookupComboBox
        Left = 203
        Top = 50
        Enabled = False
        Properties.ListColumns = <>
        TabOrder = 3
        Width = 304
      end
      object cbbFormaPgto: TcxDBLookupComboBox
        Left = 195
        Top = 79
        Enabled = False
        Properties.ListColumns = <>
        TabOrder = 5
        Width = 312
      end
    end
    object rgTipoGrupo: TcxDBRadioGroup
      AlignWithMargins = True
      Left = 5
      Top = 50
      Align = alBottom
      Caption = ' Tipo de Grupo '
      DataBinding.DataField = 'tipo'
      DataBinding.DataSource = ds
      Properties.Columns = 5
      Properties.Items = <
        item
          Caption = 'Cliente'
          Value = 'C'
        end
        item
          Caption = 'Colaborador'
          Value = 'L'
        end
        item
          Caption = 'Fornecedor'
          Value = 'F'
        end
        item
          Caption = 'Representante'
          Value = 'R'
        end
        item
          Caption = 'Transportador'
          Value = 'T'
        end>
      TabOrder = 2
      Height = 51
      Width = 521
    end
  end
  inherited pnlHelp: TPanel
    Width = 532
    ExplicitWidth = 532
    inherited mmoHelp: TMemo
      Width = 485
      ExplicitWidth = 485
    end
  end
  inherited ds: TUniDataSource
    Left = 344
    Top = 0
  end
  inherited qConsulta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO pessoa_grupos'
      
        '  (empresa, nome, tipo, bloqueado, motivo_bloqueio, tabela_preco' +
        ', forma_pgto, tabela_preco_fatura, bloqueia_geracao_ponto, limit' +
        'e, desconto_pedido)'
      'VALUES'
      
        '  (:empresa, :nome, :tipo, :bloqueado, :motivo_bloqueio, :tabela' +
        '_preco, :forma_pgto, :tabela_preco_fatura, :bloqueia_geracao_pon' +
        'to, :limite, :desconto_pedido)')
    SQLDelete.Strings = (
      'DELETE FROM pessoa_grupos'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE pessoa_grupos'
      'SET'
      
        '  empresa = :empresa, nome = :nome, tipo = :tipo, bloqueado = :b' +
        'loqueado, motivo_bloqueio = :motivo_bloqueio, tabela_preco = :ta' +
        'bela_preco, forma_pgto = :forma_pgto, tabela_preco_fatura = :tab' +
        'ela_preco_fatura, bloqueia_geracao_ponto = :bloqueia_geracao_pon' +
        'to, limite = :limite, desconto_pedido = :desconto_pedido'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM pessoa_grupos'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT empresa, nome, tipo, bloqueado, motivo_bloqueio, tabela_p' +
        'reco, forma_pgto, tabela_preco_fatura, bloqueia_geracao_ponto, l' +
        'imite, desconto_pedido FROM pessoa_grupos'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM pessoa_grupos'
      ''
      ') t')
    SQL.Strings = (
      'SELECT '#9'gp.codigo, '
      #9'gp.nome, '
      #9'gp.tipo, '
      #9'gp.bloqueado, '
      #9'gp.motivo_bloqueio, '
      #9'gp.tabela_preco, '
      #9'gp.forma_pgto, '
      #9'gp.tabela_preco_fatura, '
      #9'gp.bloqueia_geracao_ponto, '
      #9'gp.limite, '
      #9'gp.desconto_pedido,'
      #9'gp.empresa'
      '  FROM  pessoa_grupos gp'
      ' WHERE  gp.codigo = :codigo;')
    Left = 304
    Top = 0
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 260
  end
end
