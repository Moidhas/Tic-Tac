# frozen_string_literal: true

module Decision

end


# Board
class Board
  attr_accessor :moves, :p1, :p2

  def initialize
    self.moves = Array.new(3) { Array.new(3) }
    self.p1 = Player.new('X', self)
    self.p2 = Player.new('O', self)
  end

  def to_s
    moves.reduce('') { |acc, list| acc + "#{list}\n" }
  end
end

# Player
class Player
  attr_accessor :sym, :board

  def initialize(symbol, board)
    self.sym = symbol
    self.board = board
  end

  def move(row, column)
    board.move[row][column] = sym
  end
end
