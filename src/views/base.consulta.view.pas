unit base.consulta.view;

interface

uses
  base.DAO,
  base.model,
  base.cadastro.view,

  FireDAC.Comp.Client,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan, Vcl.ToolWin, Vcl.ActnCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus, Vcl.StdActns, Vcl.ExtCtrls, Vcl.ComCtrls,

  dbgrid.helper;

type
  TFrmBaseConsultaView = class(TForm)
    DBGridConsulta: TDBGrid;
    DtsConsulta: TDataSource;
    ActionList1: TActionList;
    ActRegistroNovo: TAction;
    ActRegistroAlterar: TAction;
    ActRegistroApagar: TAction;
    MainMenu1: TMainMenu;
    Registro1: TMenuItem;
    Novo1: TMenuItem;
    ActRegistroAlterar1: TMenuItem;
    ActRegistroApagar1: TMenuItem;
    ActRegistroAtualizar: TAction;
    Atualizar1: TMenuItem;
    N1: TMenuItem;
    StatusBar1: TStatusBar;
    procedure ActRegistroNovoExecute(Sender: TObject);
    procedure ActRegistroAlterarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActRegistroAtualizarExecute(Sender: TObject);
    procedure DtsConsultaStateChange(Sender: TObject);
    procedure DtsConsultaDataChange(Sender: TObject; Field: TField);
    procedure ActRegistroApagarExecute(Sender: TObject);
    procedure DBGridConsultaDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FConnection: TFDConnection;
    FConsultaDAO: IDAO;
    FConsultaDAOClass: TBaseDAOClass;
    FConsultaModelClass: TBaseModelClass;
    FCadastroView: ICadastroView;
    procedure AbrirTabela;
  public
    class procedure ShowConsulta(const AOwner: TComponent;
      const AConnection: TFDConnection; const ADAO: TBaseDAOClass;
      const AModelo: TBaseModelClass);

    property CadastroView: ICadastroView read FCadastroView write FCadastroView;
  end;

implementation

{$R *.dfm}

class procedure TFrmBaseConsultaView.ShowConsulta(const AOwner: TComponent;
  const AConnection: TFDConnection; const ADAO: TBaseDAOClass;
  const AModelo: TBaseModelClass);
var
  FrmConsulta: TFrmBaseConsultaView;
begin
  Assert(AConnection <> nil, 'Conex�o ao banco de dados n�o foi informada.');
  Assert(ADAO <> nil, 'Classe ADO n�o foi informada.');
  Assert(AModelo <> nil, 'Classe do Modelo n�o foi informada.');

  FrmConsulta := TFrmBaseConsultaView.Create(AOwner);
  try
    FrmConsulta.FConnection         := AConnection;
    FrmConsulta.FConsultaDAOClass   := ADAO;
    FrmConsulta.FConsultaModelClass := AModelo;
    FrmConsulta.ShowModal;
  finally
    FreeAndNil(FrmConsulta);
  end;
end;

procedure TFrmBaseConsultaView.DBGridConsultaDblClick(Sender: TObject);
begin
  if ActRegistroAlterar.Enabled then
    ActRegistroAlterar.Execute;
end;

procedure TFrmBaseConsultaView.DtsConsultaDataChange(Sender: TObject;
  Field: TField);
begin
  DtsConsultaStateChange(Sender);
end;

procedure TFrmBaseConsultaView.DtsConsultaStateChange(Sender: TObject);
begin
  if Assigned(DtsConsulta.DataSet) then
  begin
    ActRegistroNovo.Enabled    := True;
    ActRegistroAlterar.Enabled := not DtsConsulta.DataSet.IsEmpty;
    ActRegistroApagar.Enabled  := not DtsConsulta.DataSet.IsEmpty;
  end;
end;

procedure TFrmBaseConsultaView.AbrirTabela;
begin
  if Assigned(DtsConsulta.DataSet) then
    FreeAndNil(DtsConsulta.DataSet);

  FConsultaDAO := FConsultaDAOClass.Create(FConnection, FConsultaModelClass);
  DtsConsulta.DataSet := FConsultaDAO.GetDataset;

  DBGridConsulta.AutoAjustarLarguraColunas;
end;

procedure TFrmBaseConsultaView.FormCreate(Sender: TObject);
begin
  //
end;

procedure TFrmBaseConsultaView.FormDestroy(Sender: TObject);
begin
  if Assigned(DtsConsulta.DataSet) then
    FreeAndNil(DtsConsulta.DataSet);
end;

procedure TFrmBaseConsultaView.FormShow(Sender: TObject);
begin
  AbrirTabela;
end;

procedure TFrmBaseConsultaView.ActRegistroNovoExecute(Sender: TObject);
begin
  CadastroView.ShowCadastro(Self, FConsultaDAO);
end;

procedure TFrmBaseConsultaView.ActRegistroAlterarExecute(Sender: TObject);
begin
  CadastroView.ShowAlteracao(Self, FConsultaDAO);
end;

procedure TFrmBaseConsultaView.ActRegistroApagarExecute(Sender: TObject);
begin
  if Application.MessageBox(
    'Deseja realmente apagar o registro escolhido?',
    'Apagar',
    MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = ID_YES then
  begin
    FConsultaDAO.Delete(
      DtsConsulta.DataSet.FieldByName('ID').AsString
    );
  end;
end;

procedure TFrmBaseConsultaView.ActRegistroAtualizarExecute(Sender: TObject);
begin
  AbrirTabela;
end;

end.

