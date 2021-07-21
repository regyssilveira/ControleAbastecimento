unit bomba.model;

interface

uses
  base.model,
  base.model.intf,
  orm.atributes;

type
  [TTabela('BOMBA')]
  TBombaModel = class(TBaseModel, IModel)
  private
    FID: Integer;
    FIdTanque: Integer;
    FDescricao: string;
  public
    procedure ValidarDados; override;

    [TCampo('id', 'Id da Bomba', True, False), TPk, TNotNull]
    property Id: Integer read FID write FID;

    [TCampo('id_tanque', 'Id do Tanque', True, True), TNotNull]
    property IdTanque: Integer read FIdTanque write FIdTanque;

    [TCampo('descricao', 'Descrição da Bomba', True, True), TNotNull]
    property Descricao: string read FDescricao write FDescricao;
  end;

implementation

{ TBombaModel }

procedure TBombaModel.ValidarDados;
begin
  inherited;

end;

end.
