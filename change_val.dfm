object fchange_val: Tfchange_val
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cambiar valores de la l'#237'nea.'
  ClientHeight = 188
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 34
    Height = 13
    Caption = 'Monto:'
  end
  object Label2: TLabel
    Left = 8
    Top = 64
    Width = 58
    Height = 13
    Caption = 'Descripci'#243'n:'
  end
  object Shape1: TShape
    Left = -20
    Top = -13
    Width = 497
    Height = 122
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 169
    Width = 457
    Height = 19
    Panels = <>
    ExplicitLeft = 216
    ExplicitTop = 128
    ExplicitWidth = 0
  end
  object oBtn_Change: TButton
    Left = 56
    Top = 117
    Width = 105
    Height = 46
    Caption = 'Modificar'
    TabOrder = 3
    OnClick = oBtn_ChangeClick
  end
  object oBtn_Cancel: TButton
    Left = 280
    Top = 117
    Width = 105
    Height = 46
    Cancel = True
    Caption = 'Salir'
    TabOrder = 4
    OnClick = oBtn_CancelClick
  end
  object oPag_Des: TDBEdit
    Left = 80
    Top = 61
    Width = 313
    Height = 21
    DataField = 'Pag_Des'
    DataSource = fimports_1.oDs_Ctas
    TabOrder = 1
  end
  object oPag_Mon: TDBNumberEditEh
    Left = 80
    Top = 21
    Width = 121
    Height = 21
    DataField = 'Pag_Mon'
    DataSource = fimports_1.oDs_Ctas
    DisplayFormat = '###,###,##0.00'
    DynProps = <>
    EditButtons = <>
    TabOrder = 0
    Visible = True
  end
end
