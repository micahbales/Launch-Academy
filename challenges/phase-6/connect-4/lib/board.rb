require 'pry'

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

  def display_board #iterate over grid to print display
    @display_board = []
    @grid.each do |row|
      @display_board << '|'+ row.join(' ') + "|\n"
    end
    @display_board << " A B C D E F G H I J"
    @display_board.join('')
  end

  def drop_marker(column_selection, marker) # assign markers to the grid
    @grid.reverse.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        if col_index == @column_selectors[column_selection] #find appropriate column
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

  def column_full?(column_selection) # return true or false, depending if inputted column is full
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
