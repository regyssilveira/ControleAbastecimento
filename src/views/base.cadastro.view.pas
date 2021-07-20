unit base.cadastro.view;

interface

uses
  base.DAO,
  base.model,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask;

type
  ICadastroView = interface
    ['{1C609BBA-0CBC-46B5-9EA8-B46A9FAD4AFE}']
    function ShowCadastro(AOwner: TComponent; ADAO: IDAO): Boolean;
    function ShowAlteracao(AOwner: TComponent; ADAO: IDAO; AObjeto: IModel): Boolean;
  end;

  TFrmBaseCadastroView = class(TForm, ICadastroView)
    Panel1: TPanel;
    BtnGravar: TButton;
    PgcCadastro: TPageControl;
    TbsDadosCadastrais: TTabSheet;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FAlteracao: Boolean;
    FDAO: IDAO;
    FObjeto: IModel;
  public
    function ShowCadastro(AOwner: TComponent; ADAO: IDAO): Boolean;
    function ShowAlteracao(AOwner: TComponent; ADAO: IDAO; AObjeto: IModel): Boolean;

    property DAO: IDAO read FDAO;
  end;

implementation

{$R *.dfm}

uses
  orm.utils;

{ TFrmBaseCadastroView }

function TFrmBaseCadastroView.ShowCadastro(AOwner: TComponent; ADAO: IDAO): Boolean;
begin
  Self.FAlteracao := False;
  Self.FDAO       := ADAO;
  Self.FObjeto    := nil;

  Result := Self.ShowModal = mrOk;
end;

function TFrmBaseCadastroView.ShowAlteracao(AOwner: TComponent; ADAO: IDAO;
  AObjeto: IModel): Boolean;
begin
  Self.FAlteracao := True;
  Self.FDAO       := ADAO;
  Self.FObjeto    := AObjeto;

  Result := Self.ShowModal = mrOk;
end;

procedure TFrmBaseCadastroView.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to Self.ComponentCount - 1 do
  begin
    if (Self.Components[I] is TEdit) then
      (Self.Components[I] as TEdit).Clear
    else
    if (Self.Components[I] is TComboBox) then
      (Self.Components[I] as TComboBox).Clear
    else
    if (Self.Components[I] is TMaskEdit) then
      (Self.Components[I] as TMaskEdit).Clear
    else
    if (Self.Components[I] is TDateTimePicker) then
      (Self.Components[I] as TDateTimePicker).Date := Date;
  end;
end;

procedure TFrmBaseCadastroView.FormShow(Sender: TObject);
begin
  if Assigned(FObjeto) then
    FObjeto.BindForm(Self);
end;

end.
