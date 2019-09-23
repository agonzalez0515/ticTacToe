require 'ttt'

describe TicTacToe do
    before (:each) do
        @console = PlayerConsole.new
        @win = Win.new(console: @console)
        @game = TicTacToe.new(console: @console, win: @win)
    end
    
    it "creates a board" do
        expect(@game.board).to eq(["","","","","","","","",""])
    end
    
    it "gets input from player and converts it to index value" do
        allow(@console).to receive(:player_input) { 2 }
        expect(@game.get_player_input).to eq(1)
    end
        
    context '#turn' do
        it "places the token on the selected spot" do
            allow(@console).to receive(:player_input) { 1 }
            @game.turn
            expect(@game.board).to eq(["X","","","","","","","",""])
        end
        
        it "switches players if the token is placed successfully" do 
            allow(@console).to receive(:player_input) { 1 }
            expect(@game.turn).to be_a (Player)
            # i want to test that the Player instance has the token == "O" ?
        end
    end
end



describe Player do
    it "creates a player with a value" do
        player = Player.new('Angie')
        expect(player.token).to eq("Angie")
    end
end

describe PlayerConsole do
    it "prints a board" do
        console = PlayerConsole.new
        board = [
            "","","",
            "","","",
            "","",""
        ]
        expect{console.display_board(board)}.to output(" |  | \n--------\n |  | \n--------\n |  | \n").to_stdout
    end
end


describe Win do
    before (:each) do
        @console = PlayerConsole.new
        @win = Win.new(console: @console)
    end
    
    it "checks if the game is won when all spots are empty" do
        board = [
            "","","",
            "","","",
            "","",""
        ]
        expect(@win.game_over?(board)).to eq(false)
    end

    it "checks if the game is won for a row of X's" do
        board = [
            "X","X","X",
            "O","","O",
            "","",""
        ]
        expect(@win.game_over?(board)).to eq(true)
    end
    
    it "checks if the game is won for a row of O's" do
        board = [
            "X","X","",
            "O","O","O",
            "","",""
        ]
        expect(@win.game_over?(board)).to eq(true)
    end

    it "checks if the game is won for a column of X's" do
        board = [
            "X","X","O",
            "X","O","X",
            "X","",""
        ]
        expect(@win.game_over?(board)).to eq(true)
    end

    it "checks if the game is won for a column of O's" do
        board = [
            "X","X","O",
            "O","","O",
            "X","","O"
        ]
        expect(@win.game_over?(board)).to eq(true)
    end

    it "checks if the game is won diagonal top to bottom " do
        board = [
            "X","X","O",
            "O","X","O",
            "X","","X"
        ]
        expect(@win.game_over?(board)).to eq(true)
    end

    it "checks if the game is won diagonal bottom to top" do
        board = [
            "X","X","O",
            "O","O","X",
            "O","","X"
        ]
        expect(@win.game_over?(board)).to eq(true)
    end

    it "check if there is a tie" do
        board = [
            "O","X","O",
            "O","X","X",
            "X","O","X"
        ]
        expect(@win.game_over?(board)).to eq(true)
    end
end


# TODO
# Refactor diagonals array
