n=5

set terminal 'jpeg'
set output '4x4.jpeg'
plot for [i=2:n] 'out.txt' using 1:i with lines
