load "config.m";
s := BelyiDBGet(4,1)[2];
phi := BelyiMaps(s)[1];
C := PlaneEquation(phi);
F := DefiningEquation(C);
// testing out specialization
vals := GetSpecializationValues();
val := vals[1];
f := SpecializePolynomial(F,val);
K<nu> := NumberField(f);
f := DefiningPolynomial(K);
t2 := T2Norm(f);

// improving minpoly
QQ := Rationals();
KC<x,y> := FunctionField(C);
// make polynomial over rational function field
k<t> := RationalFunctionField(QQ);
Rk<Y> := PolynomialRing(k);
F_func := Evaluate(F,[k.1,Y]);
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
//F_func_new := Evaluate(F_func_new,3^3*Y/(2^5));
printf "rescaled minpoly is %o\n", F_func_new;

// make new poly and curve
R<X,Y> := Parent(F);
F_new := OneVarTwoVarPoly(F_func_new, R);
C_new := Curve(AffineSpace(R), F_new);
KC_new<x_new, y_new> := FunctionField(C_new);
// Belyi map is now 1/x_new
/*
S0<X> := PolynomialRing(QQ);
S<Y> := PolynomialRing(S0);
h := hom< R -> S | [S0.1, S.1] >;
*/

my_vals := vals[1..3];
M := PolredGramMatrix(F_new, my_vals);
M_LLL, T, r := LLLGram(M);
