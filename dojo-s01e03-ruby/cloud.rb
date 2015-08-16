class Cloud
  def initialize(grid, clouds, airports)
    @days = airports.map { |a| clouds.map { |c| (a.first - c.first).abs + (a.last - c.last).abs }.min }
  end

  def days_until_first_airport_covered
    @days.min
  end

  def days_until_every_airports_covered
    @days.max
  end
end
