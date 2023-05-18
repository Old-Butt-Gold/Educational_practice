object AddForm: TAddForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize, biHelp]
  BorderStyle = bsSingle
  Caption = 'Add Team'
  ClientHeight = 319
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 23
  object InfoLabel: TLabel
    Left = 0
    Top = 0
    Width = 472
    Height = 23
    Align = alTop
    Alignment = taCenter
    Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1082#1086#1084#1072#1085#1076#1077
    ExplicitWidth = 208
  end
  object SBRefresh: TSpeedButton
    Left = 320
    Top = 208
    Width = 113
    Height = 93
    ImageIndex = 0
    Images = MainForm.ImageList1
    Flat = True
    ParentShowHint = False
    ShowHint = False
    OnClick = SpeedButtonClick
  end
  object TeamNameEdit: TLabeledEdit
    Left = 176
    Top = 37
    Width = 257
    Height = 31
    Alignment = taCenter
    EditLabel.Width = 166
    EditLabel.Height = 23
    EditLabel.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1086#1084#1072#1085#1076#1099
    LabelPosition = lpLeft
    TabOrder = 0
    TextHint = #1053#1072#1079#1074#1072#1085#1080#1077
    OnChange = LabeledEditChange
    OnKeyDown = LabeledEditKeyDown
    OnKeyPress = StrKeyPress
  end
  object TeamCodeEdit: TLabeledEdit
    Left = 176
    Top = 88
    Width = 121
    Height = 31
    Alignment = taCenter
    EditLabel.Width = 114
    EditLabel.Height = 23
    EditLabel.Caption = #1050#1086#1076' '#1082#1086#1084#1072#1085#1076#1099
    LabelPosition = lpLeft
    TabOrder = 1
    TextHint = #1050#1086#1076
    OnChange = LabeledEditChange
    OnKeyDown = LabeledEditKeyDown
    OnKeyPress = NumberPress
  end
  object TeamCountryEdit: TLabeledEdit
    Left = 176
    Top = 133
    Width = 257
    Height = 31
    Alignment = taCenter
    EditLabel.Width = 144
    EditLabel.Height = 23
    EditLabel.Caption = #1057#1090#1088#1072#1085#1072' '#1082#1086#1084#1072#1085#1076#1099
    LabelPosition = lpLeft
    TabOrder = 2
    TextHint = #1057#1090#1088#1072#1085#1072
    OnChange = LabeledEditChange
    OnKeyDown = LabeledEditKeyDown
    OnKeyPress = StrKeyPress
  end
  object TeamRankEdit: TLabeledEdit
    Left = 176
    Top = 184
    Width = 121
    Height = 31
    Alignment = taCenter
    EditLabel.Width = 121
    EditLabel.Height = 23
    EditLabel.Caption = #1056#1072#1085#1075' '#1082#1086#1084#1072#1085#1076#1099
    LabelPosition = lpLeft
    TabOrder = 3
    TextHint = #1056#1072#1085#1075
    OnChange = LabeledEditChange
    OnKeyDown = LabeledEditKeyDown
    OnKeyPress = NumberPress
  end
  object AddBtn: TBitBtn
    Left = 24
    Top = 240
    Width = 145
    Height = 49
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Enabled = False
    Kind = bkYes
    NumGlyphs = 2
    TabOrder = 4
    OnClick = AddBtnClick
  end
  object ChangeBtn: TBitBtn
    Left = 24
    Top = 240
    Width = 145
    Height = 49
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    Kind = bkYes
    NumGlyphs = 2
    TabOrder = 5
    Visible = False
    OnClick = ChangeBtnClick
  end
end
