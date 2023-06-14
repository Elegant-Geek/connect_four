# require 'stringio'
require_relative '../connect_four.rb'
require_relative '../test_big_arrays.rb'

# def capture_name
#   $stdin.gets.chomp
# end

describe Game do
  subject(:test_game) { Game.new() }

    # this is basially doing set_player_names() minus cmd line input 
    # subject(:p1) { Player.new("Player One", " \u25CF  ") }
    # subject(:p2) { Player.new("Player Two", " \u25CB  ") }
    # describe 'capture_name' do
    #   before do
    #     $stdin = StringIO.new("Player One")
    #   end
    
    #   after do
    #     $stdin = STDIN
    #   end
    
    #   it "should be 'Player One'" do    
    #     expect(capture_name).to be == "Player One"
    #   end
    # end

    describe 'store players' do
    before do
      # TIP! If you need to allow multiple gets in the loop, (example: the method set_player_names requires four consecutive inputs), you list them consecutively: ('Player One', 'Y', 'Player Two', 'Y') 
      allow(subject).to receive(:gets).and_return('One', 'Y', 'Two', 'Y')
      subject.set_player_names()
    end

    it "first player should be 'One'" do    
      expect(test_game.players[0].name).to be == "One"
    end

    it "second player should be 'Two'" do    
      expect(test_game.players[1].name).to be == "Two"
    end
  end

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



