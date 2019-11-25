load "config.m";
s := BelyiDBGet(4,1)[2];
phi := BelyiMaps(s)[1];
C0 := PlaneEquation(phi);
F0 := DefiningEquation(C0);
// testing out specialization
vals := GetSpecializationValues();
/*
QQ := Rationals();
vals := [7,23,5,14,-6,9,31];
vals := [QQ!el : el in vals];
*/
val := vals[1];
/*
f := SpecializePolynomial(F0,val);
K<nu> := NumberField(f);
f := DefiningPolynomial(K);
t2 := T2Norm(f);
*/

// improving minpoly
QQ := Rationals();
KC0<x0,y0> := FunctionField(C0);
// make polynomial over rational function field
k<t> := RationalFunctionField(QQ);
Rk<Y> := PolynomialRing(k);
F_func := Evaluate(F0,[k.1,Y]);
K_func := FunctionField(F_func);
min_y := MinimalPolynomial(K_func.1);
printf "minimal polynomial of y is %o\n", min_y;
// rescale minpoly to have ZZ coeffs
cs := Coefficients(min_y);
//cs_new := [Evaluate(el,1/k.1) : el in cs];
//min_y_new := &+[cs_new[i]*Y^(i-1) : i in [1..#cs_new]];
F_func_new := 2^20*t^4*min_y;
//F_func_new := 2^20/3^12*min_y_new;
//R<Y> := Parent(F_new);
F_func_new := Evaluate(F_func_new,Y/(2^5*t));
F_func_new := Evaluate(F_func_new/3^4, 3*Y);
//F_func_new := Evaluate(F_func_new,3^3*Y/(2^5));
printf "rescaled minpoly is %o\n", F_func_new;

// make new poly and curve
R<X,Y> := Parent(F0);
F := OneVarTwoVarPoly(F_func_new, R);
C := Curve(AffineSpace(R), F);
KC<x,y> := FunctionField(C);
/*
S0<X> := PolynomialRing(QQ);
S<Y> := PolynomialRing(S0);
h := hom< R -> S | [S0.1, S.1] >;
*/

my_vals := vals[1..10];
time M := PolredGramMatrix(F, my_vals);
printf "Is positive definite? %o\n", IsPositiveDefinite(M);
L := LatticeWithGram(M);
L_red, basis := LLL(L);

val := vals[1];
F_spec := SpecializePolynomial(F,val);
K<nu> := NumberField(F_spec);
OK := Integers(K);
basis_OK := Basis(OK);
basis_K := [K!el : el in basis_OK];
h := hom< KC -> K | [val,nu]>;

/*
shortest := ShortestVectors(L);
norm := Norm(shortest[1]);
// try to find short vectors beyond trivial answer
for i := 1 to 1000 do
  shorties := ShortVectors(L,Floor(i^2*norm), Ceiling((i+1)^2*norm));
  if #shorties gt 2 then
    print "Success!";
    print i;
    print shorties;
    break i;
  end if;
end for;
*/

// can intersect lattices using L meet M
