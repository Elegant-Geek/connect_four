require_relative '../connect_four.rb'
require_relative '../test_big_arrays.rb'


describe Game do
  subject(:test_game) { Game.new() }

  before do
    # TIP! If you need to allow multiple gets in the loop, (example: the method set_player_names requires four consecutive inputs), you list them consecutively: ('Player One', 'Y', 'Player Two', 'Y') 
    allow(subject).to receive(:gets).and_return('One', 'Y', 'Two', 'Y')
    subject.set_player_names()
    # this  is commented out because each sequence must be unique to the test and so you can't add onto it w/o overwriting prev instructions
    # allow(subject).to receive(:gets).and_return('C1R1', 'C1R2', 'C2R1', 'C2R2')
    # whatever is in my loop must be wrapped in a function so i can immediately print the output (my test is set up to kill overarching function oops)
  end

  # describe 'WINNERS constant' do
  #   expect(WINNERS.size).to eq(183)
  # end

    describe 'store players' do
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
    context 'select valid grid square' do    
      it "should return as invalid because it is not a grid coordinate on the board'" do
        # this is player one's move again 
        allow(subject).to receive(:gets).and_return('C1R1')
        expect(subject.report('C1R1')).to eq("valid")
      end
    end

    context 'select invalid grid square' do    
      it "should return as invalid because it is not a grid coordinate on the board'" do
        allow(subject).to receive(:gets).and_return('C8R8')
        expect(subject.report('C8R8')).to eq("invalid")
      end

      it "should return as invalid because space is already taken'" do  
        # plop something on the board
        subject.board[35] = " \u25CF  "
        puts "If a C1R1 is declared again on the grid below, 'invalid' is returned..."
        subject.print_array()
        allow(subject).to receive(:gets).and_return('C1R1')
        expect(subject.report('C1R1')).to eq("invalid")
      end
    end

    context 'select grid that is antigravity and off board' do    
      it "should not return as antigravity, but as an off board example instead" do    
        allow(subject).to receive(:gets).and_return('C8R8')
        expect(subject.report('C8R8')).to eq("invalid")
      end

      it 'should return as antigravity because it is validly on board but hovering' do    
        allow(subject).to receive(:gets).and_return('C1R2')
        expect(subject.report('C1R2')).to eq("gravity")      
      end
    end

  end


end

# goal is to get printed output only once...
# on second iteration, assign first player to white (black in cmd) by default.

# tested invalid move
# tested top gravity thing 

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



