set term pdfcairo
set output "Lineare Regression.pdf"

f(x) = a + b * x
fit f(x) "lin-reg.txt"  via a,b

fb(x) = c + d * x
fit fb(x) "random_walk2d.dat" using 1:($2*$2) via c,d

plot "lin-reg.txt" using 1:2 title "Lin Reg", f(x) title "LR - Fit"
plot "random_walk2d.dat" using 1:($2*$2) title "Random Walk", fb(x) title "RW - Fit"

unset term
unset output