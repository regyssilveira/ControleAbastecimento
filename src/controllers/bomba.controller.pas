unit bomba.controller;

interface

uses
  base.model.intf,
  base.controller,
  base.controller.intf;

type
  TBombaController = class(TBaseController, IController)
  private

  public
    constructor Create;
  end;

implementation

{ TBombaController }

uses
  datamodule.conexao,
  bomba.model,
  bomba.DAO;

constructor TBombaController.Create;
begin
  FDAO := TBombaDAO.Create(
    DtmConexao.FDConnection1,
    TBombaModel
  );
end;

end.
