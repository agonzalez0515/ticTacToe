
require 'minimax_rb'

class Player
    attr_reader :token

    def initialize(args)
        @board = args[:board]
        @token = args[:token]
        @player_console = args[:console]
    end

    def choose_move
        raise NotImplementedError, "Missing method"
    end
    
    def print_instructions_message
        raise NotImplementedError, "Missing method"
    end
end

class HumanPlayer < Player
    TO_INDEX = 1

    def choose_move
        @player_console.get_player_input - TO_INDEX
    end

    def print_instructions_message
        @player_console.print_human_instructions_message
    end
end


class ComputerPlayer < Player
    
    def choose_move
        call_minimax
    end

    def print_instructions_message
        @player_console.print_computer_instructions_message
    end
    
    private
    def call_minimax
       opponent =  @token == "X" ? "O" : "X"

        args = {
            board: @board.board,
            marker: @token,
            opponent: opponent,
            empty_marker: ""
        }
        MinimaxRB.best_move(args)
    end
end
