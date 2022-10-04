require_relative 'knight'

class Board
  attr_accessor :root

  def initialize(starting_square)
    @root = Knight.new(starting_square, nil)
  end


  def print_lineage(node, count = 0)
    count = print_lineage(node.parent, count + 1) unless node.parent.nil?

    p node.position
    count
  end

  def print_path(target)
    queue = []
    node = @root
    until node.position == target
      node.possible_moves.each { |move| queue.append(move) }
      node = queue.shift
    end
    length = print_lineage(node)
    puts "Not bad, it took #{length} move#{length == 1 ? '' : 's'}"
  end
end
