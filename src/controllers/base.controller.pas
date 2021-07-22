unit base.controller;

interface

uses
  base.model,
  base.model.intf,
  base.DAO.intf,
  base.controller.intf,
  base.consulta.view,

  System.Classes,
  System.SysUtils,
  System.Types,

  Vcl.Forms,

  FireDAC.Comp.Client;

type
  TBaseController = class(TInterfacedObject, IController)
  private
    function GetDAO: IDAO;
    function GetModelo: TBaseModelClass;
  protected
    FDAO: IDAO;
  public
    procedure ShowConsulta(const AConsultaView: TFrmBaseConsultaViewClass);
    procedure Salvar(const AObjeto: TBaseModel);
    procedure Delete(const AID: Integer);
  end;

implementation

{ TBaseController }

function TBaseController.GetDAO: IDAO;
begin
  Result := FDAO;
end;

function TBaseController.GetModelo: TBaseModelClass;
begin
  Result := FDAO.Modelo;
end;

procedure TBaseController.Delete(const AID: Integer);
begin
  FDAO.Delete(AID);
end;

procedure TBaseController.Salvar(const AObjeto: TBaseModel);
begin
  FDAO.Salvar(AObjeto);
end;

procedure TBaseController.ShowConsulta(const AConsultaView: TFrmBaseConsultaViewClass);
var
  FrmConsulta: TFrmBaseConsultaView;
begin
  Assert(FDAO <> nil, 'Classe ADO não foi informada.');
  Assert(FDAO.Connection <> nil, 'Conexão ao banco de dados não foi informada.');
  Assert(FDAO.Modelo <> nil, 'Classe do Modelo não foi informada.');

  FrmConsulta := AConsultaView.Create(nil, FDAO);
  try
    FrmConsulta.ShowModal;
  finally
    FreeAndNil(FrmConsulta);
  end;
end;

end.
