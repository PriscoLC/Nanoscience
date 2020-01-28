n=3

set terminal 'jpeg'
set output 'geolin.jpg'
set xlabel 'Kx' ; set ylabel 'Ky'
set title 'Punti della BZ in cui vengono calcolate le bande elettroniche'
plot 'geolin.txt' using 2:3 with lines ti 'K su cui si calcolano le bande'

set terminal 'jpeg'
set output 'geo2d.jpg'
set xlabel 'Kx' ; set ylabel 'Ky'
set title 'Prima Zona di Brillouin'
plot 'geo2d.txt' using 1:2

set terminal 'jpeg'
set output 'energie1D.jpg'
unset xtics
set ylabel 'Energia (eV)' ; set xlabel 'Vettori onda'
set title 'Bande elettroniche grafene in approssimazione S=0' ;
plot for [i=2:n] 'energie1D.txt' using 1:i with lines ti "Autovalore".(i-1)

set terminal 'jpeg'
set output 'energie1DS.jpg'
unset xtics
set ylabel 'Energia (eV)' ; set xlabel 'Vettori onda'
set title 'Bande elettroniche grafene (S diverso da 0)' ;
plot for [i=2:n] 'energie1DS.txt' using 1:i with lines ti "Autovalore".(i-1)

clear
reset
#set output 'prova.jpg'
#plot 'prova.txt' using 2:1 with line

#set surface
#set dgrid3d
#set contour
set terminal 'jpeg'
set output 'energie2D.jpg'
set xlabel 'Kx'; set ylabel 'Ky' ; set zlabel 'Energie (eV)'
set title 'Rappresentazione 3D bande eletroniche nella 1BZ (S=0)'
set view 90,45

splot for [i=3:4] 'energie2D.txt' using 1:2:i  ti "Autovalore".(i-2)


#set surface
#set dgrid3d
#unset contour
set terminal 'jpeg'
set output 'energie2DS.jpg'
set title 'Rappresentazione 3D bande elettroniche nella 1BZ (S diverso da 0)'
splot for [i=3:4] 'energie2DS.txt' using 1:2:i  ti "Autovalore".(i-2)

unset hidden3d
unset dgrid3d

#DA QUI IN POI I GRAFICI DEI RIBBOMS
set terminal 'jpeg'
set output 'energie8-AGNR.jpg'
set view 45,45
set nokey
set xlabel 'Kx' ; set ylabel 'Energie (eV)'
set title 'Bande elettroniche 8AGNR (S=0)'
plot for [i=2:3] 'energie8-AGNR.txt' using 1:i with lines lc rgbcolor "#00000000", for [i=4:5] 'energie8-AGNR.txt' using 1:i with lines lc rgbcolor "#00FF0000" , \
     for [i=6:7] 'energie8-AGNR.txt' using 1:i with lines lc rgbcolor "#0000FF00", for [i=8:9] 'energie8-AGNR.txt' using 1:i with lines lc rgbcolor "#000000FF" , \
     for [i=10:11] 'energie8-AGNR.txt' using 1:i with lines lc rgbcolor "#00000000", for [i=12:13] 'energie8-AGNR.txt' using 1:i with lines lc rgbcolor "#0000FFFF", \
     for [i=14:15] 'energie8-AGNR.txt' using 1:i with lines lc rgbcolor "#00FF00FF", for [i=16:17] 'energie8-AGNR.txt' using 1:i with lines lc rgbcolor "#00000FFF"


set terminal 'jpeg'
set output 'energie7-AGNR.jpg'
set xlabel 'Kx' ; set ylabel 'Energie (eV)'
set title 'Bande elettroniche 7AGNR (S=0)'
plot for [i=2:3] 'energie7-AGNR.txt' using 1:i with lines lc rgbcolor "#00000000", for [i=4:5] 'energie7-AGNR.txt' using 1:i with lines lc rgbcolor "#00FF0000", \
     for [i=6:7] 'energie7-AGNR.txt' using 1:i with lines lc rgbcolor "#0000FF00", for [i=8:9] 'energie7-AGNR.txt' using 1:i with lines lc rgbcolor "#000000FF", \
     for [i=10:11] 'energie7-AGNR.txt' using 1:i with lines lc rgbcolor "#00000000", for [i=12:13] 'energie7-AGNR.txt' using 1:i with lines lc rgbcolor "#0000FFFF", \
     for [i=14:15] 'energie7-AGNR.txt' using 1:i with lines lc rgbcolor "#00FF00FF"


set terminal 'jpeg'
set output 'energie6-AGNR.jpg'
set xlabel 'Kx' ; set ylabel 'Energie (eV)'
set title 'Bande elettroniche 6AGNR (S=0)'
plot for [i=2:3] 'energie6-AGNR.txt' using 1:i with lines lc rgbcolor "#00000000", for [i=4:5] 'energie6-AGNR.txt' using 1:i with lines lc rgbcolor "#00FF0000", \
     for [i=6:7] 'energie6-AGNR.txt' using 1:i with lines lc rgbcolor "#0000FF00", for [i=8:9] 'energie6-AGNR.txt' using 1:i with lines lc rgbcolor "#000000FF", \
     for [i=10:11] 'energie6-AGNR.txt' using 1:i with lines lc rgbcolor "#00000000", for [i=12:13] 'energie6-AGNR.txt' using 1:i with lines lc rgbcolor "#0000FFFF"


