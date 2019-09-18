require "pp"

class TicTacToe
    attr_accessor :board

    def initialize(input: $stdin)
        @board = Array.new(9, "")
        @player1 = Player.new("X")
        @player2 = Player.new("O")
        @current_player = @player1
        @input = input
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
        place_token
    end

    
    def place_token
        input = player_input
        if @board[input] == ""
            @board[input] = @current_player.token
            switch_player
            true
        else
            puts "The spot is already taken. Please select another spot."
            false
        end
    end

    def player_input
        position_chosen = @input.gets.chomp.to_i
        position_chosen = position_chosen - 1
    end

    def game_over?(board)
        rows = board.each_slice(3).to_a
        columns = rows.transpose
        diagonals = [[rows[0][0],rows[1][1],rows[2][2]],[rows.reverse[0][0],rows.reverse[1][1],rows.reverse[2][2]]]
  

        winner = [rows, columns, diagonals].map {|section| check_winner(section)}
        if winner.include?(true)
            puts "Congrats, you win!"
        end
        winner.include?(true)
    end

    private
    def check_winner(win_groups)
        win_groups.map {|group| return true if group.uniq.length == 1 && (group[0] == "X" || group[0] == "O") }.include?(true)
    end

    def switch_player
        if @current_player == @player1
            @current_player = @player2
        else
            @current_player = @player1
        end
    end
end


class Player
    attr_accessor :token

    def initialize(token)
        @token = token
    end
end



# game = TicTacToe.new
# game.start_game
