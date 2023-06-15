# 8:48pm on 6.13.23 is start of this project connect four
# ended main code at 4:04am, so now all I gotta do is write the tests for it! Yay!
# require 'stringio'

require_relative './test_big_arrays.rb'
class Game
  attr_reader :board, :players
  attr_accessor :gameover
  # NOTE: the winning combo array is hosted in another file for brevity.
  def initialize(game_name = "Connect Four")
    @players = []
    reset()
    puts "New game called '#{game_name}' created."
  end
  def reset()
        # reset gameover back to false so that a new gameturn can start
        @gameover = false
        # create an array with 9 empty spaces! (before it was just @board = [] and I might revert back to that)
        @board = %w(C1R6 C2R6 C3R6 C4R6 C5R6 C6R6 C7R6 
          C1R5 C2R5 C3R5 C4R5 C5R5 C6R5 C7R5 
          C1R4 C2R4 C3R4 C4R4 C5R4 C6R4 C7R4 
          C1R3 C2R3 C3R3 C4R3 C5R3 C6R3 C7R3
          C1R2 C2R2 C3R2 C4R2 C5R2 C6R2 C7R2
          C1R1 C2R1 C3R1 C4R1 C5R1 C6R1 C7R1)
        @players.each do |p|
          p.combo_array = []
        end
  end
  def print_array()
    # creates a great display array without all the extra quotes
    (6).times do |n|
      p @board[(7 * n)..(7 * n + 6)].join(', ')
    end
  end

  def set_player_names()
    2.times do |i|
      loop do
        puts "Player #{i+1}, what is your name?"
        name = gets.chomp 
          puts "Confirm name is #{name}? (Y/N)"
          # verify confirmation
          confirm_name = gets.to_s.upcase.chomp
          if (confirm_name == "Y" && (name != '' && name != nil))
            puts "Thanks! Your name is saved as '#{name}'."
            # after names set up, save them
            #create new player
            # on first iteration, assign first player to black (white in cmd) by default.
            if i == 0
            @players << Player.new("#{name}", " \u25CF  ")
            # on second iteration, assign second player to white (black in cmd) by default.
            elsif i == 1
            @players << Player.new("#{name}", " \u25CB  ")
            else 
              puts "something is wrong"
            end
            puts "Player '#{name}' saved."
            #break loop only if name is valid
            break
          elsif (confirm_name == "N")
            puts "NO? TRY AGAIN!"
          else 
            puts "Please enter Y/N. (Name cannot be left blank either). Information has not been saved."
          end
        end
    end
        #you can comment out the display line below
        # p @players
        if @players.size > 2
          p @players
          puts "Array too big (2 needed). The most recent entries have overwritten previous player data."
          # you can uncomment this line below to only grab the most recent two players in the array and reprint the array!
          # slice says start the slice at the last, and return/keep only the last two elements
          @players = @players.slice(-2, @players.length)
          p @players
        end
  end
  def top_row_empty?()
    @board[0..6].any?(/.*R6/)
  end
  def win?()
    @intersection.size == 4
  end
  def report(selection)
    # line below verifies the player's input gets upcased.
      # puts selection
      # if C1R4 then grabs 3 as a string form:
      row_beneath_selection = (selection[-1].to_i - 1).to_s
      # create new variable that stores the spot immediately beneath the selection! (C1R4's below neighbor is "C1R3" so C1R3 is generated)
      spot_beneath_selection = selection[0..2] + (row_beneath_selection)
      # add the user's selection to x or o combo array (each player has their own combo array.)
      if (@board.include?(selection)) && !(@board.include?(spot_beneath_selection))
        "valid"
      elsif (@board.include?(selection)) && (@board.include?(spot_beneath_selection))
        "gravity"
      else
        "invalid"
      end
      # return this for use
  end

  def game_turn
    while @gameover == false do
    # puts "Starting new round:"
    @players.each do |p|
    loop do
      # puts "#{p.name} playing as #{p.character}!"
      puts "Player #{p.name} (#{p.character}), pick a position on the board (Use 'C_R_' format)."
      # grab selection then automatically upcase any letters!
      selection = gets.chomp.upcase
      # runs report (you can comment out 104)
      report = report(selection)
      p.combo_array
      # If board includes C1R4 for instance as a character in the array, it is replaced with players character x or o for time being. otherwise, error
      # next step is to add if player x or o already exists say spot taken
      # next next step is to prohibit hovering chips and must have sunken chip below like C1R4 cant be filled til C1R3 is filled. so if C1R4 is called but C1R(4-1) spot exists in array, ERROR for hovering chip 
      # if the board includes the C1R4 description and the spot below is already filled (ie, excludes C1R3) then it is a valid entry!
      # this takes care of all of row one as well because if spot is C1R1, the array will never have C1R0 which will always return false.
      if selection == "QUIT"
        puts "goodbye"
        @gameover = true
        break
      elsif (report == "valid")
        # NEXT STEP IS BELOW: line 117 add the replacement with test c6r1
        # array[array.index(4)] = "Z"
      @board[@board.index(selection)] = p.character
      p.combo_array << selection
      p p.combo_array
      # this line (below) must be here so that the board display gets updated every time the board changes. The map to_s includes quotes so board maintains shape throughout the game.
      # @board_display = @board.map(&:to_s)
      print_array()
      break
      # if the spot below is empty, notify user and have them repick. I'm a nice person and won't allow it to drop in.
      elsif (report == "gravity")
      puts "GRAVITY ERROR: The spot below is empty."
      elsif (report == "invalid") 
      # else the loop repeats til a valid character is entered
      puts "Invalid position."
      else
        puts "Something is wrong..."
        break
      end
      #^ cond end
      end
      # ^ loop small end
            # match combo array to any winning combo using iteration through every winning combo
            # puts "player combo ignore#{p.combo_array}"
            WINNERS.each do |n|
              # the "and" sign catches the intersecting values of each instance of the winning combos constant and matches it to the current player's combo array.
              @intersection = n & p.combo_array
              # if (@intersection.size >= 3)
              #   puts "Getting close... #{@intersection}"
              # end
              # if any winner at all, then report winner and break game. It doesn't matter if board is full or not. The board is checked for fullness later on.
              # puts "printing intersection #{@intersection}"
              # puts "printing n #{n}"
              # .... the answer was right in front of me. screw matching, as soon as the intersection is size of four, that is a win.
              if (win?()) # << no sorting needed with this strategy!
                puts "PLAYER #{p.name} (#{p.character}), WINS THE GAME WITH POSITIONS #{@intersection}!"
                @gameover = true
                break
              end
            end
            #^ end winning constant each do combo loop

            # now exit out of main loop if game over is true (because it is currently nested in the each do loop above but not outside of it.)
            if @gameover == true
            break
            # now cats can be declared if board is full but the loop never broke and declared a winner as shown above!
            # cats must be checked outside of the main loop using gameover variable set to true condition because otherwise, cats will be returned on first
            # iteration if match not found but board full, so this cats must be defined based on conditions outside the each do loop! COOL!
            # if cats aka no game end and the board is full, break loop but dont 
            #as long as R6 exists anywhere (aka top row is not completely full yet), KEEP GOING! This next line checks the top board row for any empty R6's
            # if gameover toggle is false AND if the board does NOT(!) have any spots on the top shelf that haven't been filled (aka one or more C_R6) spots are open, keep going.
            elsif @gameover == false && !top_row_empty?()
            puts "CATS! end game."
            @gameover = true
            break
            end
      end
      # ^ players each do end
    end
    #^^ bigger loop end
    puts "GAME OVER."
    # the end game will give the option to relaunch another round and clear the board, and toggle gameover back to false.
    replay()
  end
  # ^ gameturn end

  def replay()
    puts "Play again? (Y/N)"
    answer = gets.to_s.upcase.chomp
    if ((answer == "Y" || answer == "YES"))
    reset()
    print_array()
    game_turn()
    else      
      puts "Thanks for playing!"
    end
  end

  def play_game()
    puts "Welcome to Connect Four!"
    set_player_names()
    print_array()
    game_turn()
  end
end

class Player
  attr_reader :name, :character
  attr_accessor :players, :combo_array
  # setting a class variable container to store all the players and their characters!
 
  def initialize(name, character)
    @name = name
    @character = character
    @combo_array = []
    #append player details to the main array of players. Each player is their own array. Maybe change this to be a hash...
  end
end


# have this run only if instructed to within this file otherwise when you run rspec, it searches the whole rspec doc for input.
if __FILE__== $0
  o = Game.new()
  o.play_game()
end


