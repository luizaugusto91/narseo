inherited frmGridPedidoCompras: TfrmGridPedidoCompras
  Tag = 3101
  Caption = 'Pedido de Compras'
  ClientHeight = 400
  ExplicitWidth = 1116
  ExplicitHeight = 439
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotton: TPanel
    Top = 360
    ExplicitTop = 360
    inherited btnNovo: TButton
      OnClick = btnNovoClick
    end
    inherited btnVisualizar: TButton
      OnClick = btnVisualizarClick
    end
    inherited btnEditar: TButton
      OnClick = btnEditarClick
    end
    inherited btnExcluir: TButton
      OnClick = btnExcluirClick
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
        object Viewcodigo: TcxGridDBColumn
          Caption = '#ID'
          DataBinding.FieldName = 'codigo'
          Width = 50
        end
        object Viewfornecedor: TcxGridDBColumn
          Caption = 'Fornecedor'
          DataBinding.FieldName = 'fornecedor'
          Width = 300
        end
        object Viewrepresentante: TcxGridDBColumn
          Caption = 'Representante'
          DataBinding.FieldName = 'representante'
          Visible = False
          VisibleForCustomization = False
          Width = 200
        end
        object Viewdata_pedido: TcxGridDBColumn
          Caption = 'Data'
          DataBinding.FieldName = 'data_pedido'
          Width = 80
        end
        object Viewprevisao_entrega: TcxGridDBColumn
          Caption = 'Total'
          DataBinding.FieldName = 'total_pedido'
          Width = 100
        end
        object Viewstatus: TcxGridDBColumn
          Caption = 'Status'
          DataBinding.FieldName = 'status'
          Width = 100
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
    SQLDelete.Strings = (
      'DELETE FROM pedido_compras'
      'WHERE'
      '  codigo = :Old_codigo')
    SQL.Strings = (
      'SELECT vpc.codigo, '
      #9'vpc.empresa, '
      #9'vpc.cd_fornecedor, '
      #9'vpc.fornecedor, '
      #9'vpc.cd_representante, '
      #9'vpc.representante, '
      #9'vpc.data_pedido, '
      #9'vpc.previsao_entrega, '
      #9'vpc.data_compra, '
      #9'vpc.data_entrada,'
      #9'vpc.total_pedido, '
      #9'vpc.status'
      '   FROM vw_pedido_compras vpc;')
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
        Value = 'vw_pedido_compras'
      end>
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
