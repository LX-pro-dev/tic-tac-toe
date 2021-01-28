class Show
  attr_accessor :board
  def show_board(board)
    puts " " * 4 + "1".green + " " * 3 + "2".green + " " * 3 + "3".green
    puts " " * 2 + "-".green * 13
    puts "A | ".green + board.arr_boardcase[0].token.yellow + " | ".green + board.arr_boardcase[1].token.yellow + " | ".green + board.arr_boardcase[2].token.yellow + " |".green
    puts " " * 2 + "-".green * 13
    puts "B | ".green + board.arr_boardcase[3].token.yellow + " | ".green + board.arr_boardcase[4].token.yellow + " | ".green + board.arr_boardcase[5].token.yellow + " |".green
    puts " " * 2 + "-".green * 13
    puts "C | ".green + board.arr_boardcase[6].token.yellow + " | ".green + board.arr_boardcase[7].token.yellow + " | ".green + board.arr_boardcase[8].token.yellow + " |".green
    puts " " * 2 + "-".green * 13
  end
end
