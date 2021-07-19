unit orm.atributes;

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
    FVisivel: Boolean;
    FFieldName: string;
    FEditavel: Boolean;
    FDisplayText: string;
    FMascara: string;
    FTamanho: Integer;
  public
    constructor Create(const AFieldName: string; const ADisplayText: string = '';
      const AVisivel: Boolean = True; const AEditavel: Boolean = True;
      const AMascara: string = ''; const ATamanho: Integer = 0);

    property FieldName: string read FFieldName write FFieldName;
    property DisplayText: string read FDisplayText write FDisplayText;
    property Mascara: string read FMascara write FMascara;
    property Tamanho: Integer read FTamanho write FTamanho;
    property Visivel: Boolean read FVisivel write FVisivel;
    property Editavel: Boolean read FEditavel write FEditavel;
  end;

  TLista = class(TCustomAttribute)
  private
    FLista: string;
  public
    constructor Create(const Alista: string);
    property Lista: string read FLista write FLista;
  end;

  TPk = class(TCustomAttribute)
  end;

  TNotNull = class(TCustomAttribute)
  end;

implementation

{ TLista }

constructor TLista.Create(const Alista: string);
begin
  FLista := Alista;
end;

{ Tabela }

constructor TTabela.Create(const ANome: string);
begin
  FTableName := ANome;
end;

{ TCampo }

constructor TCampo.Create(const AFieldName, ADisplayText: string;
  const AVisivel, AEditavel: Boolean; const AMascara: string;
  const ATamanho: Integer);
begin
  FFieldName   := AFieldName;
  FDisplayText := ADisplayText;
  FMascara     := AMascara;
  FTamanho     := ATamanho;
  FVisivel     := AVisivel;
  FEDitavel    := AEditavel;
end;

end.
