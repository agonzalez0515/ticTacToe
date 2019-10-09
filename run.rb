require "./lib/ttt.rb"
require "./lib/player_console.rb"
require "./lib/win.rb"
require "./lib/board.rb"

console = PlayerConsole.new
win = Win.new(console: console)
board = Board.new
game = TicTacToe.new({console: console, win: win, board: board})

game.new_game
