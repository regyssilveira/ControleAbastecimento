unit bomba.cadastro.view;

interface

uses
  orm.atributes,
  base.cadastro.view,
  base.cadastro.view.intf,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmBombaCadastroView = class(TFrmBaseCadastroView, ICadastroView)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    [TCampo('id')]
    EdtID: TEdit;
    [TCampo('id_tanque')]
    EdtTanque: TEdit;
    [TCampo('descricao')]
    EdtDescricao: TEdit;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

implementation

uses
  bomba.model;

{$R *.dfm}

procedure TFrmBombaCadastroView.FormCreate(Sender: TObject);
begin
  inherited;
  FModelClass := TBombaModel;
end;

end.
