load "config.m";
QQ := Rationals();
R<x,y> := PolynomialRing(QQ,2);
F := y^2 - (x^2 + 1138193*x + 4892382);
vals := GetSpecializationValues();
my_vals := vals[1..5];
time M := PolredGramMatrix(F, my_vals);
printf "Is positive definite? %o\n", IsPositiveDefinite(M);
L := LatticeWithGram(M);
