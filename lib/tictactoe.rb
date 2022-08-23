require 'pp'
class TicTacToe

  attr_accessor :board, :n, :n, :move, :player_hash, :empty_hash, :total_moves, :p0_moves_left, :p1_moves_left, :total_win_states, :keys

  def initialize(n)
    self.n = n
    self.board = Array.new(n){Array.new(n){"."}}
    self.move = 0
    total_moves = n**2
    self.p0_moves_left = total_moves.even? ? n**2/2 : n**2/2+1
    self.p1_moves_left = n**2/2
    self.player_hash = Hash.new { |h,k| h[k] = Hash.new(0) }
    self.keys = ((0..self.n).map{|i| ["x#{i}","y#{i}"]} + ["x+y",["x-y"]]).flatten
    self.total_win_states = n*2+2
  end 


  def show_board()
    return self.board
  end 

  def make_move(x,y)
      player = self.current_player() 
      self.board[y-1][x-1] = player==0 ? "X" : "O"
      self.update_player_hash(x,y)
  end 

  def update_player_hash(x,y)
      player = self.current_player() 
      self.player_hash[player]["x#{x}"]+=1
      self.player_hash[player]["y#{y}"]+=1

      if x==y
        self.player_hash[player]["x+y"]+=1
      end 
      if x==self.n-y+1
        self.player_hash[player]["x-y"]+=1
      end
  end 

  def p0_won?()
      p_has_won =self.player_hash[0].has_value?(self.n)
      p_must_win = self.p0_moves_left == 1 && self.p1_moves_left == 0 && (self.player_hash[0].keys - self.player_hash[1].keys).length >0
      return p_has_won || p_must_win
  end 

  def p1_won?()
      p_has_won = self.player_hash[1].has_value?(self.n)
      p_must_win = self.p1_moves_left == 1 && self.p0_moves_left == 0 && (self.player_hash[1].keys - self.player_hash[0].keys).length >0
    return p_has_won || p_must_win
  end 

  def is_draw?()
      p0_hash = self.player_hash[0]
      p1_hash = self.player_hash[1]
      p0_winnable_states = self.keys - p1_hash.keys
      p1_winnable_states = self.keys - p0_hash.keys
      all_win_states_are_occupied = p0_hash.keys == self.keys && p1_hash.keys == self.keys     
      num_moves_insufficient = p0_winnable_states.all? {|state| self.n-p0_hash[state] >self.p0_moves_left} && p1_winnable_states.all? {|state| self.n-p1_hash[state] >self.p1_moves_left}
      draw = all_win_states_are_occupied || num_moves_insufficient
      draw = num_moves_insufficient
      return draw
  end

  def current_player()
      self.move%2 
  end

  def next_turn()
    if self.current_player()==0
      self.p0_moves_left -=1
    else 
      self.p1_moves_left -=1
    end 
    self.move+=1
  end 

  def isValid?(x,y)
    within_limits = x<=self.n && y<=self.n
    in_empty_space = self.board[y-1][x-1]=="."
    return within_limits && in_empty_space
  end 

  def isFinished?
    finish_hash = Hash.new()
    return !self.board.flatten.include?(".")
  end

  def run_game(moves)
    # used for testing
    for i in moves
      self.make_move(i[0],i[1])
      break if self.p0_won? || self.p1_won?
      self.next_turn() 
      break if self.p0_won? || self.p1_won?
      break if self.is_draw?
    end 
  end 



end 




# ui = UserInterface.new("Player 1","Player 2", TicTacToe.new(3))
# ui.play_game()

game = TicTacToe.new(3)
# game.run_random_game()
# game.rerun_random_game([[3, 1], [3, 2], [1, 1], [1, 3], [1, 2], [2, 1], [2, 3]])
# game.run_game_print([[2, 1], [1, 3], [3, 2], [2, 2], [2, 3], [1, 2], [3, 1], [3, 3], [1, 1]])


# def run_game_print(moves)
#   print moves
#   print "\n"
#   for i in moves
#     print i 
#     print "\n"
#     self.make_move(i[0],i[1])
#     self.next_turn() 
#     print self.show_board().map(&:join).join("\n")+"\n"
#     print("WON", self.p0_won? || self.p1_won?)
#     print("DRAW", self.is_draw?)
#     print("--------\n")
#   end 
# end 

# def run_random_game()
#   r = Random.new
#   moves_set = Array(1..self.n).product(Array(1..self.n))
#   moves_made = []
#   loop do
#     random_index = r.rand(moves_set.length)
#     move = moves_set[random_index]
#     moves_made.append(move)
#     moves_set.delete_at(random_index)
#     current_player =self.current_player()
#     self.make_move(move[0],move[1])
#     print self.show_board().map(&:join).join("\n")+"\n\n"
#     break if self.p0_won? || self.p1_won?
#     self.next_turn() 

#     break if self.p0_won? || self.p1_won?
#     break if self.is_draw?
#   end
#   print moves_made
#   print "\n"
#   puts "Player #{self.p0_won? ? 0:1} Won" if self.p0_won? || self.p1_won? 
#   puts "Draw" if self.is_draw? 
#   print self.board
# end

# def rerun_random_game(moves)
#   for move in moves do
#     current_player =self.current_player()
#     self.make_move(move[0],move[1])
#     break if self.p0_won? || self.p1_won?
#     self.next_turn() 
#     print self.show_board().map(&:join).join("\n")+"\n\n"
#     break if self.p0_won? || self.p1_won?

#     break if self.is_draw?
 
#   end
#   print moves
#   print "\n"
#   puts "Player #{self.p0_won? ? 0:1} Won" if self.p0_won? || self.p1_won? 
#   puts "Draw" if self.is_draw? 
#   print self.board
# end