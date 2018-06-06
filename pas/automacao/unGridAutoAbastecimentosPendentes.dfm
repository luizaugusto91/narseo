inherited frmGridAutoAbastecimentosPendentes: TfrmGridAutoAbastecimentosPendentes
  Tag = 3401
  Caption = 'Abastecimentos Pendentes'
  ClientHeight = 400
  ExplicitWidth = 1116
  ExplicitHeight = 439
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 360
    ExplicitTop = 360
    inherited btnNovo: TButton
      Left = 908
      Caption = 'Manual'
      OnClick = btnNovoClick
      ExplicitLeft = 908
    end
    inherited btnVisualizar: TButton
      OnClick = btnVisualizarClick
    end
    inherited btnEditar: TButton
      Left = 716
      Caption = 'Baixar'
      OnClick = btnEditarClick
      ExplicitLeft = 716
    end
  end
  inherited grpLista: TGroupBox
    Height = 354
    ExplicitHeight = 354
    inherited pnlFuncoes: TPanel
      Height = 328
      ExplicitHeight = 328
    end
    inherited Grid: TcxGrid
      Height = 328
      ExplicitHeight = 328
      inherited View: TcxGridDBTableView
        object ColumnID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'codigo'
          Width = 70
        end
        object ColumnPUNP: TcxGridDBColumn
          Caption = 'PUMP'
          DataBinding.FieldName = 'punp_id'
          Visible = False
          Width = 70
        end
        object ColumnData: TcxGridDBColumn
          Caption = 'Data'
          DataBinding.FieldName = 'data'
          Width = 80
        end
        object ColumnHora: TcxGridDBColumn
          Caption = 'Hora'
          DataBinding.FieldName = 'hora'
          Width = 80
        end
        object ColumnLitros: TcxGridDBColumn
          Caption = 'Litros'
          DataBinding.FieldName = 'quantidade'
          Width = 80
        end
        object ColumnBomba: TcxGridDBColumn
          Caption = 'Bomba'
          DataBinding.FieldName = 'bomba'
          Width = 100
        end
        object ColumnBico: TcxGridDBColumn
          Caption = 'Bico'
          DataBinding.FieldName = 'bico'
          Width = 80
        end
        object ColumnCombustivel: TcxGridDBColumn
          Caption = 'Combustivel'
          DataBinding.FieldName = 'combustivel'
          Width = 140
        end
      end
    end
    inherited pnlFiltros: TPanel
      Height = 328
      ExplicitHeight = 328
      inherited GridFiltros: TcxGrid
        Height = 328
        ExplicitHeight = 328
      end
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited qConsulta: TUniQuery
    SQL.Strings = (
      'SELECT vw.codigo, '
      #9'vw.nr_logico, '
      #9'vw.idbico, '
      #9'vw.bico, '
      #9'vw.bomba, '
      #9'vw.quantidade, '
      #9'vw.preco_unitario, '
      #9'vw.valor, '
      #9'vw.data, '
      #9'vw.hora, '
      #9'vw.encerrante_inicial, '
      #9'vw.encerrante_final, '
      #9'vw.target_id, '
      #9'vw.punp_id, '
      #9'vw.processo_date, '
      #9'vw.combustivel'
      '  FROM vw_abastecimentos vw;')
    object qConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qConsultanr_logico: TStringField
      FieldName = 'nr_logico'
      Size = 10
    end
    object qConsultaidbico: TIntegerField
      FieldName = 'idbico'
    end
    object qConsultabico: TStringField
      FieldName = 'bico'
      Size = 10
    end
    object qConsultabomba: TStringField
      FieldName = 'bomba'
      Size = 160
    end
    object qConsultaquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '###,###,##0.00'
    end
    object qConsultapreco_unitario: TFloatField
      FieldName = 'preco_unitario'
    end
    object qConsultavalor: TFloatField
      FieldName = 'valor'
      currency = True
    end
    object qConsultadata: TDateField
      FieldName = 'data'
    end
    object qConsultahora: TTimeField
      FieldName = 'hora'
    end
    object qConsultaencerrante_inicial: TFloatField
      FieldName = 'encerrante_inicial'
    end
    object qConsultaencerrante_final: TFloatField
      FieldName = 'encerrante_final'
    end
    object qConsultatarget_id: TIntegerField
      FieldName = 'target_id'
    end
    object qConsultapunp_id: TIntegerField
      FieldName = 'punp_id'
    end
    object qConsultaprocesso_date: TDateTimeField
      FieldName = 'processo_date'
    end
    object qConsultacombustivel: TStringField
      FieldName = 'combustivel'
      Size = 45
    end
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
