unit uMaquina;

interface

uses
  uIMaquina, Classes, uTroco;

type

  TMaquina = class(TInterfacedObject, IMaquina)
  public
    function MontarTroco(aTroco: Double): TList;
  end;

implementation

function TMaquina.MontarTroco(aTroco: Double): TList;
var
  FCedulas: TList;
  FCedula: TCedula;
  aQuantidade: Integer;
begin
  FCedulas := TList.Create;
  for FCedula := Low(CValorCedula) to High(CValorCedula) do
  begin
    if aTroco >= CValorCedula[FCedula] then
    begin
      aQuantidade := Trunc(aTroco / CValorCedula[FCedula]);
      aTroco := aTroco - (CValorCedula[FCedula] * aQuantidade);
      FCedulas.Add(TTroco.Create(FCedula, aQuantidade));
    end;
  end;

  Result := FCedulas;
end;

end.


