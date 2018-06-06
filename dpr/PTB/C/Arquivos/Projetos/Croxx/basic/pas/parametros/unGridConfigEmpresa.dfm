inherited frmGridConfigEmpresa: TfrmGridConfigEmpresa
  Tag = 1201
  Caption = 'Configura'#231#245'es da Empresa'
  ClientHeight = 350
  Position = poMainFormCenter
  ExplicitHeight = 389
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 310
    ExplicitTop = 364
    ExplicitWidth = 808
    inherited btnNovo: TButton
      Left = 715
      OnClick = btnNovoClick
      ExplicitLeft = 715
    end
    inherited btnVisualizar: TButton
      Left = 811
      OnClick = btnVisualizarClick
      ExplicitLeft = 811
    end
    inherited btnEditar: TButton
      Left = 907
      OnClick = btnEditarClick
      ExplicitLeft = 907
    end
    inherited btnExcluir: TButton
      Left = 1003
      Enabled = False
      ExplicitLeft = 1003
    end
  end
  inherited grpLista: TGroupBox
    Left = 7
    Top = 7
    Width = 1086
    Height = 303
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    ExplicitLeft = 7
    ExplicitTop = 7
    ExplicitWidth = 794
    ExplicitHeight = 357
    inherited pnlFuncoes: TPanel
      Left = 746
      Height = 276
      Margins.Bottom = 7
      ExplicitLeft = 454
      ExplicitHeight = 330
    end
    inherited Grid: TcxGrid
      Left = 9
      Width = 737
      Height = 276
      Margins.Left = 7
      Margins.Bottom = 7
      ExplicitLeft = 9
      ExplicitWidth = 445
      ExplicitHeight = 330
      inherited View: TcxGridDBTableView
        OnDblClick = btnVisualizarClick
        object ColumnID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'codigo'
          Width = 30
        end
        object ColumnCNPJ: TcxGridDBColumn
          Caption = 'CNPJ'
          DataBinding.FieldName = 'cnpj'
          Width = 80
        end
        object ColumnRazaoSocial: TcxGridDBColumn
          Caption = 'Raz'#227'o Social'
          DataBinding.FieldName = 'nome'
          Width = 280
        end
        object ColumnMatriz: TcxGridDBColumn
          Caption = 'Matriz'
          DataBinding.FieldName = 'matriz'
          Width = 50
        end
        object ColumnInativo: TcxGridDBColumn
          Caption = 'Inativo'
          DataBinding.FieldName = 'inativo'
          Width = 50
        end
      end
    end
    inherited pnlFiltros: TPanel
      Left = 777
      Height = 276
      Margins.Right = 7
      Margins.Bottom = 7
      ExplicitLeft = 485
      ExplicitHeight = 330
      inherited GridFiltros: TcxGrid
        Height = 276
        Margins.Left = 7
        Margins.Bottom = 7
        ExplicitHeight = 330
      end
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited qConsulta: TUniQuery
    SQL.Strings = (
      'SELECT ep.codigo, '
      #9'ep.pessoa,'
      #9'ep.datacadastro,'
      #9'ps.cnpj as cnpj,'
      #9'ps.nome as nome,  '
      #9'ep.serial, '
      #9'ep.chave, '
      #9'ep.data_inicio, '
      #9'ep.data_fim, '
      #9'ep.matriz, '
      #9'ep.cd_matriz, '
      #9'ep.inativo'
      '   FROM empresas ep'
      '   left join pessoas ps on ps.codigo = ep.pessoa;')
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
        Value = 'empresas'
      end>
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
