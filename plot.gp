set term pdfcairo
set output "Lineare Regression.pdf"

f(x) = a + b * x
fit f(x) "lin-reg.txt"  via a,b

plot "lin-reg.txt" using 1:2 title "Data", f(x) title "Fit"

unset term
unset output