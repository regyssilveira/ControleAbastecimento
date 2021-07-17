unit bomba.model;

interface

uses
  base.model,
  orm.simple.atributes;

type
  [TTabela('BOMBA')]
  TBomba = class(TBaseModel)
  private
    FID: string;
    FIdTanque: string;
    FDescricao: string;
  public
    [TCampo('id'), TPk, TNotNull]
    [TDisplay('Id da Bomba')]
    property Id: string read FID write FID;

    [TCampo('id_tanque'), TNotNull]
    [TDisplay('Id do Tanque')]
    [TVisivel]
    [TEditavel]
    property IdTanque: string read FIdTanque write FIdTanque;

    [TCampo('descricao'), TNotNull]
    [TDisplay('Descrição da Bomba')]
    [TVisivel]
    [TEditavel]
    property Descricao: string read FDescricao write FDescricao;
  end;

implementation

end.
