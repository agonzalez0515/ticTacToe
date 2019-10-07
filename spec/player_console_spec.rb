require 'player_console'

describe PlayerConsole do
    let(:output) { StringIO.new }
    let(:console) { PlayerConsole.new(output: output) }

    it "prints a board" do
        board = [
            "","","",
            "","","",
            "","",""
        ]
        console.print_board(board)
        expect(output.string).to eq(" |  | \n--------\n |  | \n--------\n |  | \n")
    end

    it "prints message" do
        console.print_instructions_message
        expect(output.string).to eq("Please enter a number 1-9\n")
    end
end
