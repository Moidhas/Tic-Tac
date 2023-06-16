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
    self.moves = Array.new(9, 0)
    self.p1 = Player.new('X', self)
    self.p2 = Player.new('O', self)
  end

  def to_s
    index = 1
    moves.reduce(' ') do |acc, item|
      if (index % 3).zero?
        acc + "| #{item} | \n"
      else
        acc + "| #{item} |"
      end
      index += 1
      acc
    end
  end

  def play
    display_start
    loop do
     posn = p1.ask
     moves[posn - 1] = p1.sym
     puts self
     break if p1.win? || p2.win?
    end
  end

  private
  def display_start
    for i in (1..9)
      if (i % 3).zero?
        puts "| #{i} |" 
      else
        print "| #{i} |"
      end
    end
  end

end

# Player
class Player
  include InputTroubles
  attr_accessor :sym, :board, :positions

  WINNING = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
             [1, 4, 7], [2, 5, 8], [3, 6, 9],
             [1, 5, 9], [3, 5, 7]].freeze

  def initialize(symbol, board)
    self.sym = symbol
    self.board = board
    self.positions = Array.new(9)
  end

  def ask
    loop do
      print "#{sym}, input a number (1 - 9): "
      posn = input_move
      if valid_posn(posn)
        positions.push(posn) 
        break posn
      end
    end
  end

  def win?
    WINNING.filter { |winning| winning - positions != [] }.length < 8
  end

  private 
  def valid_posn(posn)
    if !posn.between?(1, 9)
      puts 'Try again please input a number between 1 and 9.'
      return false 
    elsif positions.include?(posn)
      puts 'The position has already been chosen, Try again.'
      return false
    end
    true
  end
end

board = Board.new
board.play
