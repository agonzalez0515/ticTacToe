require "pp"

require_relative 'player_console'
require_relative 'player'
require_relative 'win'

class TicTacToe
    attr_reader :board
    TO_INDEX = 1

    def initialize (console:, win:)
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
        player_turn
    end

    def player_turn
        player_input = get_player_input
        if  valid_input?(player_input)
            place_token(player_input)
            switch_player
        else 
            @player_console.invalid_input
        end
    end

    def get_player_input
        @player_console.player_input - TO_INDEX
    end


    private
    def valid_input?(input)
        return @board[input] == "" && [0,1,2,3,4,5,6,7,8].include?(input)
    end
        
    def place_token(input)
        @board[input] = @current_player.token
    end

    def switch_player
        @current_player == @player1 ? @current_player = @player2 : @current_player = @player1        
    end
end







# console = PlayerConsole.new
# win = Win.new(console: console)
# game = TicTacToe.new(win: win, console: console)
# game.start_game
