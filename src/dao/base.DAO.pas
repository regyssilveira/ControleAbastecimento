unit base.DAO;

interface

uses
  Data.DB,
  base.model,
  System.Classes,
  System.SysUtils,
  System.Types,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Phys,
  FireDAC.Comp.Client, FireDAC.Stan.ExprFuncs;

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

    function GetAll(const AWhere: string = ''): TDataSet;

    procedure Salvar(AObjeto: TObject);
    procedure Delete(const AID: string);

    property Connection: TFDConnection read GetConnection;
    property Modelo: TBaseModelClass read GetModelo;
  end;

  TBaseDAO = class(TInterfacedObject, IDAO)
  private
    FConnection: TFDConnection;
    FModeloClass: TBaseModelClass;

    function GetFieldList: string;
    function GetPkField: string;
    function GetConnection: TFDConnection;
    function GetModelo: TBaseModelClass;
  public
    constructor Create(AFDConnection: TFDConnection; AModelo: TBaseModelClass);

    function GetSQLCreateTable: string;
    function GetTableName: string;
    function GetSelect: string;

    function GetAll(const AWhere: string = ''): TDataSet;

    procedure Salvar(AObjeto: TObject);
    procedure Delete(const AID: string);
  end;

  TBaseDAOClass = class of TBaseDAO;

implementation

uses
  orm.simple.atributes,
  System.RTTI;

{ TBaseDAO }

constructor TBaseDAO.Create(AFDConnection: TFDConnection; AModelo: TBaseModelClass);
begin
  FConnection  := AFDConnection;
  FModeloClass := AModelo;
end;

function TBaseDAO.GetConnection: TFDConnection;
begin
  Result := FConnection;
end;

function TBaseDAO.GetSQLCreateTable: string;
var
  OContexto: TRttiContext;
  OTipo: TRttiType;
  OAtributo: TCustomAttribute;
  OPropriedade: TRttiProperty;

  ICount: Integer;
  TableName: string;
  TableFields: string;

  FieldString: string;
  FieldName: string;
  FieldPK: string;
  FieldType: string;
  FieldNotNull: string;
begin
  TableFields := EmptyStr;

  OTipo := OContexto.GetType(FModeloClass);
  try
    // nome da tabela
    for OAtributo in OTipo.GetAttributes do
    begin
      if OAtributo is TTabela then
        TableName := TTabela(OAtributo).TableName;
    end;

    // nomes dos campos e tipos conforme tipo da propriedade
    ICount := 0;
    for OPropriedade in OTipo.GetProperties do
    begin
      Inc(ICount);

      // tipo do campo
      case OPropriedade.PropertyType.TypeKind of
        tkString, tkChar, tkWChar, tkLString, tkWString, tkVariant, tkUString:
          FieldType := 'text';
        tkInteger, tkInt64:
          FieldType := 'integer';
        tkFloat:
          FieldType := 'double precision';
      else
        FieldType := 'text';
      end;

      FieldName    := '';
      FieldPK      := '';
      FieldNotNull := '';
      for OAtributo in OPropriedade.GetAttributes do
      begin
        if OAtributo is TCampo then
          FieldName := TCampo(OAtributo).FieldName;

        if OAtributo is TPk then
          FieldPK := 'primary key';

        if OAtributo is TNotNull then
          FieldNotNull := 'not null';
      end;

      FieldString := FieldName;
      FieldString := FieldString + ' ' + FieldType;

      if FieldNotNull <> '' then
        FieldString := FieldString + ' ' + FieldNotNull;

      if FieldPk <> '' then
        FieldString := FieldString + ' ' + FieldPk;

      if ICount < Length(OTipo.GetProperties) then
        FieldString := FieldString + ',';

      TableFields := TableFields + sLineBreak + FieldString;
    end;
  finally
    OContexto.Free;
  end;

  Result :=
    'create table if not exists ' + TableName + ' (' + sLineBreak +
    TableFields.Trim + sLineBreak +
    ');';
end;

function TBaseDAO.GetTableName: string;
var
  OContexto: TRttiContext;
  OTipo: TRttiType;
  OAtributo: TCustomAttribute;
begin
  Result := EmptyStr;

  OTipo := OContexto.GetType(FModeloClass);
  try
    // nome da tabela
    for OAtributo in OTipo.GetAttributes do
    begin
      if OAtributo is TTabela then
        Result := TTabela(OAtributo).TableName;
    end;
  finally
    OContexto.Free;
  end;
end;

function TBaseDAO.GetPkField: string;
var
  OContexto: TRttiContext;
  OTipo: TRttiType;
  OAtributo: TCustomAttribute;
  OPropriedade: TRttiProperty;
begin
  Result := EmptyStr;

  OTipo := OContexto.GetType(FModeloClass);
  try
    for OPropriedade in OTipo.GetProperties do
    begin
      for OAtributo in OPropriedade.GetAttributes do
      begin
        if (OAtributo is TCampo) and (OAtributo is TPk) then
        begin
          Result := TCampo(OAtributo).FieldName;
          Break;
        end;
      end;
    end;
  finally
    OContexto.Free;
  end;
end;

function TBaseDAO.GetFieldList: string;
var
  OContexto: TRttiContext;
  OTipo: TRttiType;
  OAtributo: TCustomAttribute;
  OPropriedade: TRttiProperty;

  ICOunt: Integer;
begin
  Result := EmptyStr;

  OTipo := OContexto.GetType(FModeloClass);
  try
    ICount := 0;
    for OPropriedade in OTipo.GetProperties do
    begin
      Inc(ICOunt);

      for OAtributo in OPropriedade.GetAttributes do
      begin
        if OAtributo is TCampo then
          Result := Result + TCampo(OAtributo).FieldName;
      end;

      if ICount < Length(OTipo.GetProperties) then
        Result := Result + ',';
    end;
  finally
    OContexto.Free;
  end;
end;

function TBaseDAO.GetModelo: TBaseModelClass;
begin
  Result := FModeloClass;
end;

function TBaseDAO.GetSelect: string;
begin
  Result := Format('select %s from %s', [
    Self.GetFieldList, Self.GetTableName
  ]);
end;

function TBaseDAO.GetAll(const AWhere: string): TDataSet;
var
  SSQL: string;
begin
  if not Assigned(FConnection) then
    raise EDatabaseError.Create('Propriedade connection não foi informada.');

  SSQL := self.GetSelect;
  if not AWhere.Trim.IsEmpty then
    SSQL := SSQL + ' where ' + AWhere;

  FConnection.ExecSQL(SSQL, Result);
end;

procedure TBaseDAO.Salvar(AObjeto: TObject);
begin

end;

procedure TBaseDAO.Delete(const AID: string);
begin

end;

end.
