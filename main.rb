# frozen_string_literal: true

# Board
class Board
  attr_accessor(:p1, :p2, :moves)

  def initialize(pl1, pl2)
    self.p1 = pl1
    self.p2 = pl2
    pl1.board = self
    pl2.board = self
    self.moves = Array.new(3) { Array.new(3) }
  end

  def to_s
    moves.reduce('') do |acc, list|
      acc + "#{list}\n"
    end
  end
end

# Player
class Player
  attr_accessor(:name, :piece, :board)

  def initialize(name, piece)
    self.name = name
    self.piece = piece
  end
end

p1 = Player.new(p1, 'X')
p2 = Player.new(p2, 'O')
board = Board.new(p1, p2)
puts board
