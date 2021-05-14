s := BelyiDBInitialize();

/*
Base Field Data
*/

base_field_data := [* *];
K1<nu1> := NumberField(Polynomial([RationalField() | 1, -1, 1]));
place1 := InfinitePlaces(K1)[1];
conj1 := true;
CC<I> := ComplexField(20);
z1 := 0.00000000000000000000p20;
base_field_data_1 := [* K1, place1, conj1, z1 *];
Append(~base_field_data, base_field_data_1);
K2<nu2> := NumberField(Polynomial([RationalField() | 1, -1, 1]));
place2 := InfinitePlaces(K2)[1];
conj2 := false;
CC<I> := ComplexField(20);
z2 := 0.00000000000000000000p20;
base_field_data_2 := [* K2, place2, conj2, z2 *];
Append(~base_field_data, base_field_data_2);
s`BelyiDBBaseFieldData := base_field_data;

/*
Belyi Maps
*/

curves := [* *];
maps := [* *];
maps_improvedg0 := [* *];
maps_improved_factorizedg0 := [* *];
K1<nu1> := K1;
X1 := Curve(ProjectiveSpace(PolynomialRing(K1, 2)));
KX1<x> := FunctionField(X1);
phi1 := KX1!((-1/686*x^7 + 1/2*x^6 + 1/98*(108*nu1 - 5139)*x^5 + 1/14*(-4572*nu1 + 15867)*x^4 + 1/98*(2794392*nu1 + 4834107)*x^3 + 1/98*(-41394888*nu1 + 76952835)*x^2 + 1/98*(-2242769796*nu1 + 2019357135)*x + 1/686*(-91042624620*nu1 + 114639245001))/(x^6 + 1/7*(-4572*nu1 + 15867)*x^4 + 1/49*(-41394888*nu1 + 76952835)*x^2 + 1/343*(-91042624620*nu1 + 114639245001)));
phi_improvedg01 := KX1!((1/2*x^7 + 1/3*(14*nu1 + 14)*x^5 + 1/9*(-28*nu1 - 28)*x^4 + 1/9*(448*nu1 - 112)*x^3 + 1/27*(-784*nu1 - 112)*x^2 + 1/243*(19936*nu1 - 19040)*x + 1/81*(-5760*nu1 + 1088))/(x^7 + (7*nu1 - 7)*x^6 + 1/3*(-98*nu1 + 28)*x^5 + 1/3*(140*nu1 + 140)*x^4 + 1/9*(280*nu1 - 1512)*x^3 + 1/3*(-560*nu1 + 672)*x^2 + 1/243*(49952*nu1 - 28000)*x + 1/243*(-18496*nu1 - 1216)));
phi_improved_factorizedg01 := [*
[
<x + 4*nu1 - 2, 1>,
<(6*nu1 - 3)*x^2 + 6*x + 12*nu1 - 20, 3>
],
[
<x + nu1 - 1, 1>,
<(6*nu1 - 3)*x^2 + (-6*nu1 - 6)*x + 4*nu1 + 20, 3>
],
1/2
*];
Append(~curves, X1);
Append(~maps, phi1);
Append(~maps_improvedg0, phi_improvedg01);
Append(~maps_improved_factorizedg0, phi_improved_factorizedg01);
K2<nu2> := K2;
X2 := Curve(ProjectiveSpace(PolynomialRing(K2, 2)));
KX2<x> := FunctionField(X2);
phi2 := KX2!((-1/686*x^7 + 1/2*x^6 + 1/98*(108*nu2 - 5139)*x^5 + 1/14*(-4572*nu2 + 15867)*x^4 + 1/98*(2794392*nu2 + 4834107)*x^3 + 1/98*(-41394888*nu2 + 76952835)*x^2 + 1/98*(-2242769796*nu2 + 2019357135)*x + 1/686*(-91042624620*nu2 + 114639245001))/(x^6 + 1/7*(-4572*nu2 + 15867)*x^4 + 1/49*(-41394888*nu2 + 76952835)*x^2 + 1/343*(-91042624620*nu2 + 114639245001)));
phi_improvedg02 := KX2!((1/2*x^7 + 1/3*(-14*nu2 + 28)*x^5 + 1/9*(28*nu2 - 56)*x^4 + 1/9*(-448*nu2 + 336)*x^3 + 1/27*(784*nu2 - 896)*x^2 + 1/243*(-19936*nu2 + 896)*x + 1/81*(5760*nu2 - 4672))/(x^7 - 7*nu2*x^6 + 1/3*(98*nu2 - 70)*x^5 + 1/3*(-140*nu2 + 280)*x^4 + 1/9*(-280*nu2 - 1232)*x^3 + 1/3*(560*nu2 + 112)*x^2 + 1/243*(-49952*nu2 + 21952)*x + 1/243*(18496*nu2 - 19712)));
phi_improved_factorizedg02 := [*
[
<x - 4*nu2 + 2, 1>,
<(-6*nu2 + 3)*x^2 + 6*x - 12*nu2 - 8, 3>
],
[
<x - nu2, 1>,
<(-6*nu2 + 3)*x^2 + (6*nu2 - 12)*x - 4*nu2 + 24, 3>
],
1/2
*];
Append(~curves, X2);
Append(~maps, phi2);
Append(~maps_improvedg0, phi_improvedg02);
Append(~maps_improved_factorizedg0, phi_improved_factorizedg02);
s`BelyiDBBelyiCurves := curves;
s`BelyiDBBelyiMaps := maps;
s`BelyiDBBelyiMapsImprovedg0 := maps_improvedg0;
s`BelyiDBBelyiMapsImprovedFactorizedg0 := maps_improved_factorizedg0;

/*
auto printing
*/

s`BelyiDBName := "7T3-[3,3,3]-331-331-331-g0";
s`BelyiDBFilename := "7T3-[3,3,3]-331-331-331-g0.m";
s`BelyiDBDegree := 7;
s`BelyiDBOrders := \[ 3, 3, 3 ];
s`BelyiDBType := "Euclidean";
s`BelyiDBGenus := 0;
s`BelyiDBSize := 2;
s`BelyiDBPointedSize := 2;
s`BelyiDBPermutationTriple := [ PermutationGroup<7 |  
\[ 2, 3, 4, 5, 6, 7, 1 ],
\[ 2, 4, 6, 1, 3, 5, 7 ]:
 Order := 21 > |
[ 1, 5, 2, 6, 3, 7, 4 ],
[ 3, 7, 4, 1, 5, 2, 6 ],
[ 4, 1, 5, 2, 6, 3, 7 ]
];
s`BelyiDBAutomorphismGroup := PermutationGroup<7 |   >;
s`BelyiDBPointedAutomorphismGroup := PermutationGroup<7 |   >;
s`BelyiDBMonodromyGroup := PermutationGroup<7 |  
\[ 1, 5, 2, 6, 3, 7, 4 ],
\[ 3, 7, 4, 1, 5, 2, 6 ],
\[ 4, 1, 5, 2, 6, 3, 7 ]:
 Order := 21 >;
s`BelyiDBPassport := [ PowerSequence(PermutationGroup<7 |  
\[ 1, 5, 2, 6, 3, 7, 4 ],
\[ 3, 7, 4, 1, 5, 2, 6 ],
\[ 4, 1, 5, 2, 6, 3, 7 ]:
 Order := 21 >) |
[ PermutationGroup<7 |  
\[ 1, 5, 2, 6, 3, 7, 4 ],
\[ 3, 7, 4, 1, 5, 2, 6 ],
\[ 4, 1, 5, 2, 6, 3, 7 ]:
 Order := 21 > |
[ 3, 7, 4, 1, 5, 2, 6 ],
[ 7, 4, 1, 5, 2, 6, 3 ],
[ 2, 6, 3, 7, 4, 1, 5 ]
],
[ PermutationGroup<7 |  
\[ 1, 5, 2, 6, 3, 7, 4 ],
\[ 3, 7, 4, 1, 5, 2, 6 ],
\[ 4, 1, 5, 2, 6, 3, 7 ]:
 Order := 21 > |
[ 4, 6, 1, 3, 5, 7, 2 ],
[ 3, 5, 7, 2, 4, 6, 1 ],
[ 1, 3, 5, 7, 2, 4, 6 ]
]
];
s`BelyiDBPointedPassport := [ PowerSequence(PermutationGroup<7 |  
\[ 2, 3, 4, 5, 6, 7, 1 ],
\[ 2, 4, 6, 1, 3, 5, 7 ]:
 Order := 21 >) |
[ PermutationGroup<7 |  
\[ 2, 3, 4, 5, 6, 7, 1 ],
\[ 2, 4, 6, 1, 3, 5, 7 ]:
 Order := 21 > |
[ 1, 5, 2, 6, 3, 7, 4 ],
[ 3, 7, 4, 1, 5, 2, 6 ],
[ 4, 1, 5, 2, 6, 3, 7 ]
],
[ PermutationGroup<7 |  
\[ 2, 3, 4, 5, 6, 7, 1 ],
\[ 2, 4, 6, 1, 3, 5, 7 ]:
 Order := 21 > |
[ 1, 3, 5, 7, 2, 4, 6 ],
[ 4, 6, 1, 3, 5, 7, 2 ],
[ 3, 5, 7, 2, 4, 6, 1 ]
]
];
s`BelyiDBGaloisOrbits := [ PowerSequence(PowerSequence(PermutationGroup<7 |  
\[ 2, 3, 4, 5, 6, 7, 1 ],
\[ 2, 4, 6, 1, 3, 5, 7 ]:
 Order := 21 >)) |
[ PowerSequence(PermutationGroup<7 |  
\[ 2, 3, 4, 5, 6, 7, 1 ],
\[ 2, 4, 6, 1, 3, 5, 7 ]:
 Order := 21 >) |
[ PermutationGroup<7 |  
\[ 2, 3, 4, 5, 6, 7, 1 ],
\[ 2, 4, 6, 1, 3, 5, 7 ]:
 Order := 21 > |
[ 1, 5, 2, 6, 3, 7, 4 ],
[ 3, 7, 4, 1, 5, 2, 6 ],
[ 4, 1, 5, 2, 6, 3, 7 ]
],
[ PermutationGroup<7 |  
\[ 2, 3, 4, 5, 6, 7, 1 ],
\[ 2, 4, 6, 1, 3, 5, 7 ]:
 Order := 21 > |
[ 1, 3, 5, 7, 2, 4, 6 ],
[ 4, 6, 1, 3, 5, 7, 2 ],
[ 3, 5, 7, 2, 4, 6, 1 ]
]
]
];
s`BelyiDBLFTInfo := [ PowerSequence(IntegerRing()) |
\[ 1, 0 ],
\[ 0, 1 ]
];

/*
Numerical Data
*/


/*
Powser Bases
*/


/*
Return for eval
*/

return s;
