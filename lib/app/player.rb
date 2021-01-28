class Player
  attr_accessor :player_name, :player_token

  def initialize
    @player_name = gets_name
    @player_token = gets_token
  end

  def show_state
    puts "#{@player_name} plays with the #{@player_token} token"
  end
  
  def gets_name
    puts "Enter your name: "
    print "> "
    name = gets.chomp
  end

  def gets_token
    puts "Choose between X and O..."
    sleep(0.5)
    print "> "
    token = gets.chomp.upcase
    while token != "X" && token != "O"
      puts "Sorry you need to choose between X and O!"
      print "> "
      token = gets.chomp.upcase
    end
    return token
  end
end
