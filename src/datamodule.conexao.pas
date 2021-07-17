unit datamodule.conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.DApt, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite,
  FireDAC.VCLUI.Error, FireDAC.VCLUI.Login, FireDAC.VCLUI.Script,
  FireDAC.Comp.UI;

type
  TDtmConexao = class(TDataModule)
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
  DtmConexao: TDtmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  System.IOUtils,
  bomba.DAO, tanque.DAO, abastecimento.DAO,
  abastecimento.model, bomba.model, tanque.model;

// metodo para verficar e criar as tabelas se não existirem no banco
// não entrei no nível de checar campos e tudo o mais para não complicar demais
// o aplicativo, é mais uma forma de mostra o uso do RTTI para esse fim
procedure TDtmConexao.VerificarEConstruirBanco;
var
  Tabelas: TStringList;
begin
  Tabelas := TStringList.Create;
  try
    FDConnection1.GetTableNames('', '', '', Tabelas);

    if Tabelas.IndexOf(TTanqueDAO.GetTableName<TTanque>) < 0 then
      FDConnection1.ExecSQL(TTanqueDAO.GetSQLCreateTable<TTanque>);

    if Tabelas.IndexOf(TBombaDAO.GetTableName<TBomba>) < 0 then
      FDConnection1.ExecSQL(TBombaDAO.GetSQLCreateTable<TBomba>);

    if Tabelas.IndexOf(TAbastecimentoDAO.GetTableName<TAbastecimento>) < 0 then
      FDConnection1.ExecSQL(TAbastecimentoDAO.GetSQLCreateTable<TAbastecimento>);

    FDConnection1.Close;
  finally
    Tabelas.Free;
  end;
end;

// não utilizei pool de conexões por ter optado pelo SQLite, que
// resumidamente implica no funcionamento stand-alone da aplicação
procedure TDtmConexao.FDConnection1BeforeConnect(Sender: TObject);
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

procedure TDtmConexao.DataModuleCreate(Sender: TObject);
begin
  VerificarEConstruirBanco;

end;

end.
