inherited frmGridAutoAbastecimentosBaixados: TfrmGridAutoAbastecimentosBaixados
  Tag = 3402
  Caption = 'Abastecimentos Baixados'
  ClientHeight = 400
  ClientWidth = 1200
  ExplicitWidth = 1216
  ExplicitHeight = 439
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 360
    Width = 1200
    ExplicitTop = 360
    inherited btnNovo: TButton
      Left = 816
      Caption = 'Baixar'
      OnClick = btnNovoClick
    end
    inherited btnVisualizar: TButton
      Left = 912
      OnClick = btnVisualizarClick
    end
    inherited btnEditar: TButton
      Left = 1008
      Caption = 'Manual'
      OnClick = btnEditarClick
    end
    inherited btnExcluir: TButton
      Left = 1104
    end
  end
  inherited grpLista: TGroupBox
    Width = 1188
    Height = 354
    ExplicitHeight = 354
    inherited pnlFuncoes: TPanel
      Left = 849
      Height = 328
      ExplicitHeight = 328
    end
    inherited Grid: TcxGrid
      Width = 841
      Height = 328
      ExplicitHeight = 328
      inherited View: TcxGridDBTableView
        object ColumnID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'codigo'
          Width = 50
        end
        object ColumnPUNP: TcxGridDBColumn
          Caption = 'PUMP'
          DataBinding.FieldName = 'punp_id'
          Visible = False
          Width = 70
        end
        object ColumnPlaca: TcxGridDBColumn
          Caption = 'Placa'
          DataBinding.FieldName = 'placa'
          Width = 80
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
        object ColumnCombustivel: TcxGridDBColumn
          Caption = 'Combustivel'
          DataBinding.FieldName = 'combustivel'
          Width = 140
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
        object ColumnKM: TcxGridDBColumn
          Caption = 'KM'
          DataBinding.FieldName = 'km_baixa'
          Width = 80
        end
        object ColumnManual: TcxGridDBColumn
          Caption = 'M'
          DataBinding.FieldName = 'manual'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Images = ImageList16
          Properties.Items = <
            item
              ImageIndex = 12
              Value = True
            end
            item
              Value = False
            end>
          HeaderHint = 'Lan'#231'amento Manual'
        end
      end
    end
    inherited pnlFiltros: TPanel
      Left = 880
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
      #9'vw.hora_baixa, '
      #9'vw.km_baixa, '
      #9'vw.placa, '
      #9'vw.manual, '
      #9'vw.troca_oleo, '
      #9'vw.combustivel'
      '   FROM vw_abastecimentos_baixados vw;')
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
    object qConsultahora_baixa: TDateTimeField
      FieldName = 'hora_baixa'
    end
    object qConsultakm_baixa: TFloatField
      FieldName = 'km_baixa'
    end
    object qConsultaplaca: TStringField
      FieldName = 'placa'
      EditMask = '!LLL-9000;0;_'
      Size = 7
    end
    object qConsultamanual: TBooleanField
      FieldName = 'manual'
    end
    object qConsultatroca_oleo: TBooleanField
      FieldName = 'troca_oleo'
    end
    object qConsultacombustivel: TStringField
      FieldName = 'combustivel'
      Size = 45
    end
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited pmFiltros: TPopupMenu
    Left = 234
    Top = 240
  end
end
