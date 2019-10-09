require 'player'
require 'player_console'
require 'board'

describe Player do
    it "creates a player with a token" do
        player = Player.new({token: 'Angie'})
        
        expect(player.token).to eq("Angie")
    end   

    it "throws an error when choose move method is not implemented" do
        class TestPlayer < Player 
        end
        player = TestPlayer.new({token: "X", console: PlayerConsole.new})

        expect{player.choose_move}.to raise_error(NotImplementedError)
    end

    it "throws an error when printing method is not implemented" do
        class TestPlayer < Player
        end
        player = TestPlayer.new({token: "X", console: PlayerConsole.new})

        expect{player.print_instructions_message}.to raise_error(NotImplementedError)
    end
end


describe HumanPlayer do 
    let(:console) { PlayerConsole.new }
    let(:player)  { HumanPlayer.new({token: "X", console: console}) }

    it "gets input from player and converts it to index value" do
        allow(console).to receive(:get_player_input) { 2 }
        
        expect(player.choose_move).to eq(1)
    end

    it "prints instructions for human player" do
        expect{player.print_instructions_message}.to output("Please enter an available number between 1-9.\n").to_stdout
    end
end

describe ComputerPlayer do
    let(:console) { PlayerConsole.new }
    let(:board)   { Board.new }
    let(:player)  { ComputerPlayer.new({token: "X", console: console, board: board}) }

    it "returns a move when the Minimax module is called" do
        allow(MinimaxRB).to receive(:best_move) { 42 }

        expect(player.choose_move).to eq(42)
        expect(MinimaxRB).to have_received(:best_move)
    end

    it "prints a loading message about the computer" do
        expect{player.print_instructions_message}.to output("Computer thinking...\n").to_stdout
    end
end
