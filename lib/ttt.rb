require "pp"

require_relative 'player_console'
require_relative 'player'

class TicTacToe
    attr_reader :board, :console, :win

    def initialize (console: console, win: win)
        @board = Array.new(9, "")
        @player1 = Player.new("X")
        @player2 = Player.new("O")
        @player_console = console
        @current_player = @player1
        @win = win
    end

    def start_game
        @player_console.starting_message
        until @win.game_over?(@board) do
            play
        end
    end

    def play
        @player_console.display_board(@board)
        @player_console.instructions
        turn
    end

    def turn
        player_input = get_player_input
        if  valid_input?(player_input)
            place_token(player_input)
            switch_player
        else 
            @player_console.invalid_input
        end
    end

    def get_player_input
        position_chosen = @player_console.player_input - 1
    end


    private
    def valid_input?(input)
        return true if [0,1,2,3,4,5,6,7,8].include?(input) and @board[input] == ""
    end
        
    def place_token(input)
        @board[input] = @current_player.token
    end

    def switch_player
        @current_player == @player1 ? @current_player = @player2 : @current_player = @player1        
    end
end

class Win
    def initialize(console: console)
        @player_console = console
    end

    def game_over?(board)
        if winner?(board) 
            return true
        elsif tie?(board)
            return true
        else
            false
        end
    end

    private
    def winner?(board)
        rows = board.each_slice(3).to_a
        columns = rows.transpose
        diagonals = [[rows[0][0],rows[1][1],rows[2][2]],[rows.reverse[0][0],rows.reverse[1][1],rows.reverse[2][2]]]
        winner = [rows, columns, diagonals].map {|section| check_spots(section)}.include?(true)
        if winner
            @player_console.display_board(board)
            @player_console.winner_message
        end
        winner
    end

    def check_spots(section)
        section.map {|group| return true if group.uniq.length == 1 && (group[0] == "X" or group[0] == "O") }.include?(true)
    end

    def tie?(board)
        tie = !board.include?("")
        if tie
            @player_console.display_board(board)
            @player_console.tie_message
        end
        tie
    end

end





# console = PlayerConsole.new
# win = Win.new(console: console)
# game = TicTacToe.new(win: win, console: console)
# game.start_game
