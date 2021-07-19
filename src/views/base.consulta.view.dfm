object FrmBaseConsultaView: TFrmBaseConsultaView
  Left = 0
  Top = 0
  Caption = 'Consulta'
  ClientHeight = 473
  ClientWidth = 864
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridConsulta: TDBGrid
    Left = 0
    Top = 0
    Width = 864
    Height = 473
    Align = alClient
    DataSource = DtsConsulta
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGridConsultaDblClick
  end
  object DtsConsulta: TDataSource
    OnStateChange = DtsConsultaStateChange
    OnDataChange = DtsConsultaDataChange
    Left = 105
    Top = 125
  end
  object ActionList1: TActionList
    Left = 105
    Top = 225
    object ActRegistroNovo: TAction
      Caption = 'Novo'
      OnExecute = ActRegistroNovoExecute
    end
    object ActRegistroAlterar: TAction
      Caption = 'Alterar'
      OnExecute = ActRegistroAlterarExecute
    end
    object ActRegistroApagar: TAction
      Caption = 'Remover'
      OnExecute = ActRegistroApagarExecute
    end
    object ActRegistroAtualizar: TAction
      Caption = 'Atualizar'
      OnExecute = ActRegistroAtualizarExecute
    end
  end
  object MainMenu1: TMainMenu
    Left = 105
    Top = 175
    object Registro1: TMenuItem
      Caption = 'Registro'
      object Novo1: TMenuItem
        Action = ActRegistroNovo
      end
      object ActRegistroAlterar1: TMenuItem
        Action = ActRegistroAlterar
      end
      object ActRegistroApagar1: TMenuItem
        Action = ActRegistroApagar
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Atualizar1: TMenuItem
        Action = ActRegistroAtualizar
      end
    end
  end
end
