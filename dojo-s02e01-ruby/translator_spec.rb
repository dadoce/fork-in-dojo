require "minitest/autorun"
require_relative 'translator'

describe Translator do
  before do
    @cell = Translator.new
  end

  it 'should return 8 when type V' do
    @cell.type('V').
      must_equal '8'
  end

  it 'should return 4 when type I' do
    @cell.type('I').
      must_equal '4'
  end

  it 'should return 8486 when type VIVO' do
    @cell.type('VIVO').
      must_equal '8486'
  end

  it 'should return 222 when type ABC' do
    @cell.type('ABC').
      must_equal '222'
  end

  it 'should return 365668 when type DOJOMT' do
    @cell.type('DOJOMT').
      must_equal '365668'
  end

  it 'should return 1-4663-79338-4663 when type 1-HOME-SWEET-HOME' do
    @cell.type('1-HOME-SWEET-HOME').
      must_equal '1-4663-79338-4663'
  end
end
