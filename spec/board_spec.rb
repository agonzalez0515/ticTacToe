require "board"

describe Board do

    it "creates a board with 9 cells" do
        board = Board.new

        expect(board.board).to eq(["","","", "","","","","",""])
    end

    it "places a token on the board" do
        board = Board.new
        token = "X"
        move = 2
        expect(board.place_token(move, token)).to eq(["","","X", "","","","","",""])
    end
end