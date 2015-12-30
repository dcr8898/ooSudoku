require_relative 'spec_helper'

describe Sudoku do
  include_context "test_values"

  describe "#board_loader" do
    it "properly loads init_board" do
      sudoku = Sudoku.new(@input_01)
      expect(
        sudoku.send(:board_loader, @input_02, @start_board).join
      ).to eq(@solution_02)
    end
  end

  describe "#solve_cell" do
    it "should solve individual cells and modify cohorts" do
      sudoku = Sudoku.new(@input_01)
      expect(
        sudoku.send(:solve_cell, @start_board, 0, '1')
      ).to eq(@solve_cell_01)
    end
    it "should modify cohorts for implicitly solved cells" do
      sudoku = Sudoku.new(@input_01)
      expect(
        sudoku.send(:solve_cell, @solve_cell_02, 0, '1')
      ).to eq(@solve_cell_03)
    end
  end

end
