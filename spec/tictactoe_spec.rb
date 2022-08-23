require "tictactoe"


describe "TicTacToe" do


  context "when initialized" do
    before(:each) do
      @tictactoe = TicTacToe.new(3)
    end
    it "returns an empty board" do

      expect(@tictactoe.show_board()).to eq([[".", ".", "."],[".", ".", "."],[".", ".", "."]])

    end 

    it "returns a board with a marker placed in the correct position" do
      position = [1,2]
      @tictactoe.make_move(position[0],position[1])
      expect(@tictactoe.show_board()).to eq([[".", ".", "."],["X", ".", "."],[".", ".", "."]])
    end 

    # it "returns an empty board when a marker is placed outside of the boundaries" do
    #   position = [4,2]
    #   @tictactoe.make_move(position[0],position[1])
    #   expect(@tictactoe.show_board()).to eq([[".", ".", "."],[".", ".", "."],[".", ".", "."]])

    # end 
  end 

  context "For a 3x3 board" do
    context "a draw condition is reached" do
      before(:each) do
        @tictactoe = TicTacToe.new(3)
      end
      context "when there are insufficient moves" do
        it "determines a draw case 1" do
          # insufficient moves left [[3, 1], [3, 3], [1, 3], [1, 2], [1, 1], [2, 1], [3, 2], [2, 2]]
          moves =[[3, 1], [3, 3], [1, 3], [1, 2], [1, 1], [2, 1], [3, 2], [2, 2]]
          @tictactoe.run_game(moves)
          expect(@tictactoe.p1_won?).to eq false
          expect(@tictactoe.p0_won?).to eq false
          expect(@tictactoe.is_draw?).to eq true
        end 
        it "determines a draw case 2" do
          # insufficient moves left [[3, 3], [3, 2], [3, 1], [2, 2], [2, 3], [1, 1], [1, 2], [1, 3]]
          moves = [[3, 3], [3, 2], [3, 1], [2, 2], [2, 3], [1, 1], [1, 2], [1, 3]]
          @tictactoe.run_game(moves)
          expect(@tictactoe.p1_won?).to eq false
          expect(@tictactoe.p0_won?).to eq false
          expect(@tictactoe.is_draw?).to eq true
        end 

        

        it "determines a draw case 3" do
          # insufficient moves left [[3, 3], [3, 2], [3, 1], [2, 2], [2, 3], [1, 1], [1, 2], [1, 3]]
          moves = [[3, 1], [3, 2], [1, 1], [1, 3], [1, 2], [2, 1], [2, 3]]
          @tictactoe.run_game(moves)
          expect(@tictactoe.p1_won?).to eq false
          expect(@tictactoe.p0_won?).to eq false
          expect(@tictactoe.is_draw?).to eq true
        end 
     end

     context "when there are no available moves" do
      it "determines a draw case 1" do
        # draw moves [[2, 3], [2, 1], [3, 3], [3, 2], [1, 2], [1, 3], [3, 1]]
        moves =[[2, 3], [2, 1], [3, 3], [3, 2], [1, 2], [1, 3], [3, 1]]
        @tictactoe.run_game(moves)
        expect(@tictactoe.p1_won?).to eq false
        expect(@tictactoe.p0_won?).to eq false
        expect(@tictactoe.is_draw?).to eq true
      end 
    end 



      it "determines a draw when there are sufficient moves left configuration 3" do
        # insufficient moves left [[3, 1], [3, 2], [1, 1], [1, 3], [1, 2], [2, 1], [2, 3]]
        @tictactoe.run_game([[3, 1], [3, 2], [1, 1], [1, 3], [1, 2], [2, 1], [2, 3]])
        expect(@tictactoe.p1_won?).to eq false
        expect(@tictactoe.p0_won?).to eq false
        expect(@tictactoe.is_draw?).to eq true
      end 

      it "determines a draw when there are sufficient moves left configuration 4" do
        # insufficient moves left [[3, 3], [1, 3], [2, 1], [2, 2], [1, 2], [3, 2], [2, 3], [1, 1]]
        @tictactoe.run_game([[3, 3], [1, 3], [2, 1], [2, 2], [1, 2], [3, 2], [2, 3], [1, 1]])
        expect(@tictactoe.p1_won?).to eq false
        expect(@tictactoe.p0_won?).to eq false
        expect(@tictactoe.is_draw?).to eq true
      end 
    end

    context "A win condition is reached" do
      before(:each) do
        @tictactoe = TicTacToe.new(3)
      end
      context "when player 1 makes a move" do
        it "determines player 1 as the winner case 1" do
          # win condition [[2, 1], [3, 3], [1, 2], [2, 2], [3, 2], [3, 1], [1, 3], [1, 1]]
          moves = [[2, 1], [3, 3], [1, 2], [2, 2], [3, 2], [3, 1], [1, 3], [1, 1]] 
          @tictactoe.run_game(moves)
          expect(@tictactoe.p1_won?).to eq true
          expect(@tictactoe.p0_won?).to eq false
          expect(@tictactoe.is_draw?). to eq false
        end 
        it "determines player 1 as the winner case 2" do
          # win condition [[3, 3], [2, 3], [3, 2], [1, 1], [1, 3], [2, 1], [1, 2], [2, 2]]
          moves = [[3, 3], [2, 3], [3, 2], [1, 1], [1, 3], [2, 1], [1, 2], [2, 2]]
          @tictactoe.run_game(moves)
          expect(@tictactoe.p1_won?).to eq true
          expect(@tictactoe.p0_won?).to eq false
          expect(@tictactoe.is_draw?). to eq false
        end 
        it "determines player 1 as the winner case 3" do
          # win condition [[3, 1], [2, 3], [3, 3], [2, 2], [1, 3], [3, 2], [1, 1], [1, 2]]
          moves = [[3, 1], [2, 3], [3, 3], [2, 2], [1, 3], [3, 2], [1, 1], [1, 2]]
          @tictactoe.run_game(moves)
          expect(@tictactoe.p1_won?).to eq true
          expect(@tictactoe.p0_won?).to eq false
          expect(@tictactoe.is_draw?). to eq false
        end 

      end 
      context "when player 0 makes a move" do
        it "determines player 0 as the winner case 1" do
          # win condition [[1, 3], [2, 1], [1, 2], [3, 3], [2, 2], [1, 1], [3, 1]]
          moves = [[1, 3], [2, 1], [1, 2], [3, 3], [2, 2], [1, 1], [3, 1]] 
          @tictactoe.run_game(moves)
          expect(@tictactoe.p0_won?).to eq true
          expect(@tictactoe.p1_won?).to eq false
          expect(@tictactoe.is_draw?). to eq false
        end 
        it "determines player 0 as the winner case 2" do
          # win condition [[3, 3], [2, 3], [1, 1], [3, 2], [1, 2], [3, 1], [2, 2]]
          moves = [[3, 3], [2, 3], [1, 1], [3, 2], [1, 2], [3, 1], [2, 2]]
          @tictactoe.run_game(moves)
          expect(@tictactoe.p0_won?).to eq true
          expect(@tictactoe.p1_won?).to eq false
          expect(@tictactoe.is_draw?). to eq false
        end 
        it "determines player 1 as the winner case 3" do
          # win condition [[2, 2], [3, 1], [2, 1], [1, 1], [1, 2], [3, 3], [3, 2]]
          moves = [[2, 2], [3, 1], [2, 1], [1, 1], [1, 2], [3, 3], [3, 2]]
          @tictactoe.run_game(moves)
          expect(@tictactoe.p0_won?).to eq true
          expect(@tictactoe.p1_won?).to eq false
          expect(@tictactoe.is_draw?). to eq false
        end 

      end
      context "when a win condition is inevitable" do
        before(:each) do
          @tictactoe = TicTacToe.new(3)
        end
        it "determines player 0 as the winner case 1" do
          # must win condition [[2, 2], [3, 2], [2, 3], [1, 2], [3, 1], [2, 1], [3, 3], [1, 1]]
          moves =[[2, 2], [3, 2], [2, 3], [1, 2], [3, 1], [2, 1], [3, 3], [1, 1]]
          @tictactoe.run_game(moves)
          expect(@tictactoe.p0_won?).to eq true
          expect(@tictactoe.p1_won?).to eq false
          expect(@tictactoe.is_draw?). to eq false
        end 
    
        it "determines player 0 as the winner case 2" do
          # must win condition [[1, 1], [2, 3], [3, 2], [3, 1], [2, 2], [1, 3], [2, 1], [1, 2]]
          moves =[[1, 1], [2, 3], [3, 2], [3, 1], [2, 2], [1, 3], [2, 1], [1, 2]]
          @tictactoe.run_game(moves)
          expect(@tictactoe.p0_won?).to eq true
          expect(@tictactoe.p1_won?).to eq false
          expect(@tictactoe.is_draw?). to eq false
        end 
    
        it "determines player 0 as the winner case 3" do
          # must win condition [[3, 2], [1, 3], [1, 1], [3, 3], [2, 1], [3, 1], [2, 3], [1, 2]]
          moves =[[3, 2], [1, 3], [1, 1], [3, 3], [2, 1], [3, 1], [2, 3], [1, 2]]
          @tictactoe.run_game(moves)
          expect(@tictactoe.p0_won?).to eq true
          expect(@tictactoe.p1_won?).to eq false
          expect(@tictactoe.is_draw?). to eq false
        end 
    
        it "determines player 0 as the winner case 4" do
          # must win condition [[1, 3], [2, 2], [3, 2], [3, 1], [2, 1], [3, 3], [1, 1], [2, 3]]
          moves = [[1, 3], [2, 2], [3, 2], [3, 1], [2, 1], [3, 3], [1, 1], [2, 3]]
          @tictactoe.run_game(moves)
          expect(@tictactoe.p0_won?).to eq true
          expect(@tictactoe.p1_won?).to eq false
          expect(@tictactoe.is_draw?). to eq false
        end 
    
        it "determines player 0 as the winner case 5" do
          # must win condition [[2, 1], [3, 2], [2, 3], [1, 1], [3, 3], [2, 2], [1, 2], [3, 1]]
          moves = [[2, 1], [3, 2], [2, 3], [1, 1], [3, 3], [2, 2], [1, 2], [3, 1]]
          @tictactoe.run_game(moves)
          expect(@tictactoe.p0_won?).to eq true
          expect(@tictactoe.p1_won?).to eq false
          expect(@tictactoe.is_draw?). to eq false
        end 
    
      end
    end 
  end

  context "for a 4x4 board" do
    context "A draw condition is reached" do
      before(:each) do
        @tictactoe = TicTacToe.new(4)
      end

      context "when there are no available wins" do
        it "determines a draw case 1" do
          # draw moves [[3, 1], [1, 1], [3, 3], [3, 4], [2, 4], [2, 3], [1, 3], [1, 4], [4, 4], [1, 2], [4, 3], [4, 1], [2, 1], [4, 2], [3, 2]]
          moves =[[3, 1], [1, 1], [3, 3], [3, 4], [2, 4], [2, 3], [1, 3], [1, 4], [4, 4], [1, 2], [4, 3], [4, 1], [2, 1], [4, 2], [3, 2]]
          @tictactoe.run_game(moves)
          expect(@tictactoe.p1_won?).to eq false
          expect(@tictactoe.p0_won?).to eq false
          expect(@tictactoe.is_draw?). to eq true
        end
        it "determines a draw case 2" do
          # draw moves [[1, 2], [1, 3], [4, 2], [4, 4], [3, 2], [2, 2], [2, 4], [3, 3], [3, 1], [2, 1], [1, 1], [3, 4], [4, 3]]
          moves = [[1, 2], [1, 3], [4, 2], [4, 4], [3, 2], [2, 2], [2, 4], [3, 3], [3, 1], [2, 1], [1, 1], [3, 4], [4, 3]]
          @tictactoe.run_game(moves)
          expect(@tictactoe.p1_won?).to eq false
          expect(@tictactoe.p0_won?).to eq false
          expect(@tictactoe.is_draw?). to eq true
        end
        it "determines a draw case 3" do
          # draw moves [[1, 3], [3, 3], [2, 4], [2, 2], [1, 1], [1, 2], [4, 2], [3, 4], [4, 4], [4, 3], [4, 1], [2, 3], [3, 1], [2, 1]]
          moves = [[1, 3], [3, 3], [2, 4], [2, 2], [1, 1], [1, 2], [4, 2], [3, 4], [4, 4], [4, 3], [4, 1], [2, 3], [3, 1], [2, 1]]
          @tictactoe.run_game(moves)
          expect(@tictactoe.p1_won?).to eq false
          expect(@tictactoe.p0_won?).to eq false
          expect(@tictactoe.is_draw?). to eq true
        end

      end 
      context "when there are insufficient moves" do
        it "determines a draw case 1" do
        # draw moves [[4, 2], [1, 2], [3, 2], [2, 1], [4, 3], [4, 1], [2, 4], [1, 3], [2, 3], [1, 1], [3, 1], [3, 4], [1, 4]]
        moves =[[4, 2], [1, 2], [3, 2], [2, 1], [4, 3], [4, 1], [2, 4], [1, 3], [2, 3], [1, 1], [3, 1], [3, 4], [1, 4]]
        @tictactoe.run_game(moves)
        expect(@tictactoe.p1_won?).to eq false
        expect(@tictactoe.p0_won?).to eq false
        expect(@tictactoe.is_draw?). to eq true
        end 
        it "determines a draw case 2" do
          # draw moves [[4, 1], [4, 2], [1, 1], [1, 3], [3, 3], [3, 4], [4, 3], [1, 2], [2, 2], [2, 1], [2, 3], [2, 4], [1, 4], [3, 2], [3, 1]]
          moves =[[4, 1], [4, 2], [1, 1], [1, 3], [3, 3], [3, 4], [4, 3], [1, 2], [2, 2], [2, 1], [2, 3], [2, 4], [1, 4], [3, 2], [3, 1]]
          @tictactoe.run_game(moves)
          expect(@tictactoe.p1_won?).to eq false
          expect(@tictactoe.p0_won?).to eq false
          expect(@tictactoe.is_draw?). to eq true
        end 

        it "determines a draw case 3" do
          # draw moves [[3, 4], [4, 1], [1, 2], [3, 2], [3, 3], [2, 1], [4, 4], [4, 2], [2, 3], [2, 2], [1, 3], [4, 3], [1, 1], [3, 1], [2, 4]]
          moves = [[3, 4], [4, 1], [1, 2], [3, 2], [3, 3], [2, 1], [4, 4], [4, 2], [2, 3], [2, 2], [1, 3], [4, 3], [1, 1], [3, 1], [2, 4]]
          @tictactoe.run_game(moves)
          expect(@tictactoe.p1_won?).to eq false
          expect(@tictactoe.p0_won?).to eq false
          expect(@tictactoe.is_draw?). to eq true
        end 
      end 
      

    end 
    context "A win condition is reached" do
      before(:each) do
        @tictactoe = TicTacToe.new(4)
      end
      context "when player 1 makes a move" do
        it "determines player 1 as the winner case 1" do
          # win condition [[3, 3], [4, 1], [1, 4], [4, 4], [3, 2], [2, 4], [2, 3], [4, 3], [1, 2], [3, 1], [2, 2], [1, 1], [2, 1], [4, 2]]
          moves = [[3, 3], [4, 1], [1, 4], [4, 4], [3, 2], [2, 4], [2, 3], [4, 3], [1, 2], [3, 1], [2, 2], [1, 1], [2, 1], [4, 2]]
          @tictactoe.run_game(moves)
          expect(@tictactoe.p1_won?).to eq true
          expect(@tictactoe.p0_won?).to eq false
          expect(@tictactoe.is_draw?). to eq false
        end 
        it "determines player 1 as the winner case 2" do
          # win condition [[1, 1], [1, 2], [4, 3], [4, 2], [1, 3], [4, 4], [3, 3], [1, 4], [2, 1], [3, 2], [2, 4], [4, 1], [2, 2], [2, 3]]
          moves = [[1, 1], [1, 2], [4, 3], [4, 2], [1, 3], [4, 4], [3, 3], [1, 4], [2, 1], [3, 2], [2, 4], [4, 1], [2, 2], [2, 3]]
          @tictactoe.run_game(moves)
          expect(@tictactoe.p1_won?).to eq true
          expect(@tictactoe.p0_won?).to eq false
          expect(@tictactoe.is_draw?). to eq false
        end 
        it "determines player 1 as the winner case 3" do
          # win condition [[3, 4], [3, 1], [4, 4], [1, 3], [4, 1], [2, 3], [4, 2], [1, 2], [3, 3], [1, 1], [2, 2], [2, 1], [2, 4], [1, 4]]
          moves = [[3, 4], [3, 1], [4, 4], [1, 3], [4, 1], [2, 3], [4, 2], [1, 2], [3, 3], [1, 1], [2, 2], [2, 1], [2, 4], [1, 4]]
          @tictactoe.run_game(moves)
          expect(@tictactoe.p1_won?).to eq true
          expect(@tictactoe.p0_won?).to eq false
          expect(@tictactoe.is_draw?). to eq false
        end 
        
      end 
      context "when player 0 makes a move" do
        it "determines player 0 as the winner case 1" do
          # win condition [[4, 4], [1, 4], [4, 2], [3, 2], [2, 1], [1, 3], [4, 3], [2, 4], [2, 3], [2, 2], [4, 1]]
          moves = [[4, 4], [1, 4], [4, 2], [3, 2], [2, 1], [1, 3], [4, 3], [2, 4], [2, 3], [2, 2], [4, 1]]
          @tictactoe.run_game(moves)
          expect(@tictactoe.p0_won?).to eq true
          expect(@tictactoe.p1_won?).to eq false
          expect(@tictactoe.is_draw?). to eq false
        end 
        it "determines player 0 as the winner case 2" do
          # win condition [[1, 2], [4, 4], [4, 3], [3, 4], [2, 1], [1, 4], [2, 4], [4, 1], [3, 3], [3, 2], [2, 2], [4, 2], [1, 3], [1, 1], [2, 3]]
          moves = [[1, 2], [4, 4], [4, 3], [3, 4], [2, 1], [1, 4], [2, 4], [4, 1], [3, 3], [3, 2], [2, 2], [4, 2], [1, 3], [1, 1], [2, 3]]
          @tictactoe.run_game(moves)
          expect(@tictactoe.p0_won?).to eq true
          expect(@tictactoe.p1_won?).to eq false
          expect(@tictactoe.is_draw?). to eq false
        end 
        it "determines player 0 as the winner case 3" do
          # win condition [[3, 2], [3, 3], [1, 4], [4, 4], [1, 1], [2, 2], [1, 2], [3, 1], [4, 2], [3, 4], [2, 4], [2, 1], [4, 3], [4, 1], [1, 3]]
          moves = [[3, 2], [3, 3], [1, 4], [4, 4], [1, 1], [2, 2], [1, 2], [3, 1], [4, 2], [3, 4], [2, 4], [2, 1], [4, 3], [4, 1], [1, 3]]
          @tictactoe.run_game(moves)
          expect(@tictactoe.p0_won?).to eq true
          expect(@tictactoe.p1_won?).to eq false
          expect(@tictactoe.is_draw?). to eq false
        end 

        
      end
        
      context "when a win condition is inevitable" do
        it "determines player 1 as the winner case 1" do
          # must win condition [[3, 1], [1, 4], [4, 2], [1, 1], [2, 2], [3, 2], [2, 1], [2, 4], [4, 3], [4, 1], [4, 4], [3, 4], [1, 3], [1, 2], [3, 3]]
          moves =[[3, 1], [1, 4], [4, 2], [1, 1], [2, 2], [3, 2], [2, 1], [2, 4], [4, 3], [4, 1], [4, 4], [3, 4], [1, 3], [1, 2], [3, 3]]
          @tictactoe.run_game(moves)
          expect(@tictactoe.p1_won?).to eq true
          expect(@tictactoe.p0_won?).to eq false
          expect(@tictactoe.is_draw?). to eq false
        end
        
        it "determines player 1 as the winner case 2" do
          # must win condition [[1, 4], [2, 2], [3, 4], [3, 3], [4, 2], [1, 2], [4, 1], [1, 3], [2, 1], [4, 4], [2, 4], [3, 1], [1, 1], [2, 3], [3, 2]]
          moves =[[1, 4], [2, 2], [3, 4], [3, 3], [4, 2], [1, 2], [4, 1], [1, 3], [2, 1], [4, 4], [2, 4], [3, 1], [1, 1], [2, 3], [3, 2]]
          @tictactoe.run_game(moves)
          expect(@tictactoe.p1_won?).to eq true
          expect(@tictactoe.p0_won?).to eq false
          expect(@tictactoe.is_draw?). to eq false
        end
      end

        
    end 


  end 

   


end 
