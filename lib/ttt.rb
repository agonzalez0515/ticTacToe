require "pp"

class TicTacToe
    attr_accessor :board

    def initialize
        @board = Array.new(9, "")
        @player1 = Player.new("X")
        @player2 = Player.new("O")
        @player_console = PlayerConsole.new
        @current_player = @player1
    end

    def display_board
        puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
        puts "--------"
        puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
        puts "--------"
        puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
    end


    def start_game
        puts "Starting new Tic Tac Toe game"
        until game_over?(@board) do
            play
        end
    end

    def play
        display_board
        puts "Please enter a number 1-9"
        turn
    end

    
    def turn
        player_input = get_player_input
        if  valid_input?(player_input)
            place_token(player_input)
            switch_player
        else 
            @player_console.invalid_input
            # turn
        end
    end


    def get_player_input
        position_chosen = @player_console.player_input - 1
    end
    

    def game_over?(board) #refactor - should return true if there is a tie or a winner
        rows = board.each_slice(3).to_a
        columns = rows.transpose
        diagonals = [[rows[0][0],rows[1][1],rows[2][2]],[rows.reverse[0][0],rows.reverse[1][1],rows.reverse[2][2]]]
  
        #move to new method
        winner = [rows, columns, diagonals].map {|section| check_winner(section)}.include?(true)

        if winner
            display_board
            puts "Congrats, you win!"
        end
        winner

        # winner?(board) || tie?(board)
    end

    private
    
    def valid_input?(input)
        return true if [0,1,2,3,4,5,6,7,8].include?(input) and @board[input] == ""
    end
        
    def place_token(input)
        @board[input] = @current_player.token
    end

    def switch_player
        @current_player == @player1 ? @current_player = @player2 : @current_player = @player1        
    end

    def check_winner(win_groups)
        win_groups.map {|group| return true if group.uniq.length == 1 && (group[0] == "X" || group[0] == "O") }.include?(true)
    end

end


class Player
    attr_accessor :token

    def initialize(token)
        @token = token
    end
end

class PlayerConsole
    def initialize(input: $stdin, output: $stdout)
        @input = input
        @output = output
    end

    def invalid_input
        @output.puts "The spot is already taken. Please select another spot."
    end

    def player_input
        @input.gets.chomp.to_i
    end
end



# game = TicTacToe.new
# game.start_game
