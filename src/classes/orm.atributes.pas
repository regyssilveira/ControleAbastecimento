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
    FLista: string;
    FPk: Boolean;
  public
    constructor Create(const AFieldName: string; const ADisplayText: string = '';
      const AVisivel: Boolean = True; const AEditavel: Boolean = True;
      const AMascara: string = ''; const ATamanho: Integer = 0;
      const ALista: string = ''; const APk: Boolean = False);

    property Pk: Boolean read FPk write FPk;
    property FieldName: string read FFieldName write FFieldName;
    property DisplayText: string read FDisplayText write FDisplayText;
    property Mascara: string read FMascara write FMascara;
    property Tamanho: Integer read FTamanho write FTamanho;
    property Visivel: Boolean read FVisivel write FVisivel;
    property Editavel: Boolean read FEditavel write FEditavel;
    property Lista: string read FLista write FLista;
  end;

  TNotNull = class(TCustomAttribute)
  end;

implementation

{ Tabela }

constructor TTabela.Create(const ANome: string);
begin
  FTableName := ANome;
end;

{ TCampo }

constructor TCampo.Create(const AFieldName, ADisplayText: string;
  const AVisivel, AEditavel: Boolean; const AMascara: string;
  const ATamanho: Integer; const ALista: string; const APk: Boolean);
begin
  FPk          := APk;
  FFieldName   := AFieldName;
  FDisplayText := ADisplayText;
  FMascara     := AMascara;
  FTamanho     := ATamanho;
  FVisivel     := AVisivel;
  FEDitavel    := AEditavel;
  FLista       := ALista;
end;

end.
