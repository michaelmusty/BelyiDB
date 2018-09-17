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
K1<nu1> := K1;
X1 := Curve(ProjectiveSpace(PolynomialRing(K1, 2)));
KX1<x> := FunctionField(X1);
phi1 := KX1!((-14*x^2 + 16*x - 5)/(5*x^8 - 16*x^7 + 14*x^6 - 14*x^2 + 16*x - 5));
Append(~curves, X1);
Append(~maps, phi1);
s`BelyiDBBelyiCurves := curves;
s`BelyiDBBelyiMaps := maps;

/*
auto printing
*/

s`BelyiDBName := "8T50-[6,6,5]-611-611-5111-g0";
s`BelyiDBFilename := "8T50-[6,6,5]-611-611-5111-g0.m";
s`BelyiDBDegree := 8;
s`BelyiDBOrders := \[ 6, 6, 5 ];
s`BelyiDBType := "Hyperbolic";
s`BelyiDBGenus := 0;
s`BelyiDBSize := 1;
s`BelyiDBPointedSize := 1;
s`BelyiDBPermutationTriple := [ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 5, 1, 3, 4, 6, 7, 8, 2 ],
[ 1, 2, 8, 3, 4, 5, 6, 7 ],
[ 2, 3, 4, 5, 1, 6, 7, 8 ]
];
s`BelyiDBAutomorphismGroup := PermutationGroup<8 |   >;
s`BelyiDBPointedAutomorphismGroup := PermutationGroup<8 |   >;
s`BelyiDBMonodromyGroup := PermutationGroup<8 |  
\[ 5, 1, 3, 4, 6, 7, 8, 2 ],
\[ 1, 2, 8, 3, 4, 5, 6, 7 ],
\[ 2, 3, 4, 5, 1, 6, 7, 8 ]:
 Order := 40320 >;
s`BelyiDBPassport := [ PowerSequence(PermutationGroup<8 |  
\[ 5, 1, 3, 4, 6, 7, 8, 2 ],
\[ 1, 2, 8, 3, 4, 5, 6, 7 ],
\[ 2, 3, 4, 5, 1, 6, 7, 8 ]:
 Order := 40320 >) |
[ PermutationGroup<8 |  
\[ 5, 1, 3, 4, 6, 7, 8, 2 ],
\[ 1, 2, 8, 3, 4, 5, 6, 7 ],
\[ 2, 3, 4, 5, 1, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 6, 2, 3, 7, 4, 5, 8, 1 ],
[ 1, 8, 2, 3, 5, 6, 4, 7 ]
]
];
s`BelyiDBPointedPassport := [ PowerSequence(PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 >) |
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 5, 1, 3, 4, 6, 7, 8, 2 ],
[ 1, 2, 8, 3, 4, 5, 6, 7 ],
[ 2, 3, 4, 5, 1, 6, 7, 8 ]
]
];
s`BelyiDBGaloisOrbits := [ PowerSequence(PowerSequence(PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 >)) |
[ PowerSequence(PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 >) |
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 5, 1, 3, 4, 6, 7, 8, 2 ],
[ 1, 2, 8, 3, 4, 5, 6, 7 ],
[ 2, 3, 4, 5, 1, 6, 7, 8 ]
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
