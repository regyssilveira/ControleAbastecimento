unit base.DAO;

interface

uses
  Data.DB,
  base.model,
  base.model.intf,
  base.DAO.intf,
  auxiliares.classes,
  System.Classes,
  System.SysUtils,
  System.Types,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Phys,
  FireDAC.Comp.Client, FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param;

type
  TBaseDAO = class(TInterfacedObject, IDAO)
  private
    FConnection: TFDConnection;
    FModeloClass: TBaseModelClass;

    function GetFieldList(const AToParametro: Boolean= False): string;
    function GetFieldsWithParametro(const AAdPKFields: Boolean = False): string;
    function GetPkField: string;
    function GetConnection: TFDConnection;
    function GetModelo: TBaseModelClass;
    procedure ConfigurarFieldsDataset(ADataset: TDataSet);
    function RemoveVirgulaFinal(const AString: string): string;
    function GetInsertSQL: string;
    function GetUpdateSQL: string;
    function GetParamsFromObj(const AObjeto: TBaseModel;
      const AGetParamID: Boolean = True): TFDParams;
  public
    constructor Create(AFDConnection: TFDConnection; AModelo: TBaseModelClass);

    function GetSQLCreateTable: string;
    function GetTableName: string;
    function GetSelect: string;

    function GetDataset(const AWhere: string = ''): TDataSet;

    procedure Salvar(const AObjeto: TBaseModel);
    procedure Atualizar(const AID: Integer; const AObjeto: TBaseModel);
    procedure Delete(const AID: Integer);
  end;

  TBaseDAOClass = class of TBaseDAO;

implementation

uses
  orm.atributes,
  System.Variants,
  System.StrUtils,
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

function TBaseDAO.RemoveVirgulaFinal(const AString: string): string;
begin
  Result := AString.Trim;
  if not Result.IsEmpty then
  begin
    if Result[Result.Length] = ',' then
      Result[Result.Length] := ' ';
    Result := Result.Trim;
  end;
end;

function TBaseDAO.GetSQLCreateTable: string;
var
  OContexto: TRttiContext;
  OTipo: TRttiType;
  OAtributo: TCustomAttribute;
  OPropriedade: TRttiProperty;

  TableName: string;
  TableFields: string;
  sPropType: string;

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
    for OPropriedade in OTipo.GetProperties do
    begin
      // tipo do campo
      sPropType := OPropriedade.PropertyType.Name.ToUpper;
      if sPropType.Equals('INTEGER') then
        FieldType := 'integer'
      else
      if sPropType.Equals('TDATE') then
        FieldType := 'date'
      else
      if sPropType.Equals('TDATETIME') then
        FieldType := 'datetime'
      else
      if sPropType.Equals('DOUBLE') then
        FieldType := 'double precision'
      else
        FieldType := 'text';

      FieldName    := '';
      FieldPK      := '';
      FieldNotNull := '';
      for OAtributo in OPropriedade.GetAttributes do
      begin
        if OAtributo is TCampo then
        begin
          FieldName := TCampo(OAtributo).FieldName;

          if TCampo(OAtributo).Pk then
            FieldPK := 'primary key';
        end;

        if OAtributo is TNotNull then
          FieldNotNull := 'not null';
      end;

      FieldString := FieldName;
      FieldString := FieldString + ' ' + FieldType;

      if FieldNotNull <> '' then
        FieldString := FieldString + ' ' + FieldNotNull;

      if FieldPk <> '' then
        FieldString := FieldString + ' ' + FieldPk;

      FieldString := FieldString + ',';
      TableFields := TableFields + sLineBreak + FieldString;
    end;

    TableFields := RemoveVirgulaFinal(TableFields);
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
  SFieldName: string;
begin
  Result := EmptyStr;

  OTipo := OContexto.GetType(FModeloClass);
  try
    for OPropriedade in OTipo.GetProperties do
    begin
      for OAtributo in OPropriedade.GetAttributes do
      begin
        if (OAtributo is TCampo) then
        begin
          SFieldName := TCampo(OAtributo).FieldName;
          if (TCampo(OAtributo).Pk) then
          begin
            Result := SFieldName;
            Break;
          end;
        end;
      end;
    end;
  finally
    OContexto.Free;
  end;
end;

function TBaseDAO.GetFieldList(const AToParametro: Boolean): string;
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
        if OAtributo is TCampo then
        begin
          Result := Result + IfThen(AToParametro, ':') + TCampo(OAtributo).FieldName;
          Result := Result + ',';
        end;
      end;
    end;

    Result := RemoveVirgulaFinal(Result);
  finally
    OContexto.Free;
  end;
