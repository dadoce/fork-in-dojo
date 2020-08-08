defmodule PersonagemTest do
  use ExUnit.Case
  import Personagem

  setup do
    { :ok, arma: %{nome: "espada", distancia: 1, dano: 20} }
  end

  setup context do
    { :ok,
      [ leonidas: %Personagem{nome: "Leonidas", arma: context[:arma], hp: 200},
        hulk: %Personagem{nome: "Hulk", arma: nil, hp: 800}
      ]
    }
  end

  test "deveria criar um personagem", context do
    leonidas = context[:leonidas]
    assert leonidas.nome == "Leonidas"
    assert leonidas.hp == 200 
    assert leonidas.arma == context[:arma]
  end

  test "deveria estar vivo", context do
    assert esta_vivo(context[:leonidas])
  end

  test "deveria atacar outro personagem quando armado", context do
    vitima = ataca context[:leonidas], context[:hulk]
    assert vitima.hp == 780
  end

  test "deveria tentar atacar outro personagem quando desarmado", context  do
    atacante = %{ context[:leonidas] | arma: nil }
    assert_raise RuntimeError, "atacante necessita de uma arma", fn ->
      ataca atacante, context[:hulk]
    end
  end

  test "deveria estar armado", context do
    assert esta_armado?(context[:leonidas]) 
  end

  test "deveria não estar armado", context do 
    assert esta_armado?(context[:hulk]) == false
  end
  
  test "deveria estar atingível quando armado", context do
    atacante = context[:leonidas]
    atacante = move_para atacante, 1, 2
    vitima = %{ nome: "Chuck Noris", x: 1, y: 1 }

    assert esta_atingivel?(atacante, vitima)
  end

  test "deveria não estar atingível quando desarmado", context do
    atacante = %{ context[:leonidas] | arma: nil } 
    atacante = move_para atacante, 1, 2
    vitima = %{ nome: "Chuck Noris", x: 1, y: 1 }

    assert_raise RuntimeError, "atacante necessita de uma arma", fn -> 
      esta_atingivel?(atacante, vitima)
    end
  end

  test "deveria se mover de um ponto a outro", context do
    leonidas = context[:leonidas]
    leonidas = move_para leonidas, 1, 1
    leonidas = move_para leonidas, 4, 5

    assert leonidas.x == 4
    assert leonidas.y == 5
  end
end
