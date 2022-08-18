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
K1<nu1> := K1;
X1 := Curve(ProjectiveSpace(PolynomialRing(K1, 2)));
KX1<x> := FunctionField(X1);
phi1 := KX1!(729*x^6/(x^9 + 405*x^6 + 34992*x^3 - 1259712));
Append(~curves, X1);
Append(~maps, phi1);
s`BelyiDBBelyiCurves := curves;
s`BelyiDBBelyiMaps := maps;

/*
auto printing
*/

s`BelyiDBName := "9T4-[6,3,2]-63-333-222111-g0";
s`BelyiDBFilename := "9T4-[6,3,2]-63-333-222111-g0.m";
s`BelyiDBDegree := 9;
s`BelyiDBOrders := \[ 6, 3, 2 ];
s`BelyiDBType := "Euclidean";
s`BelyiDBGenus := 0;
s`BelyiDBSize := 1;
s`BelyiDBPointedSize := 1;
s`BelyiDBPermutationTriple := [ PermutationGroup<9 |  
\[ 2, 9, 4, 5, 3, 7, 8, 6, 1 ],
\[ 2, 1, 3, 5, 4, 6, 8, 7, 9 ],
\[ 4, 5, 6, 7, 8, 9, 1, 2, 3 ]:
 Order := 18 > |
[ 5, 4, 6, 8, 7, 9, 2, 1, 3 ],
[ 8, 6, 1, 2, 9, 4, 5, 3, 7 ],
[ 1, 9, 5, 4, 3, 8, 7, 6, 2 ]
];
s`BelyiDBAutomorphismGroup := PermutationGroup<9 |  
\[ 7, 8, 9, 1, 2, 3, 4, 5, 6 ]:
 Order := 3 >;
s`BelyiDBPointedAutomorphismGroup := PermutationGroup<9 |  
\[ 7, 8, 9, 1, 2, 3, 4, 5, 6 ]:
 Order := 3 >;
s`BelyiDBMonodromyGroup := PermutationGroup<9 |  
\[ 5, 4, 6, 8, 7, 9, 2, 1, 3 ],
\[ 8, 6, 1, 2, 9, 4, 5, 3, 7 ],
\[ 1, 9, 5, 4, 3, 8, 7, 6, 2 ]:
 Order := 18 >;
s`BelyiDBPassport := [ PowerSequence(PermutationGroup<9 |  
\[ 5, 4, 6, 8, 7, 9, 2, 1, 3 ],
\[ 8, 6, 1, 2, 9, 4, 5, 3, 7 ],
\[ 1, 9, 5, 4, 3, 8, 7, 6, 2 ]:
 Order := 18 >) |
[ PermutationGroup<9 |  
\[ 5, 4, 6, 8, 7, 9, 2, 1, 3 ],
\[ 8, 6, 1, 2, 9, 4, 5, 3, 7 ],
\[ 1, 9, 5, 4, 3, 8, 7, 6, 2 ]:
 Order := 18 > |
[ 5, 4, 6, 8, 7, 9, 2, 1, 3 ],
[ 8, 6, 1, 2, 9, 4, 5, 3, 7 ],
[ 1, 9, 5, 4, 3, 8, 7, 6, 2 ]
]
];
s`BelyiDBPointedPassport := [ PowerSequence(PermutationGroup<9 |  
\[ 2, 9, 4, 5, 3, 7, 8, 6, 1 ],
\[ 2, 1, 3, 5, 4, 6, 8, 7, 9 ],
\[ 4, 5, 6, 7, 8, 9, 1, 2, 3 ]:
 Order := 18 >) |
[ PermutationGroup<9 |  
\[ 2, 9, 4, 5, 3, 7, 8, 6, 1 ],
\[ 2, 1, 3, 5, 4, 6, 8, 7, 9 ],
\[ 4, 5, 6, 7, 8, 9, 1, 2, 3 ]:
 Order := 18 > |
[ 5, 4, 6, 8, 7, 9, 2, 1, 3 ],
[ 8, 6, 1, 2, 9, 4, 5, 3, 7 ],
[ 1, 9, 5, 4, 3, 8, 7, 6, 2 ]
]
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
