unit principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids,
  Vcl.DBGrids, System.Actions, Vcl.ActnList, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.PlatformDefaultStyleActnCtrls, Vcl.Menus, Vcl.ExtCtrls;

type
  TFrmPrincipal = class(TForm)
    ActionManager1: TActionManager;
    ActAbastecimento: TAction;
    ActTanque: TAction;
    ActBomba: TAction;
    PnlMenu: TPanel;
    PnlClient: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ActAbastecimentoExecute(Sender: TObject);
    procedure ActTanqueExecute(Sender: TObject);
    procedure ActBombaExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  datamodule.conexao,

  bomba.consulta.view,
  tanque.consulta.view,
  abastecimento.consulta.view,

  abastecimento.DAO,
  bomba.DAO,
  tanque.DAO,

  abastecimento.model,
  bomba.model,
  tanque.model;

{$R *.dfm}

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
end;

procedure TFrmPrincipal.ActAbastecimentoExecute(Sender: TObject);
begin
  TFrmAbastecimentoConsultaView.ShowConsulta(
    PnlClient,
    DtmConexao.FDConnection1,
    TAbastecimentoDAO,
    TAbastecimentoModel
  );
end;

procedure TFrmPrincipal.ActBombaExecute(Sender: TObject);
begin
  TFrmBombaConsultaView.ShowConsulta(
    Self,
    DtmConexao.FDConnection1,
    TBombaDAO,
    TBombaModel
  );
end;

procedure TFrmPrincipal.ActTanqueExecute(Sender: TObject);
begin
  TFrmTanqueConsultaView.ShowConsulta(
    Self,
    DtmConexao.FDConnection1,
    TTanqueDAO,
    TTanqueModel
  );
end;

end.
