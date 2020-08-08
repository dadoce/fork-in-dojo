# encoding: utf-8
require 'compra_goiaba'

describe CompraGoiaba do
  before do
    @compra = CompraGoiaba.new
  end

  it 'deveria comprar a goiaba se tem fome e tem grana' do
    expect(@compra.pode_fazer?(2, tem_fome)).to be_truthy
  end

  it 'deveria não comprar goiaba se não tem grana' do
    expect(@compra.pode_fazer?(0, tem_fome)).to be_falsy
  end

  it 'deveria não comprar a goiaba se tem grana e não tem fome' do
    expect(@compra.pode_fazer?(0, nao_tem_fome)).to be_falsy
  end

  def tem_fome() true end
  def nao_tem_fome() false end
end