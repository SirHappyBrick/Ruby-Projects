class Game

# 1) Po co ten result na końcu w sensie jak to działa xd
# 2) Co zrobić żeby nie trzeba było przekazywać (symbol)
# 3) Czemu input musi być stringiem
  attr_accessor :board, :input
  def initialize
    @board = (0...9).map {' '}
    @input = ''
  end

  def play
    welcome
    board_setup
    turn_loop
  end

  private

  def board_setup
    puts ""
    puts "#{board[0]} | #{board[1]} | #{board[2]}"
    puts separator = "---------"
    puts "#{board[3]} | #{board[4]} | #{board[5]}"
    puts separator
    puts "#{board[6]} | #{board[7]} | #{board[8]}"
    puts ""
  end

  def turn_loop
    i = 0
    while input != "exit" do
      symbol = i.odd? ? "X" : "O"
      puts "#{symbol} to move:"
      input = gets.chomp
      if valid_input?(input) and square_not_taken?(input)
        board[input.to_i - 1] = symbol
        i += 1
        board_setup
      end
      return winner(symbol) if won?(symbol)
      return if draw?(symbol)
    end
  end

  def win_combinations
    [
    [0,1,2], # top_row
    [3,4,5], # middle_row
    [6,7,8], # bottom_row
    [0,3,6], # left_column
    [1,4,7], # center_column
    [2,5,8], # right_column
    [0,4,8], # left_diagonal
    [6,4,2]  # right_diagonal
    ]
  end

  def won?(symbol)
    result = false
    win_combinations.each do |comb|
      result = true if comb.map { |index| board[index] } == [symbol, symbol, symbol]
    end
    result
  end

  def winner(symbol)
    puts "#{symbol} has won!"
  end

  def draw?(symbol)
    if board.map {|s| s != ' ' }.all?
      puts "As it should be, it's a draw"
      return true
    end
  end

  def valid_input?(input)
    if (1..9).include?(input.to_i)
      return true
    else
      puts "Please be serious and enter a number from 1 to 9"
      return false
    end
  end

  def square_not_taken?(input)
    if board[input.to_i - 1] != " "
      puts "This square is already taken!"
      return false
    else
      return true
    end
  end

  def welcome
    puts "\nWelcome in Tic Tac Toe! \n "
    puts "To fill the square, enter a number from 1 to 9, counting from the upper left corner \n "
  end
end

table = Game.new
table.play
