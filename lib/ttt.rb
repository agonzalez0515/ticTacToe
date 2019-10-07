require "pp"

require_relative 'player_console'
require_relative 'player'
require_relative 'win'
require_relative 'board'

class TicTacToe
    attr_reader :board
    ONE_PLAYER = 1
    OPPONENT = 1

    def initialize (args)
        @board = Board.new()
        @players = args[:players]
        @player_console = args[:console]
        @current_player = @players[0]
        @win = args[:win]
    end

    def start_game
        @player_console.print_starting_message

        until @win.game_over?(@board.board) do
            play
        end
    end


    def play
        @player_console.print_board(@board.board)
        @player_console.print_instructions_message
        player_turn
    end

    def player_turn
        player_input = get_player_input(@board.board, @players[OPPONENT])

        if  valid_input?(player_input)
            @board.place_token(player_input, @current_player.token)
            switch_player
        else 
            @player_console.print_invalid_input_message
        end
    end

    
    private
    def get_player_input(board, opponent)
        @current_player.choose_move(board, opponent)
    end

    def valid_input?(input)
        @board.board[input] == "" && [0,1,2,3,4,5,6,7,8].include?(input)
    end
        

    def switch_player
        @players.rotate!
    end
end



# console = PlayerConsole.new
# win = Win.new(console: console)
# game = TicTacToe.new(win: win, console: console)
# game.start_game
