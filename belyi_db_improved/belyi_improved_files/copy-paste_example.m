SetDebugOnError(true);
SetProfile(true);
load "../belyi_lmfdb/belyiredbest-2.m";


K1<nu> := RationalsAsNumberField();
X1 := Curve(ProjectiveSpace(PolynomialRing(K1, 2)));
KX1<x> := FunctionField(X1);
phi1 := KX1!(2*x^5/(x^5 - 45/8*x^4 + 135/4*x^2 - 729/8));


nnn,lft:=phirat0(phi1,X1,K1);
phisep_reduced:=BelyiReduction(phi1,X1,K1);
Kpolx<x>:=PolynomialRing(K1);

phi_reduced:=[* [ < Kpolx!P[1], P[2] > : P in phisep_reduced[1] ],
[ < Kpolx!P[1], P[2]> : P in phisep_reduced[2] ], phisep_reduced[3] *];
//phi_reduced;   //the factorized reduced map.

phi_from_factorization:=(KX1!phi_reduced[3])*(KX1!&*[ fac[1]^fac[2] : fac in phi_reduced[1] ])/
(KX1!&*[ fac[1]^fac[2] : fac in phi_reduced[2] ]);
phi_from_factorization;  //this is the reduced map.
lft; //this is the linear fractional transformation used in getting to the reduced map.
