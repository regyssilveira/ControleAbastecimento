unit principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan, Vcl.ExtCtrls;

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
    Button4: TButton;
    ActRelatorio: TAction;
    procedure FormCreate(Sender: TObject);
    procedure ActAbastecimentoExecute(Sender: TObject);
    procedure ActTanqueExecute(Sender: TObject);
    procedure ActBombaExecute(Sender: TObject);
    procedure ActRelatorioExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  base.controller.intf,

  abastecimento.controller,
  bomba.controller,
  tanque.controller,

  abastecimento.consulta.view,
  bomba.consulta.view,
  tanque.consulta.view;

{$R *.dfm}

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  Self.WindowState := TWindowState.wsMaximized;
end;

procedure TFrmPrincipal.ActAbastecimentoExecute(Sender: TObject);
var
  AbastecimentoController: IController;
begin
  AbastecimentoController := TAbastecimentoController.Create;
  AbastecimentoController.ShowConsulta(TFrmAbastecimentoConsultaView);
end;

procedure TFrmPrincipal.ActBombaExecute(Sender: TObject);
var
  BombaController: IController;
begin
  BombaController := TBombaController.Create;
  BombaController.ShowConsulta(TFrmBombaConsultaView);
end;

procedure TFrmPrincipal.ActTanqueExecute(Sender: TObject);
var
  TanqueController: IController;
begin
  TanqueController := TTanqueController.Create;
  TanqueController.ShowConsulta(TFrmTanqueConsultaView);
end;

procedure TFrmPrincipal.ActRelatorioExecute(Sender: TObject);
begin

//
end;

end.

