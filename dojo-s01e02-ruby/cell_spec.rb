require "minitest/autorun"
require_relative 'cell'

describe Cell do
  before do
    @cell = Cell.new
  end

  it 'should type text' do
    @cell.type('SEMPRE ACESSO O DOJOPUZZLES').
      must_equal '77773367_7773302_222337777_777766606660366656667889999_9999555337777'
  end

  it 'should type yo' do
    @cell.type('YO').must_equal '999666'
  end
end
