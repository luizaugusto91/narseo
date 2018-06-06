object dmCaixa: TdmCaixa
  Left = 0
  Top = 0
  ClientHeight = 492
  ClientWidth = 838
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object qColaborador: TUniQuery
    SQL.Strings = (
      'select 1')
    Left = 56
    Top = 16
  end
  object qCliente: TUniQuery
    SQL.Strings = (
      'select 1')
    Left = 56
    Top = 64
  end
end
