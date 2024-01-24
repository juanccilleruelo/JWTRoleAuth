object Authentication: TAuthentication
  Left = 0
  Top = 0
  Caption = 'Authentication'
  ClientHeight = 738
  ClientWidth = 1350
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 472
    Width = 1350
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitLeft = -16
    ExplicitTop = 302
    ExplicitWidth = 513
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 193
    Width = 1350
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitLeft = -8
    ExplicitTop = 302
    ExplicitWidth = 513
  end
  object MemoToken: TMemo
    Left = 0
    Top = 90
    Width = 1350
    Height = 103
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object MemoContentJSON: TMemo
    Left = 0
    Top = 240
    Width = 1350
    Height = 232
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    ExplicitLeft = 119
    ExplicitTop = 280
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1350
    Height = 49
    Align = alTop
    TabOrder = 0
    object BtnGetResourceC: TButton
      AlignWithMargins = True
      Left = 967
      Top = 4
      Width = 154
      Height = 41
      Align = alLeft
      Caption = 'Get Resource C'
      TabOrder = 2
      OnClick = BtnGetResourceCClick
      ExplicitLeft = 783
    end
    object BtnLoginUser1: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 109
      Height = 41
      Align = alLeft
      Caption = 'Login User 1 Admin'
      TabOrder = 0
      OnClick = BtnLoginUser1Click
    end
    object BtnLoginUser2: TButton
      AlignWithMargins = True
      Left = 119
      Top = 4
      Width = 194
      Height = 41
      Align = alLeft
      Caption = 'Login User 2 Manager (JsonObject)'
      TabOrder = 1
      OnClick = BtnLoginUser2Click
    end
    object BtnGetResourceB: TButton
      AlignWithMargins = True
      Left = 807
      Top = 4
      Width = 154
      Height = 41
      Align = alLeft
      Caption = 'Get Resource B'
      TabOrder = 3
      OnClick = BtnGetResourceBClick
      ExplicitLeft = 623
    end
    object BtnGetResourceA: TButton
      AlignWithMargins = True
      Left = 647
      Top = 4
      Width = 154
      Height = 41
      Align = alLeft
      Caption = 'Get Resourse A'
      TabOrder = 4
      OnClick = BtnGetResourceAClick
      ExplicitLeft = 463
    end
    object BtnLoginUser3: TButton
      AlignWithMargins = True
      Left = 319
      Top = 4
      Width = 162
      Height = 41
      Align = alLeft
      Caption = 'Login User 3 User (JsonObject)'
      TabOrder = 5
      OnClick = BtnLoginUser3Click
      ExplicitLeft = 271
    end
    object BtnLoginUser4: TButton
      AlignWithMargins = True
      Left = 487
      Top = 4
      Width = 154
      Height = 41
      Align = alLeft
      Caption = 'Login User 4 (Exception)'
      TabOrder = 6
      OnClick = BtnLoginUser4Click
      ExplicitLeft = 351
    end
    object BtnLogOut: TButton
      AlignWithMargins = True
      Left = 1127
      Top = 4
      Width = 154
      Height = 41
      Align = alLeft
      Caption = 'Log Out'
      TabOrder = 7
      OnClick = BtnLogOutClick
      ExplicitLeft = 1167
      ExplicitTop = 2
    end
  end
  object MemoContentHTML: TMemo
    Left = 0
    Top = 516
    Width = 1350
    Height = 222
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    ExplicitLeft = 160
    ExplicitTop = 441
    ExplicitHeight = 225
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 1350
    Height = 41
    Align = alTop
    Alignment = taLeftJustify
    Caption = '       JSON Web Token  (Authentication Token)'
    TabOrder = 4
    ExplicitLeft = -8
    ExplicitTop = 39
  end
  object Panel4: TPanel
    Left = 0
    Top = 196
    Width = 1350
    Height = 44
    Align = alTop
    Alignment = taLeftJustify
    Caption = '       JSON Content'
    TabOrder = 5
    ExplicitLeft = 16
    ExplicitTop = 493
  end
  object Panel3: TPanel
    Left = 0
    Top = 475
    Width = 1350
    Height = 41
    Align = alTop
    Alignment = taLeftJustify
    Caption = '       HTML Content'
    TabOrder = 6
    ExplicitLeft = 32
    ExplicitTop = 656
  end
end
