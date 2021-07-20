unit abastecimento.controller;

interface

uses
  base.controller;

type
  TAbastecimentoController = class(TBaseController, IController)
  private

  public
    constructor Create;
    procedure ValidarDados(const Objeto: TObject); override;
  end;

implementation

{ TAbastecimentoController }

uses
  datamodule.conexao,

  abastecimento.model,
  abastecimento.DAO,
  abastecimento.consulta.view;

constructor TAbastecimentoController.Create;
begin
  FConnection := DtmConexao.FDConnection1;
  FModeloClass := TAbastecimentoModel;
  FDAO := TAbastecimentoDAO.Create(FConnection, FModeloClass);
  FConsultaView := TFrmAbastecimentoConsultaView;
end;

procedure TAbastecimentoController.ValidarDados(const Objeto: TObject);
begin

end;

end.
