require 'player_console'

describe PlayerConsole do
    it "prints a board" do
        console = PlayerConsole.new
        board = [
            "","","",
            "","","",
            "","",""
        ]
        expect{console.display_board(board)}.to output(" |  | \n--------\n |  | \n--------\n |  | \n").to_stdout
        # expect(console.display_board(board)).to eq(" |  | \n--------\n |  | \n--------\n |  | \n")
    end
end