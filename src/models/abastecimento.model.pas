unit abastecimento.model;

interface

uses
  base.model,
  orm.simple.atributes;

type
  [TTabela('ABASTECIMENTO')]
  TAbastecimentoModel = class(TBaseModel)
  private
    FValorImposto: Double;
    FValorUnitario: Double;
    FQuantidadeLitros: Double;
    FId: string;
    FIdBomba: string;
    FValorAbastecido: Double;
    FDataAbastecimento: TDateTime;
  public
    [TCampo('id'), TPk, TNotNull]
    [TDisplay('Id')]
    property Id: string read FId write FId;

    [TCampo('id_bomba'), TNotNull]
    [TDisplay('Bomba')]
    [TVisivel]
    [TEditavel]
    property IdBomba: string read FIdBomba write FIdBomba;

    [TCampo('dt_abastecimento'), TNotNull]
    [TDisplay('Data')]
    [TMascara('dd/mm/yyyy')]
    [TVisivel]
    [TEditavel]
    property DataAbastecimento: TDateTime read FDataAbastecimento write FDataAbastecimento;

    [TCampo('qt_litros'), TNotNull]
    [TDisplay('Quantidade')]
    [TMascara(',#0.000')]
    [TVisivel]
    [TEditavel]
    property QuantidadeLitros: Double read FQuantidadeLitros write FQuantidadeLitros;

    [TCampo('vl_unitario')]
    [TDisplay('Valor Unitário')]
    [TMascara(',#0.000')]
    [TVisivel]
    property ValorUnitario: Double read FValorUnitario write FValorUnitario;

    [TCampo('vl_abastecimento'), TNotNull]
    [TDisplay('Valor Abastecido')]
    [TMascara(',#0.00')]
    [TVisivel]
    property ValorAbastecido: Double read FValorAbastecido write FValorAbastecido;

    [TCampo('vl_imposto'), TNotNull]
    [TDisplay('Imposto Pago')]
    [TMascara(',#0.00')]
    [TVisivel]
    property ValorImposto: Double read FValorImposto write FValorImposto;
  end;

implementation

end.

