unit tanque.controller;

interface

uses
  base.model.intf,
  base.controller,
  base.controller.intf;

type
  TTanqueController = class(TBaseController, IController)
  private

  public
    constructor Create;
  end;

implementation

{ TTanqueController }

uses
  datamodule.conexao,
  tanque.model,
  tanque.DAO;

constructor TTanqueController.Create;
begin
  FDAO := TTanqueDAO.Create(
    DtmConexao.FDConnection1,
    TTanqueModel
  );
end;

end.

