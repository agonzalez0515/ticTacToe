require "board"

describe Board do
    let (:board) { Board.new }

    it "creates a board with 9 cells" do
        expect(board.board).to eq(["","","", "","","","","",""])
    end

    it "places a player token on the board" do
        token = "X"
        move = 2
        
        expect(board.place_token(move, token)).to eq(["","","X", "","","","","",""])
    end

    it "checks if a move is valid" do
        board.place_token(1, "X")
        pp board.board
        move = 1

        expect(board.valid_move?(move)).to eq(false)
    end

end