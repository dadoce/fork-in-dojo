class Cheque
  def initialize(value)
    @value = value
  end

  def humanize
    foo = []

    integer_part = @value.to_i
    decimal_part = @value - @value.to_i
    foo << "#{write_out(integer_part)} #{currency(integer_part)}" if integer_part > 0
    foo << "#{write_out(((decimal_part) * hundred).round)} #{currency(decimal_part)}" if decimal_part > 0

    foo.join ' e '
  end

  private

  def write_out(number, index_class = one)
    if (number / thousand).zero?
      "#{first_class_write_out number}"
    else
      "#{write_out number / thousand, index_class.next}
      #{add_numerical_class number, index_class}
      #{add_conjunction number, index_class}
      #{first_class_write_out number % thousand}"
    end.gsub(/\s+/, ' ').strip
  end

  def first_class_write_out(number)
    return if number.zero?

    number %= thousand
    if lib number
      "#{lib number}"
    else
      "#{lib(number / numeric_class(number) * numeric_class(number))}
        e #{first_class_write_out number % numeric_class(number)}"
    end
  end

  def numeric_class(number)
    number.zero? ? one : ten**Math.log10(number).to_i
  end

  def add_numerical_class(number, index_class)
    value = number % million
    i = value / thousand == one ? zero : one
    if (thousand...million).include? numeric_class(value)
      write_out_class(index_class)[i]
    end
  end
  
  def write_out_class(index)
    {
      1 => ['mil',     'mil'],
      2 => ['milhão',  'milhões'],
      3 => ['bilhão',  'bilhões'],
      4 => ['trilhão', 'trilhões']
    }[index]
  end

  def add_conjunction(number, index_class)
    'e' if index_class == one && (one...hundred).include?(number % thousand)
  end

  def lib(number)
    {
      1 => 'um',
      2 => 'dois',
      3 => 'tres',
      4 => 'quatro',
      5 => 'cinco',
      6 => 'seis',
      7 => 'sete',
      8 => 'oito',
      9 => 'nove',
      10 => 'dez',
      11 => 'onze',
      12 => 'doze',
      13 => 'treze',
      14 => 'quatorze',
      15 => 'quinze',
      16 => 'dezesseis',
      17 => 'dezessete',
      18 => 'dezoito',
      19 => 'dezenove',
      20 => 'vinte',
      30 => 'trinta',
      40 => 'quarenta',
      50 => 'cinquenta',
      60 => 'sessenta',
      70 => 'setenta',
      80 => 'oitenta',
      90 => 'noventa',
      100 => 'cento',
      200 => 'duzentos',
      300 => 'trezentos',
      400 => 'quatrocentos',
      500 => 'quinhentos',
      600 => 'seicentos',
      700 => 'setecentos',
      800 => 'oitocentos',
      900 => 'novecentos'
    }[number]
  end


  def zero;     0         end
  def one;      1         end
  def ten;      10        end
  def hundred;  100       end
  def thousand; 1_000     end
  def million;  1_000_000 end

  def currency(value)
    case value
    when 0.01
      'centavo'
    when 0.02..0.99
      'centavos'
    when 1
      'real'
    else
      'reais'
    end
  end
end
