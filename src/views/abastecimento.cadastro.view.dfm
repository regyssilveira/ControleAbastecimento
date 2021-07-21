inherited FrmAbastecimentoCadastroView: TFrmAbastecimentoCadastroView
  Caption = 'Abastecimento'
  ClientHeight = 288
  ClientWidth = 591
  ExplicitWidth = 597
  ExplicitHeight = 317
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 247
    Width = 591
    ExplicitTop = 247
    ExplicitWidth = 591
    inherited BtnGravar: TButton
      Left = 438
      ExplicitLeft = 438
    end
  end
  inherited PgcCadastro: TPageControl
    Width = 585
    Height = 241
    ExplicitWidth = 585
    ExplicitHeight = 241
    inherited TbsDadosCadastrais: TTabSheet
      ExplicitWidth = 577
      ExplicitHeight = 213
      object Label1: TLabel
        Left = 37
        Top = 33
        Width = 10
        Height = 13
        Caption = 'Id'
      end
      object Label2: TLabel
        Left = 37
        Top = 79
        Width = 23
        Height = 13
        Caption = 'Data'
      end
      object Label3: TLabel
        Left = 164
        Top = 79
        Width = 32
        Height = 13
        Caption = 'Bomba'
      end
      object Label4: TLabel
        Left = 37
        Top = 125
        Width = 63
        Height = 13
        Caption = 'Quant. Litros'
      end
      object Label5: TLabel
        Left = 291
        Top = 125
        Width = 64
        Height = 13
        Caption = 'Valor Unit'#225'rio'
      end
      object Label6: TLabel
        Left = 164
        Top = 125
        Width = 51
        Height = 13
        Caption = 'Valor Total'
      end
      object Label7: TLabel
        Left = 418
        Top = 125
        Width = 66
        Height = 13
        Caption = 'Valor Imposto'
      end
      object EdtId: TEdit
        Left = 37
        Top = 52
        Width = 248
        Height = 21
        TabOrder = 0
        Text = 'EdtId'
      end
      object EdtBomba: TComboBox
        Left = 164
        Top = 98
        Width = 121
        Height = 21
        TabOrder = 2
        Text = 'EdtBomba'
      end
      object EdtDataLancamento: TDateTimePicker
        Left = 37
        Top = 98
        Width = 121
        Height = 21
        Date = 44397.000000000000000000
        Time = 0.563457210650085400
        TabOrder = 1
      end
      object EdtLitros: TMaskEdit
        Left = 37
        Top = 144
        Width = 121
        Height = 21
        TabOrder = 3
        Text = 'EdtLitros'
      end
      object EdtVlrUnitario: TMaskEdit
        Left = 291
        Top = 144
        Width = 121
        Height = 21
        TabOrder = 5
        Text = 'MaskEdit1'
      end
      object EdtValorTotal: TMaskEdit
        Left = 164
        Top = 144
        Width = 121
        Height = 21
        TabOrder = 4
        Text = 'MaskEdit1'
      end
      object EdtValorImposto: TMaskEdit
        Left = 418
        Top = 144
        Width = 121
        Height = 21
        TabOrder = 6
        Text = 'MaskEdit1'
      end
    end
  end
end