end;

function TBaseDAO.GetFieldsWithParametro(const AAdPKFields: Boolean): string;
var
  OContexto: TRttiContext;
  OTipo: TRttiType;
  OAtributo: TCustomAttribute;
  OPropriedade: TRttiProperty;
  LinhaCampo: string;
begin
  Result := EmptyStr;

  OTipo := OContexto.GetType(FModeloClass);
  try
    for OPropriedade in OTipo.GetProperties do
    begin
      LinhaCampo := EmptyStr;

      for OAtributo in OPropriedade.GetAttributes do
      begin
        if OAtributo is TCampo then
        begin
          if (TCampo(OAtributo).Pk) and not(AAdPKFields) then
            LinhaCampo := ''
          else
          begin
            LinhaCampo := TCampo(OAtributo).FieldName;
            LinhaCampo := LinhaCampo + '= :' + LinhaCampo + ',';
          end;
        end;
      end;

      if not LinhaCampo.Trim.IsEmpty then
        Result := Result + LinhaCampo + sLineBreak;
    end;

    Result := RemoveVirgulaFinal(Result);
  finally
    OContexto.Free;
  end;
end;

function TBaseDAO.GetModelo: TBaseModelClass;
begin
  Result := FModeloClass;
end;

procedure TBaseDAO.ConfigurarFieldsDataset(ADataset: TDataSet);
var
  OContexto: TRttiContext;
  OTipo: TRttiType;
  OAtributo: TCustomAttribute;
  OPropriedade: TRttiProperty;
  CampoAtributo: TCampo;
  FieldAtu: TField;
begin
  OTipo := OContexto.GetType(FModeloClass);
  try
    for OPropriedade in OTipo.GetProperties do
    begin
      for OAtributo in OPropriedade.GetAttributes do
      begin
        if OAtributo is TCampo then
        begin
          CampoAtributo := (OAtributo as TCampo);

          FieldAtu := ADataset.FindField(CampoAtributo.FieldName);
          if Assigned(FieldAtu) then
          begin
            FieldAtu.DisplayLabel := CampoAtributo.DisplayText;
            FieldAtu.ReadOnly     := CampoAtributo.Editavel;
            FieldAtu.Visible      := CampoAtributo.Visivel;

            case FieldAtu.DataType of
              ftFloat, ftCurrency, ftBCD, ftFMTBcd:
                begin
                  (FieldAtu as TFloatField).DisplayFormat := CampoAtributo.Mascara;
                  (FieldAtu as TFloatField).EditFormat    := CampoAtributo.Mascara;
                end;

              ftDate, ftTime, ftDateTime, ftTimeStamp:
                begin
                  (FieldAtu as TDateTimeField).DisplayFormat := CampoAtributo.Mascara;
                  (FieldAtu as TDateTimeField).EditMask      := CampoAtributo.Mascara;
                end;

              ftMemo, ftWideMemo:
                begin
                  (FieldAtu as TWideMemoField).DisplayValue := TBlobDisplayValue.dvFit;
                end;
            end;
          end;
        end;
      end;
    end;
  finally
    OContexto.Free;
  end;
end;

function TBaseDAO.GetSelect: string;
begin
  Result := Format('select %s from %s', [
    Self.GetFieldList, Self.GetTableName
  ]);
end;

function TBaseDAO.GetInsertSQL: string;
begin
  Result :=
    Format('Insert into %s (%s) values (%s)', [
      GetTableName, GetFieldList, GetFieldList(True)
    ]);
end;

function TBaseDAO.GetUpdateSQL: string;
begin
  Result :=
    'update ' + GetTableName + ' set ' + sLineBreak +
    GetFieldsWithParametro             + sLineBreak +
    'where '                           + sLineBreak +
    GetPkField + ' = :' + GetPkField;
end;

function TBaseDAO.GetParamsFromObj(const AObjeto: TBaseModel;
  const AGetParamID: Boolean): TFDParams;
var
  OContexto: TRttiContext;
  OTipo: TRttiType;
  OAtributo: TCustomAttribute;
  OPropriedade: TRttiProperty;
  TipoParametro: TFieldType;
  sPropType: string;
  sNomeParametro: string;
  Valor: Variant;
