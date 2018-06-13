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
phi1 := KX1!(1/32/(x^7 - 7/4*x^5 + 7/8*x^3 - 7/64*x + 1/64));
Append(~curves, X1);
Append(~maps, phi1);
s`BelyiDBBelyiCurves := curves;
s`BelyiDBBelyiMaps := maps;

/*
auto printing
*/

s`BelyiDBName := "7T2-[7,2,2]-7-2221-2221-g0";
s`BelyiDBFilename := "7T2-[7,2,2]-7-2221-2221-g0.m";
s`BelyiDBDegree := 7;
s`BelyiDBOrders := \[ 7, 2, 2 ];
s`BelyiDBType := "Spherical";
s`BelyiDBGenus := 0;
s`BelyiDBSize := 1;
s`BelyiDBPointedSize := 1;
s`BelyiDBPermutationTriple := [ PermutationGroup<7 |  
\[ 2, 3, 4, 5, 6, 7, 1 ],
\[ 6, 5, 4, 3, 2, 1, 7 ]:
 Order := 14 > |
[ 2, 3, 4, 5, 6, 7, 1 ],
[ 5, 4, 3, 2, 1, 7, 6 ],
[ 6, 5, 4, 3, 2, 1, 7 ]
];
s`BelyiDBAutomorphismGroup := PermutationGroup<7 |   >;
s`BelyiDBPointedAutomorphismGroup := PermutationGroup<7 |   >;
s`BelyiDBMonodromyGroup := PermutationGroup<7 |  
\[ 2, 3, 4, 5, 6, 7, 1 ],
\[ 5, 4, 3, 2, 1, 7, 6 ],
\[ 6, 5, 4, 3, 2, 1, 7 ]:
 Order := 14 >;
s`BelyiDBPassport := [ PowerSequence(PermutationGroup<7 |  
\[ 2, 3, 4, 5, 6, 7, 1 ],
\[ 5, 4, 3, 2, 1, 7, 6 ],
\[ 6, 5, 4, 3, 2, 1, 7 ]:
 Order := 14 >) |
[ PermutationGroup<7 |  
\[ 2, 3, 4, 5, 6, 7, 1 ],
\[ 5, 4, 3, 2, 1, 7, 6 ],
\[ 6, 5, 4, 3, 2, 1, 7 ]:
 Order := 14 > |
[ 2, 3, 4, 5, 6, 7, 1 ],
[ 5, 4, 3, 2, 1, 7, 6 ],
[ 6, 5, 4, 3, 2, 1, 7 ]
]
];
s`BelyiDBPointedPassport := [ PowerSequence(PermutationGroup<7 |  
\[ 2, 3, 4, 5, 6, 7, 1 ],
\[ 6, 5, 4, 3, 2, 1, 7 ]:
 Order := 14 >) |
[ PermutationGroup<7 |  
\[ 2, 3, 4, 5, 6, 7, 1 ],
\[ 6, 5, 4, 3, 2, 1, 7 ]:
 Order := 14 > |
[ 2, 3, 4, 5, 6, 7, 1 ],
[ 5, 4, 3, 2, 1, 7, 6 ],
[ 6, 5, 4, 3, 2, 1, 7 ]
]
];
s`BelyiDBGaloisOrbits := [ PowerSequence(PowerSequence(PermutationGroup<7 |  
\[ 2, 3, 4, 5, 6, 7, 1 ],
\[ 6, 5, 4, 3, 2, 1, 7 ]:
 Order := 14 >)) |
[ PowerSequence(PermutationGroup<7 |  
\[ 2, 3, 4, 5, 6, 7, 1 ],
\[ 6, 5, 4, 3, 2, 1, 7 ]:
 Order := 14 >) |
[ PermutationGroup<7 |  
\[ 2, 3, 4, 5, 6, 7, 1 ],
\[ 6, 5, 4, 3, 2, 1, 7 ]:
 Order := 14 > |
[ 2, 3, 4, 5, 6, 7, 1 ],
[ 5, 4, 3, 2, 1, 7, 6 ],
[ 6, 5, 4, 3, 2, 1, 7 ]
]
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
