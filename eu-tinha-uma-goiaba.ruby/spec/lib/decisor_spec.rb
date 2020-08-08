# encoding: utf-8
require 'decisor'

describe "Carinha da Goiaba:" do
  it "Se não tem grana, não compra a goiaba" do
    compraGoiaba   = double('CompraGoiaba',   valor: 1.5, descricao: 'comprar goiaba',   pode_fazer?: false)
    compraPassagem = double('CompraPassagem', valor: 1.5, descricao: 'comprar passagem', pode_fazer?: false)
    user = Decisor.new(0.50, false, [compraGoiaba, compraPassagem])

    expect(user.decide).to eq('')
  end

  it "Tem fome e tem grana, compra a goiaba" do
    compraGoiaba   = double('CompraGoiaba',   valor: 1.5, descricao: 'comprar goiaba',   pode_fazer?: true)
    compraPassagem = double('CompraPassagem', valor: 1.5, descricao: 'comprar passagem', pode_fazer?: false)
    user = Decisor.new(2, true, [compraGoiaba, compraPassagem])

    expect(user.decide).to eq('comprar goiaba')
  end

  it "Não tem fome e tem grana, não compra a goiaba e pega o onibus" do
    compraGoiaba   = double('CompraGoiaba',   valor: 1.5, descricao: 'comprar goiaba',   pode_fazer?: false)
    compraPassagem = double('CompraPassagem', valor: 1.5, descricao: 'comprar passagem', pode_fazer?: true)
    user = Decisor.new(2, false, [compraGoiaba, compraPassagem])

    expect(user.decide).to eq('comprar passagem')
  end

  it "Tem fome e não tem grana, não compra a goiaba" do
    compraGoiaba   = double('CompraGoiaba',   valor: 1.5, descricao: 'comprar goiaba',   pode_fazer?: false)
    compraPassagem = double('CompraPassagem', valor: 1.5, descricao: 'comprar passagem', pode_fazer?: false)
    user = Decisor.new(0.5, true, [compraGoiaba, compraPassagem])

    expect(user.decide).to eq('')
  end

  it "Compra a goiaba e pega onibus" do
    compraGoiaba   = double('CompraGoiaba',   valor: 1.5, descricao: 'comprar goiaba',   pode_fazer?: true)
    compraPassagem = double('CompraPassagem', valor: 1.5, descricao: 'comprar passagem', pode_fazer?: true)
    user = Decisor.new(10, true, [compraGoiaba, compraPassagem])

    expect(user.decide).to eq('comprar goiaba e comprar passagem')
  end
end