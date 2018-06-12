s := BelyiDBInitialize();

/*
Base Field Data
*/

base_field_data := [* *];
K1<nu1> := RationalsAsNumberField();
place1 := InfinitePlaces(K1)[1];
conj1 := false;
CC<I> := ComplexField(16);
z1 := 1.000000000000000p16;
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
phi1 := KX1!(x);
Append(~curves, X1);
Append(~maps, phi1);
s`BelyiDBBelyiCurves := curves;
s`BelyiDBBelyiMaps := maps;

/*
auto printing
*/

s`BelyiDBName := "1T1-[1,1,1]-1-1-1-g0";
s`BelyiDBFilename := "1T1-[1,1,1]-1-1-1-g0.m";
s`BelyiDBDegree := 1;
s`BelyiDBOrders := \[ 1, 1, 1 ];
s`BelyiDBType := "Spherical";
s`BelyiDBGenus := 0;
s`BelyiDBSize := 1;
s`BelyiDBPointedSize := 1;
s`BelyiDBPermutationTriple := [ PermutationGroup<1 |  
\[ 1 ]:
 Order := 1 > |
[ 1 ],
[ 1 ],
[ 1 ]
];
s`BelyiDBAutomorphismGroup := PermutationGroup<1 |  
\[ 1 ]:
 Order := 1 >;
s`BelyiDBPointedAutomorphismGroup := PermutationGroup<1 |  
\[ 1 ],
\[ 1 ]:
 Order := 1 >;
s`BelyiDBMonodromyGroup := PermutationGroup<1 |  
\[ 1 ],
\[ 1 ],
\[ 1 ]:
 Order := 1 >;
s`BelyiDBPassport := [ PowerSequence(PermutationGroup<1 |  
\[ 1 ],
\[ 1 ],
\[ 1 ]:
 Order := 1 >) |
[ PermutationGroup<1 |  
\[ 1 ],
\[ 1 ],
\[ 1 ]:
 Order := 1 > |
[ 1 ],
[ 1 ],
[ 1 ]
]
];
s`BelyiDBPointedPassport := [ PowerSequence(PermutationGroup<1 |  
\[ 1 ]:
 Order := 1 >) |
[ PermutationGroup<1 |  
\[ 1 ]:
 Order := 1 > |
[ 1 ],
[ 1 ],
[ 1 ]
]
];
s`BelyiDBGaloisOrbits := [ PowerSequence(PowerSequence(PermutationGroup<1 |  
\[ 1 ],
\[ 1 ],
\[ 1 ]:
 Order := 1 >)) |
[ PowerSequence(PermutationGroup<1 |  
\[ 1 ],
\[ 1 ],
\[ 1 ]:
 Order := 1 >) |
[ PermutationGroup<1 |  
\[ 1 ],
\[ 1 ],
\[ 1 ]:
 Order := 1 > |
[ 1 ],
[ 1 ],
[ 1 ]
]
]
];
s`BelyiDBSanityCheckTiming := 0.010p15;

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
