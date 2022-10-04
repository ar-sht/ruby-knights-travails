require_relative 'knight'
require 'pry-byebug'

class Board
  attr_accessor :root

  def initialize(starting_square = [0, 0])
    @root = Knight.new(starting_square)
  end
end
