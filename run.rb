require "./lib/ttt.rb"
require "./lib/player_console.rb"
require "./lib/win.rb"
require "./lib/board.rb"
require "./lib/configure_game.rb"

console = PlayerConsole.new
board = Board.new
win = Win.new(console: console)
config = GameConfiguation.new({console: console, board: board})
players = config.configure_players

game = TicTacToe.new({players: players, console: console, win: win, board: board})
game.new_game
