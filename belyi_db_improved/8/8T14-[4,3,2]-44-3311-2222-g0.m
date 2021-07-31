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
phi1 := KX1!(27/16*x^4/(x^8 + 4*x^7 + 4*x^6 + 1/2*x^5 + 31/32*x^4 - 1/16*x^3 + 1/16*x^2 - 1/128*x + 1/4096));
phi_improvedg01 := KX1!((3/16*x^8 - x^6 + 10/9*x^5 + 17/18*x^4 - 80/27*x^3 + 652/243*x^2 - 280/243*x + 49/243)/(x^4 - 8/3*x^3 + 8/3*x^2 - 32/27*x + 16/81));
phi_improved_factorizedg01 := [*
[
<3*x^2 - 4*x + 2, 2>,
<9*x^2 + 12*x - 14, 2>
],
[
<3*x - 2, 4>
],
1/48
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

s`BelyiDBName := "8T14-[4,3,2]-44-3311-2222-g0";
s`BelyiDBFilename := "8T14-[4,3,2]-44-3311-2222-g0.m";
s`BelyiDBDegree := 8;
s`BelyiDBOrders := \[ 4, 3, 2 ];
s`BelyiDBType := "Spherical";
s`BelyiDBGenus := 0;
s`BelyiDBSize := 1;
s`BelyiDBPointedSize := 1;
s`BelyiDBPermutationTriple := [ PermutationGroup<8 |  
\[ 3, 8, 1, 6, 7, 4, 5, 2 ],
\[ 2, 3, 1, 4, 6, 7, 5, 8 ],
\[ 4, 6, 7, 1, 8, 2, 3, 5 ]:
 Order := 24 > |
[ 4, 5, 6, 3, 8, 1, 2, 7 ],
[ 1, 3, 8, 6, 5, 7, 4, 2 ],
[ 4, 6, 7, 1, 8, 2, 3, 5 ]
];
s`BelyiDBAutomorphismGroup := PermutationGroup<8 |  
\[ 5, 6, 7, 8, 1, 2, 3, 4 ]:
 Order := 2 >;
s`BelyiDBPointedAutomorphismGroup := PermutationGroup<8 |   >;
s`BelyiDBMonodromyGroup := PermutationGroup<8 |  
\[ 4, 5, 6, 3, 8, 1, 2, 7 ],
\[ 1, 3, 8, 6, 5, 7, 4, 2 ],
\[ 4, 6, 7, 1, 8, 2, 3, 5 ]:
 Order := 24 >;
s`BelyiDBPassport := [ PowerSequence(PermutationGroup<8 |  
\[ 4, 5, 6, 3, 8, 1, 2, 7 ],
\[ 1, 3, 8, 6, 5, 7, 4, 2 ],
\[ 4, 6, 7, 1, 8, 2, 3, 5 ]:
 Order := 24 >) |
[ PermutationGroup<8 |  
\[ 4, 5, 6, 3, 8, 1, 2, 7 ],
\[ 1, 3, 8, 6, 5, 7, 4, 2 ],
\[ 4, 6, 7, 1, 8, 2, 3, 5 ]:
 Order := 24 > |
[ 4, 5, 6, 3, 8, 1, 2, 7 ],
[ 2, 3, 1, 4, 6, 7, 5, 8 ],
[ 5, 6, 4, 3, 1, 2, 8, 7 ]
]
];
s`BelyiDBPointedPassport := [ PowerSequence(PermutationGroup<8 |  
\[ 3, 8, 1, 6, 7, 4, 5, 2 ],
\[ 2, 3, 1, 4, 6, 7, 5, 8 ],
\[ 4, 6, 7, 1, 8, 2, 3, 5 ]:
 Order := 24 >) |
[ PermutationGroup<8 |  
\[ 3, 8, 1, 6, 7, 4, 5, 2 ],
\[ 2, 3, 1, 4, 6, 7, 5, 8 ],
\[ 4, 6, 7, 1, 8, 2, 3, 5 ]:
 Order := 24 > |
[ 4, 5, 6, 3, 8, 1, 2, 7 ],
[ 1, 3, 8, 6, 5, 7, 4, 2 ],
[ 4, 6, 7, 1, 8, 2, 3, 5 ]
]
];
s`BelyiDBGaloisOrbits := [ PowerSequence(PowerSequence(PermutationGroup<8 |  
\[ 3, 8, 1, 6, 7, 4, 5, 2 ],
\[ 2, 3, 1, 4, 6, 7, 5, 8 ],
\[ 4, 6, 7, 1, 8, 2, 3, 5 ]:
 Order := 24 >)) |
[ PowerSequence(PermutationGroup<8 |  
\[ 3, 8, 1, 6, 7, 4, 5, 2 ],
\[ 2, 3, 1, 4, 6, 7, 5, 8 ],
\[ 4, 6, 7, 1, 8, 2, 3, 5 ]:
 Order := 24 >) |
[ PermutationGroup<8 |  
\[ 3, 8, 1, 6, 7, 4, 5, 2 ],
\[ 2, 3, 1, 4, 6, 7, 5, 8 ],
\[ 4, 6, 7, 1, 8, 2, 3, 5 ]:
 Order := 24 > |
[ 4, 5, 6, 3, 8, 1, 2, 7 ],
[ 1, 3, 8, 6, 5, 7, 4, 2 ],
[ 4, 6, 7, 1, 8, 2, 3, 5 ]
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
