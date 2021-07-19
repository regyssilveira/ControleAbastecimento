object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Controle de Abastecimentos'
  ClientHeight = 502
  ClientWidth = 871
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
  object Button1: TButton
    Left = 25
    Top = 35
    Width = 180
    Height = 55
    Action = ActAbastecimento
    TabOrder = 0
  end
  object Button2: TButton
    Left = 25
    Top = 96
    Width = 180
    Height = 55
    Action = ActBomba
    TabOrder = 1
  end
  object Button3: TButton
    Left = 25
    Top = 157
    Width = 180
    Height = 55
    Action = ActTanque
    TabOrder = 2
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
    Left = 430
    Top = 300
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
