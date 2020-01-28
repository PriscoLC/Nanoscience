n=5

set terminal 'jpeg'
set output 'bands.jpeg'
set xlabel 'q/a'; set ylabel 'w(q)'
set title 'Dispersion 1/1 GaAs/AlAs(first neighbour approximation, [001] direction)'
set key at graph 0.9,0.88
plot for [i=2:n] 'out.txt' using 1:i with lines ti "Band No. ".(i-1)
