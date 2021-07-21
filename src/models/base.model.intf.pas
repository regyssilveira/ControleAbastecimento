unit base.model.intf;

interface

uses
  Data.DB,
  Vcl.Forms;

type
  IModel = interface
    ['{3BB78DCD-708B-45D5-A536-749EA0B4D3B7}']
    procedure BindObjectFromFields(const AFields: TFields);
    procedure BingObjectFromForm(const AForm: TForm);
    procedure BindForm(const AForm: TForm);

    procedure ValidarDados;
  end;

implementation

end.
