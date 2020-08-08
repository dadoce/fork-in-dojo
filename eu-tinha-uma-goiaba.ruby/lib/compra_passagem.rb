class CompraPassagem
  def valor
    1.5
  end

  def pode_fazer?(dinheiro_na_carteira, estar_faminto = false)
    valor <= dinheiro_na_carteira
  end

  def descricao
    'comprar passagem'
  end
end