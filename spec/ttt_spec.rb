require 'ttt'
require 'pp'

describe TicTacToe do
    let(:console) { PlayerConsole.new }
    let(:win)     { Win.new(console: console) }
    let(:players) {[HumanPlayer.new({token: "X", console: console}), ComputerPlayer.new({token: "O", console: console})]}
    let(:game)    { TicTacToe.new({console: console, win: win, players: players}) }
    
    
    context '#player_turn' do
        it "switches players if the token is placed successfully" do 
            allow(console).to receive(:get_player_input) { 1 }
            players = game.player_turn
            
            expect(players[0].token).to eq("O")
        end
    end
end
