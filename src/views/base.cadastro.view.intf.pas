unit base.cadastro.view.intf;

interface

uses
  System.Classes,
  base.model.intf,
  base.DAO.intf;

type
  ICadastroView = interface
    ['{1C609BBA-0CBC-46B5-9EA8-B46A9FAD4AFE}']
    function ShowCadastro(AOwner: TComponent; ADAO: IDAO): Boolean;
    function ShowAlteracao(AOwner: TComponent; ADAO: IDAO; AObjeto: IModel; AID: Integer): Boolean;
  end;


implementation

end.
