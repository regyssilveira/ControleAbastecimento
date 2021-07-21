unit tanque.model;

interface

uses
  base.model,
  base.model.intf,
  orm.atributes;

type
  [TTabela('TANQUE')]
  TTanqueModel = class(TBaseModel, IModel)
  private
    FID: Integer;
    FCombustivel: string;
    FValorLitro: Double;
  public
    procedure ValidarDados; override;

    [TCampo('id', 'Id', True), TPk, TNotNull]
    property ID: Integer read FID write FID;

    [TCampo('nome_combustivel', 'Combust�vel', True, True, '', 20, 'Gasolina;�leo Diesel'), TNotNull]
    property Combustivel: string read FCombustivel write FCombustivel;

    [TCampo('vl_litro', 'Valor Litro', True, True, ',#.000'), TNotNull]
    property ValorLitro: Double read FValorLitro write FValorLitro;
  end;

implementation

{ TTanqueModel }

procedure TTanqueModel.ValidarDados;
begin
  inherited;

end;

end.
