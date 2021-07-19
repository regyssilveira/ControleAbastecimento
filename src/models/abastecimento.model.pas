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
    [TCampo('id', 'Id'), TPk, TNotNull]
    property Id: string read FId write FId;

    [TCampo('id_bomba', 'Bomba', True, True), TNotNull]
    property IdBomba: string read FIdBomba write FIdBomba;

    [TCampo('dt_abastecimento', 'Data', True, True, 'dd/mm/yyyy'), TNotNull]
    property DataAbastecimento: TDateTime read FDataAbastecimento write FDataAbastecimento;

    [TCampo('qt_litros', 'Qt. Litros', True, True, ',#0.000'), TNotNull]
    property QuantidadeLitros: Double read FQuantidadeLitros write FQuantidadeLitros;

    [TCampo('vl_unitario', 'Vl. Unitário', True, False, ',#0.000')]
    property ValorUnitario: Double read FValorUnitario write FValorUnitario;

    [TCampo('vl_abastecimento', 'Vl. Abastecido', True, False, ',#0.00'), TNotNull]
    property ValorAbastecido: Double read FValorAbastecido write FValorAbastecido;

    [TCampo('vl_imposto', 'Vl. Imposto', True, False, ',#0.00'), TNotNull]
    property ValorImposto: Double read FValorImposto write FValorImposto;
  end;

implementation

end.

