unit bomba.consulta.view;

interface

uses
  base.consulta.view,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, Vcl.Menus, Vcl.StdActns, System.Actions, Vcl.ActnList,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TFrmBombaConsultaView = class(TFrmBaseConsultaView)
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

implementation

{$R *.dfm}

uses
  bomba.cadastro.view;

procedure TFrmBombaConsultaView.FormCreate(Sender: TObject);
begin
  inherited;
  CadastroView := TFrmBombaCadastroView.Create(Self);
end;

end.
