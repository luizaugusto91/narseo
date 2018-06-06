inherited frmGridFrota: TfrmGridFrota
  Tag = 2211
  Caption = 'Cadastro de Frota'
  ClientHeight = 400
  ClientWidth = 900
  ExplicitWidth = 916
  ExplicitHeight = 439
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 360
    Width = 900
    ExplicitTop = 360
    ExplicitWidth = 900
    inherited btnNovo: TButton
      Left = 515
      OnClick = btnNovoClick
      ExplicitLeft = 515
    end
    inherited btnVisualizar: TButton
      Left = 611
      OnClick = btnVisualizarClick
      ExplicitLeft = 611
    end
    inherited btnEditar: TButton
      Left = 707
      OnClick = btnEditarClick
      ExplicitLeft = 707
    end
    inherited btnExcluir: TButton
      Left = 803
      OnClick = btnExcluirClick
      ExplicitLeft = 803
    end
  end
  inherited grpLista: TGroupBox
    Left = 7
    Top = 7
    Width = 886
    Height = 353
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    ExplicitLeft = 7
    ExplicitTop = 7
    ExplicitWidth = 886
    ExplicitHeight = 353
    inherited pnlFuncoes: TPanel
      Left = 546
      Height = 326
      Margins.Bottom = 7
      ExplicitLeft = 546
      ExplicitHeight = 326
    end
    inherited Grid: TcxGrid
      Left = 9
      Width = 537
      Height = 326
      Margins.Left = 7
      Margins.Bottom = 7
      ExplicitLeft = 9
      ExplicitWidth = 537
      ExplicitHeight = 326
      inherited View: TcxGridDBTableView
        OnDblClick = ViewDblClick
        object ColViewID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'codigo'
          Width = 60
        end
        object ColViewPlaca: TcxGridDBColumn
          Caption = 'Placa'
          DataBinding.FieldName = 'placa'
          Width = 70
        end
        object ColViewTipo: TcxGridDBColumn
          Caption = 'Tipo'
          DataBinding.FieldName = 'desc_tipo'
          Width = 200
        end
        object ColViewDescricao: TcxGridDBColumn
          Caption = 'Descricao'
          DataBinding.FieldName = 'veiculo'
          Width = 160
        end
        object ColumnInativo: TcxGridDBColumn
          Caption = 'Inativo'
          DataBinding.FieldName = 'inativo'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Items = <
            item
              Description = 'Sim'
              ImageIndex = 0
              Value = True
            end
            item
              Description = 'N'#227'o'
              Value = False
            end>
          Width = 50
        end
      end
    end
    inherited pnlFiltros: TPanel
      Left = 577
      Height = 326
      Margins.Right = 7
      Margins.Bottom = 7
      ExplicitLeft = 577
      ExplicitHeight = 326
      inherited GridFiltros: TcxGrid
        Height = 326
        Margins.Left = 7
        Margins.Bottom = 7
        ExplicitHeight = 326
      end
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited qConsulta: TUniQuery
    SQL.Strings = (
      'SELECT vf.codigo, '
      #9'vf.cd_tipo, '
      #9'vf.desc_tipo, '
      #9'vf.placa, '
      #9'vf.identificacao, '
      #9'vf.automacao, '
      #9'vf.veiculo, '
      #9'vf.cd_motorista, '
      #9'vf.desc_mototista, '
      #9'vf.ultimokm, '
      #9'vf.inativo'
      '   FROM vw_frotas vf ;')
  end
  inherited qInfo: TUniQuery
    ParamData = <
      item
        DataType = ftString
        Name = 'colunas'
        ParamType = ptInput
        Value = #39#39
      end
      item
        DataType = ftString
        Name = 'tabela'
        ParamType = ptInput
        Value = 'vw_frotas'
      end>
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
