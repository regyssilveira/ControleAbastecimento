inherited FrmBombaCadastroView: TFrmBombaCadastroView
  Caption = 'Bomba'
  ClientHeight = 284
  ClientWidth = 441
  ExplicitWidth = 447
  ExplicitHeight = 313
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 243
    Width = 441
    inherited BtnGravar: TButton
      Left = 288
    end
  end
  inherited PgcCadastro: TPageControl
    Width = 435
    Height = 237
    inherited TbsDadosCadastrais: TTabSheet
      ExplicitWidth = 427
      ExplicitHeight = 209
      object Label1: TLabel
        Left = 35
        Top = 30
        Width = 10
        Height = 13
        Caption = 'Id'
      end
      object Label2: TLabel
        Left = 35
        Top = 76
        Width = 36
        Height = 13
        Caption = 'Tanque'
      end
      object Label3: TLabel
        Left = 35
        Top = 122
        Width = 96
        Height = 13
        Caption = 'Descri'#231#227'o da Bomba'
      end
      object EdtID: TEdit
        Left = 35
        Top = 49
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'EdtID'
      end
      object EdtTanque: TEdit
        Left = 35
        Top = 95
        Width = 121
        Height = 21
        TabOrder = 1
        Text = 'Edit1'
      end
      object EdtDescricao: TEdit
        Left = 35
        Top = 141
        Width = 351
        Height = 21
        TabOrder = 2
        Text = 'Edit1'
      end
    end
  end
end
