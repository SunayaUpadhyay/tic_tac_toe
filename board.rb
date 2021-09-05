# board is 1D array with 9 elements.

# Board class for tic-tac-toe
class Board
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def posn_empty?(posn)
    board[posn - 1].is_a?(Numeric)
  end

  def fill_posn(posn, str)
    @board[posn - 1] = str
  end

  def game_won?
    # check vertical for win
    3.times do |n|
      return true if board[n] == board[n + 3] && board[n + 3] == board[n + 6]
    end

    # check horizontal for win
    [0, 3, 6].each do |n|
      return true if board[n] == board[n + 1] && board[n + 1] == board[n + 2]
    end

    # check / diagonal for win
    return true if board[2] == board[4] && board[4] == board[6]

    # check \ diagonal for win
    return true if board[0] == board[4] && board[5] == board[8]

    false
  end

  def draw
    puts "
    "
    print "             #{board[0]} | #{board[1]} | #{board[2]}\n"\
          "            ---+---+---\n"\
          "             #{board[3]} | #{board[4]} | #{board[5]}\n"\
          "            ---+---+---\n"\
          "             #{board[6]} | #{board[7]} | #{board[8]}\n"
    puts "
    "
  end
end
