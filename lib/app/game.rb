require_relative 'board'
require 'view/show'
require_relative 'player'


class Game
    attr_accessor :current_player, :status, :arr_player, :board

  def initialize
    # creating 2 players,defining the status to 'on_going', define current_player
    @player_1 = Player.new
    @player_2 = Player.new
    @arr_player = [@player_1,@player_2]
    @status = 'on going'

    # check token value
    if @player_1.player_token == @player_2.player_token
      puts "I'm switching your token as you both picked the same one... "
      if @player_1.player_token == 'X'
        @player_2.player_token = 'O'
      elsif @player_1.player_token == 'O'
        @player_2.player_token = 'X'
      end
    end

    @player_1.show_state
    @player_2.show_state

    # create the boardgame
    @board = Board.new

    # print the boardgame to the terminal
    Show.new.show_board(@board)
  end

  def turn
    counter = 0
    while @status == "on going" && counter < 9
      @current_player = @arr_player[counter % 2] # cheking who's player is it the turn and assigning that player to the current_player variable
      @board.play_turn(@board, @current_player)

      # Print the current boardgame to the terminal
      Show.new.show_board(@board)

      # check if one of the players has won
      if @board.victory?(@board)
        @status = 'WINNER'
        break
      end

      counter += 1
    end
  end

  def new_round
    puts "Would you like to play again?"
    puts "Select: Y for Yes or N for NO"
    answer = gets.chomp.upcase
    while answer != 'Y' || answer != 'N'
      if answer == 'Y'
        @board = Board.new
        @status = "on going"
        
        # print new board on screen
        Show.new.show_board(@board)
        break
      elsif answer == 'N'
        puts "Ok bye!"
        exit
      end
      puts "Wrong answer"
      puts "Select: Y for Yes or N for No"
      answer = get.chomp.upcase
    end
    puts "You selected #{answer}... Well done..."
  end

  def game_end
    if @status == "WINNER"
      puts "Well done #{@current_player.player_name}!"
    elsif @status == "on going"
      puts "It's a draw"
    end
  end
end
