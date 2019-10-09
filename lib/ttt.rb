require "pp"

require_relative 'player_console'
require_relative 'player'
require_relative 'win'
require_relative 'board'

class TicTacToe
    CURRENT = 0
    OPPONENT = 1
    ONE_PLAYER = 1

    def initialize (args)
        @board = args[:board]
        @players = []
        @player_console = args[:console]
        @current_player = @players[CURRENT]
        @win = args[:win]
    end

    def new_game
        start_game
        play
        end_game
    end

    private
    def start_game
        @player_console.print_starting_message
        set_game_type(@player_console.get_game_type_response)
        set_current_player
    end

    def end_game
        if @win.game_over?(@board.board)
            @win.print_game_over_message(@board.board, @players[OPPONENT].token)
        end
    end

    def set_game_type(game_type)
        human_player_1 = HumanPlayer.new({console: @player_console, token: "X"})
        human_player_2 = HumanPlayer.new({console: @player_console, token: "O"})
        computer_player = ComputerPlayer.new({board: @board, console: @player_console, token: "O"})

        if game_type == ONE_PLAYER
            @players = [human_player_1, computer_player]
        else
            @players = [human_player_1, human_player_2]
        end
    end

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

    def player_turn
        player_input = get_player_input

        if  valid_input?(player_input)
            @board.place_token(player_input, @current_player.token)
            switch_player
        else 
            @player_console.print_invalid_input_message
        end
    end
    
    def get_player_input
        @current_player.choose_move
    end

    def valid_input?(input)
        @board.board[input] == "" && [0,1,2,3,4,5,6,7,8].include?(input)
    end
        
    def switch_player
        @current_player = @players.rotate![0]
    end
end

