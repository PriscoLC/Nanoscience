n=5

set terminal 'jpeg'
set output 'bands.jpeg'
plot for [i=2:n] 'out.txt' using 1:i with lines