begin
  Result := TFDParams.Create;

  OTipo := OContexto.GetType(AObjeto.ClassInfo);
  try
    for OPropriedade in OTipo.GetProperties do
    begin
      for OAtributo in OPropriedade.GetAttributes do
      begin
        if OAtributo is TCampo then
        begin
          sNomeParametro := TCampo(OAtributo).FieldName;

          sPropType := OPropriedade.PropertyType.Name.ToUpper;
          if sPropType.Equals('INTEGER') then
            TipoParaMetro := TFieldType.ftInteger
          else
          if sPropType.Equals('TDATE') then
            TipoParaMetro := TFieldType.ftDate
          else
          if sPropType.Equals('TDATETIME') then
            TipoParaMetro := TFieldType.ftDateTime
          else
          if sPropType.Equals('DOUBLE') then
            TipoParaMetro := TFieldType.ftFloat
          else
          if sPropType.Equals('STRING') then
            TipoParaMetro := TFieldType.ftString
          else
            TipoParaMetro := TFieldType.ftUnknown;

          if (TCampo(OAtributo).Pk) and not(AGetParamID) then
            Continue;

          if TipoParaMetro <> TFieldType.ftUnknown then
          begin
            if TCampo(OAtributo).Pk then
              Valor := Null
            else
              Valor := OPropriedade.GetValue(AObjeto).AsVariant;

            if not VarIsNull(Valor) then
            begin
              case TipoParametro of
                ftString   : Valor := VarToStr(Valor);
                ftInteger  : Valor := StrToInt(VarToStr(VAlor));
                ftFloat    : Valor := StrToFloat(VarToStr(Valor).Replace('.', ''));
                ftDate     : Valor := StrToDate(VarToStr(Valor));
                ftDateTime : Valor := StrToDateTime(VarToStr(Valor));
              end;

              Result.CreateParam(
                TipoParaMetro, sNomeParametro, TParamType.ptInput
              ).Value := Valor;
            end
            else
            begin
              Result.CreateParam(
                TipoParaMetro, sNomeParametro, TParamType.ptInput
              ).Clear;
            end;
          end;
        end;
      end;
    end;
  finally
    OContexto.Free;
  end;
end;

function TBaseDAO.GetDataset(const AWhere: string): TDataSet;
var
  SSQL: string;
begin
  if not Assigned(FConnection) then
    raise EDatabaseError.Create('Propriedade connection não foi informada.');

  SSQL := self.GetSelect;
  if not AWhere.Trim.IsEmpty then
    SSQL := SSQL + ' where ' + AWhere;

  FConnection.ExecSQL(SSQL, Result);
  ConfigurarFieldsDataset(Result);
end;

procedure TBaseDAO.Delete(const AID: Integer);
var
  PkField: string;
  TableName: string;
  CountDelete: Integer;
begin
  if AID <= 0 then
    raise Exception.Create('ID do registro não foi informado, não é possível continuar.');

  if not Assigned(FConnection) then
    raise EDatabaseError.Create('Propriedade connection não foi informada.');

  PkField := GetPkField;
  if PkField.trim.IsEmpty then
    raise Exception.Create('Propriedade "TPK" não foi configurada corretamente no modelo de dados.');

  TableName := GetTableName;
  if TableName.trim.IsEmpty then
    raise Exception.Create('Propriedade "TTableName" não foi configurada corretamente no modelo de dados.');

  CountDelete := FConnection.ExecSQL(
    'delete from ' + TableName + ' where ' + PkField + ' = ' + AID.ToString
  );

  if CountDelete <= 0 then
    raise EDatabaseError.CreateFmt('Nenhum registro foi apagado para a o identificador "%s"', [AID]);
end;

procedure TBaseDAO.Salvar(const AObjeto: TBaseModel);
var
  Parametros: TFDParams;
  SQLInsert: string;
begin
  Assert(AObjeto <> nil, 'Objeto não foi informado.');
  AObjeto.ValidarDados;

  SQLInsert  := GetInsertSQL;
  Parametros := GetParamsFromObj(AObjeto);
  try
    FConnection.ExecSQL(SQLInsert, Parametros);
  finally
    //FreeAndNil(Parametros);
  end;
end;

procedure TBaseDAO.Atualizar(const AID: Integer; const AObjeto: TBaseModel);
var
  Parametros: TFDParams;
  SQLUpdate: string;
begin
  Assert(AObjeto <> nil, 'Objeto não foi informado.');
  AObjeto.ValidarDados;

  SQLUpdate  := GetUpdateSQL;
  Parametros := GetParamsFromObj(AObjeto, False);
  try
    Parametros.CreateParam(ftInteger, GetPkField, ptInput).AsInteger := AID;

    FConnection.ExecSQL(SQLUpdate, ParaMetros);
  finally
    //FreeAndNil(Parametros);
  end;
end;

end.
