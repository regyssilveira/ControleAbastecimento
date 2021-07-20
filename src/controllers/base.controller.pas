unit base.controller;

interface

uses
  base.model,
  base.DAO,
  base.consulta.view,
  base.cadastro.view,

  System.Classes,
  System.SysUtils,
  System.Types,

  FireDAC.Comp.Client;

type
  IController = interface
    ['{E3E862B0-0BC6-4F77-93D8-FD0D3745E9D3}']
    function GetModelo: TBaseModelClass;
    function GetDAO: IDAO;

    procedure ShowConsulta;
    procedure Salvar(const AObjeto: TBaseModel);
    procedure Delete(const ID: string);

    property Modelo: TBaseModelClass read GetModelo;
    property DAO: IDAO read GetDAO;
  end;

  TBaseController = class(TInterfacedObject, IController)
  private
    function GetModelo: TBaseModelClass;
    function GetDAO: IDAO;
  protected
    FDAO: IDAO;
    FConsultaView: TFrmBaseConsultaViewClass;
    FModeloClass: TBaseModelClass;
    FConnection: TFDConnection;
    procedure ValidarDados(const Objeto: TObject); virtual;
  public
    procedure ShowConsulta;
    procedure Salvar(const AObjeto: TBaseModel);
    procedure Delete(const AID: string);
  end;

implementation

{ TBaseController }

function TBaseController.GetDAO: IDAO;
begin
  Result := FDAO;
end;

function TBaseController.GetModelo: TBaseModelClass;
begin
  Result := FModeloClass;
end;

procedure TBaseController.ValidarDados(const Objeto: TObject);
begin
  // escrever validações nos filhos

end;

procedure TBaseController.Delete(const AID: string);
begin
  if AID.Trim.IsEmpty then
    raise Exception.Create('ID do registro não foi informado, não é possível continuar.');

  FDAO.Delete(AID);
end;

procedure TBaseController.Salvar(const AObjeto: TBaseModel);
begin
  Assert(AObjeto <> nil, 'Objeto não foi informado.');

  ValidarDados(AObjeto);
  FDAO.Salvar(AObjeto);
end;

procedure TBaseController.ShowConsulta;
var
  FrmConsulta: TFrmBaseConsultaView;
begin
  Assert(FConnection <> nil, 'Conexão ao banco de dados não foi informada.');
  Assert(FDAO <> nil, 'Classe ADO não foi informada.');
  Assert(FModeloClass <> nil, 'Classe do Modelo não foi informada.');

  FrmConsulta := FConsultaView.Create(nil, FConnection, FDAO, FModeloClass);
  try
    FrmConsulta.ShowModal;
  finally
    FreeAndNil(FrmConsulta);
  end;
end;

end.
