{###############################################################################

  Adicionado para demonstrar o uso de helpers
  neste caso um metodo simples para ajustar as colunas de um dbgrid somente
  para demonstrar a utilização do recurso de helpers

###############################################################################}

unit dbgrid.helper;

interface

uses
  Vcl.DBGrids;

type
  TDBGridHelper = class helper for TDBGrid
    procedure AutoAjustarLarguraColunas;
  end;

implementation

{ TDBGridHelper }

procedure TDBGridHelper.AutoAjustarLarguraColunas;
var
  I: Integer;
  Coluna: TColumn;
  LabelTamanho: Integer;
  TextoTamanho: Integer;
begin
  for I := 0 to Self.Columns.Count - 1 do
  begin
    Coluna := Self.Columns[I];

    LabelTamanho := Canvas.TextWidth(Coluna.Field.DisplayLabel);
    TextoTamanho := Canvas.TextWidth(Coluna.Field.DisplayText);

    if TextoTamanho < LabelTamanho then
      TextoTamanho := LabelTamanho;

    Coluna.Width := TextoTamanho + 20;
  end;
end;

end.

