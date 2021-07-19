unit bomba.model;

interface

uses
  base.model,
  orm.simple.atributes;

type
  [TTabela('BOMBA')]
  TBombaModel = class(TBaseModel)
  private
    FID: string;
    FIdTanque: string;
    FDescricao: string;
  public
    [TCampo('id', 'Id da Bomba', True, False), TPk, TNotNull]
    property Id: string read FID write FID;

    [TCampo('id_tanque', 'Id do Tanque', True, True), TNotNull]
    property IdTanque: string read FIdTanque write FIdTanque;

    [TCampo('descricao', 'Descrição da Bomba', True, True), TNotNull]
    property Descricao: string read FDescricao write FDescricao;
  end;

implementation

end.
