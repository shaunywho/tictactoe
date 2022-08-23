class UserInterface
  attr_accessor :player_names, :game, :move
  def initialize(player_1_name, player_2_name,game)
    self.game = game
    self.player_names =[player_1_name,player_2_name]
    self.move = 0
  end 

  def make_move()
      loop do
      puts "Select a position in 'x,y' format"
      begin
      inputs = gets.chomp.split(",").map{|input| Integer(input)}
      valid = self.game.isValid?(inputs[0],inputs[1])
      rescue StandardError => e
        puts "Input Error, please try again"
      end

      if valid
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
      break if self.game.is_draw? 
      make_move()
      self.show_board()
      break if self.game.is_won?
      self.game.next_turn()
    end 
    puts "It's a Draw" if self.game.is_draw?
    puts "#{self.player_names[self.game.current_player]} Won" if self.game.is_won?
  end

  def show_board()
    print self.game.show_board()
    print self.game.show_board().map(&:join).join("\n")+"\n"
  end

end