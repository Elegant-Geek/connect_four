full_cat = []

1.upto(21) do
  full_cat << " \u25CF  "
  full_cat << " \u25CB  "
end

  puts full_cat.size

# use below code only to validate full_cat's output.
(6).times do |n|
  p full_cat[(7 * n)..(7 * n + 6)].join(', ')
end

# b = %w(● ○ ● ○ ● ○ ●
#        ○ ● ○ ● ○ ● ○ 
#        ● ○ ● ○ ● ○ ●
#        ● ○ ● ○ ● ○ ●
#        ○ ● ○ ● ○ ● ○ 
#        ● ○ ● ○ ● ○ ●)
#   puts b


" u25CF  ,  u25CB  ,  u25CF  ,  u25CB  ,  u25CF  ,  u25CB  ,  u25CF  "
" u25CB  ,  u25CF  ,  u25CB  ,  u25CF  ,  u25CB  ,  u25CF  ,  u25CB  "
" u25CF  ,  u25CB  ,  u25CF  ,  u25CB  ,  u25CF  ,  u25CB  ,  u25CF  "
" u25CB  ,  u25CF  ,  u25CB  ,  u25CF  ,  u25CB  ,  u25CF  ,  u25CB  "
" u25CF  ,  u25CB  ,  u25CF  ,  u25CB  ,  u25CF  ,  u25CB  ,  u25CF  "
" u25CB  ,  u25CF  ,  u25CB  ,  u25CF  ,  u25CB  ,  u25CF  ,  u25CB  "