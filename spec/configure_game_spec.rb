require "configure_game"
require "player_console"
require "board"
require "player"

describe GameConfiguation do
    let(:console) {PlayerConsole.new}
    let(:board) {Board.new({console: console})}

    context "#configure_players" do
        it "creates a set of human players" do
            config = GameConfiguation.new({board: board, console: console})
            allow(console).to receive(:get_game_type_response) { 2 }
            players = config.configure_players
    
            expect(players[0]).to be_an_instance_of(HumanPlayer)
            expect(players[1]).to be_an_instance_of(HumanPlayer)
        end
    
        it "creates a set of a human player and a computer player" do
            config = GameConfiguation.new({board: board, console: console})
            allow(console).to receive(:get_game_type_response) { 1 }
            players = config.configure_players
    
            expect(players[0]).to be_an_instance_of(HumanPlayer)
            expect(players[1]).to be_an_instance_of(ComputerPlayer)
        end
    end
end
