s := BelyiDBInitialize();

/*
Base Field Data
*/

base_field_data := [* *];
K1<nu1> := NumberField(Polynomial([RationalField() | 1, 0, 1]));
place1 := InfinitePlaces(K1)[1];
conj1 := true;
CC<I> := ComplexField(20);
z1 := 0.00000000000000000000p20;
base_field_data_1 := [* K1, place1, conj1, z1 *];
Append(~base_field_data, base_field_data_1);
K2<nu2> := NumberField(Polynomial([RationalField() | 1, 0, 1]));
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
phi1 := KX1!((1/4107*(136*nu1 + 4623)*x^5 + 1/37*(136*nu1 + 4623)*x^4)/(x^5 + (-40*nu1 + 55)*x^4 + (-13236*nu1 - 12048)*x^3 + (-1006992*nu1 - 709956)*x^2 + (67346586*nu1 - 36186777)*x + (7475471046*nu1 - 4016732247)));
phi_improvedg01 := KX1!((1/625*(2*nu1 + 11)*x^5 + 1/125*(4*nu1 + 22)*x^3 + 1/125*(44*nu1 - 8)*x^2 + 1/125*(-6*nu1 + 92)*x + 1/625*(956*nu1 - 492))/(x + 1/5*(8*nu1 - 4)));
phi_improved_factorizedg01 := [*
[
<x + 2*nu1 + 2, 1>,
<x^2 + (-nu1 - 1)*x + 3*nu1 + 5, 2>
],
[
<(-2*nu1 - 1)*x + 4, 1>
],
1/625*(-24*nu1 - 7)
*];
Append(~curves, X1);
Append(~maps, phi1);
Append(~maps_improvedg0, phi_improvedg01);
Append(~maps_improved_factorizedg0, phi_improved_factorizedg01);
K2<nu2> := K2;
X2 := Curve(ProjectiveSpace(PolynomialRing(K2, 2)));
KX2<x> := FunctionField(X2);
phi2 := KX2!((1/4107*(136*nu2 + 4623)*x^5 + 1/37*(136*nu2 + 4623)*x^4)/(x^5 + (-40*nu2 + 55)*x^4 + (-13236*nu2 - 12048)*x^3 + (-1006992*nu2 - 709956)*x^2 + (67346586*nu2 - 36186777)*x + (7475471046*nu2 - 4016732247)));
phi_improvedg02 := KX2!((1/625*(-2*nu2 + 11)*x^5 + 1/125*(-4*nu2 + 22)*x^3 + 1/125*(-44*nu2 - 8)*x^2 + 1/125*(6*nu2 + 92)*x + 1/625*(-956*nu2 - 492))/(x + 1/5*(-8*nu2 - 4)));
phi_improved_factorizedg02 := [*
[
<x - 2*nu2 + 2, 1>,
<x^2 + (nu2 - 1)*x - 3*nu2 + 5, 2>
],
[
<(2*nu2 - 1)*x + 4, 1>
],
1/625*(24*nu2 - 7)
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

s`BelyiDBName := "5T3-[4,4,2]-41-41-221-g0";
s`BelyiDBFilename := "5T3-[4,4,2]-41-41-221-g0.m";
s`BelyiDBDegree := 5;
s`BelyiDBOrders := \[ 4, 4, 2 ];
s`BelyiDBType := "Euclidean";
s`BelyiDBGenus := 0;
s`BelyiDBSize := 2;
s`BelyiDBPointedSize := 2;
s`BelyiDBPermutationTriple := [ PermutationGroup<5 |  
\[ 2, 3, 4, 5, 1 ],
\[ 2, 4, 1, 3, 5 ]:
 Order := 20 > |
[ 4, 1, 3, 5, 2 ],
[ 1, 3, 5, 2, 4 ],
[ 4, 3, 2, 1, 5 ]
];
s`BelyiDBAutomorphismGroup := PermutationGroup<5 |   >;
s`BelyiDBPointedAutomorphismGroup := PermutationGroup<5 |   >;
s`BelyiDBMonodromyGroup := PermutationGroup<5 |  
\[ 4, 1, 3, 5, 2 ],
\[ 1, 3, 5, 2, 4 ],
\[ 4, 3, 2, 1, 5 ]:
 Order := 20 >;
s`BelyiDBPassport := [ PowerSequence(PermutationGroup<5 |  
\[ 4, 1, 3, 5, 2 ],
\[ 1, 3, 5, 2, 4 ],
\[ 4, 3, 2, 1, 5 ]:
 Order := 20 >) |
[ PermutationGroup<5 |  
\[ 4, 1, 3, 5, 2 ],
\[ 1, 3, 5, 2, 4 ],
\[ 4, 3, 2, 1, 5 ]:
 Order := 20 > |
[ 4, 1, 3, 5, 2 ],
[ 5, 2, 4, 1, 3 ],
[ 2, 1, 5, 4, 3 ]
],
[ PermutationGroup<5 |  
\[ 4, 1, 3, 5, 2 ],
\[ 1, 3, 5, 2, 4 ],
\[ 4, 3, 2, 1, 5 ]:
 Order := 20 > |
[ 2, 5, 3, 1, 4 ],
[ 4, 2, 5, 3, 1 ],
[ 1, 5, 4, 3, 2 ]
]
];
s`BelyiDBPointedPassport := [ PowerSequence(PermutationGroup<5 |  
\[ 2, 3, 4, 5, 1 ],
\[ 2, 4, 1, 3, 5 ]:
 Order := 20 >) |
[ PermutationGroup<5 |  
\[ 2, 3, 4, 5, 1 ],
\[ 2, 4, 1, 3, 5 ]:
 Order := 20 > |
[ 4, 1, 3, 5, 2 ],
[ 1, 3, 5, 2, 4 ],
[ 4, 3, 2, 1, 5 ]
],
[ PermutationGroup<5 |  
\[ 2, 3, 4, 5, 1 ],
\[ 2, 4, 1, 3, 5 ]:
 Order := 20 > |
[ 2, 5, 3, 1, 4 ],
[ 5, 3, 1, 4, 2 ],
[ 4, 3, 2, 1, 5 ]
]
];
s`BelyiDBGaloisOrbits := [ PowerSequence(PowerSequence(PermutationGroup<5 |  
\[ 2, 3, 4, 5, 1 ],
\[ 2, 4, 1, 3, 5 ]:
 Order := 20 >)) |
[ PowerSequence(PermutationGroup<5 |  
\[ 2, 3, 4, 5, 1 ],
\[ 2, 4, 1, 3, 5 ]:
 Order := 20 >) |
[ PermutationGroup<5 |  
\[ 2, 3, 4, 5, 1 ],
\[ 2, 4, 1, 3, 5 ]:
 Order := 20 > |
[ 4, 1, 3, 5, 2 ],
[ 1, 3, 5, 2, 4 ],
[ 4, 3, 2, 1, 5 ]
],
[ PermutationGroup<5 |  
\[ 2, 3, 4, 5, 1 ],
\[ 2, 4, 1, 3, 5 ]:
 Order := 20 > |
[ 2, 5, 3, 1, 4 ],
[ 5, 3, 1, 4, 2 ],
[ 4, 3, 2, 1, 5 ]
]
]
];
s`BelyiDBSanityCheckTiming := 0.0200000000000000p15;
s`BelyiDBLocalSanityCheckTiming := 0.0100000000000000p15;
s`BelyiDBLocalSanityCheckPrime := 101;
s`BelyiDBLFTInfo := [ PowerSequence(IntegerRing()) |
\[ 0, 1 ],
\[ 1, 0 ]
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
