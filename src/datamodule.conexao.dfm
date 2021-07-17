object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 259
  Width = 409
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    ConnectedStoredUsage = []
    LoginPrompt = False
    BeforeConnect = FDConnection1BeforeConnect
    Left = 75
    Top = 25
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 75
    Top = 85
  end
  object FDGUIxErrorDialog1: TFDGUIxErrorDialog
    Provider = 'Forms'
    Left = 295
    Top = 25
  end
  object FDGUIxLoginDialog1: TFDGUIxLoginDialog
    Provider = 'Forms'
    Left = 295
    Top = 75
  end
  object FDGUIxScriptDialog1: TFDGUIxScriptDialog
    Provider = 'Forms'
    Left = 295
    Top = 125
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 295
    Top = 175
  end
end
