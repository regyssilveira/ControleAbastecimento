object FrmBaseCadastroView: TFrmBaseCadastroView
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro'
  ClientHeight = 319
  ClientWidth = 606
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 278
    Width = 606
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 1
    ExplicitTop = 432
    ExplicitWidth = 805
    object BtnGravar: TButton
      AlignWithMargins = True
      Left = 453
      Top = 3
      Width = 150
      Height = 35
      Align = alRight
      Caption = 'Gravar'
      TabOrder = 0
      ExplicitLeft = 652
    end
  end
  object PgcCadastro: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 600
    Height = 272
    ActivePage = TbsDadosCadastrais
    Align = alClient
    TabOrder = 0
    TabStop = False
    TabWidth = 100
    ExplicitWidth = 799
    ExplicitHeight = 426
    object TbsDadosCadastrais: TTabSheet
      Caption = 'Dados Cadastrais'
    end
  end
end
