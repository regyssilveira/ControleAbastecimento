unit base.consulta.view;

interface

uses
  base.DAO.intf,
  base.model,
  base.consulta.view.intf,
  base.cadastro.view.intf,

  FireDAC.Comp.Client,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan, Vcl.ToolWin, Vcl.ActnCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus, Vcl.StdActns, Vcl.ExtCtrls, Vcl.ComCtrls,

  dbgrid.helper;

type
  TFrmBaseConsultaView = class(TForm, IConsultaView)
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
    FConsultaDAO: IDAO;
    FCadastroView: ICadastroView;

    procedure AbrirTabela;
  public
    constructor Create(const AOwner: TComponent; const ADAO: IDAO); overload;

    property CadastroView: ICadastroView read FCadastroView write FCadastroView;
  end;

  TFrmBaseConsultaViewClass = class of TFrmBaseConsultaView;

implementation

{$R *.dfm}

uses
  orm.utils,
  base.model.intf;

constructor TFrmBaseConsultaView.Create(const AOwner: TComponent;
  const ADAO: IDAO);
begin
  inherited Create(AOwner);

  FConsultaDAO := ADAO;

  Assert(FConsultaDAO <> nil, 'Classe ADO não foi informada.');
  Assert(FConsultaDAO.Connection <> nil, 'Conexão ao banco de dados não foi informada.');
  Assert(FConsultaDAO.Modelo <> nil, 'Classe do Modelo não foi informada.');
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
var
  ObjSelectionado: IModel;
begin
  ObjSelectionado := FConsultaDAO.Modelo.Create;
  ObjSelectionado.BindObjectFromFields(DtsConsulta.DataSet.Fields);

  CadastroView.ShowAlteracao(Self, FConsultaDAO, ObjSelectionado);
end;

procedure TFrmBaseConsultaView.ActRegistroApagarExecute(Sender: TObject);
begin
  if Application.MessageBox(
    'Deseja realmente apagar o registro escolhido?',
    'Apagar',
    MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = ID_YES then
  begin
    FConsultaDAO.Delete(
      DtsConsulta.DataSet.FieldByName(FConsultaDAO.GetPkField).AsString
    );

    AbrirTabela;
  end;
end;

procedure TFrmBaseConsultaView.ActRegistroAtualizarExecute(Sender: TObject);
begin
  AbrirTabela;
end;

end.

