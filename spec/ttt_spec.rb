require 'ttt'
require 'pp'

describe TicTacToe do
    let(:console) { PlayerConsole.new }
    let(:board)   { Board.new({console: console}) }
    let(:win)     { Win.new(console: console) }
    let(:game)    { TicTacToe.new({console: console, win: win, board: board})}
    
    context "#new_game" do
        it "creates a new game" do
            expect(game).to be_an_instance_of(TicTacToe)
        end
    end
    
end
