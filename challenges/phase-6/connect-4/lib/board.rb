class Board

  attr_accessor :rows, :cols, :grid, :columns_status

  def initialize(rows = 10, cols = 10)
    @rows = rows
    @cols = cols
    @grid = []
    create_grid
    @column_selectors = {"A" => 0, "B" => 1, "C" => 2, "D" => 3, "E" => 4, "F" => 5, "G" => 6, "H" => 7, "I" => 8, "J" => 9}
    @columns_status = {0 => false, 1 => false, 2 => false, 3 => false, 4 => false, 5 => false, 6 => false, 7 => false, 8 => false, 9 => false, }
  end

  def display_board
    @display_board = []
    @grid.each do |row|
      @display_board << '|'+ row.join(' ') + "|\n"
    end
    @display_board << " A B C D E F G H I J"
    @display_board.join('')
  end

  def drop_marker(column_selection, marker)
    @grid.reverse.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        if col_index == @column_selectors[column_selection]
          if row_index <= 8 && row[col_index] == " "
            row[col_index] = marker
            return
          elsif row_index == 9 && @columns_status[col_index] == false
            @columns_status[col_index] = true
            row[col_index] = marker
            return
          elsif row_index == 9 && @columns_status[col_index] == true
            return
          end
        end
      end
    end
    nil
  end

  def column_full?(column_selection)
    if !column_selection.is_a? Numeric || !column_selection >= 0 || !column_selection <= 9
      column_selection = @column_selectors[column_selection]
    end
    if @columns_status[column_selection] == true
      true
    else
      false
    end
  end

  def win?
    horizontal_marker = @grid[9][0]
    horizontal_streak = 0
    vertical_streaks = {0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 0, 8 => 0, 9 => 0, }
    @grid.each_with_index do |row, row_index|

        if row_index > 0
          last_row = @grid[row_index - 1]
        else
          last_row = [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "]
        end

      row.each_with_index do |col, col_index|

        if row[col_index] == last_row[col_index] && row[col_index] != " "
          vertical_streaks[col_index] += 1
        else
          vertical_streaks[col_index] = 1
        end
        if vertical_streaks[col_index] >= 4
          return true
        end

        if horizontal_marker != col && horizontal_streak == 0
          horizontal_marker = col
        elsif horizontal_marker == col && horizontal_marker != " "
          horizontal_streak += 1
          if horizontal_streak >= 4
            return true
          end
        else
          horizontal_marker = col
          horizontal_streak = 1
        end
      end
    end
    false
  end

  def tie?
    @columns_status.each do |col|
      if !col[1]
        return false
      end
    end
    return true
  end

  private

  def create_grid
    rows.times do |row|
      @grid << []
      cols.times do |col|
        @grid[row] << " "
      end
    end
  end

end
