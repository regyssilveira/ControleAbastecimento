unit base.model;

interface

uses
  Data.DB,
  Vcl.Forms,
  System.Classes,
  orm.utils,
  base.model.intf;

type
  TBaseModel = class(TInterfacedObject, IModel)
  private
    class function GetListaComponentesForm(const AForm: TForm): TStringList;
  public
    procedure ValidarDados; virtual;

    procedure BindObjectFromFields(const AFields: TFields);
    procedure BingObjectFromForm(const AForm: TForm);
    procedure BindForm(const AForm: TForm);

    class procedure ConfigurarForm(const AForm: TForm);
  end;

  TBaseModelClass = class of TBaseModel;

implementation

uses
  orm.atributes,

  System.SysUtils,
  System.RTTI,

  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.Controls,
  Vcl.Mask;

{ TBaseModel }

procedure TBaseModel.ValidarDados;
begin
  // subscrever nos filhos

end;

class function TBaseModel.GetListaComponentesForm(const AForm: TForm): TStringList;
var
  OTipo: TRttiType;
  OContexto: TRttiContext;
  OField: TRttiField;
  OAtributo: TCustomAttribute;
begin
  Result := TStringList.Create;
  Result.Clear;

  OTipo := OContexto.GetType(AForm.ClassInfo);
  try
    for OField in OTipo.GetFields do
    begin
      for OAtributo in OField.GetAttributes do
      begin
        if OAtributo is TCampo then
          Result.Add((OAtributo as TCampo).FieldName + '=' + OField.Name);
      end;
    end;
  finally
    OContexto.Free;
  end;
end;

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
  OAtributo: TCustomAttribute;
  Componente: TComponent;
  ListaComponentesForm: TStringList;
  CampoForm: string;
begin
  ListaComponentesForm := GetListaComponentesForm(AForm);
  try
    if ListaComponentesForm.Count <= 0 then
      Exit;

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
                  (Componente as TComboBox).ItemIndex := (Componente as TComboBox).Items.IndexOf(OPropriedade.GetValue(Self).ToString)
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

class procedure TBaseModel.ConfigurarForm(const AForm: TForm);
var
  OTipo: TRttiType;
  OContexto: TRttiContext;
  OPropriedade: TRttiProperty;
  OAtributo: TCustomAttribute;
  Componente: TComponent;
  ListaComponentesForm: TStringList;
  ComponenteNome: string;
begin
  ListaComponentesForm := GetListaComponentesForm(AForm);
  try
    if ListaComponentesForm.Count <= 0 then
      Exit;

    OTipo := OContexto.GetType(Self.ClassInfo);
    try
      for OPropriedade in OTipo.GetProperties do
      begin
        for OAtributo in OPropriedade.GetAttributes do
        begin
          if OAtributo is TCampo then
          begin
            ComponenteNome := ListaComponentesForm.Values[(OAtributo as TCampo).FieldName];
            if not ComponenteNome.Trim.IsEmpty then
            begin
              Componente := AForm.FindComponent(ComponenteNome);
              if Assigned(Componente) then
              begin
                (Componente as TWinControl).Enabled := (OAtributo as TCampo).Editavel;
                (Componente as TWinControl).SetTextBuf('');

                if (Componente is TEdit) then
                  (Componente as TEdit).MaxLength := (OAtributo as TCampo).Tamanho
//                else
//                if (Componente is TMaskEdit) then
//                  (Componente as TMaskEdit).EditMask := (OAtributo as TCampo).Mascara
                else
                if (Componente is TComboBox) then
                begin
                  if not (OAtributo as TCampo).Lista.Trim.IsEmpty then
                  begin
                    (Componente as TComboBox).Style      := TComboBoxStyle.csDropDownList;
                    (Componente as TComboBox).Items.Text := (OAtributo as TCampo).Lista.Replace(';', sLineBreak)
                  end;
                end
                else
                if (Componente is TDateTimePicker) then
                  (Componente as TDateTimePicker).Format := (OAtributo as TCampo).Mascara;
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

end.
