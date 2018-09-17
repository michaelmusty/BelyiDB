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
phi1 := KX1!((5*x^9 - 27*x^8 + 54*x^7 - 42*x^6 + 42*x^3 - 54*x^2 + 27*x - 5)/(42*x^3 - 54*x^2 + 27*x - 5));
Append(~curves, X1);
Append(~maps, phi1);
s`BelyiDBBelyiCurves := curves;
s`BelyiDBBelyiMaps := maps;

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
