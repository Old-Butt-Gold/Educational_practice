object RatingForm: TRatingForm
  Left = 0
  Top = 0
  Caption = #1056#1077#1081#1090#1080#1085#1075
  ClientHeight = 531
  ClientWidth = 1076
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Times New Roman'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object ListView1: TListView
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1070
    Height = 525
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
        Caption = #1054#1073#1097#1080#1077' '#1086#1095#1082#1080
      end
      item
        Alignment = taCenter
        Caption = ' '
        Width = 100
      end
      item
        Alignment = taCenter
        AutoSize = True
        Caption = #1050#1086#1076' '#1082#1086#1084#1072#1085#1076#1099
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
    HotTrackStyles = [htHandPoint, htUnderlineHot]
    ReadOnly = True
    ParentFont = False
    TabOrder = 0
    ViewStyle = vsReport
  end
end
