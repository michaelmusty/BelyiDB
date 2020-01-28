load "config.m";
s := BelyiDBGet(4,1)[2];
phi := BelyiMaps(s)[1];
C0 := PlaneEquation(phi);
F0 := DefiningEquation(C0);
// testing out specialization
vals := GetSpecializationValues();
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
F_func_new := 2^20*t^4*min_y;
F_func_new := Evaluate(F_func_new,Y/(2^5*t));
F_func_new := Evaluate(F_func_new/3^4, 3*Y);
printf "rescaled minpoly is %o\n", F_func_new;
// make new poly and curve
R<X,Y> := Parent(F0);
F := OneVarTwoVarPoly(F_func_new, R);
C := Curve(AffineSpace(R), F);
KC<x,y> := FunctionField(C);
F := ChangeRing(F,Rationals());
polys := [];
for t in vals do
  F_spec := SpecializePolynomial(F,t);
  if IsIrreducible(F_spec) then
    Append(~polys, F_spec);
  end if;
end for;
F_disc := Discriminant(F,Parent(F).2);
Factorization(F_disc);
fields := [];
orders := [];
discs := [];
for f in polys do
  K := NumberField(f);
  Append(~fields, K);
  OK := Integers(K);
  Append(~orders, OK);
  Append(~discs, Discriminant(OK));
end for;
fields[1..10];
discs[1..10];
for disc in discs do
  Factorization(disc);
end for;
fields_abs := [];
for K in fields do
  Append(~fields_abs, Polredbestabs(K));
end for;

// example with specialization t=-1/2

SpecializePolynomial(F,-1/2);
L := NumberField($1);
OL := Integers(L);
Discriminant(OL);
Factorization($1);
Evaluate(F_disc,[-1/2,0]);
Factorization($1);
