unit abastecimento.controller;

interface

uses
  base.model.intf,
  base.controller,
  base.controller.intf;

type
  TAbastecimentoController = class(TBaseController, IController)
  private

  public
    constructor Create;
  end;

implementation

{ TAbastecimentoController }

uses
  datamodule.conexao,
  abastecimento.model,
  abastecimento.DAO;

constructor TAbastecimentoController.Create;
begin
  FDAO := TAbastecimentoDAO.Create(
    DtmConexao.FDConnection1,
    TAbastecimentoModel
  );
end;

end.
