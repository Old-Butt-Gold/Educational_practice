object TeamForm: TTeamForm
  Left = 0
  Top = 0
  Caption = #1048#1075#1088#1086#1082#1080' '#1082#1086#1084#1072#1085#1076
  ClientHeight = 299
  ClientWidth = 1201
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ListView1: TListView
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1195
    Height = 293
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    Columns = <
      item
        AutoSize = True
        Caption = #1050#1086#1076' '#1082#1086#1084#1072#1085#1076#1099
      end
      item
        Alignment = taCenter
        AutoSize = True
        Caption = #1048#1084#1103' '#1082#1086#1084#1072#1085#1076#1099
      end
      item
        Alignment = taCenter
        AutoSize = True
        Caption = #1056#1072#1085#1075' '#1082#1086#1084#1072#1085#1076#1099
      end
      item
        Alignment = taCenter
        Caption = ' '
      end
      item
        Alignment = taCenter
        AutoSize = True
        Caption = #1050#1086#1076' '#1080#1075#1088#1086#1082#1072
      end
      item
        Alignment = taCenter
        AutoSize = True
        Caption = #1060#1048#1054' '#1080#1075#1088#1086#1082#1072
      end
      item
        Alignment = taCenter
        AutoSize = True
        Caption = #1054#1095#1082#1080' '#1080#1075#1088#1086#1082#1072
      end
      item
        Alignment = taCenter
        Caption = ' '
      end
      item
        Alignment = taCenter
        AutoSize = True
        Caption = #1050#1086#1076' '#1080#1075#1088#1086#1082#1072
      end
      item
        Alignment = taCenter
        AutoSize = True
        Caption = #1060#1048#1054' '#1080#1075#1088#1086#1082#1072
      end
      item
        Alignment = taCenter
        AutoSize = True
        Caption = #1064#1090#1088#1072#1092#1085#1099#1077' '#1086#1095#1082#1080
      end>
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    FlatScrollBars = True
    ReadOnly = True
    ParentFont = False
    TabOrder = 0
    ViewStyle = vsReport
    OnAdvancedCustomDrawSubItem = ListView1AdvancedCustomDrawSubItem
    ExplicitWidth = 1068
  end
  object MainMenu: TMainMenu
    Left = 592
    Top = 152
    object N1: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1092#1072#1081#1083
      ShortCut = 16467
      OnClick = N1Click
    end
  end
  object SaveDialog: TSaveDialog
    Filter = #1060#1072#1081#1083'|*.txt'
    Left = 536
    Top = 200
  end
end
