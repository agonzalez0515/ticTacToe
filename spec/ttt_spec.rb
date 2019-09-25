require 'ttt'

describe TicTacToe do
    let(:console) { PlayerConsole.new }
    let(:win)     { Win.new(console: console) }
    let(:game)    { TicTacToe.new(console: console, win: win) }
    
    it "creates a board" do
        expect(game.board).to eq(["","","","","","","","",""])
    end
    
    it "gets input from player and converts it to index value" do
        allow(console).to receive(:player_input) { 2 }
        
        expect(game.get_player_input).to eq(1)
    end
        
    context '#player_turn' do
        it "places the token on the selected spot" do
            allow(console).to receive(:player_input) { 1 }
            game.player_turn
            
            expect(game.board).to eq(["X","","","","","","","",""])
        end
        
        it "switches players if the token is placed successfully" do 
            allow(console).to receive(:player_input) { 1 }
            new_player = game.player_turn
            
            expect(new_player.token).to eq("O")
        end
    end
end


# TODO
# Refactor diagonals array
