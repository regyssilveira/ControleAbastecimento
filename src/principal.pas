unit principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids,
  Vcl.DBGrids;

type
  TFrmPrincipal = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses
  abastecimento.DAO,
  abastecimento.model, datamodule.conexao;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
var
  AbastecimentoDAO: TAbastecimentoDAO;
begin
  AbastecimentoDAO := TAbastecimentoDAO.Create(DtmConexao.FDConnection1);
  try
    if Assigned(DataSource1.DataSet) then
      DataSource1.DataSet.Free;

    //DataSource1.DataSet := AbastecimentoDAO.GetById<TAbastecimento>('tests');
    DataSource1.DataSet := AbastecimentoDAO.GetAll<TAbastecimento>;
  finally
    AbastecimentoDAO.free;
  end;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
end;

procedure TFrmPrincipal.FormDestroy(Sender: TObject);
begin
  if Assigned(DataSource1.DataSet) then
    DataSource1.DataSet.Free;
end;

end.
