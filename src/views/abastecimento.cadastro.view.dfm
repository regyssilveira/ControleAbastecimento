inherited FrmAbastecimentoCadastroView: TFrmAbastecimentoCadastroView
  Caption = 'Abastecimento'
  ClientHeight = 288
  ClientWidth = 631
  ExplicitWidth = 637
  ExplicitHeight = 317
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 247
    Width = 631
    ExplicitTop = 247
    ExplicitWidth = 631
    inherited BtnGravar: TButton
      Left = 478
      ExplicitLeft = 478
    end
  end
  inherited PgcCadastro: TPageControl
    Width = 625
    Height = 241
    ExplicitWidth = 625
    ExplicitHeight = 241
    inherited TbsDadosCadastrais: TTabSheet
      ExplicitWidth = 617
      ExplicitHeight = 213
      object Label1: TLabel
        Left = 42
        Top = 28
        Width = 10
        Height = 13
        Caption = 'Id'
      end
      object Label2: TLabel
        Left = 42
        Top = 89
        Width = 23
        Height = 13
        Caption = 'Data'
      end
      object Label3: TLabel
        Left = 169
        Top = 89
        Width = 32
        Height = 13
        Caption = 'Bomba'
      end
      object Label4: TLabel
        Left = 42
        Top = 135
        Width = 63
        Height = 13
        Caption = 'Quant. Litros'
      end
      object Label6: TLabel
        Left = 169
        Top = 135
        Width = 51
        Height = 13
        Caption = 'Valor Total'
      end
      object Label5: TLabel
        Left = 296
        Top = 135
        Width = 64
        Height = 13
        Caption = 'Valor Unit'#225'rio'
      end
      object Label7: TLabel
        Left = 423
        Top = 135
        Width = 66
        Height = 13
        Caption = 'Valor Imposto'
      end
      object EdtId: TEdit
        Left = 42
        Top = 47
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'EdtId'
      end
      object EdtDataLancamento: TDateTimePicker
        Left = 42
        Top = 108
        Width = 121
        Height = 21
        Date = 44397.000000000000000000
        Time = 0.563457210650085500
        TabOrder = 1
      end
      object EdtLitros: TMaskEdit
        Left = 42
        Top = 154
        Width = 121
        Height = 21
        TabOrder = 3
        Text = 'EdtLitros'
      end
      object EdtValorTotal: TMaskEdit
        Left = 169
        Top = 154
        Width = 121
        Height = 21
        TabOrder = 4
        Text = 'MaskEdit1'
      end
      object EdtBomba: TEdit
        Left = 169
        Top = 108
        Width = 121
        Height = 21
        TabOrder = 2
        Text = 'EdtBomba'
      end
      object EdtValorUnitario: TMaskEdit
        Left = 296
        Top = 154
        Width = 121
        Height = 21
        TabOrder = 5
        Text = 'EdtValorUnitario'
      end
      object EdtValorImposto: TMaskEdit
        Left = 423
        Top = 154
        Width = 121
        Height = 21
        TabOrder = 6
        Text = 'MaskEdit1'
      end
    end
  end
end
