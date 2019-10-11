class GameConfiguation
    ONE_PLAYER = 1

    def initialize(args)
        @player_console = args[:console]
        @board = args[:board]
    end

    def configure_players
        @player_console.print_starting_message
        game_type = @player_console.get_game_type_response

        human_player_1 = HumanPlayer.new({console: @player_console, token: "X"})
        human_player_2 = HumanPlayer.new({console: @player_console, token: "O"})
        computer_player = ComputerPlayer.new({board: @board, console: @player_console, token: "O"})

        if game_type == ONE_PLAYER
            [human_player_1, computer_player]
        else
            [human_player_1, human_player_2]
        end
    end
end
