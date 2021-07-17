unit orm.simple.atributes;

interface

uses
  System.RTTI, System.Variants, System.Classes;

type
  TTabela = class(TCustomAttribute)
  private
    FTableName: string;
  public
    constructor Create(const ANome: string);
    property TableName: string read FTableName write FTableName;
  end;

  TCampo = class(TCustomAttribute)
  private
    FFieldName: string;
  public
    constructor Create(const ANome: string);
    property FieldName: string read FFieldName write FFieldName;
  end;

  TDisplay = class(TCustomAttribute)
  private
    FNome: string;
  public
    constructor Create(const ANome: string);
    property Nome: string read FNome write FNome;
  end;

  TMascara = class(TCustomAttribute)
  private
    FNome: string;
  public
    constructor Create(const ANome: string);
    property Nome: string read FNome write FNome;
  end;

  TTamanho = class(TCustomAttribute)
  private
    FTamanho: Integer;
  public
    constructor Create(const ATamanho: Integer);
    property Tamanho: Integer read FTamanho write FTamanho;
  end;

  TPk = class(TCustomAttribute)
  end;

  TNotNull = class(TCustomAttribute)
  end;

  TVisivel = class(TCustomAttribute)
  end;

  TEditavel = class(TCustomAttribute)
  end;

implementation

{ Tabela }

constructor TTabela.Create(const ANome: string);
begin
  FTableName := ANome;
end;

{ Campo }

constructor TCampo.Create(const ANome: string);
begin
  FFieldName  := ANome;
end;

{ Display }

constructor TDisplay.Create(const ANome: string);
begin
  FNome := ANome;
end;

{ Mascara }

constructor TMascara.Create(const ANome: string);
begin
  FNome := ANome;
end;

{ Tamanho }

constructor TTamanho.Create(const ATamanho: Integer);
begin
  FTamanho := ATamanho;
end;

end.
