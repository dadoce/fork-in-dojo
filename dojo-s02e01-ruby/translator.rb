class Translator
  def type(text)
    text.split(//).map { |e| type_letter(e) }.join('')
  end

  private

  def type_letter(letter)
    keyboard[ keyboard.keys.find { |e| e.include? letter } ] or letter
  end

  def keyboard
    {
      'ABC' => '2',
      'DEF' => '3',
      'GHI' => '4',
      'JKL' => '5',
      'MNO' => '6',
      'PQRS'=> '7',
      'TUV' => '8',
      'WXYZ'=> '9'
    }
  end
end
