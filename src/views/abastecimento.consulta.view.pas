unit abastecimento.consulta.view;

interface

uses
  base.consulta.view,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, Vcl.Menus, Vcl.StdActns, System.Actions, Vcl.ActnList,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TFrmAbastecimentoConsultaView = class(TFrmBaseConsultaView)
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

implementation

{$R *.dfm}

uses
  abastecimento.cadastro.view;

procedure TFrmAbastecimentoConsultaView.FormCreate(Sender: TObject);
begin
  inherited;
  CadastroView := TFrmAbastecimentoCadastroView.Create(Self);
end;

end.
