require_relative '../connect_four.rb'
require_relative '../test_big_arrays.rb'


describe Game do
  subject(:test_game) { Game.new() }

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

    it "First player unicode is" do    
      expect(test_game.players[0].character).to be == " \u25CF  "
    end

    it "Second player unicode is" do    
      expect(test_game.players[1].character).to be == " \u25CB  "
    end
  end

  describe 'play rounds' do
    before do
      # TIP! If you need to allow multiple gets in the loop, (example: the method set_player_names requires four consecutive inputs), you list them consecutively: ('Player One', 'Y', 'Player Two', 'Y') 
      allow(subject).to receive(:gets).and_return('One', 'Y', 'Two', 'Y')
      subject.set_player_names()
      # this  is commented out because each sequence must be unique to the test and so you can't add onto it w/o overwriting prev instructions
      # allow(subject).to receive(:gets).and_return('C1R1', 'C1R2', 'C2R1', 'C2R2')
    end

    context 'select invalid grid square' do    
      it "should return as invalid because it is not a grid coordinate on the board'" do
        # this is player one's move again 
        allow(subject).to receive(:gets).and_return('C1R1', 'C1R2', 'C2R1', 'C2R2', 'C4R6','quit')
        subject.game_turn()
        expect(subject).to receive(:gets).and_return("Invalid position.")
      end

      xit "should return as invalid because space is already taken'" do    
        expect(subject).to receive(:gets).and_return("Invalid position.") 
      end
    end

    context 'select grid that is antigravity' do    
      xit "should not return as antigravity, but as an off board example instead" do    
        expect(subject).to receive(:gets).and_return("Invalid position.") 
      end

      xit 'should return as antigravity because it is validly on board' do    
        expect(subject).to receive(:gets).and_return("GRAVITY ERROR: The spot below (ERHERkjdfjs) is empty..") 
      end
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



