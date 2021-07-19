inherited FrmTanqueCadastroView: TFrmTanqueCadastroView
  Caption = 'Tanque'
  ClientHeight = 288
  ClientWidth = 329
  ExplicitWidth = 335
  ExplicitHeight = 317
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 247
    Width = 329
    ExplicitTop = 247
    ExplicitWidth = 329
    inherited BtnGravar: TButton
      Left = 176
      ExplicitLeft = 176
    end
  end
  inherited PgcCadastro: TPageControl
    Width = 323
    Height = 241
    ExplicitWidth = 323
    ExplicitHeight = 241
    inherited TbsDadosCadastrais: TTabSheet
      ExplicitWidth = 315
      ExplicitHeight = 213
      object Label1: TLabel
        Left = 35
        Top = 30
        Width = 11
        Height = 13
        Caption = 'ID'
      end
      object Label2: TLabel
        Left = 35
        Top = 76
        Width = 31
        Height = 13
        Caption = 'Label1'
      end
      object Label3: TLabel
        Left = 35
        Top = 122
        Width = 31
        Height = 13
        Caption = 'Label1'
      end
      object EdtID: TEdit
        Left = 35
        Top = 49
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'EdtID'
      end
      object EdtValorLitro: TMaskEdit
        Left = 35
        Top = 141
        Width = 121
        Height = 21
        TabOrder = 2
        Text = 'EdtValorLitro'
      end
      object EdtCombustivel: TComboBox
        Left = 35
        Top = 95
        Width = 246
        Height = 21
        TabOrder = 1
        Text = 'EdtCombustivel'
      end
    end
  end
end
