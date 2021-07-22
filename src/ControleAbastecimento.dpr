program ControleAbastecimento;

uses
  Vcl.Forms,
  principal in 'principal.pas' {FrmPrincipal},
  datamodule.conexao in 'datamodule.conexao.pas' {DtmConexao: TDataModule},
  configuracao.aplicativo in 'classes\configuracao.aplicativo.pas',
  orm.atributes in 'classes\orm.atributes.pas',
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
  base.model in 'models\base.model.pas',
  abastecimento.cadastro.view in 'views\abastecimento.cadastro.view.pas' {FrmAbastecimentoCadastroView},
  abastecimento.consulta.view in 'views\abastecimento.consulta.view.pas' {FrmAbastecimentoConsultaView},
  base.cadastro.view in 'views\base.cadastro.view.pas' {FrmBaseCadastroView},
  base.consulta.view in 'views\base.consulta.view.pas' {FrmBaseConsultaView},
  bomba.cadastro.view in 'views\bomba.cadastro.view.pas' {FrmBombaCadastroView},
  bomba.consulta.view in 'views\bomba.consulta.view.pas' {FrmBombaConsultaView},
  tanque.cadastro.view in 'views\tanque.cadastro.view.pas' {FrmTanqueCadastroView},
  tanque.consulta.view in 'views\tanque.consulta.view.pas' {FrmTanqueConsultaView},
  orm.utils in 'classes\orm.utils.pas',
  dbgrid.helper in 'classes\dbgrid.helper.pas',
  base.controller in 'controllers\base.controller.pas',
  base.controller.intf in 'controllers\base.controller.intf.pas',
  base.consulta.view.intf in 'views\base.consulta.view.intf.pas',
  auxiliares.classes in 'classes\auxiliares.classes.pas',
  base.DAO.intf in 'dao\base.DAO.intf.pas',
  base.cadastro.view.intf in 'views\base.cadastro.view.intf.pas',
  base.model.intf in 'models\base.model.intf.pas',
  abastecimento.relatorio in 'reports\abastecimento.relatorio.pas' {FrmAbastecimentosRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDtmConexao, DtmConexao);
  Application.Run;
end.
