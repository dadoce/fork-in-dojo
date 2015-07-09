class Cell
  def type(text)
    text.split(//).map { |e| type_letter(e) }.reduce do |word, letter|
      "#{word}#{'_' if word.split(//).last == letter.split(//).first}#{letter}"
    end
  end

  private

  def type_letter(bar)
    xs = keyboard.find { |k, v| k.include? bar }
    xs.last * xs.first.index(bar).next
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
      'WXYZ'=> '9',
      ' '   => '0'
    }
  end
end
