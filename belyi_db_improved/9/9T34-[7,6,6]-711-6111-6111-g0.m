s := BelyiDBInitialize();

/*
Base Field Data
*/

base_field_data := [* *];
K1<nu1> := RationalsAsNumberField();
place1 := InfinitePlaces(K1)[1];
conj1 := false;
CC<I> := ComplexField(30);
z1 := 1.00000000000000000000000000000p30;
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
phi1 := KX1!((5/42*x^9 - 9/14*x^8 + 9/7*x^7 - x^6 + x^3 - 9/7*x^2 + 9/14*x - 5/42)/(x^3 - 9/7*x^2 + 9/14*x - 5/42));
phi_improvedg01 := KX1!((x^9 - 54*x^7 + 84*x^6 + 1512*x^5 - 9072*x^4 - 107730*x^3 - 370332*x^2 - 566433*x - 332424)/(x^9 - 54*x^7 + 84*x^6 + 1512*x^5 - 9072*x^4 + 23520*x^3 - 32832*x^2 + 24192*x - 7424));
phi_improved_factorizedg01 := [*
[
<x + 3, 6>,
<x^3 - 18*x^2 + 135*x - 456, 1>
],
[
<x - 2, 7>,
<x^2 + 14*x + 58, 1>
],
1
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

s`BelyiDBName := "9T34-[7,6,6]-711-6111-6111-g0";
s`BelyiDBFilename := "9T34-[7,6,6]-711-6111-6111-g0.m";
s`BelyiDBDegree := 9;
s`BelyiDBOrders := \[ 7, 6, 6 ];
s`BelyiDBType := "Hyperbolic";
s`BelyiDBGenus := 0;
s`BelyiDBSize := 1;
s`BelyiDBPointedSize := 1;
s`BelyiDBPermutationTriple := [ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 8, 1, 2, 3, 5, 4, 6, 7, 9 ],
[ 2, 3, 4, 5, 9, 6, 7, 8, 1 ],
[ 1, 2, 3, 6, 4, 7, 8, 9, 5 ]
];
s`BelyiDBAutomorphismGroup := PermutationGroup<9 |   >;
s`BelyiDBPointedAutomorphismGroup := PermutationGroup<9 |   >;
s`BelyiDBMonodromyGroup := PermutationGroup<9 |  
\[ 8, 1, 2, 3, 5, 4, 6, 7, 9 ],
\[ 2, 3, 4, 5, 9, 6, 7, 8, 1 ],
\[ 1, 2, 3, 6, 4, 7, 8, 9, 5 ]:
 Order := 362880 >;
s`BelyiDBPassport := [ PowerSequence(PermutationGroup<9 |  
\[ 8, 1, 2, 3, 5, 4, 6, 7, 9 ],
\[ 2, 3, 4, 5, 9, 6, 7, 8, 1 ],
\[ 1, 2, 3, 6, 4, 7, 8, 9, 5 ]:
 Order := 362880 >) |
[ PermutationGroup<9 |  
\[ 8, 1, 2, 3, 5, 4, 6, 7, 9 ],
\[ 2, 3, 4, 5, 9, 6, 7, 8, 1 ],
\[ 1, 2, 3, 6, 4, 7, 8, 9, 5 ]:
 Order := 362880 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 1, 2, 3, 9, 4, 5, 6, 7, 8 ],
[ 8, 1, 2, 3, 5, 6, 7, 9, 4 ]
]
];
s`BelyiDBPointedPassport := [ PowerSequence(PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 >) |
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 8, 1, 2, 3, 5, 4, 6, 7, 9 ],
[ 2, 3, 4, 5, 9, 6, 7, 8, 1 ],
[ 1, 2, 3, 6, 4, 7, 8, 9, 5 ]
]
];
s`BelyiDBGaloisOrbits := [ PowerSequence(PowerSequence(PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 >)) |
[ PowerSequence(PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 >) |
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 8, 1, 2, 3, 5, 4, 6, 7, 9 ],
[ 2, 3, 4, 5, 9, 6, 7, 8, 1 ],
[ 1, 2, 3, 6, 4, 7, 8, 9, 5 ]
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
