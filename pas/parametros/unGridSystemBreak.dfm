inherited frmGridSystemBreak: TfrmGridSystemBreak
  Tag = 1202
  Caption = 'Parada do sistema'
  ClientHeight = 400
  ClientWidth = 900
  ExplicitWidth = 916
  ExplicitHeight = 439
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 341
    Width = 900
    Visible = False
    ExplicitTop = 241
    ExplicitWidth = 900
    inherited btnNovo: TButton
      Left = 516
      ExplicitLeft = 516
    end
    inherited btnVisualizar: TButton
      Left = 612
      ExplicitLeft = 612
    end
    inherited btnEditar: TButton
      Left = 708
      ExplicitLeft = 708
    end
    inherited btnExcluir: TButton
      Left = 804
      ExplicitLeft = 804
    end
  end
  inherited grpLista: TGroupBox
    Width = 888
    Height = 213
    ExplicitWidth = 888
    ExplicitHeight = 113
    inherited pnlFuncoes: TPanel
      Left = 549
      Height = 187
      ExplicitLeft = 549
      ExplicitHeight = 87
      inherited btnFiltro: TButton
        Enabled = False
      end
    end
    inherited Grid: TcxGrid
      Width = 541
      Height = 187
      ExplicitWidth = 541
      ExplicitHeight = 87
      inherited View: TcxGridDBTableView
        object ColumnID: TcxGridDBColumn
          Caption = '#ID'
          DataBinding.FieldName = 'codigo'
          Width = 50
        end
        object ColumnTipo: TcxGridDBColumn
          Caption = 'Tipo'
          DataBinding.FieldName = 'motivo'
          Width = 200
        end
        object ColumnData: TcxGridDBColumn
          Caption = 'Data'
          DataBinding.FieldName = 'data_registro'
          Width = 80
        end
        object ColumnHora: TcxGridDBColumn
          Caption = 'Hora'
          DataBinding.FieldName = 'hora_execucao'
          Width = 80
        end
        object ColumnExpectativa: TcxGridDBColumn
          Caption = 'Expectativa'
          DataBinding.FieldName = 'expectativa'
          Width = 80
        end
      end
    end
    inherited pnlFiltros: TPanel
      Left = 580
      Height = 187
      ExplicitLeft = 580
      ExplicitHeight = 87
      inherited GridFiltros: TcxGrid
        Height = 187
        ExplicitHeight = 87
      end
    end
  end
  inherited Ribbon: TdxRibbon
    Width = 900
    ExplicitWidth = 900
    inherited MTabRegistros: TdxRibbonTab
      Index = 0
    end
  end
  inherited stb: TStatusBar
    Top = 381
    Width = 900
    ExplicitTop = 281
    ExplicitWidth = 900
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited qConsulta: TUniQuery
    SQLDelete.Strings = (
      'DELETE FROM system_break'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLRefresh.Strings = (
      
        'SELECT usuario, data_registro, hora_registro, hora_execucao, tem' +
        'po_execucao, executada, motivo, descricao, data_retorno, hora_re' +
        'torno, expectativa FROM system_break'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM system_break'
      ''
      ') t')
    SQL.Strings = (
      'SELECT sb.codigo, '
      #9'ps.fantasia as usuario, '
      #9'sb.data_registro, '
      #9'sb.hora_registro, '
      #9'sb.hora_execucao, '
      #9'sb.tempo_execucao, '
      #9'sb.executada, '
      #9'tb.descricao as motivo, '
      #9'sb.descricao, '
      #9'sb.data_retorno, '
      #9'sb.hora_retorno, '
      '        sb.expectativa'
      '   FROM system_break sb'
      '   LEFT JOIN tipo_break tb ON tb.codigo = sb.motivo'
      '   left join system_usuarios sy ON sy.codigo = sb.usuario'
      '   LEFT JOIN pessoas ps on ps.codigo = sy.pessoa')
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
        Value = 'system_break '
      end>
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited BarManager: TdxBarManager
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarOpcoes: TdxBar
      FloatClientWidth = 65
      FloatClientHeight = 216
    end
    inherited BarOutros: TdxBar
      FloatClientWidth = 76
      FloatClientHeight = 21
    end
    inherited BarSistem: TdxBar
      FloatClientWidth = 51
      FloatClientHeight = 108
    end
    inherited MnNovo: TdxBarLargeButton
      OnClick = MnNovoClick
    end
    inherited MnVisualizar: TdxBarLargeButton
      OnClick = MnVisualizarClick
    end
    inherited MnEditar: TdxBarLargeButton
      OnClick = MnEditarClick
    end
    inherited MnExcluir: TdxBarLargeButton
      OnClick = MnExcluirClick
    end
  end
end
