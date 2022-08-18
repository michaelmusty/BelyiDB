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
K1<nu1> := K1;
X1 := Curve(ProjectiveSpace(PolynomialRing(K1, 2)));
KX1<x> := FunctionField(X1);
phi1 := KX1!((-625*x^4 + (19000*nu1 + 20500)*x^3 + (-467400*nu1 - 35550)*x^2 + (2735240*nu1 - 2173820)*x - 1476984*nu1 + 9653287)/(x^5 + (-40*nu1 - 405)*x^4 + (12400*nu1 + 38050)*x^3 + (-826400*nu1 + 563950)*x^2 + (-3699760*nu1 + 5171805)*x - 1476984*nu1 + 9653287));
Append(~curves, X1);
Append(~maps, phi1);
K2<nu2> := K2;
X2 := Curve(ProjectiveSpace(PolynomialRing(K2, 2)));
KX2<x> := FunctionField(X2);
phi2 := KX2!((-625*x^4 + (19000*nu2 + 20500)*x^3 + (-467400*nu2 - 35550)*x^2 + (2735240*nu2 - 2173820)*x - 1476984*nu2 + 9653287)/(x^5 + (-40*nu2 - 405)*x^4 + (12400*nu2 + 38050)*x^3 + (-826400*nu2 + 563950)*x^2 + (-3699760*nu2 + 5171805)*x - 1476984*nu2 + 9653287));
Append(~curves, X2);
Append(~maps, phi2);
s`BelyiDBBelyiCurves := curves;
s`BelyiDBBelyiMaps := maps;

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
