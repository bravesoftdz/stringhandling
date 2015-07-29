object frmLists: TfrmLists
  Left = 0
  Top = 0
  Caption = 'frmLists'
  ClientHeight = 336
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnMouseDown = FormMouseDown
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    AlignWithMargins = True
    Left = 207
    Top = 3
    Width = 6
    Height = 330
    Beveled = True
    Color = clActiveBorder
    ParentColor = False
    ExplicitLeft = 211
    ExplicitTop = 8
    ExplicitHeight = 336
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 204
    Height = 336
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 8
      Width = 57
      Height = 13
      Caption = 'TList Object'
    end
    object Label2: TLabel
      Left = 7
      Top = 51
      Width = 85
      Height = 13
      Caption = 'TStringList Object'
    end
    object btnNext: TButton
      Left = 1
      Top = 24
      Width = 42
      Height = 21
      Caption = '>>'
      TabOrder = 0
      OnClick = ButtonClick
    end
    object btnPrevious: TButton
      Left = 161
      Top = 24
      Width = 42
      Height = 21
      Caption = '<<'
      TabOrder = 1
      OnClick = ButtonClick
    end
    object edTList: TEdit
      Left = 42
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 2
      OnClick = ButtonClick
    end
    object edStringList: TEdit
      Left = 1
      Top = 70
      Width = 202
      Height = 21
      TabOrder = 3
    end
    object memClickEventResults: TMemo
      Left = 1
      Top = 97
      Width = 202
      Height = 232
      Lines.Strings = (
        'memClickEventResults')
      ScrollBars = ssVertical
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 216
    Top = 0
    Width = 419
    Height = 336
    Align = alClient
    TabOrder = 1
    OnMouseDown = Panel2MouseDown
    object btnLoadFile: TButton
      Left = 19
      Top = 66
      Width = 75
      Height = 25
      Caption = 'Load file'
      TabOrder = 0
      OnClick = btnLoadFileClick
    end
    object btnSave: TButton
      Left = 107
      Top = 66
      Width = 75
      Height = 25
      Caption = 'Save File'
      TabOrder = 1
      OnClick = btnSaveClick
    end
    object cbStringListItems: TComboBox
      Left = 107
      Top = 24
      Width = 145
      Height = 21
      TabOrder = 2
    end
    object edSearchStringList: TEdit
      Left = 19
      Top = 24
      Width = 82
      Height = 21
      TabOrder = 3
      OnKeyPress = edSearchStringListKeyPress
    end
    object ListBox1: TListBox
      Left = 19
      Top = 97
      Width = 238
      Height = 232
      ItemHeight = 13
      Items.Strings = (
        'Cat'
        'Dog'
        'Lion'
        'Click at (388 - 196)'
        'Click at (319 - 170)'
        'Click at (456 - 194)'
        'Click at (552 - 151)'
        'Click at (551 - 234)'
        'Click at (424 - 272)'
        'Click at (540 - 224)'
        'Click at (325 - 160)'
        'Click at (463 - 155)'
        'Click at (400 - 204)'
        'Click at (399 - 205)'
        'Click at (399 - 205)'
        'Click at (399 - 205)'
        'Click at (399 - 205)'
        'Click at (399 - 205)'
        'Click at (400 - 205)'
        'Click at (402 - 205)'
        'Click at (398 - 207)'
        'Click at (354 - 157)'
        'Click at (571 - 145)'
        'Click at (430 - 208)'
        'Click at (612 - 221)'
        'Click at (436 - 261)'
        'Click at (532 - 161)'
        'Click at (440 - 199)'
        'Click at (497 - 179)'
        'Click at (412 - 33)'
        'Click at (412 - 33)'
        'Click at (412 - 33)'
        'Click at (412 - 33)'
        'Click at (412 - 33)'
        'Click at (412 - 33)'
        'Click at (412 - 33)'
        'Click at (412 - 33)'
        'Click at (412 - 33)'
        'Click at (412 - 33)'
        'Click at (412 - 33)'
        'Click at (412 - 33)'
        'Click at (412 - 33)')
      MultiSelect = True
      TabOrder = 4
    end
    object tbTrackBar: TTrackBar
      Left = 255
      Top = 90
      Width = 45
      Height = 242
      Orientation = trVertical
      TabOrder = 5
    end
  end
end
