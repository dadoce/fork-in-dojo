class Matriz
  attr_reader :columns, :lines, :matrix_area

  def initialize(columns, lines)
    @columns = columns
    @lines = lines
    @matrix = Array.new(lines){ Array.new(columns) }
    @matrix_area = columns * lines
    @sequence = 0
  end

  def mount_matrix
    cycle = even_cycle = 0

    while @sequence < matrix_area do
      (even_cycle..last_position_column - (cycle + one)).each do | c |
        @matrix[cycle][c] ||= next_number!
      end
      (cycle..last_position_line - (cycle + one)).each do | l |
        @matrix[l][last_position_column - cycle] ||= next_number!
      end
      (last_position_column - cycle).downto(even_cycle + one) do | c |
        @matrix[last_position_line - cycle][c] ||= next_number!
      end
      (last_position_line - cycle).downto(cycle + two) do | l |
        @matrix[l][cycle] ||= next_number!
      end

      cycle = cycle.next
      even_cycle = even_cycle.next if cycle.even?
    end
    @matrix
  end

  private 
  
  def last_position_column
    @columns - 1
  end

  def last_position_line
    @lines - 1
  end

  def next_number!
    @sequence = @sequence.next
  end

  def one
    1
  end

  def two
    2
  end
end