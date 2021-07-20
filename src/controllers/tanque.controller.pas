unit tanque.controller;

interface

uses
  base.controller;

type
  TTanqueController = class(TBaseController, IController)
  private

  public
    constructor Create;
    procedure ValidarDados(const Objeto: TObject); override;
  end;

implementation

{ TTanqueController }

uses
  datamodule.conexao,

  tanque.model,
  tanque.DAO,
  tanque.consulta.view;

constructor TTanqueController.Create;
begin
  FConnection := DtmConexao.FDConnection1;
  FModeloClass := TTanqueModel;
  FDAO := TTanqueDAO.Create(FConnection, FModeloClass);
  FConsultaView := TFrmTanqueConsultaView;
end;

procedure TTanqueController.ValidarDados(const Objeto: TObject);
begin

end;

end.

