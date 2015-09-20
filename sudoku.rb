class Sudoku

  attr_reader :board

  def initialize(board_string)
    @board = Array.new(81, "123456789")
    board_string.each_with_index do |cell, index|
      solve_cell(index, cell) if (1..9).include?(cell)}
    end
    solve(board)
  end

  def solve
  end

  def board
  end

  def to_s
  end

  private

end
