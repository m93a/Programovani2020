set size ratio -1
set palette model RGB defined ( 0 'red', 4 'blue' )
set cbrange [0:4]
unset colorbox

# opakovane muzeme pak prikazem (ano, dlouhym) spustit animaci

stats 'puntiky.txt' nooutput; do for [k=0:STATS_blocks-2] { plot [-80:80][-80:80] 'puntiky.txt' index k using 1:2:3:3 with circles palette fs solid; pause 0.1 }

# az bude dobre vypadat, vyrobime animovany gif nasledujicimi prikazy (chvili to trva...)

set term gif size 800,800 animate; set output 'puntiky.gif'; do for [k=0:STATS_blocks-2] { plot [-80:80][-80:80] 'puntiky.txt' index k using 1:2:3:3 with circles palette fs solid } ; unset term

# komu se nelibi jeden dlouhy radek, lze jej rozdelit pouzitim \

set term gif size 800,800 animate; \

stats "puntiky.txt" nooutput
do for [k=0:STATS_blocks-2] { \
plot [-80:80][-80:80] "puntiky.txt" \
index k \
using 1:2:3:3 \
with circles palette fs solid; \
pause 0.1 \
}