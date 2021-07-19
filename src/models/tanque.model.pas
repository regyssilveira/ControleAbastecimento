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
    [TCampo('id'), TPk, TNotNull]
    property ID: string read FID write FID;

    [TCampo('nome_combustivel'), TNotNull]
    [TDisplay('Nome do Combustível')]
    [TTamanho(20)]
    [TVisivel]
    [TEditavel]
    property Combustivel: string read FCombustivel write FCombustivel;

    [TCampo('vl_litro'), TNotNull]
    [TDisplay('Valor Litro')]
    [TMascara(',#0.000')]
    [TVisivel]
    [TEditavel]
    property ValorLitro: Double read FValorLitro write FValorLitro;
  end;

implementation

end.
