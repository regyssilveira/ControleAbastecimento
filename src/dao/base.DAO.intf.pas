unit base.DAO.intf;

interface

uses
  Data.DB,
  base.model,
  base.model.intf,
  System.Classes,
  System.SysUtils,
  System.Types,
  FireDAC.Comp.Client;

type
  IDAO  = interface
    ['{5D74BB3C-7651-4C4E-AA8D-4BE82E90BC02}']
    function GetConnection: TFDConnection;
    function GetModelo: TBaseModelClass;
    function GetFieldList(const AToParametro: Boolean= False): string;
    function GetPkField: string;
    function GetSQLCreateTable: string;
    function GetTableName: string;

    function GetDataset(const AWhere: string = ''): TDataSet;

    procedure Salvar(const AObjeto: TBaseModel);
    procedure Atualizar(const AID: Integer; const AObjeto: TBaseModel);
    procedure Delete(const AID: Integer);

    property Connection: TFDConnection read GetConnection;
    property Modelo: TBaseModelClass read GetModelo;
  end;

implementation

end.
