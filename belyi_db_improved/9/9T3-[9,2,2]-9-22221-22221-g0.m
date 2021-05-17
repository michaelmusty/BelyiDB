s := BelyiDBInitialize();

/*
Base Field Data
*/

base_field_data := [* *];
K1<nu1> := RationalsAsNumberField();
place1 := InfinitePlaces(K1)[1];
conj1 := false;
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
phi1 := KX1!(1/128/(x^9 - 9/4*x^7 + 27/16*x^5 - 15/32*x^3 + 9/256*x + 1/256));
phi_improvedg01 := KX1!(128*x^9 - 288*x^7 + 216*x^5 - 60*x^3 + 9/2*x + 1/2);
phi_improved_factorizedg01 := [*
[
<2*x - 1, 2>,
<x + 1, 1>,
<8*x^3 - 6*x - 1, 2>
],
[
<1, 1>
],
1/2
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

s`BelyiDBName := "9T3-[9,2,2]-9-22221-22221-g0";
s`BelyiDBFilename := "9T3-[9,2,2]-9-22221-22221-g0.m";
s`BelyiDBDegree := 9;
s`BelyiDBOrders := \[ 9, 2, 2 ];
s`BelyiDBType := "Spherical";
s`BelyiDBGenus := 0;
s`BelyiDBSize := 1;
s`BelyiDBPointedSize := 1;
s`BelyiDBPermutationTriple := [ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 8, 7, 6, 5, 4, 3, 2, 1, 9 ]:
 Order := 18 > |
[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
[ 7, 6, 5, 4, 3, 2, 1, 9, 8 ],
[ 8, 7, 6, 5, 4, 3, 2, 1, 9 ]
];
s`BelyiDBAutomorphismGroup := PermutationGroup<9 |   >;
s`BelyiDBPointedAutomorphismGroup := PermutationGroup<9 |   >;
s`BelyiDBMonodromyGroup := PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 7, 6, 5, 4, 3, 2, 1, 9, 8 ],
\[ 8, 7, 6, 5, 4, 3, 2, 1, 9 ]:
 Order := 18 >;
s`BelyiDBPassport := [ PowerSequence(PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 7, 6, 5, 4, 3, 2, 1, 9, 8 ],
\[ 8, 7, 6, 5, 4, 3, 2, 1, 9 ]:
 Order := 18 >) |
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 7, 6, 5, 4, 3, 2, 1, 9, 8 ],
\[ 8, 7, 6, 5, 4, 3, 2, 1, 9 ]:
 Order := 18 > |
[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
[ 7, 6, 5, 4, 3, 2, 1, 9, 8 ],
[ 8, 7, 6, 5, 4, 3, 2, 1, 9 ]
]
];
s`BelyiDBPointedPassport := [ PowerSequence(PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 8, 7, 6, 5, 4, 3, 2, 1, 9 ]:
 Order := 18 >) |
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 8, 7, 6, 5, 4, 3, 2, 1, 9 ]:
 Order := 18 > |
[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
[ 7, 6, 5, 4, 3, 2, 1, 9, 8 ],
[ 8, 7, 6, 5, 4, 3, 2, 1, 9 ]
]
];
s`BelyiDBGaloisOrbits := [ PowerSequence(PowerSequence(PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 8, 7, 6, 5, 4, 3, 2, 1, 9 ]:
 Order := 18 >)) |
[ PowerSequence(PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 8, 7, 6, 5, 4, 3, 2, 1, 9 ]:
 Order := 18 >) |
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 8, 7, 6, 5, 4, 3, 2, 1, 9 ]:
 Order := 18 > |
[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
[ 7, 6, 5, 4, 3, 2, 1, 9, 8 ],
[ 8, 7, 6, 5, 4, 3, 2, 1, 9 ]
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
