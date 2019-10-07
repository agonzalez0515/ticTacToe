require 'player'
require 'player_console'
require 'board'

describe Player do
    it "creates a player with a value" do
        player = Player.new({token: 'Angie'})
        
        expect(player.token).to eq("Angie")
    end   
end

describe HumanPlayer do 
    it "gets input from player and converts it to index value" do
        console = PlayerConsole.new
        player = HumanPlayer.new({token: "X", console: console})
        allow(console).to receive(:get_player_input) { 2 }
        board = ["X","X","","","","","","",""]
        
        expect(player.choose_move).to eq(1)
    end
end

describe ComputerPlayer do
    it "returns a move" do
        console = PlayerConsole.new
        board = Board.new
        player = ComputerPlayer.new({token: "X", console: console, board: board})

        expect(player.choose_move).to eq(0)
    end
end
