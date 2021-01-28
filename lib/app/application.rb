require_relative 'game'

class Application
  attr_accessor :player_1, :player_2, :game

  def initialize
    #initializing a new game
    @game = Game.new

    #running the new game
    while @game.status == 'on going'

      # Players take turn
      @game.turn

      # Displaying message of end of game
      @game.game_end

      # Ask players if they want to play again
      @game.new_round
    end
  end
end
