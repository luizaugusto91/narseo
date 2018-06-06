inherited frmGridTipoImovel: TfrmGridTipoImovel
  Caption = 'Tipo de Imovel'
  ClientHeight = 366
  ClientWidth = 700
  ExplicitWidth = 716
  ExplicitHeight = 405
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotton: TPanel
    Top = 326
    Width = 700
    ExplicitTop = 326
    ExplicitWidth = 700
    inherited btnNovo: TButton
      Left = 316
      OnClick = btnNovoClick
      ExplicitLeft = 316
    end
    inherited btnVisualizar: TButton
      Left = 412
      OnClick = btnVisualizarClick
      ExplicitLeft = 412
    end
    inherited btnEditar: TButton
      Left = 508
      OnClick = btnEditarClick
      ExplicitLeft = 508
    end
    inherited btnExcluir: TButton
      Left = 604
      Enabled = False
      ExplicitLeft = 604
    end
  end
  inherited grpLista: TGroupBox
    Width = 688
    Height = 269
    ExplicitWidth = 688
    ExplicitHeight = 269
    inherited pnlFuncoes: TPanel
      Left = 649
      Height = 243
      ExplicitLeft = 649
      ExplicitHeight = 243
    end
    inherited Grid: TcxGrid
      Width = 641
      Height = 243
      ExplicitWidth = 641
      ExplicitHeight = 243
      inherited View: TcxGridDBTableView
        OnDblClick = ViewDblClick
        object ColViewID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'codigo'
          Width = 60
        end
        object ColViewDescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'descricao'
          Width = 300
        end
        object ColViewBloqueado: TcxGridDBColumn
          Caption = 'Bloqueado'
          DataBinding.FieldName = 'bloqueado'
          Width = 70
        end
      end
    end
  end
  inherited grpFiltro: TGroupBox
    Top = 278
    Width = 688
    Visible = False
    ExplicitTop = 278
    ExplicitWidth = 688
    inherited Label1: TLabel
      Left = 436
      ExplicitLeft = 436
    end
    inherited lblLimite: TLabel
      Left = 556
      ExplicitLeft = 556
    end
    inherited cbbCampo: TcxComboBox
      Style.IsFontAssigned = True
      ExplicitHeight = 23
    end
    inherited cbbExpressao: TcxComboBox
      Style.IsFontAssigned = True
      ExplicitHeight = 23
    end
    inherited edtValor: TcxTextEdit
      Style.IsFontAssigned = True
      ExplicitWidth = 160
      ExplicitHeight = 23
      Width = 160
    end
    inherited edtLimit: TcxTextEdit
      Left = 598
      Style.IsFontAssigned = True
      ExplicitLeft = 598
      ExplicitHeight = 23
    end
    inherited cbbOrdem: TcxComboBox
      Left = 482
      Style.IsFontAssigned = True
      ExplicitLeft = 482
      ExplicitHeight = 23
    end
    inherited btnSearch: TButton
      Left = 652
      ExplicitLeft = 652
    end
    inherited btnClear: TButton
      Left = 405
      ExplicitLeft = 405
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited qConsulta: TUniQuery
    SQL.Strings = (
      'SELECT '#9'ti.codigo, '
      #9'ti.descricao, '
      #9'ti.bloqueado'
      '  FROM tipo_imovel ti'
      ' order by ti.descricao;')
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
