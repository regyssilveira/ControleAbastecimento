{###############################################################################

Não gosto de deixar nada engessado na aplicação, portanto, criei um arquivo
de configuração para guardar a alíquota ou outras configurações necessárias

Utilizei o padrão singleton mais no intuito de demonstrar o uso para soluções
simples como um arquivo de configuração

O valor default de 13% para a aliquota que constaq como requisito não funcinal
está como default na propriedade, então se o arquivo não for configurado
continua utilizando normalmente o valor engessado, como não foi determinado se
deveria ser configurável ou não segue atendendo as duas formas

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
