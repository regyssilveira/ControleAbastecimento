unit abastecimento.model;

interface

uses
  base.model,
  base.model.intf,
  orm.atributes;

type
  [TTabela('ABASTECIMENTO')]
  TAbastecimentoModel = class(TBaseModel, IModel)
  private
    FId: Integer;
    FIdBomba: Integer;
    FDataAbastecimento: TDateTime;
    FQuantidadeLitros: Double;
    FValorAbastecido: Double;
    FValorImposto: Double;
    FValorUnitario: Double;
    function GetValorImposto: Double;
    function GetAliquota: Double;
  public
    procedure ValidarDados; override;

    [TCampo('id', 'Id', True, False, '', 0, '', True), TNotNull]
    property Id: Integer read FId write FId;

    [TCampo('id_bomba', 'Bomba', True, True), TNotNull]
    property IdBomba: Integer read FIdBomba write FIdBomba;

    [TCampo('dt_abastecimento', 'Data', True, True, 'dd/MM/yyyy'), TNotNull]
    property DataAbastecimento: TDateTime read FDataAbastecimento write FDataAbastecimento;

    [TCampo('qt_litros', 'Qt. Litros', True, True, ',#0.000'), TNotNull]
    property QuantidadeLitros: Double read FQuantidadeLitros write FQuantidadeLitros;

    [TCampo('vl_unitario', 'Vl. Unitário', True, False, ',#0.000')]
    property ValorUnitario: Double read FValorUnitario write FValorUnitario;

    [TCampo('vl_abastecimento', 'Vl. Abastecido', True, True, ',#0.00'), TNotNull]
    property ValorAbastecido: Double read FValorAbastecido write FValorAbastecido;

    [TCampo('vl_imposto', 'Vl. Imposto', True, False, ',#0.00'), TNotNull]
    property ValorImposto: Double read GetValorImposto write FValorImposto;

    property Aliquota: Double read GetAliquota;
  end;

implementation

{ TAbastecimentoModel }

uses
  configuracao.aplicativo;

function TAbastecimentoModel.GetAliquota: Double;
var
  Config: TConfiguracaoAplicativo;
begin
  Config := TConfiguracaoAplicativo.GetConfiguracaoApp;
  Result := Config.Aliquota;
end;

function TAbastecimentoModel.GetValorImposto: Double;
begin
  if (FValorAbastecido > 0) and (Aliquota > 0 ) then
    FValorImposto := FValorAbastecido * (Aliquota / 100)
  else
    FValorImposto := 0.00;

  Result := FValorImposto;
end;

procedure TAbastecimentoModel.ValidarDados;
begin
  inherited;

end;

end.

