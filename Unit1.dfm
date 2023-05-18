object AddForm: TAddForm
  Left = 0
  Top = 0
  Caption = 'Add Team'
  ClientHeight = 456
  ClientWidth = 750
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 23
  object LabeledEdit1: TLabeledEdit
    Left = 176
    Top = 46
    Width = 217
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
  object LabeledEdit2: TLabeledEdit
    Left = 176
    Top = 112
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
  object LabeledEdit3: TLabeledEdit
    Left = 176
    Top = 168
    Width = 217
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
  object LabeledEdit4: TLabeledEdit
    Left = 176
    Top = 224
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
  object BitBtn1: TBitBtn
    Left = 168
    Top = 288
    Width = 145
    Height = 49
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Enabled = False
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 4
  end
  object CheckListBox1: TCheckListBox
    Left = 488
    Top = 46
    Width = 121
    Height = 97
    ItemHeight = 23
    Items.Strings = (
      'meow')
    TabOrder = 5
    OnKeyUp = CheckListBox1KeyUp
    OnMouseDown = CheckListBox1MouseDown
  end
end
