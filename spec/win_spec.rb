require 'win'
require 'player_console'

describe Win do
    let(:console) { PlayerConsole.new }
    let(:win)     { Win.new(console: console) }

    
    it "checks if the game is won when all spots are empty" do
        board = [
            "","","",
            "","","",
            "","",""
        ]
        expect(win.game_over?(board)).to eq(false)
    end

    it "checks if the game is won for a row of X's" do
        board = [
            "X","X","X",
            "O","","O",
            "","",""
        ]
        expect(win.game_over?(board)).to eq(true)
    end
    
    it "checks if the game is won for a row of O's" do
        board = [
            "X","X","",
            "O","O","O",
            "","",""
        ]
        expect(win.game_over?(board)).to eq(true)
    end

    it "checks if the game is won for a column of X's" do
        board = [
            "X","X","O",
            "X","O","X",
            "X","",""
        ]
        expect(win.game_over?(board)).to eq(true)
    end

    it "checks if the game is won for a column of O's" do
        board = [
            "X","X","O",
            "O","","O",
            "X","","O"
        ]
        expect(win.game_over?(board)).to eq(true)
    end

    it "checks if the game is won diagonal top to bottom " do
        board = [
            "X","X","O",
            "O","X","O",
            "X","","X"
        ]
        expect(win.game_over?(board)).to eq(true)
    end

    it "checks if the game is won diagonal bottom to top" do
        board = [
            "X","X","O",
            "O","O","X",
            "O","","X"
        ]
        expect(win.game_over?(board)).to eq(true)
    end

    it "check if there is a tie" do
        board = [
            "O","X","O",
            "O","X","X",
            "X","O","X"
        ]
        expect(win.game_over?(board)).to eq(true)
    end

    it "prints a winning message when the game is over" do
        board = [
            "X","X","O",
            "O","O","X",
            "O","","X"
        ]

        expect{win.print_game_over_message(board, "X")}.to output("X | X | O\n--------\nO | O | X\n--------\nO |  | X\nCongrats, X player wins!\n").to_stdout
    end

    it "prints a tied message when game is over" do
        board = [
            "O","X","O",
            "O","X","X",
            "X","O","X"
        ]

        expect{win.print_game_over_message(board, "X")}.to output("O | X | O\n--------\nO | X | X\n--------\nX | O | X\nYou tied. Game over\n").to_stdout
    end
end
