class CompraGoiaba
  def valor
    1.5
  end

  def pode_fazer?(dinheiro_na_carteira, estar_faminto)
    estar_faminto && valor <= dinheiro_na_carteira
  end

  def descricao
    'comprar goiaba'
  end
end