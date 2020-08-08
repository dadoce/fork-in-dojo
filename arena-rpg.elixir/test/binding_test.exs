defmodule BindingTest do
  use ExUnit.Case
  import Binding

  setup do
    { :ok, arena: %{width: 20, height: 20} }
  end

  setup context do
    { :ok,
      [
        leonidas: %Personagem{nome: "Leonidas", hp: 200},
        binding: %Binding{arena: context[:arena]}
      ]
    }
  end

  test "deveria mover o personagem ao longo da arena", context do
    leonidas = move_personagem context[:leonidas], context[:arena], 4, 5
    assert leonidas.x == 4
    assert leonidas.y == 5
  end

  test "deveria mover o personagem até o limite do largura da arena quando movimento o levaria para fora", context do
  	leonidas = move_personagem context[:leonidas], context[:arena], 24, 10
    assert leonidas.x == 20
    assert leonidas.y == 10
	end
  
  test "deveria mover o personagem até o limite do altura da arena quando movimento o levaria para fora", context do
  	leonidas = move_personagem context[:leonidas], context[:arena], 15, 30
    assert leonidas.x == 15
    assert leonidas.y == 20
	end

	test "deveria mover o personagem até o limite da arena quando movimento o levaria para fora", context do
  	leonidas = move_personagem context[:leonidas], context[:arena], -10, 30
    assert leonidas.x == 1
    assert leonidas.y == 20
	end
end