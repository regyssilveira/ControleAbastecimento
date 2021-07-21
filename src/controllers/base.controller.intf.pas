unit base.controller.intf;

interface

uses
  base.model,
  base.model.intf,
  base.DAO.intf,
  base.consulta.view;

type
  IController = interface
    ['{E3E862B0-0BC6-4F77-93D8-FD0D3745E9D3}']
    function GetModelo: TBaseModelClass;
    function GetDAO: IDAO;

    procedure ShowConsulta(const AConsultaView: TFrmBaseConsultaViewClass);
    procedure Salvar(const AObjeto: IModel);
    procedure Delete(const ID: string);

    property Modelo: TBaseModelClass read GetModelo;
    property DAO: IDAO read GetDAO;
  end;

implementation

end.
