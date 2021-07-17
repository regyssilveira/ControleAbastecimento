unit base.DAO;

interface

uses
  Data.DB,
  base.model,
  System.Classes,
  System.SysUtils,
  System.Types,
  System.Generics.Defaults,
  System.Generics.Collections,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Phys,
  FireDAC.Comp.Client, FireDAC.Stan.ExprFuncs;

type
  TBaseDAO = class
  private
    FConnection: TFDConnection;

    class function GetFieldList<T: class>: string;
    class function GetPkField<T: class>: string;
  public
    constructor Create(const AFDConnection: TFDConnection);

    class function GetSQLCreateTable<T: class>: string;
    class function GetTableName<T: class>: string;
    class function GetSelect<T: class>: string;

    function GetAll<T: class>(const AWhere: string = ''): TDataSet;

    procedure Salvar(AObjeto: TObject);

    property Connection: TFDConnection read FConnection;
  end;

implementation

uses
  orm.simple.atributes,
  System.RTTI;

{ TBaseDAO }

constructor TBaseDAO.Create(const AFDConnection: TFDConnection);
begin
  FConnection := AFDConnection;
end;

class function TBaseDAO.GetSQLCreateTable<T>: string;
var
  OContexto: TRttiContext;
  OTipo: TRttiType;
  OAtributo: TCustomAttribute;
  OPropriedade: TRttiProperty;
  ValorProp: TValue;

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

  OTipo := OContexto.GetType(T);
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

class function TBaseDAO.GetTableName<T>: string;
var
  OContexto: TRttiContext;
  OTipo: TRttiType;
  OAtributo: TCustomAttribute;
begin
  Result := EmptyStr;

  OTipo := OContexto.GetType(T);
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

class function TBaseDAO.GetPkField<T>: string;
var
  OContexto: TRttiContext;
  OTipo: TRttiType;
  OAtributo: TCustomAttribute;
  OPropriedade: TRttiProperty;

  ICOunt: Integer;
begin
  Result := EmptyStr;

  OTipo := OContexto.GetType(T);
  try
    ICount := 0;
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

class function TBaseDAO.GetFieldList<T>: string;
var
  OContexto: TRttiContext;
  OTipo: TRttiType;
  OAtributo: TCustomAttribute;
  OPropriedade: TRttiProperty;

  ICOunt: Integer;
begin
  Result := EmptyStr;

  OTipo := OContexto.GetType(T);
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

class function TBaseDAO.GetSelect<T>: string;
begin
  Result := Format('select %s from %s', [
    Self.GetFieldList<T>, Self.GetTableName<T>
  ]);
end;


function TBaseDAO.GetAll<T>(const AWhere: string): TDataSet;
var
  SSQL: string;
begin
  if not Assigned(Self.Connection) then
    raise EDatabaseError.Create('Propriedade connection não foi informada.');

  SSQL := self.GetSelect<T>;
  if not AWhere.Trim.IsEmpty then
    SSQL := SSQL + ' where ' + AWhere;

  Self.Connection.ExecSQL(SSQL, Result);
end;

procedure TBaseDAO.Salvar(AObjeto: TObject);
begin

end;

end.
