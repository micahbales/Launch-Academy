require 'pry'

class Board

  attr_accessor :rows, :cols, :grid

  def initialize(rows = 10, cols = 10)
    @rows = rows
    @cols = cols
    @grid = []
    create_grid
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
    column_selectors = {"A" => 0, "B" => 1, "C" => 2, "D" => 3, "E" => 4, "F" => 5, "G" => 6, "H" => 7, "I" => 8, "J" => 9}

    @grid.reverse.each do |row|
      row.each_with_index do |col, col_index|
        if col_index == column_selectors[column_selection]
          if row[col_index] == " "
            row[col_index] = marker # row[col_index] != col ????
            return
          else
            break
          end
        end
      end
    end
    @grid
  end

  def win?
  end

  def column_full?
  end

  private

  def create_grid # create starting grid
    rows.times do |row|
      @grid << []
      cols.times do |col|
        @grid[row] << " "
      end
    end
  end

end
