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
phi1 := KX1!(64*x^6/(x^8 + 36*x^6 + 270*x^4 - 972*x^2 + 729));
phi_improvedg01 := KX1!((-27/64*x^8 - 27/16*x^6 - 45/32*x^4 + 9/16*x^2 - 3/64)/x^2);
phi_improved_factorizedg01 := [*
[
<(-3*nu1 + 3)*x^4 + (-6*nu1 + 6)*x^2 + nu1 - 1, 2>
],
[
<x, 2>
],
1/64*(-3*nu1 + 3)
*];
Append(~curves, X1);
Append(~maps, phi1);
Append(~maps_improvedg0, phi_improvedg01);
Append(~maps_improved_factorizedg0, phi_improved_factorizedg01);
s`BelyiDBBelyiCurves := curves;
s`BelyiDBBelyiMaps := maps;
s`BelyiDBBelyiMapsImprovedg0 := maps_improvedg0;
s`BelyiDBBelyiMapsImprovedFactorizedg0 := maps_improved_factorizedg0;

/*
auto printing
*/

s`BelyiDBName := "8T13-[6,3,2]-62-3311-2222-g0";
s`BelyiDBFilename := "8T13-[6,3,2]-62-3311-2222-g0.m";
s`BelyiDBDegree := 8;
s`BelyiDBOrders := \[ 6, 3, 2 ];
s`BelyiDBType := "Euclidean";
s`BelyiDBGenus := 0;
s`BelyiDBSize := 1;
s`BelyiDBPointedSize := 1;
s`BelyiDBPermutationTriple := [ PermutationGroup<8 |  
\[ 8, 3, 2, 5, 4, 7, 6, 1 ],
\[ 3, 8, 1, 6, 7, 4, 5, 2 ],
\[ 5, 6, 7, 8, 1, 2, 3, 4 ],
\[ 2, 3, 1, 6, 4, 5, 7, 8 ]:
 Order := 24 > |
[ 5, 7, 4, 3, 8, 2, 1, 6 ],
[ 3, 2, 8, 7, 5, 4, 6, 1 ],
[ 4, 7, 6, 1, 8, 3, 2, 5 ]
];
s`BelyiDBAutomorphismGroup := PermutationGroup<8 |  
\[ 6, 5, 4, 3, 2, 1, 8, 7 ]:
 Order := 2 >;
s`BelyiDBPointedAutomorphismGroup := PermutationGroup<8 |  
\[ 6, 5, 4, 3, 2, 1, 8, 7 ]:
 Order := 2 >;
s`BelyiDBMonodromyGroup := PermutationGroup<8 |  
\[ 5, 7, 4, 3, 8, 2, 1, 6 ],
\[ 3, 2, 8, 7, 5, 4, 6, 1 ],
\[ 4, 7, 6, 1, 8, 3, 2, 5 ]:
 Order := 24 >;
s`BelyiDBPassport := [ PowerSequence(PermutationGroup<8 |  
\[ 5, 7, 4, 3, 8, 2, 1, 6 ],
\[ 3, 2, 8, 7, 5, 4, 6, 1 ],
\[ 4, 7, 6, 1, 8, 3, 2, 5 ]:
 Order := 24 >) |
[ PermutationGroup<8 |  
\[ 5, 7, 4, 3, 8, 2, 1, 6 ],
\[ 3, 2, 8, 7, 5, 4, 6, 1 ],
\[ 4, 7, 6, 1, 8, 3, 2, 5 ]:
 Order := 24 > |
[ 5, 7, 4, 3, 8, 2, 1, 6 ],
[ 3, 2, 8, 7, 5, 4, 6, 1 ],
[ 4, 7, 6, 1, 8, 3, 2, 5 ]
]
];
s`BelyiDBPointedPassport := [ PowerSequence(PermutationGroup<8 |  
\[ 8, 3, 2, 5, 4, 7, 6, 1 ],
\[ 3, 8, 1, 6, 7, 4, 5, 2 ],
\[ 5, 6, 7, 8, 1, 2, 3, 4 ],
\[ 2, 3, 1, 6, 4, 5, 7, 8 ]:
 Order := 24 >) |
[ PermutationGroup<8 |  
\[ 8, 3, 2, 5, 4, 7, 6, 1 ],
\[ 3, 8, 1, 6, 7, 4, 5, 2 ],
\[ 5, 6, 7, 8, 1, 2, 3, 4 ],
\[ 2, 3, 1, 6, 4, 5, 7, 8 ]:
 Order := 24 > |
[ 5, 7, 4, 3, 8, 2, 1, 6 ],
[ 3, 2, 8, 7, 5, 4, 6, 1 ],
[ 4, 7, 6, 1, 8, 3, 2, 5 ]
]
];
s`BelyiDBGaloisOrbits := [ PowerSequence(PowerSequence(PermutationGroup<8 |  
\[ 8, 3, 2, 5, 4, 7, 6, 1 ],
\[ 3, 8, 1, 6, 7, 4, 5, 2 ],
\[ 5, 6, 7, 8, 1, 2, 3, 4 ],
\[ 2, 3, 1, 6, 4, 5, 7, 8 ]:
 Order := 24 >)) |
[ PowerSequence(PermutationGroup<8 |  
\[ 8, 3, 2, 5, 4, 7, 6, 1 ],
\[ 3, 8, 1, 6, 7, 4, 5, 2 ],
\[ 5, 6, 7, 8, 1, 2, 3, 4 ],
\[ 2, 3, 1, 6, 4, 5, 7, 8 ]:
 Order := 24 >) |
[ PermutationGroup<8 |  
\[ 8, 3, 2, 5, 4, 7, 6, 1 ],
\[ 3, 8, 1, 6, 7, 4, 5, 2 ],
\[ 5, 6, 7, 8, 1, 2, 3, 4 ],
\[ 2, 3, 1, 6, 4, 5, 7, 8 ]:
 Order := 24 > |
[ 5, 7, 4, 3, 8, 2, 1, 6 ],
[ 3, 2, 8, 7, 5, 4, 6, 1 ],
[ 4, 7, 6, 1, 8, 3, 2, 5 ]
]
]
];
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
