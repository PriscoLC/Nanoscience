set terminal 'jpeg'
set key noautotitle


set output 'ampiezze1.jpg'
set title "Displacement's amplitude of atoms in unit cell, First band LA"
set ylabel 'Amplitude'
set yrange [-1:1]
set xtics border nomirror out nooffset ("Ga" 0.2 0, "As" 1.2 0, "Al" 2.2 0, "As" 3.2 0)
set boxwidth 0.1 relative
set style data histograms
set style fill solid 1.0 border 0
plot 'autovet2v.txt' using 1 t "Second neighbour",  [-1:6] 0, 'autovet1v.txt' using 1 t "Nearest neighbour"



set output 'ampiezze2.jpg'
set title "Displacement's amplitude of atoms in unit cell, Second band LA"
set ylabel 'Amplitude'
set yrange [-1:1]
set xtics border nomirror out nooffset ("Ga" 0.2 0, "As" 1.2 0, "Al" 2.2 0, "As" 3.2 0)
set boxwidth 0.1 relative
set style data histograms
set style fill solid 1.0 border 0
plot 'autovet2v.txt' using 2 t "Second neighbour",  [-1:6] 0, 'autovet1v.txt' using 2 t "Nearest neighbour"




set output 'ampiezze3.jpg'
set title "Displacement's amplitudet of atoms in unit cell, GaAs-like LO"
set ylabel 'Amplitude'
set yrange [-1:1]
set xtics border nomirror out nooffset ("Ga" 0.2 0, "As" 1.2 0, "Al" 2.2 0, "As" 3.2 0)
set boxwidth 0.1 relative
set style data histograms
set style fill solid 1.0 border 0
plot 'autovet2v.txt' using 3 t "Second neighbour",  [-1:6] 0, 'autovet1v.txt' using 3 t "Nearest neighbour"


set output 'ampiezze4.jpg'
set title "Displacement's amplitude of atoms in unit cell, AlAs-like LO"
set ylabel 'Amplitude'
set yrange [-1:1]
set xtics border nomirror out nooffset ("Ga" 0.2 0, "As" 1.2 0, "Al" 2.2 0, "As" 3.2 0)
set boxwidth 0.1 relative
set style data histograms
set style fill solid 1.0 border 0
plot 'autovet2v.txt' using 4 t "Second neighbour",  [-1:6] 0, 'autovet1v.txt' using 4 t "Nearest neighbour"
