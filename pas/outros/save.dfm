object frmSave: TfrmSave
  Left = 0
  Top = 0
  Caption = 'frmSave'
  ClientHeight = 779
  ClientWidth = 1417
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTOP: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1411
    Height = 50
    Align = alTop
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 0
  end
  object pnlMAIN: TPanel
    Left = 0
    Top = 56
    Width = 1417
    Height = 667
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object spl1: TSplitter
      Left = 1058
      Top = 0
      Height = 667
      Align = alRight
      ExplicitLeft = 1064
      ExplicitTop = 16
    end
    object pnl4: TPanel
      AlignWithMargins = True
      Left = 1064
      Top = 3
      Width = 350
      Height = 661
      Align = alRight
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 0
    end
    object pnl5: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 1052
      Height = 661
      Align = alClient
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 1
    end
  end
  object pnlBOTTOM: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 726
    Width = 1411
    Height = 50
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 2
  end
end
