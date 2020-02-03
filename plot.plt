n=5

set terminal 'jpeg'
set output 'second.jpeg'
set title 'Next-nearest neighbour approximation';
set key at graph 0.9,0.9;
plot for [i=2:n] 'out.txt' using 1:i with lines ti "Band No. ".(i-1)

