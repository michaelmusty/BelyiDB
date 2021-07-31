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
phi1 := KX1!((9/7*x - 1)/(x^9 - 9/7*x^8 + 9/7*x - 1));
phi_improvedg01 := KX1!((1/7411887*x^9 - 4/823543*x^7 - 8/352947*x^6 - 6/117649*x^5 - 8/117649*x^4 - 20/352947*x^3 - 24/823543*x^2 + 117648/117649*x - 3660192/823543)/(x - 40/9));
phi_improved_factorizedg01 := [*
[
<x - 6, 3>,
<x^6 + 18*x^5 + 180*x^4 + 1344*x^3 + 8262*x^2 + 41940*x + 152508, 1>
],
[
<9*x - 40, 1>
],
1/823543
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

s`BelyiDBName := "9T34-[8,8,3]-81-81-3111111-g0";
s`BelyiDBFilename := "9T34-[8,8,3]-81-81-3111111-g0.m";
s`BelyiDBDegree := 9;
s`BelyiDBOrders := \[ 8, 8, 3 ];
s`BelyiDBType := "Hyperbolic";
s`BelyiDBGenus := 0;
s`BelyiDBSize := 1;
s`BelyiDBPointedSize := 1;
s`BelyiDBPermutationTriple := [ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 2, 3, 4, 5, 6, 7, 8, 1, 9 ],
[ 8, 2, 9, 3, 4, 5, 6, 7, 1 ],
[ 1, 9, 2, 4, 5, 6, 7, 8, 3 ]
];
s`BelyiDBAutomorphismGroup := PermutationGroup<9 |   >;
s`BelyiDBPointedAutomorphismGroup := PermutationGroup<9 |   >;
s`BelyiDBMonodromyGroup := PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1, 9 ],
\[ 8, 2, 9, 3, 4, 5, 6, 7, 1 ],
\[ 1, 9, 2, 4, 5, 6, 7, 8, 3 ]:
 Order := 362880 >;
s`BelyiDBPassport := [ PowerSequence(PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1, 9 ],
\[ 8, 2, 9, 3, 4, 5, 6, 7, 1 ],
\[ 1, 9, 2, 4, 5, 6, 7, 8, 3 ]:
 Order := 362880 >) |
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1, 9 ],
\[ 8, 2, 9, 3, 4, 5, 6, 7, 1 ],
\[ 1, 9, 2, 4, 5, 6, 7, 8, 3 ]:
 Order := 362880 > |
[ 2, 3, 4, 5, 6, 7, 8, 1, 9 ],
[ 8, 2, 9, 3, 4, 5, 6, 7, 1 ],
[ 1, 9, 2, 4, 5, 6, 7, 8, 3 ]
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
[ 2, 3, 4, 5, 6, 7, 8, 1, 9 ],
[ 8, 2, 9, 3, 4, 5, 6, 7, 1 ],
[ 1, 9, 2, 4, 5, 6, 7, 8, 3 ]
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
[ 2, 3, 4, 5, 6, 7, 8, 1, 9 ],
[ 8, 2, 9, 3, 4, 5, 6, 7, 1 ],
[ 1, 9, 2, 4, 5, 6, 7, 8, 3 ]
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
