class Board
    attr_reader :board

    def initialize
        @board = Array.new(9, "")
    end

    def place_token(input, token)
        @board[input] = token
        @board
    end
end