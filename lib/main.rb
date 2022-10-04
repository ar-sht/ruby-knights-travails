require_relative 'board'

def knight_moves(start_pos, end_pos)
  board = Board.new(start_pos)
  board.print_path(end_pos)
end

10.times do |i|
  start_pos = Array.new(2) { rand(0..7) }
  end_pos = Array.new(2) { rand(0..7) }
  puts "Try ##{i + 1} (#{start_pos} - #{end_pos}):"
  knight_moves(start_pos, end_pos)
  puts
end
