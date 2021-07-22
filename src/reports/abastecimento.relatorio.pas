unit abastecimento.relatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmAbastecimentosRelatorio = class(TForm)
    RelAbastecimentos: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    DtsAbastecimentos: TDataSource;
    QryAbastecimentos: TFDQuery;
    QryAbastecimentosdt_abastecimento: TDateTimeField;
    QryAbastecimentosid_bomba: TIntegerField;
    QryAbastecimentosid_tanque: TIntegerField;
    QryAbastecimentosvl_abastecido: TFloatField;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLDBResult1: TRLDBResult;
  private

  public
    class procedure PreviewAbastecimentos;
  end;

implementation

{$R *.dfm}

uses
  datamodule.conexao;

{ TForm1 }

class procedure TFrmAbastecimentosRelatorio.PreviewAbastecimentos;
var
  FrmAbastecimentosRelatorio: TFrmAbastecimentosRelatorio;
begin
  FrmAbastecimentosRelatorio := TFrmAbastecimentosRelatorio.Create(nil);
  try
    FrmAbastecimentosRelatorio.QryAbastecimentos.Open();
    if FrmAbastecimentosRelatorio.RelAbastecimentos.Prepare then
      FrmAbastecimentosRelatorio.RelAbastecimentos.PreviewModal;
  finally
    FreeAndNil(FrmAbastecimentosRelatorio);
  end;
end;

end.
