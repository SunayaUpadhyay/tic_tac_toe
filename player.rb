# Player class for tic-tac-toe
class Player
  attr_reader :name, :sign

  @@players = []

  def initialize(name, sign)
    @name = name
    @sign = sign
    @@players << self
  end

  def self.get_info
    print 'Enter your name: '
    name = gets.chomp
    if @@players.length == 0
      print "Do you want to be 'X' or 'O'? "
      sign = gets.chomp

      unless (sign == 'O') || (sign == 'X')
        print "Enter either 'X' or 'O': "
        sign = gets.chomp
      end
    else
      sign = @@players[0].sign == 'X' ? 'O' : 'X'
      print "#{name}'s sign is #{sign}"
      puts ' '
    end

    Player.new(name, sign)
  end

  def get_posn(board)
    print "#{name}, please enter a number between(1-9) which isn't" \
         " occupied to place #{sign}: "
    num = gets.chomp.to_i

    until num.between?(1, 9)
      print 'Please enter a valid number: '
      num = gets.chomp.to_i
    end

    until board.posn_empty?(num)
      print 'The position is already filled. Please enter a new number: '
      num = gets.chomp.to_i
    end
    num
  end
end
