class PlayerConsole
    def initialize(input: $stdin, output: $stdout)
        @input = input
        @output = output
    end

    def display_board(board)
        puts "#{board[0]} | #{board[1]} | #{board[2]}"
        puts "--------"
        puts "#{board[3]} | #{board[4]} | #{board[5]}"
        puts "--------"
        puts "#{board[6]} | #{board[7]} | #{board[8]}"
    end

    def starting_message
        @output.puts "Starting new Tic Tac Toe game"
    end

    def instructions
        @output.puts "Please enter a number 1-9"
    end

    def invalid_input
        @output.puts "The spot is already taken. Please select another spot."
    end

    def player_input
        @input.gets.chomp.to_i
    end

    def winner_message
        @output.puts "Congrats, you win!"
    end

    def tie_message
        @output.puts "You tied. Game over"
    end
end