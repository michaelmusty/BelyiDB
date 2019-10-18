load "config.m";
s := BelyiDBGet(4,1)[2];
phi := BelyiMaps(s)[1];
C := PlaneEquation(phi);
F := DefiningEquation(C);
vals := GetSpecializationValues();
val := vals[2];
f := SpecializePolynomial(F,val);
