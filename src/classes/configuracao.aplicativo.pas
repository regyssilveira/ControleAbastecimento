{###############################################################################

N�o gosto de deixar nada engessado na aplica��o, portanto, criei um arquivo
de configura��o para guardar a al�quota ou outras configura��es necess�rias

Utilizei o padr�o singleton mais no intuito de demonstrar o uso para solu��es
simples como um arquivo de configura��o

O valor default de 13% para a aliquota que constaq como requisito n�o funcinal
est� como default na propriedade, ent�o se o arquivo n�o for configurado
continua utilizando normalmente o valor engessado, como n�o foi determinado se
deveria ser configur�vel ou n�o segue atendendo as duas formas

###############################################################################}

unit configuracao.aplicativo;

interface

uses
  IniFiles;

type
  TConfiguracaoAplicativo = class(TInifile)
  const
    SEC_IMPOSTOS = 'IMPOSTOS';
    ID_IMPOSTOS_ALIQUOTA = 'Aliquota';
  strict private
    class var FInstancia: TConfiguracaoAplicativo;
  private
    class procedure ReleaseInstance;

    function GetAliquota: Double;
    procedure SetAliquota(const Value: Double);
  public
    class function GetConfiguracaoApp: TConfiguracaoAplicativo;

    property Aliquota: Double read GetAliquota write SetAliquota;
  end;

implementation

uses
  System.IOUtils;


{ TConfiguracaoAplicativo }

class function TConfiguracaoAplicativo.GetConfiguracaoApp: TConfiguracaoAplicativo;
var
  IniFilePath: string;
begin
  if not Assigned(Self.FInstancia) then
  begin
    IniFilePath := TPath.Combine(
      TPath.GetDirectoryName(ParamStr(0)), 'config.ini'
    );

    Self.FInstancia := TConfiguracaoAplicativo.Create(IniFilePath);
  end;

  Result := FInstancia;
end;

class procedure TConfiguracaoAplicativo.ReleaseInstance;
begin
  if Assigned(Self.FInstancia) then
    Self.FInstancia.DisposeOf;
end;

function TConfiguracaoAplicativo.GetAliquota: Double;
begin
  Result := Self.ReadFloat(SEC_IMPOSTOS, ID_IMPOSTOS_ALIQUOTA, 13.00);
end;

procedure TConfiguracaoAplicativo.SetAliquota(const Value: Double);
begin
  Self.WriteFloat(SEC_IMPOSTOS, ID_IMPOSTOS_ALIQUOTA, Value);
end;



initialization

finalization
  TConfiguracaoAplicativo.ReleaseInstance;

end.
