s := BelyiDBInitialize();

/*
Base Field Data
*/

base_field_data := [* *];
K1<nu1> := NumberField(Polynomial([RationalField() | 1, -1, 1]));
place1 := InfinitePlaces(K1)[1];
conj1 := false;
CC<I> := ComplexField(20);
z1 := 0.00000000000000000000p20;
base_field_data_1 := [* K1, place1, conj1, z1 *];
Append(~base_field_data, base_field_data_1);
K2<nu2> := NumberField(Polynomial([RationalField() | 1, -1, 1]));
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
phi1 := KX1!((117649*x^6 + (153683208*nu1 + 379670130)*x^5 + (496945630440*nu1 + 426873153735)*x^4 + (624552404893200*nu1 + 161872815813660)*x^3 + (380351982940730640*nu1 - 36682147877015025)*x^2 + (111758745394797340392*nu1 - 41015126214779146542)*x + (12585356000994278904840*nu1 - 7731959004293205559239))/(x^7 + (1512*nu1 + 70434)*x^6 + (92941128*nu1 + 1132866567)*x^5 + (1295178477264*nu1 - 3787587957636)*x^4 + (-2833588529369136*nu1 + 2602771553898495)*x^3 + (1123676988837269832*nu1 + 447161722046302914)*x^2 + (197366611057435057896*nu1 - 244025053896984254055)*x));
Append(~curves, X1);
Append(~maps, phi1);
K2<nu2> := K2;
X2 := Curve(ProjectiveSpace(PolynomialRing(K2, 2)));
KX2<x> := FunctionField(X2);
phi2 := KX2!((117649*x^6 + (153683208*nu2 + 379670130)*x^5 + (496945630440*nu2 + 426873153735)*x^4 + (624552404893200*nu2 + 161872815813660)*x^3 + (380351982940730640*nu2 - 36682147877015025)*x^2 + (111758745394797340392*nu2 - 41015126214779146542)*x + (12585356000994278904840*nu2 - 7731959004293205559239))/(x^7 + (1512*nu2 + 70434)*x^6 + (92941128*nu2 + 1132866567)*x^5 + (1295178477264*nu2 - 3787587957636)*x^4 + (-2833588529369136*nu2 + 2602771553898495)*x^3 + (1123676988837269832*nu2 + 447161722046302914)*x^2 + (197366611057435057896*nu2 - 244025053896984254055)*x));
Append(~curves, X2);
Append(~maps, phi2);
s`BelyiDBBelyiCurves := curves;
s`BelyiDBBelyiMaps := maps;

/*
auto printing
*/

s`BelyiDBName := "7T4-[6,3,2]-61-331-2221-g0";
s`BelyiDBFilename := "7T4-[6,3,2]-61-331-2221-g0.m";
s`BelyiDBDegree := 7;
s`BelyiDBOrders := \[ 6, 3, 2 ];
s`BelyiDBType := "Euclidean";
s`BelyiDBGenus := 0;
s`BelyiDBSize := 2;
s`BelyiDBPointedSize := 2;
s`BelyiDBPermutationTriple := [ PermutationGroup<7 |  
\[ 2, 3, 4, 5, 6, 7, 1 ],
\[ 3, 6, 2, 5, 1, 4, 7 ]:
 Order := 42 > |
[ 6, 4, 2, 7, 5, 3, 1 ],
[ 1, 5, 2, 6, 3, 7, 4 ],
[ 6, 5, 4, 3, 2, 1, 7 ]
];
s`BelyiDBAutomorphismGroup := PermutationGroup<7 |   >;
s`BelyiDBPointedAutomorphismGroup := PermutationGroup<7 |   >;
s`BelyiDBMonodromyGroup := PermutationGroup<7 |  
\[ 6, 4, 2, 7, 5, 3, 1 ],
\[ 1, 5, 2, 6, 3, 7, 4 ],
\[ 6, 5, 4, 3, 2, 1, 7 ]:
 Order := 42 >;
s`BelyiDBPassport := [ PowerSequence(PermutationGroup<7 |  
\[ 6, 4, 2, 7, 5, 3, 1 ],
\[ 1, 5, 2, 6, 3, 7, 4 ],
\[ 6, 5, 4, 3, 2, 1, 7 ]:
 Order := 42 >) |
[ PermutationGroup<7 |  
\[ 6, 4, 2, 7, 5, 3, 1 ],
\[ 1, 5, 2, 6, 3, 7, 4 ],
\[ 6, 5, 4, 3, 2, 1, 7 ]:
 Order := 42 > |
[ 6, 4, 2, 7, 5, 3, 1 ],
[ 5, 2, 6, 3, 7, 4, 1 ],
[ 5, 4, 3, 2, 1, 7, 6 ]
],
[ PermutationGroup<7 |  
\[ 6, 4, 2, 7, 5, 3, 1 ],
\[ 1, 5, 2, 6, 3, 7, 4 ],
\[ 6, 5, 4, 3, 2, 1, 7 ]:
 Order := 42 > |
[ 7, 3, 6, 2, 5, 1, 4 ],
[ 7, 2, 4, 6, 1, 3, 5 ],
[ 4, 3, 2, 1, 7, 6, 5 ]
]
];
s`BelyiDBPointedPassport := [ PowerSequence(PermutationGroup<7 |  
\[ 2, 3, 4, 5, 6, 7, 1 ],
\[ 3, 6, 2, 5, 1, 4, 7 ]:
 Order := 42 >) |
[ PermutationGroup<7 |  
\[ 2, 3, 4, 5, 6, 7, 1 ],
\[ 3, 6, 2, 5, 1, 4, 7 ]:
 Order := 42 > |
[ 6, 4, 2, 7, 5, 3, 1 ],
[ 1, 5, 2, 6, 3, 7, 4 ],
[ 6, 5, 4, 3, 2, 1, 7 ]
],
[ PermutationGroup<7 |  
\[ 2, 3, 4, 5, 6, 7, 1 ],
\[ 3, 6, 2, 5, 1, 4, 7 ]:
 Order := 42 > |
[ 7, 3, 6, 2, 5, 1, 4 ],
[ 3, 5, 7, 2, 4, 6, 1 ],
[ 6, 5, 4, 3, 2, 1, 7 ]
]
];
s`BelyiDBGaloisOrbits := [ PowerSequence(PowerSequence(PermutationGroup<7 |  
\[ 2, 3, 4, 5, 6, 7, 1 ],
\[ 3, 6, 2, 5, 1, 4, 7 ]:
 Order := 42 >)) |
[ PowerSequence(PermutationGroup<7 |  
\[ 2, 3, 4, 5, 6, 7, 1 ],
\[ 3, 6, 2, 5, 1, 4, 7 ]:
 Order := 42 >) |
[ PermutationGroup<7 |  
\[ 2, 3, 4, 5, 6, 7, 1 ],
\[ 3, 6, 2, 5, 1, 4, 7 ]:
 Order := 42 > |
[ 6, 4, 2, 7, 5, 3, 1 ],
[ 1, 5, 2, 6, 3, 7, 4 ],
[ 6, 5, 4, 3, 2, 1, 7 ]
],
[ PermutationGroup<7 |  
\[ 2, 3, 4, 5, 6, 7, 1 ],
\[ 3, 6, 2, 5, 1, 4, 7 ]:
 Order := 42 > |
[ 7, 3, 6, 2, 5, 1, 4 ],
[ 3, 5, 7, 2, 4, 6, 1 ],
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
