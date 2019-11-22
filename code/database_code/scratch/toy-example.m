load "config.m";
QQ := Rationals();
R<x,y> := PolynomialRing(QQ,2);
F := y - (x^2 + 1138193*x + 4892382);
vals := GetSpecializationValues();
my_vals := vals[1..5];
//time M := PolredGramMatrix(F, my_vals);
mons := [1,x,y];
printf "Is positive definite? %o\n", IsPositiveDefinite(M);
L := LatticeWithGram(M);

k<t> := RationalFunctionField(QQ);
Rk<Y> := PolynomialRing(k);
F_func := Evaluate(F,[k.1,Y]);
K_func := FunctionField(F_func);
