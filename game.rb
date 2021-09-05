require_relative "board"
require_relative "player"

BOARD_ARR = (1..9).to_a
board = Board.new(BOARD_ARR)

player1 = Player.get_info
player2 = Player.get_info
current_player = ""

def process(player, board)
  board.fill_posn(player.get_posn(board), player.sign)
  player.name
end

9.times do |n|
  board.draw
  current_player = n.odd? ? process(player1, board) : process(player2, board)
  break if board.game_won?
end

board.draw

if board.game_won?
  puts "#{current_player} won the game"
else
  puts "It's a draw"
end
