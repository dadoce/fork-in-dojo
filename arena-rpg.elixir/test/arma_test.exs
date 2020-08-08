defmodule ArmaTest do
  use ExUnit.Case

  test "deveria criar uma arma" do
    arma = %Arma{nome: "espada", distancia: 1, dano: 20}

    assert arma[:nome] == "espada"
    assert arma[:distancia] == 1
    assert arma[:dano] == 20
  end
end
