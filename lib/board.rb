class Board
    attr_reader :board

    def initialize(args)
        @board = Array.new(9, "")
        @player_console = args[:console]
    end

    def place_token(move, token)
        if valid_move?(move)
            place_token_on_board(move, token)
        else 
            @player_console.print_invalid_input_message
        end
    end

    def place_token_on_board(move, token)
        @board[move] = token
        @board
    end

    def valid_move?(move)
        @board[move] == "" && [0,1,2,3,4,5,6,7,8].include?(move)
    end
end