class Board
    attr_reader :board

    def initialize
        @board = Array.new(9, "")
    end

    def place_token(move, token)
        @board[move] = token
        @board
    end

    def valid_move?(move)
        @board[move] == "" && [0,1,2,3,4,5,6,7,8].include?(move)
    end
end