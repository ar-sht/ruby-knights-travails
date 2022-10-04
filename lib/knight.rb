# frozen_string_literal: true
require 'pry-byebug'

class Knight
  attr_reader :position, :parent

  MOVE_DIFFS = [[1, 2], [-1, 2], [1, -2], [-1, -2], [2, 1], [-2, 1], [2, -1], [-2, -1]].freeze
  @@used = []

  def initialize(position, parent)
    @position = position
    @parent = parent
    @@used.append(parent)
  end

  def possible_moves
    MOVE_DIFFS
      .map { |difference| [@position[0] + difference[0], @position[1] + difference[1]] }
      .select { |move| Knight.valid?(move) }
      .reject { |move| @@used.include?(move) }
      .map { |move| Knight.new(move, self)}
  end

  def self.valid?(position)
    position.all? { |coordinate| coordinate.between?(0, 7) }
  end
end
