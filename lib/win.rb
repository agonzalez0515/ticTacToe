class Win
    def initialize(console:)
        @player_console = console
    end

    def game_over?(board)
        winner?(board) || tie?(board)
    end

    def print_game_over_message(board, token)
        @player_console.print_board(board)
        if winner?(board)
            @player_console.print_winning_message(token)
        else
            @player_console.print_tie_message
        end
    end

    private
    def winner?(board)
        rows = board.each_slice(3).to_a
        columns = rows.transpose
        diagonals = [[rows[0][0],rows[1][1],rows[2][2]],[rows.reverse[0][0],rows.reverse[1][1],rows.reverse[2][2]]]
        winner = [rows, columns, diagonals].map {|section| check_spots(section)}.include?(true)
    end

    def check_spots(section)
        section.map {|group| return true if group.uniq.length == 1 && (group[0] == "X" || group[0] == "O") }.include?(true)
    end

    def tie?(board)
        tie = !board.include?("")
    end
end