set terminal 'jpeg'
set output 'energie5-AGNR.jpg'
set xlabel 'Kx' ; set ylabel 'Energie (eV)'
set title 'Bande elettroniche 5AGNR (S=0)'
plot for [i=2:3] 'energie5-AGNR.txt' using 1:i with lines lc rgbcolor "#00000000", for [i=4:5] 'energie5-AGNR.txt' using 1:i with lines lc rgbcolor "#00FF0000", \
     for [i=6:7] 'energie5-AGNR.txt' using 1:i with lines lc rgbcolor "#0000FF00", for [i=8:9] 'energie5-AGNR.txt' using 1:i with lines lc rgbcolor "#000000FF", \
     for [i=10:11] 'energie5-AGNR.txt' using 1:i with lines lc rgbcolor "#0000FFFF"

#CON S DIVERSO DA 0
set terminal 'jpeg'
set output 'S-en5AGNR.jpg'
set xlabel 'Kx' ; set ylabel 'Energie (eV)'
set title 'Bande elettroniche 5AGNR (S diverso da 0)'
plot for [i=2:3] 'S-en5AGNR.txt' using 1:i with lines lc rgbcolor "#00000000", for [i=4:5] 'S-en5AGNR.txt' using 1:i with lines lc rgbcolor "#00FF0000", \
     for [i=6:7] 'S-en5AGNR.txt' using 1:i with lines lc rgbcolor "#0000FF00", for [i=8:9] 'S-en5AGNR.txt' using 1:i with lines lc rgbcolor "#000000FF", \
     for [i=10:11] 'S-en5AGNR.txt' using 1:i with lines lc rgbcolor "#0000FFFF"

set terminal 'jpeg'
set output 'S-en6AGNR.jpg'
set xlabel 'Kx' ; set ylabel 'Energie (eV)'
set title 'Bande elettroniche 6AGNR (S diverso da 0)'
plot for [i=2:3] 'S-en6AGNR.txt' using 1:i with lines lc rgbcolor "#00000000", for [i=4:5] 'S-en6AGNR.txt' using 1:i with lines lc rgbcolor "#00FF0000", \
     for [i=6:7] 'S-en6AGNR.txt' using 1:i with lines lc rgbcolor "#0000FF00", for [i=8:9] 'S-en6AGNR.txt' using 1:i with lines lc rgbcolor "#000000FF", \
     for [i=10:11] 'S-en6AGNR.txt' using 1:i with lines lc rgbcolor "#00000000", for [i=12:13] 'S-en6AGNR.txt' using 1:i with lines lc rgbcolor "#0000FFFF"


set terminal 'jpeg'
set output 'S-en7AGNR.jpg'
set xlabel 'Kx' ; set ylabel 'Energie (eV)'
set title 'Bande elettroniche 7AGNR (S diverso da 0)'
plot for [i=2:3] 'S-en7AGNR.txt' using 1:i with lines lc rgbcolor "#00000000", for [i=4:5] 'S-en7AGNR.txt' using 1:i with lines lc rgbcolor "#00FF0000", \
     for [i=6:7] 'S-en7AGNR.txt' using 1:i with lines lc rgbcolor "#0000FF00", for [i=8:9] 'S-en7AGNR.txt' using 1:i with lines lc rgbcolor "#000000FF", \
     for [i=10:11] 'S-en7AGNR.txt' using 1:i with lines lc rgbcolor "#00000000", for [i=12:13] 'S-en7AGNR.txt' using 1:i with lines lc rgbcolor "#0000FFFF", \
     for [i=14:15] 'S-en7AGNR.txt' using 1:i with lines lc rgbcolor "#00FF00FF"


set terminal 'jpeg'
set output 'S-en8AGNR.jpg'
set xlabel 'Kx' ; set ylabel 'Energie (eV)'
set title 'Bande elettroniche 8AGNR (S divero da 0)'
plot for [i=2:3] 'S-en8AGNR.txt' using 1:i with lines lc rgbcolor "#00000000", for [i=4:5] 'S-en8AGNR.txt' using 1:i with lines lc rgbcolor "#00FF0000", \
     for [i=6:7] 'S-en8AGNR.txt' using 1:i with lines lc rgbcolor "#0000FF00", for [i=8:9] 'S-en8AGNR.txt' using 1:i with lines lc rgbcolor "#000000FF", \
     for [i=10:11] 'S-en8AGNR.txt' using 1:i with lines lc rgbcolor "#00000000", for [i=12:13] 'S-en8AGNR.txt' using 1:i with lines lc rgbcolor "#0000FFFF", \
     for [i=14:15] 'S-en8AGNR.txt' using 1:i with lines lc rgbcolor "#00FF00FF", for [i=16:17] 'S-en8AGNR.txt' using 1:i with lines lc rgbcolor "#00000FFF"
