require_relative 'minimax'

class Player
    attr_reader :token

    def initialize(args)
        @token = args[:token]
        @player_console = args[:console]
    end

    def choose_move
        raise NotImplementedError
    end
end

class HumanPlayer < Player
    TO_INDEX = 1

    def choose_move(board, opponent)
        @player_console.get_player_input - TO_INDEX
    end
end


class ComputerPlayer < Player
    include Minimax
    
    def choose_move(board, opponent)
        call_minimax(board, opponent)
    end
    
    private
    def call_minimax(board, opponent)
        args = {
            board: board,
            marker: @token,
            opponent: opponent,
            empty_marker: ""
        }
        Minimax.best_move(args)
    end
end
