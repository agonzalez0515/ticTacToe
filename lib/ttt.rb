require_relative 'player_console'
require_relative 'player'
require_relative 'win'
require_relative 'board'

class TicTacToe
    CURRENT = 0
    OPPONENT = 1

    def initialize (args)
        @board = args[:board]
        @players = args[:players]
        @player_console = args[:console]
        @current_player = nil
        @win = args[:win]
    end

    def new_game
        set_current_player
        play
        end_game
    end

    private
    def set_current_player
        @current_player = @players[CURRENT]
    end
    
    def play
        until @win.game_over?(@board.board) do
            @player_console.print_board(@board.board)
            @current_player.print_instructions_message
            player_turn
        end
    end

    def end_game
        if @win.game_over?(@board.board)
            @win.print_game_over_message(@board.board, @players[OPPONENT].token)
        end
    end

    def player_turn
        if @board.place_token(get_player_input, @current_player.token)
            switch_player
        end
    end
    
    def get_player_input
    @current_player.choose_move
    end
    
    def switch_player
    @current_player = @players.rotate![0]
    end
end

