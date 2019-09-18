require 'ttt'

describe TicTacToe do
    before (:each) do
        input = StringIO.new('1')
        @game = TicTacToe.new(input: input)
    end


    it "creates a board" do
        expect(@game.board).to eq(["","","","","","","","",""])
    end

    it "prints a board" do
        expect{@game.display_board}.to output(" |  | \n--------\n |  | \n--------\n |  | \n").to_stdout
    end

    xit "starts a game" do
        expect{@game.start_game}.to output("Starting new Tic Tac Toe game\n |  | \n--------\n |  | \n--------\n |  | \nPlayer 1, enter number from 1-9\n").to_stdout
    end

    it "gets input from player" do
        expect(@game.player_input).to eq(0)
    end

    it "places the token on the selected spot" do 
        expect(@game.place_token).to eq("X")
    end

    it "checks if the game is won when all spots are empty" do
        board = [
            "","","",
            "","","",
            "","",""
        ]
        expect(@game.game_over?(board)).to eq(false)
    end

    it "checks if the game is won for a row of X's" do
        board = [
            "X","X","X",
            "O","","O",
            "","",""
        ]
        expect(@game.game_over?(board)).to eq(true)
    end
    
    it "checks if the game is won for a row of O's" do
        board = [
            "X","X","",
            "O","O","O",
            "","",""
        ]
        expect(@game.game_over?(board)).to eq(true)
    end

    it "checks if the game is won for a column of X's" do
        board = [
            "X","X","O",
            "X","O","X",
            "X","",""
        ]
        expect(@game.game_over?(board)).to eq(true)
    end

    it "checks if the game is won for a column of O's" do
        board = [
            "X","X","O",
            "O","","O",
            "X","","O"
        ]
        expect(@game.game_over?(board)).to eq(true)
    end

    it "checks if the game is won diagonal top to bottom " do
        board = [
            "X","X","O",
            "O","X","O",
            "X","","X"
        ]
        expect(@game.game_over?(board)).to eq(true)
    end

    it "checks if the game is won diagonal bottom to top" do
        board = [
            "X","X","O",
            "O","O","X",
            "O","","X"
        ]
        expect(@game.game_over?(board)).to eq(true)
    end

    xit "checks if the game is won" do
        board = [
            "X","X","O",
            "O","O","X",
            "X","O","X"
        ]
        expect(@game.game_over?(board)).to eq(false)
    end
end



describe Player do
    it "creates a player with a value" do
        player = Player.new('Angie')
        expect(player.token).to eq("Angie")
    end
end

