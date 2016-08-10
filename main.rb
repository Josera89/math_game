# main.rb
require './question'
require './player'
require './game'

# start it all!
new_game = Game.new
new_game.start_game_loop