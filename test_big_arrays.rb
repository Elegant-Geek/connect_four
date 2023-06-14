# generates all across winners
WINNERS = []

1.upto(6) do |n|
  n = n.to_s
  across_winners = [["C1R_", "C2R_", "C3R_", "C4R_"],
                    ["C2R_", "C3R_", "C4R_",  "C5R_"],
                    ["C3R_", "C4R_",  "C5R_", "C6R_"],
                    ["C4R_",  "C5R_", "C6R_", "C7R_"]]
  across_winners.each do |w|
    w.each do |inside|
      inside.gsub!("_", n)
    end
    # put every single combo into the WINNERS array
    WINNERS << across_winners
  end
# p WINNERS.size
# p across_winners
end
#generates all down winners
1.upto(7) do |n|
  n = n.to_s
  down_winners = [["C_R6", "C_R5", "C_R4", "C_R3"],
                  ["C_R5", "C_R4", "CR_3", "C_R2"],
                  ["C_R4", "CR_3", "C_R2", "C_R1"]]
  down_winners.each do |w|
    w.each do |inside|
      inside.gsub!("_", n)
    end
    # put every single combo into the WINNERS array
    WINNERS << down_winners
  end
  # p WINNERS.size
  # p down_winners
end

diagonal_winners = [["C1R3", "C2R4", "C3R5", "C4R6"],
                    ["C1R2", "C2R3", "C3R4", "C4R5"],
                    ["C2R3", "C3R4", "C4R5", "C5R6"],
                    ["C1R1", "C2R2", "C3R3", "C4R4"],
                    ["C2R2", "C3R3", "C4R4", "C5R5"],
                    ["C3R3", "C4R4", "C5R5", "C6R6"],
                    ["C2R1", "C3R2", "C4R3", "C5R4"],
                    ["C3R2", "C4R3", "C5R4", "C6R5"],
                    ["C4R3", "C5R4", "C6R5", "C7R6"],
                    ["C3R1", "C4R2", "C5R3", "C6R4"],
                    ["C4R2", "C5R3", "C6R4", "C7R5"],
                    ["C4R1", "C5R2", "C6R3", "C7R4"],
                  
                    ["C4R6", "C5R5", "C6R4", "C7R3"],
                    ["C3R6", "C4R5", "C5R4", "C6R3"],
                    ["C4R5", "C5R4", "C6R3", "C7R2"], 
                    ["C2R6", "C3R5", "C4R4", "C5R3"],
                    ["C3R5", "C4R4", "C5R3", "C6R2"],
                    ["C4R4", "C5R3", "C6R2", "C7R1"],
                    ["C1R6", "C2R5", "C3R4", "C4R3"],
                    ["C2R5", "C3R4", "C4R3", "C5R2"],
                    ["C3R4", "C4R3", "C5R2", "C6R1"],
                    ["C1R5", "C2R4", "C3R3", "C4R2"],
                    ["C2R4", "C3R3", "C4R2", "C5R1"],
                    ["C1R4", "C2R3", "C3R2", "C4R1"]]
# put every single combo into the WINNERS array
                   diagonal_winners.each do |w|
                      WINNERS << w
                    end
                    # p diagonal_winners

if __FILE__== $0
  # total size is 69 combos (show all the winners only if this file is run)
  p WINNERS
  puts WINNERS.size
end




