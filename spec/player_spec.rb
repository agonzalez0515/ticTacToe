require 'player'
require 'player_console'
require 'board'

describe Player do
    it "creates a player with a value" do
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
    it "gets input from player and converts it to index value" do
        console = PlayerConsole.new
        player = HumanPlayer.new({token: "X", console: console})
        allow(console).to receive(:get_player_input) { 2 }
        
        expect(player.choose_move).to eq(1)
    end

    it "prints instructions for human player" do
        console = PlayerConsole.new
        player = HumanPlayer.new({console: console})

        expect{player.print_instructions_message}.to output("Please enter an available number between 1-9.\n").to_stdout
    end
end

describe ComputerPlayer do
    it "returns a move" do
        console = PlayerConsole.new
        board = Board.new
        player = ComputerPlayer.new({token: "X", console: console, board: board})

        expect(player.choose_move).to eq(0)
    end

    it "prints a loading message about the computer" do
        console = PlayerConsole.new
        player = ComputerPlayer.new({token: "X", console: console})

        expect{player.print_instructions_message}.to output("Computer thinking...\n").to_stdout
    end
end
