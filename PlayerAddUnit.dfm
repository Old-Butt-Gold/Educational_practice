object AddPlayerForm: TAddPlayerForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize, biHelp]
  BorderStyle = bsSingle
  Caption = 'AddPlayer'
  ClientHeight = 309
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Times New Roman'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 21
  object SBRefresh: TSpeedButton
    Left = 504
    Top = 198
    Width = 113
    Height = 93
    ImageIndex = 0
    Images = MainForm.ImageList1
    Flat = True
    ParentShowHint = False
    ShowHint = False
    OnClick = SBRefreshClick
  end
  object Label1: TLabel
    Left = 364
    Top = 67
    Width = 70
    Height = 21
    Alignment = taCenter
    Caption = #1055#1086#1079#1080#1094#1080#1103
  end
  object PlayerNameEdit: TLabeledEdit
    Left = 160
    Top = 21
    Width = 441
    Height = 29
    Alignment = taCenter
    EditLabel.Width = 132
    EditLabel.Height = 21
    EditLabel.Caption = #1060#1072#1084#1080#1083#1080#1103' '#1080#1075#1088#1086#1082#1072
    LabelPosition = lpLeft
    PopupMenu = MainForm.PopupMenu
    TabOrder = 0
    TextHint = #1060#1048#1054
    OnChange = PlayerNameEditChange
    OnKeyDown = PlayerNameEditKeyDown
    OnKeyPress = PlayerStrKeyPress
  end
  object PlayerCodeEdit: TLabeledEdit
    Left = 160
    Top = 64
    Width = 121
    Height = 29
    Alignment = taCenter
    EditLabel.Width = 91
    EditLabel.Height = 21
    EditLabel.Caption = #1050#1086#1076' '#1080#1075#1088#1086#1082#1072
    LabelPosition = lpLeft
    MaxLength = 5
    PopupMenu = MainForm.PopupMenu
    TabOrder = 1
    TextHint = #1050#1086#1076
    OnChange = PlayerNameEditChange
    OnKeyDown = PlayerNameEditKeyDown
    OnKeyPress = PlayerCodeEditKeyPress
  end
  object PlayerPenaltyEdit: TLabeledEdit
    Left = 160
    Top = 117
    Width = 121
    Height = 29
    Alignment = taCenter
    EditLabel.Width = 131
    EditLabel.Height = 21
    EditLabel.Caption = #1064#1090#1088#1072#1092#1085#1099#1077' '#1086#1095#1082#1080
    LabelPosition = lpLeft
    PopupMenu = MainForm.PopupMenu
    TabOrder = 2
    TextHint = #1064#1090#1088#1072#1092
    OnChange = PlayerNameEditChange
    OnKeyDown = PlayerNameEditKeyDown
    OnKeyPress = PlayerPenaltyEditKeyPress
  end
  object PlayerScoreEdit: TLabeledEdit
    Left = 160
    Top = 165
    Width = 121
    Height = 29
    Alignment = taCenter
    EditLabel.Width = 134
    EditLabel.Height = 21
    EditLabel.Caption = #1054#1073#1097#1072#1103' '#1094#1077#1085#1085#1086#1089#1090#1100
    LabelPosition = lpLeft
    PopupMenu = MainForm.PopupMenu
    TabOrder = 3
    TextHint = #1062#1077#1085#1085#1086#1089#1090#1100
    OnChange = PlayerNameEditChange
    OnKeyDown = PlayerNameEditKeyDown
    OnKeyPress = PlayerPenaltyEditKeyPress
  end
  object ComboBoxPosition: TComboBox
    Left = 440
    Top = 64
    Width = 161
    Height = 29
    Cursor = crHandPoint
    AutoDropDown = True
    AutoCloseUp = True
    Style = csDropDownList
    PopupMenu = MainForm.PopupMenu
    TabOrder = 4
    TextHint = #1055#1086#1079#1080#1094#1080#1103
    OnChange = PlayerNameEditChange
    OnKeyPress = ComboBoxPositionKeyPress
    Items.Strings = (
      #1042#1088#1072#1090#1072#1088#1100
      #1047#1072#1097#1080#1090#1085#1080#1082
      #1055#1086#1083#1091#1079#1072#1097#1080#1090#1085#1080#1082
      #1060#1086#1088#1074#1072#1088#1076)
  end
  object AddBtn: TBitBtn
    Left = 88
    Top = 216
    Width = 193
    Height = 49
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1075#1088#1086#1082#1072
    Enabled = False
    Kind = bkYes
    NumGlyphs = 2
    TabOrder = 5
    OnClick = AddBtnClick
  end
  object ChangeBtn: TBitBtn
    Left = 88
    Top = 216
    Width = 193
    Height = 49
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1080#1075#1088#1086#1082#1072
    Kind = bkYes
    NumGlyphs = 2
    TabOrder = 6
    Visible = False
    OnClick = ChangeBtnClick
  end
end
