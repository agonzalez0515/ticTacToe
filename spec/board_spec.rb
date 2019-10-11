require "board"
require "player_console"

describe Board do
    let (:output) { StringIO.new }
    let (:console) { PlayerConsole.new(output: output) }
    let (:board) { Board.new({console: console}) }

    it "creates a board with 9 cells" do
        expect(board.board).to eq(["","","", "","","","","",""])
    end

    it "places a player token on the board" do
        token = "X"
        move = 2
        
        expect(board.place_token_on_board(move, token)).to eq(["","","X", "","","","","",""])
    end

    it "checks if a move is valid" do
        board.place_token_on_board(1, "X")
        move = 1

        expect(board.valid_move?(move)).to eq(false)
    end

    it "places a token on the board if the move is valid" do
        new_board = board.place_token(3, "X")

        expect(new_board).to eq(["","","","X","","","","",""])
    end

    it "prints an error message when a valid move is tried to be placed on the board" do
        board.place_token_on_board(1, "X")
        board.place_token(1, "X")

        expect(output.string).to eq("Invalid choice. Please pick again.\n")
    end

end