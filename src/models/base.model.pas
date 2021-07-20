unit base.model;

interface

uses
  Data.DB,
  Vcl.Forms,
  orm.utils;

type
  IModel = interface
    ['{3BB78DCD-708B-45D5-A536-749EA0B4D3B7}']
    procedure BindObjectFromFields(const AFields: TFields);
    procedure BingObjectFromForm(const AForm: TForm);
    procedure BindForm(const AForm: TForm);
  end;

  TBaseModel = class(TInterfacedObject, IModel)
  private

  public
    procedure BindObjectFromFields(const AFields: TFields);
    procedure BingObjectFromForm(const AForm: TForm);
    procedure BindForm(const AForm: TForm);
  end;

  TBaseModelClass = class of TBaseModel;

implementation

uses
  orm.atributes,

  System.SysUtils,
  System.Classes,
  System.RTTI,

  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.Mask;

{ TBaseModel }

procedure TBaseModel.BindObjectFromFields(const AFields: TFields);
var
  OTipo: TRttiType;
  OContexto: TRttiContext;
  OPropriedade: TRttiProperty;
  OAtributo: TCustomAttribute;
  FieldAtu: TField;
  PropValue: Variant;
begin
  OTipo := OContexto.GetType(Self.ClassInfo);
  try
    for OPropriedade in OTipo.GetProperties do
    begin
      for OAtributo in OPropriedade.GetAttributes do
      begin
        if OAtributo is TCampo then
        begin
          FieldAtu := AFields.FindField(TCampo(OAtributo).FieldName);
          if Assigned(FieldAtu) then
            PropValue := FieldAtu.Value
          else
            PropValue := '';

          OPropriedade.SetValue(
            Pointer(Self), TValue.FromVariant(PropValue)
          );
        end;
      end;
    end;
  finally
    OContexto.Free;
  end;
end;

procedure TBaseModel.BindForm(const AForm: TForm);
var
  OTipo: TRttiType;
  OContexto: TRttiContext;
  OPropriedade: TRttiProperty;
  OField: TRttiField;
  OAtributo: TCustomAttribute;
  Componente: TComponent;
  ListaComponentesForm: TStringList;
  CampoForm: string;
begin
  ListaComponentesForm := TStringList.Create;
  try
    // listar campos configurados para buscar e preencher
    ListaComponentesForm.Clear;
    OTipo := OContexto.GetType(AForm.ClassInfo);
    try
      for OField in OTipo.GetFields do
      begin
        for OAtributo in OField.GetAttributes do
        begin
          if OAtributo is TCampo then
          begin
            ListaComponentesForm.Add(
              (OAtributo as TCampo).FieldName + '=' + OField.Name
            );
          end;
        end;
      end;
    finally
      OContexto.Free;
    end;

    // preencher campos conforme a propriedade do objeto
    OTipo := OContexto.GetType(Self.ClassInfo);
    try
      for OPropriedade in OTipo.GetProperties do
      begin
        for OAtributo in OPropriedade.GetAttributes do
        begin
          if OAtributo is TCampo then
          begin
            CampoForm := ListaComponentesForm.Values[(OAtributo as TCampo).FieldName];
            if not CampoForm.Trim.IsEmpty then
            begin
              Componente := AForm.FindComponent(CampoForm);
              if Assigned(Componente) then
              begin
                if (Componente is TEdit) then
                  (Componente as TEdit).Text := OPropriedade.GetValue(Self).ToString
                else
                if (Componente is TComboBox) then
                  (Componente as TComboBox).Text := OPropriedade.GetValue(Self).ToString
                else
                if (Componente is TMaskEdit) then
                  (Componente as TMaskEdit).Text := OPropriedade.GetValue(Self).ToString
                else
                if (Componente is TDateTimePicker) then
                  (Componente as TDateTimePicker).DateTime := OPropriedade.GetValue(Self).AsVariant;
              end;
            end;
          end;
        end;
      end;
    finally
      OContexto.Free;
    end;
  finally
    ListaComponentesForm.Free;
  end;
end;

procedure TBaseModel.BingObjectFromForm(const AForm: TForm);
begin

end;

end.
