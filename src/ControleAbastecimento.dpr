program ControleAbastecimento;

uses
  Vcl.Forms,
  principal in 'principal.pas' {FrmPrincipal},
  datamodule.conexao in 'datamodule.conexao.pas' {DataModule1: TDataModule},
  configuracao.aplicativo in 'classes\configuracao.aplicativo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
