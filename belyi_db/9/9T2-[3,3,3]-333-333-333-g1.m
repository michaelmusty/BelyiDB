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
aInvs1 := [ 0, 0, 0, 0, -27 ];
E1 := EllipticCurve(aInvs1);
X1 := BaseChange(E1, K1);
KX1<x,y> := FunctionField(X1);
phi1 := KX1!((x^3 + 216)/(54*x^3)*y + 1/2);
Append(~curves, X1);
Append(~maps, phi1);
s`BelyiDBBelyiCurves := curves;
s`BelyiDBBelyiMaps := maps;

/*
auto printing
*/

s`BelyiDBName := "9T2-[3,3,3]-333-333-333-g1";
s`BelyiDBFilename := "9T2-[3,3,3]-333-333-333-g1.m";
s`BelyiDBDegree := 9;
s`BelyiDBOrders := \[ 3, 3, 3 ];
s`BelyiDBType := "Euclidean";
s`BelyiDBGenus := 1;
s`BelyiDBSize := 1;
s`BelyiDBPointedSize := 1;
s`BelyiDBPermutationTriple := [ PermutationGroup<9 |  
\[ 2, 9, 4, 5, 3, 7, 8, 6, 1 ],
\[ 4, 5, 6, 7, 8, 9, 1, 2, 3 ]:
 Order := 9 > |
[ 2, 9, 4, 5, 3, 7, 8, 6, 1 ],
[ 3, 4, 8, 6, 7, 2, 9, 1, 5 ],
[ 7, 8, 9, 1, 2, 3, 4, 5, 6 ]
];
s`BelyiDBAutomorphismGroup := PermutationGroup<9 |  
\[ 9, 1, 5, 3, 4, 8, 6, 7, 2 ],
\[ 8, 6, 1, 2, 9, 4, 5, 3, 7 ]:
 Order := 9 >;
s`BelyiDBPointedAutomorphismGroup := PermutationGroup<9 |  
\[ 2, 9, 4, 5, 3, 7, 8, 6, 1 ]:
 Order := 3 >;
s`BelyiDBMonodromyGroup := PermutationGroup<9 |  
\[ 2, 9, 4, 5, 3, 7, 8, 6, 1 ],
\[ 3, 4, 8, 6, 7, 2, 9, 1, 5 ],
\[ 7, 8, 9, 1, 2, 3, 4, 5, 6 ]:
 Order := 9 >;
s`BelyiDBPassport := [ PowerSequence(PermutationGroup<9 |  
\[ 2, 9, 4, 5, 3, 7, 8, 6, 1 ],
\[ 3, 4, 8, 6, 7, 2, 9, 1, 5 ],
\[ 7, 8, 9, 1, 2, 3, 4, 5, 6 ]:
 Order := 9 >) |
[ PermutationGroup<9 |  
\[ 2, 9, 4, 5, 3, 7, 8, 6, 1 ],
\[ 3, 4, 8, 6, 7, 2, 9, 1, 5 ],
\[ 7, 8, 9, 1, 2, 3, 4, 5, 6 ]:
 Order := 9 > |
[ 2, 9, 4, 5, 3, 7, 8, 6, 1 ],
[ 3, 4, 8, 6, 7, 2, 9, 1, 5 ],
[ 7, 8, 9, 1, 2, 3, 4, 5, 6 ]
]
];
s`BelyiDBPointedPassport := [ PowerSequence(PermutationGroup<9 |  
\[ 2, 9, 4, 5, 3, 7, 8, 6, 1 ],
\[ 4, 5, 6, 7, 8, 9, 1, 2, 3 ]:
 Order := 9 >) |
[ PermutationGroup<9 |  
\[ 2, 9, 4, 5, 3, 7, 8, 6, 1 ],
\[ 4, 5, 6, 7, 8, 9, 1, 2, 3 ]:
 Order := 9 > |
[ 2, 9, 4, 5, 3, 7, 8, 6, 1 ],
[ 3, 4, 8, 6, 7, 2, 9, 1, 5 ],
[ 7, 8, 9, 1, 2, 3, 4, 5, 6 ]
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
