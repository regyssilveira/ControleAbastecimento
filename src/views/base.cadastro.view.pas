unit base.cadastro.view;

interface

uses
  base.DAO,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  ICadastroView = interface
    ['{1C609BBA-0CBC-46B5-9EA8-B46A9FAD4AFE}']
    function ShowCadastro(AOwner: TComponent; ADAO: IDAO): Boolean;
    function ShowAlteracao(AOwner: TComponent; ADAO: IDAO): Boolean;
  end;

  TFrmBaseCadastroView = class(TForm, ICadastroView)
    Panel1: TPanel;
    BtnGravar: TButton;
    PgcCadastro: TPageControl;
    TbsDadosCadastrais: TTabSheet;
  private
    FAlteracao: Boolean;
    FDAO: IDAO;
  public
    function ShowCadastro(AOwner: TComponent; ADAO: IDAO): Boolean;
    function ShowAlteracao(AOwner: TComponent; ADAO: IDAO): Boolean;

    property DAO: IDAO read FDAO;
  end;

implementation

{$R *.dfm}

{ TFrmBaseCadastroView }

function TFrmBaseCadastroView.ShowCadastro(AOwner: TComponent; ADAO: IDAO): Boolean;
var
  FrmCadastro: TFrmBaseCadastroView;
begin
  FrmCadastro := TFrmBaseCadastroView.Create(AOwner);
  try
    FrmCadastro.FAlteracao := False;
    FrmCadastro.FDAO := ADAO;

    Result := FrmCadastro.ShowModal = mrOk;
  finally
    FreeAndNil(FrmCadastro);
  end;
end;

function TFrmBaseCadastroView.ShowAlteracao(AOwner: TComponent; ADAO: IDAO): Boolean;
var
  FrmCadastro: TFrmBaseCadastroView;
begin
  FrmCadastro := TFrmBaseCadastroView.Create(AOwner);
  try
    FrmCadastro.FAlteracao := True;
    FrmCadastro.FDAO := ADAO;

    Result := FrmCadastro.ShowModal = mrOk;
  finally
    FreeAndNil(FrmCadastro);
  end;
end;

end.
