unit bomba.cadastro.view;

interface

uses
  base.cadastro.view,
  orm.simple.atributes,

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
  private

  public

  end;

implementation

{$R *.dfm}

end.