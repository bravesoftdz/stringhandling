object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 439
  ClientWidth = 494
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 416
    Top = 375
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object TreeView1: TTreeView
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 488
    Height = 118
    Align = alTop
    Indent = 19
    TabOrder = 1
    ExplicitLeft = 8
  end
  object Memo1: TMemo
    Left = 3
    Top = 207
    Width = 321
    Height = 145
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object ListBox1: TListBox
    Left = 3
    Top = 127
    Width = 494
    Height = 74
    ItemHeight = 13
    TabOrder = 3
  end
  object XMLDocument1: TXMLDocument
    Left = 327
    Top = 320
    DOMVendorDesc = 'MSXML'
  end
end
