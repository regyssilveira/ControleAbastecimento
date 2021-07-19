unit tanque.consulta.view;

interface

uses
  base.consulta.view,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, Vcl.Menus, Vcl.StdActns, System.Actions, Vcl.ActnList,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TFrmTanqueConsultaView = class(TFrmBaseConsultaView)
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

implementation

{$R *.dfm}

uses
  tanque.cadastro.view;

procedure TFrmTanqueConsultaView.FormCreate(Sender: TObject);
begin
  inherited;
  CadastroView := TFrmTanqueCadastroView.Create(Self);
end;

end.
