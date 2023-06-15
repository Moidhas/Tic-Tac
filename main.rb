# frozen_string_literal: true

# InputTroubles
module InputTroubles
  def input_move
    begin
      input = gets.chomp
      input = Integer(input)
    rescue StandardError
      print 'Not an Integer Value Try Again: '
      retry
    end
    input
  end
end

# Board
class Board
  attr_accessor :moves, :p1, :p2

  def initialize
    self.moves = Array.new(3) { Array.new(3, 0) }
    self.p1 = Player.new('X', self)
    self.p2 = Player.new('O', self)
  end

  def to_s
    moves.reduce('') { |acc, list| acc + "#{list}\n" }
  end

  def play
    puts self
    posn = p1.ask
    moves[posn[0]][posn[1]] = p1.sym
    puts self
  end
end

# Player
class Player
  include InputTroubles
  attr_accessor :sym, :board

  def initialize(symbol, board)
    self.sym = symbol
    self.board = board
  end

  def ask
    print "#{sym} pick a row: "
    row = input_move
    print "\n#{sym} pick a column: "
    col = input_move
    [row, col]
  end
end

board = Board.new
board.play
