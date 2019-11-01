load "code/database_code/scratch/plane_equation.m";
F := DefiningEquation(C_plane);
vals := GetSpecializationValues();
val := vals[2];
f := SpecializePolynomial(F,val);
K<nu> := NumberField(f);
K;
f2 := DefiningPolynomial(K);
//f_abs, cs := Polredabs(f2);
f_abs, cs := Polredbestabs(f2);
K_abs := NumberField(f_abs);
#cs;
_, iota := IsIsomorphic(K,K_abs);
(iota^-1)(K_abs.1);
Eltseq((iota^-1)(K_abs.1));
/*
OK := Integers(K);
basis_K := Basis(OK);
&+[cs[i+1]*K_abs.1^i : i in [0..3]];
iota(K.1);
Lattice(OK);
lat_K := $1;
ShortVectors(lat_K);
ShortVectors;
LLL(lat_K);
*/
