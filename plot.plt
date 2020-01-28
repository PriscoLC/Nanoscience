n=5

set terminal 'jpeg'
set output 'bands.jpeg'
set xlabel 'q/a'; set ylabel 'w(q) (cm^-1)'
set yrange [0:400]
set title 'First neighbour approximation, different force costants'
set key at graph 0.9,0.85
plot for [i=2:n] 'out.txt' using 1:i with lines ti "Band No. ".(i-1)
