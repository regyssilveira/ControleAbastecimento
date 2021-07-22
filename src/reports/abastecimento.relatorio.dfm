object FrmAbastecimentosRelatorio: TFrmAbastecimentosRelatorio
  Left = 0
  Top = 0
  Caption = 'Abastecimentos'
  ClientHeight = 835
  ClientWidth = 846
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RelAbastecimentos: TRLReport
    Left = 20
    Top = 18
    Width = 794
    Height = 1123
    DataSource = DtsAbastecimentos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 73
      BandType = btTitle
      object RLLabel1: TRLLabel
        Left = 3
        Top = 15
        Width = 270
        Height = 22
        Caption = 'Relat'#243'rio de Abastecimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 3
        Top = 50
        Width = 33
        Height = 16
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 121
        Top = 50
        Width = 52
        Height = 16
        Caption = 'Tanque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 191
        Top = 50
        Width = 49
        Height = 16
        Caption = 'Bomba'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 265
        Top = 50
        Width = 112
        Height = 16
        Caption = 'Valor Abastecido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 111
      Width = 718
      Height = 30
      object RLDBText1: TRLDBText
        Left = 3
        Top = 8
        Width = 107
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'dt_abastecimento'
        DataSource = DtsAbastecimentos
        DisplayMask = 'dd/MM/yyyy'
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 121
        Top = 8
        Width = 60
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'id_tanque'
        DataSource = DtsAbastecimentos
        DisplayMask = '0000'
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 191
        Top = 8
        Width = 60
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'id_bomba'
        DataSource = DtsAbastecimentos
        DisplayMask = '0000'
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 265
        Top = 8
        Width = 103
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'vl_abastecido'
        DataSource = DtsAbastecimentos
        DisplayMask = ',#0.00'
        Text = ''
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 141
      Width = 718
      Height = 45
      BandType = btSummary
      object RLLabel6: TRLLabel
        Left = 177
        Top = 14
        Width = 82
        Height = 16
        Alignment = taRightJustify
        Caption = 'Valor Total :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBResult1: TRLDBResult
        Left = 265
        Top = 14
        Width = 103
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'vl_abastecido'
        DataSource = DtsAbastecimentos
        DisplayMask = ',#0.00'
        Info = riSum
        Text = ''
      end
    end
  end
  object DtsAbastecimentos: TDataSource
    DataSet = QryAbastecimentos
    Left = 270
    Top = 305
  end
  object QryAbastecimentos: TFDQuery
    Connection = DtmConexao.FDConnection1
    SQL.Strings = (
      'select'
      '    abastecimento.dt_abastecimento,'
      '    abastecimento.id_bomba,'
      '    bomba.id_tanque,'
      '    sum(abastecimento.vl_abastecimento) as vl_abastecido'
      'from'
      '    abastecimento'
      '    inner join bomba on ('
      '        bomba.id = abastecimento.id_bomba'
      '    )'
      'group by'
      '    abastecimento.dt_abastecimento,'
      '    abastecimento.id_bomba,'
      '    bomba.id_tanque')
    Left = 270
    Top = 260
    object QryAbastecimentosdt_abastecimento: TDateTimeField
      FieldName = 'dt_abastecimento'
      Origin = 'dt_abastecimento'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object QryAbastecimentosid_bomba: TIntegerField
      FieldName = 'id_bomba'
      Origin = 'id_bomba'
      Required = True
    end
    object QryAbastecimentosid_tanque: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_tanque'
      Origin = 'id_tanque'
      ProviderFlags = []
      ReadOnly = True
    end
    object QryAbastecimentosvl_abastecido: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'vl_abastecido'
      Origin = 'vl_abastecido'
      ProviderFlags = []
      ReadOnly = True
      EditFormat = ',#0.00'
    end
  end
end
