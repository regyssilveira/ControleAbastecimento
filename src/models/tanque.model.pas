unit tanque.model;

interface

uses
  base.model,
  orm.simple.atributes;

type
  [TTabela('TANQUE')]
  TTanqueModel = class(TBaseModel)
  private
    FID: string;
    FCombustivel: string;
    FValorLitro: Double;
  public
    [TCampo('id', 'Id', True), TPk, TNotNull]
    property ID: string read FID write FID;

    [TCampo('nome_combustivel', 'Combustível', True, True, '', 20), TNotNull]
    [TLista('Gasolina, Óleo Diesel')]
    property Combustivel: string read FCombustivel write FCombustivel;

    [TCampo('vl_litro', 'Valor Litro', True, True, ',#.000'), TNotNull]
    property ValorLitro: Double read FValorLitro write FValorLitro;
  end;

implementation

end.
