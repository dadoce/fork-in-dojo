defmodule Binding do
  @derive [Access]
  import Personagem
  defstruct [arena: nil]

  def move_personagem(personagem, arena, coordenada_x, coordenada_y) do
    cond do
      coordenada_x <  1 -> x = 1
    	coordenada_x >  arena.width -> x = arena.width
      coordenada_x <= arena.width -> x = coordenada_x
    end
    cond do
      coordenada_y <  1 -> y = 1
      coordenada_y >  arena.height -> y = arena.height
      coordenada_y <= arena.height -> y = coordenada_y
    end
    move_para personagem, x, y
  end
end