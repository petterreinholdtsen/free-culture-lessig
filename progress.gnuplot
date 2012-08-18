set terminal png size 800, 300
set output "progress.png"
set key left top
set style fill solid
set xdata time
set timefmt "%Y-%m-%dT%H%M"
set format x "%b %d"
#set ytics 700
#set y2tics 100 border
set xlabel "Translation progress"

set style line 1 linetype 1 pointtype 0 linewidth 1 linecolor 6
set style line 2 linetype 2 pointtype 0 linewidth 1 linecolor 7
set style line 3 linetype 3 pointtype 0 linewidth 1 linecolor 8
plot ["2012-07-08T0000":"2012-08-19T0000"][:] \
 'stats.csv' using 1:($2+$3+$4) t "missing" w filledcurves x1 linestyle 3, \
 'stats.csv' using 1:($2+$3) t "fuzzy" w filledcurves x1 linestyle 2, \
 'stats.csv' using 1:($2) t "translated" w filledcurves x1 linestyle 1
