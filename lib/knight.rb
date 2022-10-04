# frozen_string_literal: true
require 'pry-byebug'

class Knight
  attr_accessor :position, :possible_moves

  def initialize(square = [nil, nil], used = [])
    @possible_moves = []
    @move_diffs = [[1, 2], [-1, 2], [1, -2], [-1, -2], [2, 1], [-2, 1], [2, -1], [-2, -1]].sort_by { |x| x[0] }
    @position = square

    @move_diffs.each do |diff|
      new_position = []
      @position.each_with_index { |coord, i| new_position << coord + diff[i] }
      unless new_position.any? { |coord| coord.negative? || coord > 7 } || used.include?(new_position)
        used.append(new_position)
        @possible_moves << new_position
      end
    end
    @possible_moves.map! { |move| Knight.new(move, used) }
  end

  def <=>(other)
    @position <=> other.data
  end
end

tester = Knight.new([3, 3])
