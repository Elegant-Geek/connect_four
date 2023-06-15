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

  describe 'WINNERS constant' do
    it "first player should be 'One'" do    
      expect(WINNERS.size).to eq(183)
    end
  end

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
      it "should return as valid because it is a grid coordinate on the board'" do
        expect(subject.report('C1R1')).to eq("valid")
      end

      it "should return as valid because it is a grid coordinate on the board'" do
        expect(subject.report('C3R1')).to eq("valid")
      end

      it "should return as valid because it is a grid coordinate on the board'" do
        expect(subject.report('C5R1')).to eq("valid")
      end
    end

    context 'select invalid grid square' do    
      it "should return as invalid because it is not a grid coordinate on the board'" do
        expect(subject.report('C8R8')).to eq("invalid")
      end

      it "should return as invalid because space is already taken'" do  
        # plop something on the board
        subject.board[35] = " \u25CF  "
        puts "If a C1R1 is declared again on the grid below, 'invalid' is returned..."
        subject.print_array()
        expect(subject.report('C1R1')).to eq("invalid")
      end
    end

    context 'select grid that is antigravity and off board' do    
      it "should not return as antigravity, but as an off board example instead" do    
        expect(subject.report('C8R8')).to eq("invalid")
      end

      it 'should return as antigravity because it is validly on board but hovering' do    
        expect(subject.report('C1R2')).to eq("gravity")      
      end
    end
  end

  context 'a cats game' do

    # EMPTY TOP
    it 'should not be a full board on top row (some empty on top row)' do   
      allow(subject).to receive(:gets).and_return("C1R1", "C1R2", "QUIT", "N")  
      expect(subject.top_row_empty?()).to be true  
    end

    #TRUE CATS FULL TOP NO WIN ("C7R6", "C3R6")
    it 'should be a full board on top row (NONE empty on top row)' do
      allow(subject).to receive(:gets).and_return("C1R1", "C2R1", "C1R2", "C3R1", "C4R1","C5R1", "C1R3","C1R4", "C2R2", "C3R2", "C1R5", "C7R1", "C6R1", "C4R2", "C5R2", "C6R2", "C7R2", "C1R6", 
        "C4R3", "C6R3", "C3R3","C3R4", "C7R3", "C4R4", "C5R3", "C2R3", "C2R4", "C5R4", "C6R4", "C7R4", "C2R5", "C3R5", "C4R5", "C5R5", "C7R5", "C5R6", 
        "C6R5", "C6R6", "C4R6", "C2R6", "C3R6", "C7R6", "QUIT", "N")
      subject.game_turn()
      expect(subject.top_row_empty?()).to be false  
    end

    #TRUE CATS GAME OUTPUT TEST: WINNER ON LAST MOVE ("C3R6", "C7R6"). LAST MOVE THAT ENDS UP WINNING TAKES PRIORITY OVER CATS OUTPUT (win = true)
    it 'should declare winner on last move of an otherwise cats game' do
      allow(subject).to receive(:gets).and_return("C1R1", "C2R1", "C1R2", "C3R1", "C4R1","C5R1", "C1R3","C1R4", "C2R2", "C3R2", "C1R5", "C7R1", "C6R1", "C4R2", "C5R2", "C6R2", "C7R2", "C1R6", 
        "C4R3", "C6R3", "C3R3","C3R4", "C7R3", "C4R4", "C5R3", "C2R3", "C2R4", "C5R4", "C6R4", "C7R4", "C2R5", "C3R5", "C4R5", "C5R5", "C7R5", "C5R6", 
        "C6R5", "C6R6", "C2R6", "C4R6", "C3R6", "C7R6", "QUIT", "N")  
      subject.game_turn()
      expect(subject.win?()).to be true   
    end

    #TRUE CATS GAME OUTPUT TEST: NO WINNER (win = false)
    it 'declare no winner on true cats game' do
      allow(subject).to receive(:gets).and_return("C1R1", "C2R1", "C1R2", "C3R1", "C4R1","C5R1", "C1R3","C1R4", "C2R2", "C3R2", "C1R5", "C7R1", "C6R1", "C4R2", "C5R2", "C6R2", "C7R2", "C1R6", 
        "C4R3", "C6R3", "C3R3","C3R4", "C7R3", "C4R4", "C5R3", "C2R3", "C2R4", "C5R4", "C6R4", "C7R4", "C2R5", "C3R5", "C4R5", "C5R5", "C7R5", "C5R6", 
        "C6R5", "C6R6", "C4R6", "C2R6", "C3R6", "C7R6", "QUIT", "N")
      subject.game_turn()
      expect(subject.win?()).to be false   
    end
  end

  context 'a winning game' do
    # ACROSS WIN (note that QUIT and N are only really needed when loop doesnt break aka no game over trigger/win. I kept em in anyway.)
    it 'should let player 1 win across bottom row' do  
      allow(subject).to receive(:gets).and_return("C1R1", "C1R2", "C2R1", "C1R3", "C3R1", "C2R2", "C4R1", "QUIT", "N")  
      subject.game_turn()
      expect(subject.win?()).to be true  
    end
    # UPDOWN WIN
    it 'should let player 1 win up/down column 1' do
      allow(subject).to receive(:gets).and_return("C1R1", "C1R2", "C2R1", "C1R3", "C3R1", "C2R2", "C3R2", "C1R4", "C2R3", "C1R5", "QUIT", "N")  
      subject.game_turn()
      expect(subject.win?()).to be true  
    end
    # DIAGONAL WIN 
    it 'should let player 1 win up/down column 1' do
      allow(subject).to receive(:gets).and_return("C1R1", "C2R1", "C2R2", "C3R1", "C4R1", "C3R2", "C3R3", "C4R2", "C5R1", "C4R3", "C4R4", "QUIT", "N")  
      subject.game_turn()
      expect(subject.win?()).to be true  
    end
  end
end

# goal is to get printed output only once...
# -----------------------------COMPLETED TESTS--------------------------------
# player names one and two name storage 2x
# unicode support / correct setup 2x
# on first iteration, assign first player to black (white in cmd) by default.
# on second iteration, assign first player to white (black in cmd) by default.
# tested three valid squares on first row
# test invalid off grid spot
# test invalid bc spot taken
# an antigravity and off board returns the offboard message before/instead of antigravity
# only returns antigravity when a valid spot on the board but still hovering
# (id love to get two or more chips on the board then test antigravity like that...)
# winner size should always be WINNERS.size == 183
# test a across win
# test a down win
# test a diag win
# test an empty top
# test full top
# -----------------------------TODO TESTS--------------------------------


# make sure a cats game works: test a game with values of (start C1R1...C7R6) consecutively gives cats 
# test that after reset, each players combo_array is [] again, @gameover == false and that board is... [big array again]

# test if player one win comes before player two win, report player one as winner
# test if player two win comes before player one win, report player two as winner







