# encoding: utf-8
require 'compra_passagem'

describe CompraPassagem do
  before do
    @compra = CompraPassagem.new
  end

  it 'deveria comprar a passagem se tem grana' do
    expect(@compra.pode_fazer?(2)).to be_truthy
  end

  it 'deveria não comprar a passagem se não tem grana' do
    expect(@compra.pode_fazer?(0)).to be_falsy
  end
end