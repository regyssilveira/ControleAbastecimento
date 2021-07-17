unit datamodule.conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite,
  FireDAC.VCLUI.Error, FireDAC.VCLUI.Login, FireDAC.VCLUI.Script,
  FireDAC.Comp.UI;

type
  TDataModule1 = class(TDataModule)
    FDConnection1: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDGUIxErrorDialog1: TFDGUIxErrorDialog;
    FDGUIxLoginDialog1: TFDGUIxLoginDialog;
    FDGUIxScriptDialog1: TFDGUIxScriptDialog;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure FDConnection1BeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure VerificarEConstruirBanco;
  public

  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  System.IOUtils;

// metodo para verficar e criar as tabelas existentes no banco
procedure TDataModule1.VerificarEConstruirBanco;
begin

end;

// não utilizei pool de conexões por ter optado pelo SQLite, que
// resumidamente implica no funcionamento stand-alone da aplicação
procedure TDataModule1.FDConnection1BeforeConnect(Sender: TObject);
var
  DatabaseFolder: string;
  DatabasePath: string;
begin
  DatabaseFolder := TPath.Combine(
    TPath.GetDirectoryName(ParamStr(0)), 'database'
  );
  ForceDirectories(DatabaseFolder);

  DatabasePath := TPath.Combine(
    DatabaseFolder, 'abastecimentos.sqlite'
  );

  FDConnection1.Params.Database := DatabasePath;
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  VerificarEConstruirBanco;

end;

end.
