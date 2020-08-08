defmodule Personagem do
  @derive [Access]
  defstruct [nome: nil, arma: nil, hp: nil, x: nil, y: nil]

  def esta_vivo(this), do: this.hp > 0

  def ataca(this, vitima) do 
    unless esta_armado?(this), do: raise "atacante necessita de uma arma"    
    %{ vitima | hp: vitima.hp - this.arma.dano }
  end

  def esta_armado?(this), do: this.arma || false

  def move_para(this, x, y), do: %{ this | x: x, y: y }
  
  def esta_atingivel?(this, vitima) do 
    unless esta_armado?(this), do: raise "atacante necessita de uma arma"
    distancia_ate(this, vitima) <= this.arma.distancia
  end

  def distancia_ate(this, outro_personagem) do
    cateto_a = :math.pow this.x - outro_personagem.x, 2
    cateto_b = :math.pow this.y - outro_personagem.y, 2
    :math.sqrt cateto_a + cateto_b
  end
end
