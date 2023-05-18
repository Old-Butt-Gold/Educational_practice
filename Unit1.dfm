object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Football Viewer'
  ClientHeight = 601
  ClientWidth = 1266
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Times New Roman'
  Font.Style = []
  Padding.Left = 2
  Padding.Top = 2
  Padding.Right = 2
  Padding.Bottom = 2
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    1266
    601)
  PixelsPerInch = 96
  TextHeight = 17
  object Bevel1: TBevel
    Left = 528
    Top = 564
    Width = 185
    Height = 29
    Shape = bsSpacer
  end
  object Label1: TLabel
    Left = 336
    Top = 576
    Width = 40
    Height = 17
    Caption = 'Label1'
  end
  object MaskEdit1: TMaskEdit
    Left = 184
    Top = 572
    Width = 121
    Height = 25
    Alignment = taCenter
    BevelInner = bvNone
    DoubleBuffered = False
    ParentDoubleBuffered = False
    TabOrder = 0
    Text = 'MaskEdit1'
  end
  object BitBtn1: TBitBtn
    Left = 424
    Top = 568
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 1
  end
  object ListBox1: TListBox
    Left = 719
    Top = 496
    Width = 121
    Height = 97
    ItemHeight = 17
    Items.Strings = (
      'meow')
    TabOrder = 2
  end
  object LViewTeam: TListView
    AlignWithMargins = True
    Left = 8
    Top = 8
    Width = 594
    Height = 407
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 10
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
        Caption = #1057#1090#1088#1072#1085#1072' '#1082#1086#1084#1072#1085#1076#1099
      end
      item
        Alignment = taCenter
        AutoSize = True
        Caption = #1053#1086#1084#1077#1088' '#1074' '#1088#1077#1081#1090#1080#1085#1075#1077
      end>
    FlatScrollBars = True
    Groups = <
      item
        GroupID = 0
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end>
    HotTrackStyles = [htHandPoint, htUnderlineHot]
    Items.ItemData = {
      05A80000000200000000000000FFFFFFFFFFFFFFFF03000000FFFFFFFF000000
      000131000365007700720090310A1B03740077006500900E0A1B033400360033
      0030FC091B00000000FFFFFFFFFFFFFFFF03000000FFFFFFFF00000000013200
      1333003200340033003200340033003200350033003200350033003200360035
      0033003200360038470A1B03330032003500D8F5091B04330032003500360050
      170A1BFFFFFFFFFFFFFFFFFFFFFFFF}
    ReadOnly = True
    RowSelect = True
    SortType = stBoth
    TabOrder = 3
    ViewStyle = vsReport
    OnColumnClick = LViewTeamColumnClick
    OnDblClick = LViewTeamDblClick
    OnKeyDown = LViewTeamKeyDown
    OnSelectItem = LViewTeamSelectItem
    ExplicitWidth = 577
    ExplicitHeight = 413
  end
  object PanelAnalysis: TPanel
    Left = 376
    Top = 440
    Width = 232
    Height = 81
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 4
    ExplicitWidth = 209
    DesignSize = (
      232
      81)
    object BitBtn3: TBitBtn
      AlignWithMargins = True
      Left = 31
      Top = 3
      Width = 200
      Height = 77
      Anchors = [akRight]
      BiDiMode = bdLeftToRight
      Caption = #1040#1085#1072#1083#1080#1079' '#1080#1075#1088#1086#1082#1086#1074
      Constraints.MaxWidth = 200
      Constraints.MinWidth = 200
      ImageIndex = 0
      Layout = blGlyphRight
      ParentBiDiMode = False
      TabOrder = 0
      ExplicitLeft = 8
    end
  end
  object PanelAdd: TPanel
    Left = 8
    Top = 440
    Width = 232
    Height = 81
    Anchors = [akLeft, akBottom]
    BevelOuter = bvNone
    TabOrder = 5
    DesignSize = (
      232
      81)
    object BitBtn2: TBitBtn
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 200
      Height = 81
      Anchors = [akLeft]
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1084#1072#1085#1076#1091
      Constraints.MaxWidth = 200
      Constraints.MinWidth = 200
      ImageIndex = 1
      TabOrder = 0
    end
  end
  object PanelPlayers: TPanel
    AlignWithMargins = True
    Left = 625
    Top = 5
    Width = 610
    Height = 310
    Anchors = [akTop, akRight]
    BevelOuter = bvNone
    Caption = 'P'
    ShowCaption = False
    TabOrder = 6
    object Label2: TLabel
      Left = 0
      Top = 0
      Width = 610
      Height = 21
      Align = alTop
      Alignment = taCenter
      Anchors = []
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1080#1075#1088#1086#1082#1072#1093
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = -40
      ExplicitTop = 32
      ExplicitWidth = 600
    end
    object ListView2: TListView
      Left = 0
      Top = 21
      Width = 610
      Height = 289
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      Columns = <
        item
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
          Caption = #1040#1084#1087#1083#1091#1072
        end
        item
          Alignment = taCenter
          AutoSize = True
          Caption = #1064#1090#1088#1072#1092#1085#1099#1077' '#1086#1095#1082#1080
        end
        item
          AutoSize = True
          Caption = #1054#1073#1097#1072#1103' '#1094#1077#1085#1085#1086#1089#1090#1100
        end>
      FlatScrollBars = True
      HotTrackStyles = [htHandPoint, htUnderlineHot]
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      ExplicitWidth = 600
      ExplicitHeight = 204
    end
  end
end