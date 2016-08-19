board_a = [
  ['x', 'o', 'x'],
  ['x', nil, 'o'],
  ['x', 'o', nil]
]

board_b = [
  [nil, 'o', 'x'],
  ['x', 'o', nil],
  ['x', 'o', nil]
]

def print_grid(board)
  board.each_with_index do |row, index|
    row.each do |col|
      if col.nil?
        row[index] = " "
      end
    end
    this_row = board[index].join(' | ')
    divider = ""
    this_row.length.times do
      divider += "-"
    end
    puts this_row
    if row.last.nil?
      divider += "-"
    end
    if row != board.last
      puts divider
    end
  end
end

print_grid(board_b)
