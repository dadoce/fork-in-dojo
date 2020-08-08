require 'test/unit'
require_relative 'banheiro'
 
class BanheiroTest < Test::Unit::TestCase

	def test_deve_usar_o_mictorio_1
		banheiro = Banheiro.new([0,0,1,1,1])
		assert_equal "1", banheiro.escolhe_mictorio
	end

	def test_deve_usar_o_mictorio_5
		banheiro = Banheiro.new([1,1,1,0,0])
		assert_equal "5", banheiro.escolhe_mictorio
	end

	def test_deve_usar_o_mictorio_7
		banheiro = Banheiro.new([1,0,1,0,1,0,0,0,1])
		assert_equal "7", banheiro.escolhe_mictorio
	end

	def test_nao_deve_usar_esse_banheiro
		banheiro = Banheiro.new([1,0,1,0,1])
		assert_equal "Nao deve usar esse banheiro", banheiro.escolhe_mictorio
	end

	def test_os_dois_primeiros_mictorios_devem_estar_vagos
		banheiro = Banheiro.new([0,0,1,1,1])
		assert banheiro.os_dois_primeiros_mictorios_estao_vagos?
	end

	def test_os_dois_ultimos_mictorios_devem_estar_vagos
		banheiro = Banheiro.new([1,1,1,0,0])
		assert banheiro.os_dois_ultimos_mictorios_estao_vagos?
	end

	def test_deve_existir_espaco_entre_os_mictorios
		banheiro = Banheiro.new([1,0,0,0,1])
		assert banheiro.existe_sequencia_de_tres_mictorios_vagos?
	end

	def test_deve_achar_mictorio_mijavel
		banheiro = Banheiro.new([1,0,0,0,1])
		assert_equal "3", banheiro.ache_mictorio_mijavel
	end

	def test_nao_deve_achar_mictorio_mijavel
		banheiro = Banheiro.new([1,0,1,0,1])
		assert_equal "Nao encontrado", banheiro.ache_mictorio_mijavel
	end
end
