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
  OnShow = FormShow
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
    object Button1: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 179
      Height = 40
      Action = ActAbastecimento
      Align = alTop
      TabOrder = 0
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 3
      Top = 49
      Width = 179
      Height = 40
      Action = ActBomba
      Align = alTop
      TabOrder = 1
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 3
      Top = 95
      Width = 179
      Height = 40
      Action = ActTanque
      Align = alTop
      TabOrder = 2
    end
    object Button4: TButton
      AlignWithMargins = True
      Left = 3
      Top = 141
      Width = 179
      Height = 40
      Action = ActRelatorio
      Align = alTop
      TabOrder = 3
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
    object ActRelatorio: TAction
      Caption = 'Relat'#243'rio'
      OnExecute = ActRelatorioExecute
    end
  end
end
