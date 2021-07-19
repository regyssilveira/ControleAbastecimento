object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Controle de Abastecimentos'
  ClientHeight = 553
  ClientWidth = 900
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnClick = ActTanqueExecute
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMenu: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 553
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'PnlMenu'
    ShowCaption = False
    TabOrder = 0
    ExplicitLeft = 70
    ExplicitTop = 135
    ExplicitHeight = 276
    object Button1: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 179
      Height = 55
      Action = ActAbastecimento
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 5
      ExplicitTop = 8
      ExplicitWidth = 180
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 3
      Top = 64
      Width = 179
      Height = 55
      Action = ActBomba
      Align = alTop
      TabOrder = 1
      ExplicitLeft = 5
      ExplicitTop = 69
      ExplicitWidth = 180
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 3
      Top = 125
      Width = 179
      Height = 55
      Action = ActTanque
      Align = alTop
      TabOrder = 2
      ExplicitLeft = 5
      ExplicitTop = 130
      ExplicitWidth = 180
    end
  end
  object PnlClient: TPanel
    Left = 185
    Top = 0
    Width = 715
    Height = 553
    Align = alClient
    BevelOuter = bvNone
    Caption = 'PnlClient'
    ShowCaption = False
    TabOrder = 1
    ExplicitLeft = 350
    ExplicitTop = 250
    ExplicitWidth = 185
    ExplicitHeight = 41
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActAbastecimento
            Caption = '&Abastecimento'
          end
          item
            Action = ActTanque
            Caption = '&Tanque'
          end
          item
            Action = ActBomba
            Caption = '&Bomba'
          end>
      end>
    Left = 70
    Top = 235
    StyleName = 'Platform Default'
    object ActAbastecimento: TAction
      Caption = 'Abastecimento'
      OnExecute = ActAbastecimentoExecute
    end
    object ActTanque: TAction
      Caption = 'Tanque'
      OnExecute = ActTanqueExecute
    end
    object ActBomba: TAction
      Caption = 'Bomba'
      OnExecute = ActBombaExecute
    end
  end
end
