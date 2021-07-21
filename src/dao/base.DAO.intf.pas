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
    function GetFieldList: string;
    function GetPkField: string;
    function GetConnection: TFDConnection;
    function GetModelo: TBaseModelClass;
    function GetSQLCreateTable: string;
    function GetTableName: string;
    function GetSelect: string;

    function GetDataset(const AWhere: string = ''): TDataSet;

    procedure Salvar(AObjeto: IModel);
    procedure Delete(const AID: string);

    property Connection: TFDConnection read GetConnection;
    property Modelo: TBaseModelClass read GetModelo;
  end;

implementation

end.
