program ControleAbastecimento;

uses
  Vcl.Forms,
  principal in 'principal.pas' {FrmPrincipal},
  datamodule.conexao in 'datamodule.conexao.pas' {DtmConexao: TDataModule},
  configuracao.aplicativo in 'classes\configuracao.aplicativo.pas',
  orm.simple.atributes in 'classes\orm.simple.atributes.pas',
  abastecimento.model in 'models\abastecimento.model.pas',
  bomba.model in 'models\bomba.model.pas',
  tanque.model in 'models\tanque.model.pas',
  base.DAO in 'dao\base.DAO.pas',
  tanque.DAO in 'dao\tanque.DAO.pas',
  bomba.DAO in 'dao\bomba.DAO.pas',
  abastecimento.DAO in 'dao\abastecimento.DAO.pas',
  abastecimento.controller in 'controllers\abastecimento.controller.pas',
  tanque.controller in 'controllers\tanque.controller.pas',
  bomba.controller in 'controllers\bomba.controller.pas',
  base.model in 'models\base.model.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDtmConexao, DtmConexao);
  Application.Run;
end.
