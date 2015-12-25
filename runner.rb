require 'benchmark'
require_relative 'sudoku'

board_strings = File.readlines('sudoku_puzzles.txt')

def run_game(board_string, index)
  board_string.chomp!
  time = Benchmark.realtime { Sudoku.new(board_string) }
  game = Sudoku.new(board_string)
  puts
  puts "Puzzle# #{index + 1} (#{time} seconds):"
  puts game
  puts
end

if ARGV.empty?
  board_strings.each_with_index do | board_string, index |
    run_game(board_string, index)
  end
else
  selected_game = ARGV[0].to_i
  ARGV.clear
  run_game(board_strings[selected_game - 1], selected_game - 1)
end
