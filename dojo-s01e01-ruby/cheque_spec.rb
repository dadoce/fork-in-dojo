require 'test/unit'
require_relative 'cheque'

class ChequeTest < Test::Unit::TestCase
  def test_should_be_um_real
    um_real = Cheque.new(1)

    assert_equal 'um real', um_real.humanize
  end

  def test_should_be_dois_reais
    dois_reais = Cheque.new(2)

    assert_equal 'dois reais', dois_reais.humanize
  end

  def test_should_be_cinco_centavos
    cinco_centavos = Cheque.new(0.05)

    assert_equal 'cinco centavos', cinco_centavos.humanize
  end

  def test_should_be_cento_e_vinte_e_dois_reais
    cento_e_vinte_e_dois_reais = Cheque.new(122)

    assert_equal 'cento e vinte e dois reais', cento_e_vinte_e_dois_reais.humanize
  end

  def test_should_be_cento_e_quinze_reais
    cento_e_quinze_reais = Cheque.new(115)

    assert_equal 'cento e quinze reais', cento_e_quinze_reais.humanize
  end

  def test_should_be_cento_e_um_reais
    cento_e_um_reais = Cheque.new(101)

    assert_equal 'cento e um reais', cento_e_um_reais.humanize
  end

  def test_should_be_um_mil_reais
    um_mil_reais = Cheque.new(1_000)

    assert_equal 'um mil reais', um_mil_reais.humanize
  end

  def test_should_be_um_milhao_e_caralhada
    cheque = Cheque.new(1_562_941)

    assert_equal 'um milhão quinhentos e sessenta e dois mil novecentos e quarenta e um reais',
      cheque.humanize
  end

  def test_should_be_dois_milhões_e_trinta_e_um_reais
    cheque = Cheque.new 2_000_031

    assert_equal 'dois milhões e trinta e um reais', cheque.humanize
  end

  def test_should_be_dois_milhões_e_trinta_e_um_reais_e_vinte_e_nove_centavos
    cheque = Cheque.new 2_000_031.29

    assert_equal 'dois milhões e trinta e um reais e vinte e nove centavos', 
      cheque.humanize
  end
end
