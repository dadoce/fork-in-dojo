require 'compra_goiaba'
require 'compra_passagem'

class Decisor
  def initialize(dinheiro_na_carteira, estar_faminto, opcoes)
    @dinheiro_na_carteira = dinheiro_na_carteira
    @estar_faminto = estar_faminto
    @opcoes = opcoes
  end

  def decide
    decisao = []

    @opcoes.each do | opcao |
      if opcao.pode_fazer? @dinheiro_na_carteira, @estar_faminto
        paga opcao.valor 
        decisao << opcao.descricao
      end
    end

    decisao.join(" e ")
  end

  private

  def paga(valor)
    @dinheiro_na_carteira -= valor
  end
end