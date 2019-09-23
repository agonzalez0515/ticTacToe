require 'ttt'

describe TicTacToe do
    before (:each) do
        @game = TicTacToe.new()
    end
    
    it "creates a board" do
        expect(@game.board).to eq(["","","","","","","","",""])
    end
    
    it "prints a board" do
        expect{@game.display_board}.to output(" |  | \n--------\n |  | \n--------\n |  | \n").to_stdout
    end
    
    it "gets input from player" do
        allow(player_console).to receive(:player_input) { 1 }
        expect(@game.get_player_input).to eq(0)
    end
        

    
    # describe '#turn' do
    #     it "places the token on the selected spot" do
    #         @game.turn
    #         expect(@game.board).to eq(["X","","","","","","","",""])
    #     end
        
    #     it "switches players if the token is placed successfully" do 
    #         expect(@game.turn).to be_a (Player)
    #         # i want to test that the Player instance has the token == "O" ?
    #     end
    # end
    
    # it "checks if the game is won when all spots are empty" do
    #     board = [
    #         "","","",
    #         "","","",
    #         "","",""
    #     ]
    #     expect(@game.game_over?(board)).to eq(false)
    # end

    # it "checks if the game is won for a row of X's" do
    #     board = [
    #         "X","X","X",
    #         "O","","O",
    #         "","",""
    #     ]
    #     expect(@game.game_over?(board)).to eq(true)
    # end
    
    # it "checks if the game is won for a row of O's" do
    #     board = [
    #         "X","X","",
    #         "O","O","O",
    #         "","",""
    #     ]
    #     expect(@game.game_over?(board)).to eq(true)
    # end

    # it "checks if the game is won for a column of X's" do
    #     board = [
    #         "X","X","O",
    #         "X","O","X",
    #         "X","",""
    #     ]
    #     expect(@game.game_over?(board)).to eq(true)
    # end

    # it "checks if the game is won for a column of O's" do
    #     board = [
    #         "X","X","O",
    #         "O","","O",
    #         "X","","O"
    #     ]
    #     expect(@game.game_over?(board)).to eq(true)
    # end

    # it "checks if the game is won diagonal top to bottom " do
    #     board = [
    #         "X","X","O",
    #         "O","X","O",
    #         "X","","X"
    #     ]
    #     expect(@game.game_over?(board)).to eq(true)
    # end

    # it "checks if the game is won diagonal bottom to top" do
    #     board = [
    #         "X","X","O",
    #         "O","O","X",
    #         "O","","X"
    #     ]
    #     expect(@game.game_over?(board)).to eq(true)
    # end
end



describe Player do
    it "creates a player with a value" do
        player = Player.new('Angie')
        expect(player.token).to eq("Angie")
    end
end


# TODO
# Check if game is tied
# Refactor diagonals array
# Create a class for outputs?