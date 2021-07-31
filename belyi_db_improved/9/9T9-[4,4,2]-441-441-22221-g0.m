s := BelyiDBInitialize();

/*
Base Field Data
*/

base_field_data := [* *];
K1<nu1> := NumberField(Polynomial([RationalField() | 1, 0, 1]));
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
phi1 := KX1!((x^9 + 24*x^8 + 204*x^7 + 648*x^6 + 54*x^5 - 1944*x^4 + 1836*x^3 - 648*x^2 + 81*x)/(x^9 - 57*x^8 + 852*x^7 - 1188*x^6 + 1998*x^5 - 1998*x^4 + 1188*x^3 - 852*x^2 + 57*x - 1));
phi_improvedg01 := KX1!((-1/243*x^9 + 592/27*x^7 + 54848/81*x^6 - 199072/9*x^5 - 48229120/27*x^4 - 3788098816/81*x^3 - 5668099072/9*x^2 - 119081279744/27*x - 3106392150016/243)/(x^8 + 128*x^7 + 7120*x^6 + 224768*x^5 + 4404064*x^4 + 54843392*x^3 + 423896320*x^2 + 1859428352*x + 3544535296));
phi_improved_factorizedg01 := [*
[
<x + 16, 1>,
<x^4 - 8*x^3 - 2568*x^2 - 62240*x - 440624, 2>
],
[
<x^2 + 32*x + 244, 4>
],
-1/243
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

s`BelyiDBName := "9T9-[4,4,2]-441-441-22221-g0";
s`BelyiDBFilename := "9T9-[4,4,2]-441-441-22221-g0.m";
s`BelyiDBDegree := 9;
s`BelyiDBOrders := \[ 4, 4, 2 ];
s`BelyiDBType := "Euclidean";
s`BelyiDBGenus := 0;
s`BelyiDBSize := 1;
s`BelyiDBPointedSize := 1;
s`BelyiDBPermutationTriple := [ PermutationGroup<9 |
\[ 2, 9, 4, 5, 3, 7, 8, 6, 1 ],
\[ 4, 5, 6, 7, 8, 9, 1, 2, 3 ],
\[ 8, 4, 5, 1, 6, 7, 3, 2, 9 ]:
 Order := 36 > |
[ 1, 6, 7, 3, 2, 9, 8, 4, 5 ],
[ 9, 8, 6, 5, 1, 2, 7, 3, 4 ],
[ 5, 4, 9, 2, 1, 6, 8, 7, 3 ]
];
s`BelyiDBAutomorphismGroup := PermutationGroup<9 |   >;
s`BelyiDBPointedAutomorphismGroup := PermutationGroup<9 |   >;
s`BelyiDBMonodromyGroup := PermutationGroup<9 |
\[ 1, 6, 7, 3, 2, 9, 8, 4, 5 ],
\[ 9, 8, 6, 5, 1, 2, 7, 3, 4 ],
\[ 5, 4, 9, 2, 1, 6, 8, 7, 3 ]:
 Order := 36 >;
s`BelyiDBPassport := [ PowerSequence(PermutationGroup<9 |
\[ 1, 6, 7, 3, 2, 9, 8, 4, 5 ],
\[ 9, 8, 6, 5, 1, 2, 7, 3, 4 ],
\[ 5, 4, 9, 2, 1, 6, 8, 7, 3 ]:
 Order := 36 >) |
[ PermutationGroup<9 |
\[ 1, 6, 7, 3, 2, 9, 8, 4, 5 ],
\[ 9, 8, 6, 5, 1, 2, 7, 3, 4 ],
\[ 5, 4, 9, 2, 1, 6, 8, 7, 3 ]:
 Order := 36 > |
[ 9, 8, 6, 5, 1, 2, 7, 3, 4 ],
[ 5, 1, 2, 7, 3, 4, 9, 8, 6 ],
[ 1, 9, 8, 7, 6, 5, 4, 3, 2 ]
]
];
s`BelyiDBPointedPassport := [ PowerSequence(PermutationGroup<9 |
\[ 2, 9, 4, 5, 3, 7, 8, 6, 1 ],
\[ 4, 5, 6, 7, 8, 9, 1, 2, 3 ],
\[ 8, 4, 5, 1, 6, 7, 3, 2, 9 ]:
 Order := 36 >) |
[ PermutationGroup<9 |
\[ 2, 9, 4, 5, 3, 7, 8, 6, 1 ],
\[ 4, 5, 6, 7, 8, 9, 1, 2, 3 ],
\[ 8, 4, 5, 1, 6, 7, 3, 2, 9 ]:
 Order := 36 > |
[ 1, 6, 7, 3, 2, 9, 8, 4, 5 ],
[ 9, 8, 6, 5, 1, 2, 7, 3, 4 ],
[ 5, 4, 9, 2, 1, 6, 8, 7, 3 ]
]
];
s`BelyiDBGaloisOrbits := [ PowerSequence(PowerSequence(PermutationGroup<9 |
\[ 2, 9, 4, 5, 3, 7, 8, 6, 1 ],
\[ 4, 5, 6, 7, 8, 9, 1, 2, 3 ],
\[ 8, 4, 5, 1, 6, 7, 3, 2, 9 ]:
 Order := 36 >)) |
[ PowerSequence(PermutationGroup<9 |
\[ 2, 9, 4, 5, 3, 7, 8, 6, 1 ],
\[ 4, 5, 6, 7, 8, 9, 1, 2, 3 ],
\[ 8, 4, 5, 1, 6, 7, 3, 2, 9 ]:
 Order := 36 >) |
[ PermutationGroup<9 |
\[ 2, 9, 4, 5, 3, 7, 8, 6, 1 ],
\[ 4, 5, 6, 7, 8, 9, 1, 2, 3 ],
\[ 8, 4, 5, 1, 6, 7, 3, 2, 9 ]:
 Order := 36 > |
[ 1, 6, 7, 3, 2, 9, 8, 4, 5 ],
[ 9, 8, 6, 5, 1, 2, 7, 3, 4 ],
[ 5, 4, 9, 2, 1, 6, 8, 7, 3 ]
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
