unit tanque.cadastro.view;

interface

uses
  base.cadastro.view,
  orm.atributes,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask;

type
  TFrmTanqueCadastroView = class(TFrmBaseCadastroView, ICadastroView)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    [TCampo('id')]
    EdtID: TEdit;
    [TCampo('nome_combustivel')]
    EdtCombustivel: TComboBox;
    [TCampo('vl_litro')]
    EdtValorLitro: TMaskEdit;
  private

  public

  end;

implementation

{$R *.dfm}

end.
