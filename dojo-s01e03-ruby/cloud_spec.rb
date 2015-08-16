require 'minitest/autorun'
require_relative 'cloud'

describe Cloud do
  before do
    grid     = [8, 7]
    clouds   = [[2, 0], [6, 0], [7, 0],
                [1, 1], [2, 1],
                [0, 2], [1, 2], [2, 2],
                [1, 3],
                [1, 4]]
    airports = [[4, 2], [7, 2], [6, 4], [3, 5]]
    @dado = Cloud.new grid, clouds, airports
  end

  it 'should inform the number of days until a first airport stay under the cloud of ash' do
    @dado.days_until_first_airport_covered.must_equal 2
  end

  it 'should inform the number of days until all airports remain covered by ash' do
    @dado.days_until_every_airports_covered.must_equal 4
  end
end
