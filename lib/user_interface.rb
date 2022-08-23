require_relative "./tictactoe"
class UserInterface
  attr_accessor :game
  def initialize(game)
    self.game = game
  end 

  def make_move()
      loop do
      puts "Select a position in 'x,y' format"
      begin
      inputs = gets.chomp.split(",").map{|input| Integer(input)}
      rescue StandardError => e
        puts "Input Error, please try again"
      end
      if self.game.isValid?(inputs[0],inputs[1])
        self.game.make_move(inputs[0],inputs[1])
        break
      else
        puts "Invalid Position"
      end
    end 
  end


  def play_game()
    puts "Welcome to TicTacToe"
    puts "This is the board"
    self.show_board()
    loop do
      make_move()
      self.show_board()
      break if self.game.p0_won? || self.game.p1_won?
      self.game.next_turn()
      break if self.game.p0_won? || self.game.p1_won?
      break if self.game.is_draw?
    end 
    puts "It's a Draw" if self.game.is_draw?
    puts "Player 0 Won" if self.game.p0_won?
    puts "Player 1 Won" if self.game.p1_won?
  end

  def show_board()
    print self.game.show_board().map(&:join).join("\n")+"\n"
  end

end

ui = UserInterface.new(TicTacToe.new(3))
ui.play_game()