load "config.m";
QQ := Rationals();
R<x,y> := PolynomialRing(QQ,2);
F := y - (x^2 + 1138193*x + 4892382);
// make function field
k<t> := RationalFunctionField(QQ);
Rk<Y> := PolynomialRing(k);
F_func := Evaluate(F,[k.1,Y]);
K_func := FunctionField(F_func);
// find new generator using average polredabs
vals := GetSpecializationValues();
//my_vals := vals[1..10];
my_vals := vals;
//my_vals := [QQ!el : el in [1..20]];
mons := [1,x,y];
time M := PolredGramMatrix(F, my_vals : mons := mons);
printf "Is positive definite? %o\n", IsPositiveDefinite(M);
L := LatticeWithGram(M);
L_red := LLL(L);
basis := Basis(L_red);
cs := Eltseq(basis[3]);
cs := ChangeUniverse(cs, ZZ);
y_new := &+[cs[i]*mons[i] : i in [1..#mons]];
// now compute minpoly of new y
y_func := Evaluate(y_new, [k.1,K_func.1]);
MinimalPolynomial(y_func);
