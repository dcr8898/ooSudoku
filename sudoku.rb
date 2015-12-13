class Sudoku

  attr_reader :board

  # Row = index / 9
  ROWS = [[0,   1,  2,  3,  4,  5,  6,  7,  8],
          [9,  10, 11, 12, 13, 14, 15, 16, 17],
          [18, 19, 20, 21, 22, 23, 24, 25, 26],
          [27, 28, 29, 30, 31, 32, 33, 34, 35],
          [36, 37, 38, 39, 40, 41, 42, 43, 44],
          [45, 46, 47, 48, 49, 50, 51, 52, 53],
          [54, 55, 56, 57, 58, 59, 60, 61, 62],
          [63, 64, 65, 66, 67, 68, 69, 70, 71],
          [72, 73, 74, 75, 76, 77, 78, 79, 80]]

  # Column = index % 9
  COLS = [[0,  9, 18, 27, 36, 45, 54, 63, 72],
          [1, 10, 19, 28, 37, 46, 55, 64, 73],
          [2, 11, 20, 29, 38, 47, 56, 65, 74],
          [3, 12, 21, 30, 39, 48, 57, 66, 75],
          [4, 13, 22, 31, 40, 49, 58, 67, 76],
          [5, 14, 23, 32, 41, 50, 59, 68, 77],
          [6, 15, 24, 33, 42, 51, 60, 69, 78],
          [7, 16, 25, 34, 43, 52, 61, 70, 79],
          [8, 17, 26, 35, 44, 53, 62, 71, 80]]

  # Square = (index % 9 / 3) + 3 * (index / 9 / 3)
  SQRS = [[0,   1,  2,  9, 10, 11, 18, 19, 20],
          [3,   4,  5, 12, 13, 14, 21, 22, 23],
          [6,   7,  8, 15, 16, 17, 24, 25, 26],
          [27, 28, 29, 36, 37, 38, 45, 46, 47],
          [30, 31, 32, 39, 40, 41, 48, 49, 50],
          [33, 34, 35, 42, 43, 44, 51, 52, 53],
          [54, 55, 56, 63, 64, 65, 72, 73, 74],
          [57, 58, 59, 66, 67, 68, 75, 76, 77],
          [60, 61, 62, 69, 70, 71, 78, 79, 80]]

  def initialize(init_board)
    @board = Array.new(81) { "123456789" }
    board_loader(init_board)
    solve
  end

  def solve(board = @board)
    if (board == false) || invalid?(board)
      return false
    elsif solved?(board) and valid?(board)
      return board
    end
    working_cell = board.index { |cell| cell.size > 1 }
    board[working_cell].chars.each do |prospect|
      board[working_cell] = prospect
      next_board = Sudoku.new(board)
      next_board.solve(working_cell)
    end
  end

  def to_s
    board.each_with_index.with_object("") do |(cell, index), output|
      output << cell.center(10, " ")
      output << "\n" if index % 9 == 8
    end
  end

  private

  def board_loader(init_board)
    init_board.chars.each_with_index do |cell_value, index|
      if ('1'..'9').include?(cell_value)
        @board = solve_cell(@board, index, cell_value)
      end
    end
  end

  def solve_cell(solve_board, solve_cell, solve_value)
    solve_board[solve_cell] = solve_value
    solve_map = ROWS[solve_cell / 9] +
                COLS[solve_cell % 9] +
                SQRS[(solve_cell % 9 / 3) + 3 * (solve_cell / 9 / 3)]
    solve_map.select! { |index| solve_board[index].size > 1 }
    solve_map.uniq.each do |target_index|
      solve_board[target_index].delete!(solve_value)
      if solve_board[target_index].size == 1
        solve_cell(solve_board, target_index, solve_board[target_index])
      end
    end
    solve_board
  end

  def solved?(board)
    board.all? { |cell| cell.size == 1 }
  end

  def invalid?(board)
    board.any? { |cell| cell.empty? }
  end

  def valid?(board)
    groups = (ROWS + COLS + SQRS).map { |group| group.map { |index| board[index] } }
    groups.all? { |group| group.sort.join == "123456789" }
  end

  def deep_dup(board)
    board.map { |cell| cell.dup }
  end

  def debug(obj, pause = false)
    puts obj
    gets if pause
  end

end
