unit bomba.controller;

interface

uses
  base.controller;

type
  TBombaController = class(TBaseController, IController)
  private

  public
    constructor Create;
    procedure ValidarDados(const Objeto: TObject); override;
  end;

implementation

{ TBombaController }

uses
  datamodule.conexao,

  bomba.model,
  bomba.DAO,
  bomba.consulta.view;

constructor TBombaController.Create;
begin
  FConnection := DtmConexao.FDConnection1;
  FModeloClass := TBombaModel;
  FDAO := TBombaDAO.Create(FConnection, FModeloClass);
  FConsultaView := TFrmBombaConsultaView;
end;

procedure TBombaController.ValidarDados(const Objeto: TObject);
begin

end;

end.
