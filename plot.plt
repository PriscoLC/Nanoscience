n=5

set terminal 'jpeg'
set output 'sameAl.jpeg'
set xlabel 'q/a'; set ylabel 'w(q) (cm^-1)'
set title 'First neighbour approximation, Al force costants for both'
set key at graph 0.9,0.85
plot for [i=2:n] 'out.txt' using 1:i with lines ti "Band No. ".(i-1)
