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
phi1 := KX1!((x^8 - 6*x^7 + 14*x^6 - 14*x^5 + 14*x^3 - 14*x^2 + 6*x - 1)/(14*x^3 - 14*x^2 + 6*x - 1));
Append(~curves, X1);
Append(~maps, phi1);
s`BelyiDBBelyiCurves := curves;
s`BelyiDBBelyiMaps := maps;

/*
auto printing
*/

s`BelyiDBName := "8T49-[7,5,5]-71-5111-5111-g0";
s`BelyiDBFilename := "8T49-[7,5,5]-71-5111-5111-g0.m";
s`BelyiDBDegree := 8;
s`BelyiDBOrders := \[ 7, 5, 5 ];
s`BelyiDBType := "Hyperbolic";
s`BelyiDBGenus := 0;
s`BelyiDBSize := 1;
s`BelyiDBPointedSize := 1;
s`BelyiDBPermutationTriple := [ PermutationGroup<8 |  
\[ 2, 1, 4, 5, 6, 7, 8, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8 ]:
 Order := 20160 > |
[ 7, 2, 8, 3, 4, 5, 6, 1 ],
[ 8, 1, 4, 2, 5, 6, 7, 3 ],
[ 1, 4, 3, 5, 6, 7, 2, 8 ]
];
s`BelyiDBAutomorphismGroup := PermutationGroup<8 |   >;
s`BelyiDBPointedAutomorphismGroup := PermutationGroup<8 |   >;
s`BelyiDBMonodromyGroup := PermutationGroup<8 |  
\[ 7, 2, 8, 3, 4, 5, 6, 1 ],
\[ 8, 1, 4, 2, 5, 6, 7, 3 ],
\[ 1, 4, 3, 5, 6, 7, 2, 8 ]:
 Order := 20160 >;
s`BelyiDBPassport := [ PowerSequence(PermutationGroup<8 |  
\[ 7, 2, 8, 3, 4, 5, 6, 1 ],
\[ 8, 1, 4, 2, 5, 6, 7, 3 ],
\[ 1, 4, 3, 5, 6, 7, 2, 8 ]:
 Order := 20160 >) |
[ PermutationGroup<8 |  
\[ 7, 2, 8, 3, 4, 5, 6, 1 ],
\[ 8, 1, 4, 2, 5, 6, 7, 3 ],
\[ 1, 4, 3, 5, 6, 7, 2, 8 ]:
 Order := 20160 > |
[ 2, 3, 4, 5, 6, 7, 1, 8 ],
[ 7, 1, 3, 4, 5, 8, 6, 2 ],
[ 1, 2, 8, 3, 4, 5, 7, 6 ]
]
];
s`BelyiDBPointedPassport := [ PowerSequence(PermutationGroup<8 |  
\[ 2, 1, 4, 5, 6, 7, 8, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8 ]:
 Order := 20160 >) |
[ PermutationGroup<8 |  
\[ 2, 1, 4, 5, 6, 7, 8, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8 ]:
 Order := 20160 > |
[ 7, 2, 8, 3, 4, 5, 6, 1 ],
[ 8, 1, 4, 2, 5, 6, 7, 3 ],
[ 1, 4, 3, 5, 6, 7, 2, 8 ]
]
];
s`BelyiDBGaloisOrbits := [ PowerSequence(PowerSequence(PermutationGroup<8 |  
\[ 2, 1, 4, 5, 6, 7, 8, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8 ]:
 Order := 20160 >)) |
[ PowerSequence(PermutationGroup<8 |  
\[ 2, 1, 4, 5, 6, 7, 8, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8 ]:
 Order := 20160 >) |
[ PermutationGroup<8 |  
\[ 2, 1, 4, 5, 6, 7, 8, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8 ]:
 Order := 20160 > |
[ 7, 2, 8, 3, 4, 5, 6, 1 ],
[ 8, 1, 4, 2, 5, 6, 7, 3 ],
[ 1, 4, 3, 5, 6, 7, 2, 8 ]
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
