require_relative 'knight'
require 'pry-byebug'

class Board
  attr_accessor :root

  def initialize(starting_square)
    @root = Knight.new(starting_square, nil)
  end


  def print_lineage(node)
    print_lineage(node.parent) unless node.parent.nil?
    p node.position
  end

  def print_path(target)
    queue = []
    node = @root
    until node.position == target
      node.possible_moves.each { |move| queue.append(move) }
      node = queue.shift
    end
    print_lineage(node)
  end
end
