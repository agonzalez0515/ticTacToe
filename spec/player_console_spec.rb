require 'player_console'

describe PlayerConsole do
    let(:output) { StringIO.new }
    let(:input) { StringIO.new("2") }
    let(:console) { PlayerConsole.new(output: output, input: input) }

    it "prints a board" do
        board = [
            "","","",
            "","","",
            "","",""
        ]
        console.print_board(board)
        expect(output.string).to eq(" |  | \n--------\n |  | \n--------\n |  | \n")
    end

    it "prints a message" do
        console.print_computer_instructions_message
        expect(output.string).to eq("Computer thinking...\n")
    end

    it "gets user input" do
        expect(console.get_player_input).to eq(2)
    end
end
