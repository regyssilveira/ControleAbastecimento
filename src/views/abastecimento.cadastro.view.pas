unit abastecimento.cadastro.view;

interface

uses
  base.cadastro.view,
  orm.simple.atributes,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask;

type
  TFrmAbastecimentoCadastroView = class(TFrmBaseCadastroView, ICadastroView)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    [TCampo('id')]
    EdtId: TEdit;
    [TCampo('id_bomba')]
    EdtBomba: TComboBox;
    [TCampo('dt_abastecimento')]
    EdtDataLancamento: TDateTimePicker;
    [TCampo('qt_litros')]
    EdtLitros: TMaskEdit;
    [TCampo('vl_unitario')]
    EdtVlrUnitario: TMaskEdit;
    [TCampo('vl_abastecimento')]
    EdtValorTotal: TMaskEdit;
    [TCampo('vl_imposto')]
    EdtValorImposto: TMaskEdit;

  private

  public

  end;

implementation

{$R *.dfm}

end.
