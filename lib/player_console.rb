class PlayerConsole
    def initialize(input: $stdin, output: $stdout)
        @input = input
        @output = output
    end

    def print_board(board)
        @output.puts "#{board[0]} | #{board[1]} | #{board[2]}"
        @output.puts "--------"
        @output.puts "#{board[3]} | #{board[4]} | #{board[5]}"
        @output.puts "--------"
        @output.puts "#{board[6]} | #{board[7]} | #{board[8]}"
    end

    def print_starting_message
        @output.puts "Starting new Tic Tac Toe game"
        @output.puts "Do you want to play 1 player or 2 players? Enter 1 or 2."
    end

    def get_game_type_response
        @input.gets.chomp.to_i
    end

    def print_human_instructions_message
        @output.puts "Please enter an available number between 1-9."
    end

    def print_computer_instructions_message
        @output.puts "Computer thinking..."
    end

    def print_invalid_input_message
        @output.puts "Invalid choice. Please pick again."
    end

    def get_player_input
        @input.gets.chomp.to_i
    end

    def print_winning_message(token)
        @output.puts "Congrats, #{token} player wins!"
    end

    def print_tie_message
        @output.puts "You tied. Game over"
    end
end