# encoding: utf-8
require 'decisor'
require 'compra_goiaba'
require 'compra_passagem'

describe "Integration" do
  before do
    compraGoiaba   = CompraGoiaba.new 
    compraPassagem = CompraPassagem.new
    @opcoes        = [compraGoiaba, compraPassagem]
  end

  it "Se não tem grana, não compra a goiaba" do
    user = Decisor.new(0.50, nao_tem_fome, @opcoes)

    expect(user.decide).to eq('')
  end

  it "Tem fome e tem grana, compra a goiaba" do
    user = Decisor.new(2, tem_fome, @opcoes)

    expect(user.decide).to eq('comprar goiaba')
  end

  it "Não tem fome e tem grana, não compra a goiaba e pega o onibus" do
    user = Decisor.new(2, nao_tem_fome, @opcoes)

    expect(user.decide).to eq('comprar passagem')
  end

  it "Tem fome e não tem grana, não compra a goiaba" do
    user = Decisor.new(0.5, tem_fome, @opcoes)

    expect(user.decide).to eq('')
  end

  it "Compra a goiaba e pega onibus" do
    user = Decisor.new(10, tem_fome, @opcoes)

    expect(user.decide).to eq('comprar goiaba e comprar passagem')
  end

  def tem_fome() true end
  def nao_tem_fome() false end
end