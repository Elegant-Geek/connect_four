require 'stringio'
require_relative '../connect_four.rb'
require_relative '../test_big_arrays.rb'

def capture_name
  $stdin.gets.chomp
end

describe Game do
  # subject(:test_game) { Game.new() }

    # this is basially doing set_player_names() minus cmd line input 
    # subject(:p1) { Player.new("Player One", " \u25CF  ") }
    # subject(:p2) { Player.new("Player Two", " \u25CB  ") }
    describe 'capture_name' do
      before do
        $stdin = StringIO.new("Player One")
      end
    
      after do
        $stdin = STDIN
      end
    
      it "should be 'James T. Kirk'" do    
        expect(capture_name).to be == "Player One"
      end
    end
    # test_game.set_player_names()
    # $stdin = StringIO.new("Player One")
    # $stdin = StringIO.new("Y")
    # $stdin = StringIO.new("Player Two")
    # $stdin = StringIO.new("Y")


  # context 'when testing the before setup players above' do
  #   it 'will have @player.size of 2' do
  #     expect(test_game.players.size).to eq(2)
  #   end
  # end

end


#   elsif i == 1

#   print_array()
#   game_turn()

#   context 'when testing for multiple outcomes' do
#     it 'will be coffee, tea, or water' do
#       expect(drinks.sample).to eq('coffee').or eq('tea').or eq('water')
#     end
#   end


#   context 'when testing for a change' do
#     it 'will change the length to 4' do
#       expect { drinks << 'juice' }.to change { drinks.length }.to(4)
#     end

#     it 'will change the length from 3 to 4' do
#       expect { drinks << 'juice' }.to change { drinks.length }.from(3).to(4)
#     end
# end


# on second iteration, assign first player to white (black in cmd) by default.

# test invalid move
# test top gravity thing 
# test inputs that show up as intersects like winners[1] will show one intersect
# test inputs that show up as intersects like winners[2] will show two intersect etc
# test two across wins (sorted and unsorted)
# test two down wins (sorted and unsorted)
# test two diag wins (sorted and unsorted)
# test if player one win comes before player two win, report player one as winner
# test if player two win comes before player one win, report player two as winner
# winner size should always be WINNERS.size == 183
# test row beneath selection 
# test that after reset, each players combo_array is [] again, @gameover == false and that board is... [big array again]

# test a game with values of (start C1R1...C7R6) consecutively gives cats 

# make sure a cats game works



