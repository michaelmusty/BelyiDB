s := BelyiDBInitialize();

/*
Base Field Data
*/

base_field_data := [* *];
K1<nu1> := NumberField(Polynomial([RationalField() | -2, 0, 1]));
place1 := InfinitePlaces(K1)[1];
conj1 := false;
CC<I> := ComplexField(20);
z1 := 0.00000000000000000000p20;
base_field_data_1 := [* K1, place1, conj1, z1 *];
Append(~base_field_data, base_field_data_1);
K2<nu2> := NumberField(Polynomial([RationalField() | -2, 0, 1]));
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
phi1 := KX1!((x^8 + (-16*nu1 - 24)*x^7 + (304*nu1 + 508)*x^6 + (-3728*nu1 - 5352)*x^5 + (25392*nu1 + 38182)*x^4 + (-114608*nu1 - 163624)*x^3 + (301328*nu1 + 455356)*x^2 + (-471472*nu1 - 676696)*x + (262800*nu1 + 511649))/(x^8 + (-16*nu1 - 24)*x^7 + (304*nu1 + 252)*x^6 + (368*nu1 + 792)*x^5 + (-58576*nu1 - 74970)*x^4 + (739408*nu1 + 1031384)*x^3 + (-4640496*nu1 - 6559300)*x^2 + (14882384*nu1 + 21135528)*x - 19639664*nu1 - 27710815));
Append(~curves, X1);
Append(~maps, phi1);
K2<nu2> := K2;
X2 := Curve(ProjectiveSpace(PolynomialRing(K2, 2)));
KX2<x> := FunctionField(X2);
phi2 := KX2!((x^8 + (-16*nu2 - 24)*x^7 + (304*nu2 + 508)*x^6 + (-3728*nu2 - 5352)*x^5 + (25392*nu2 + 38182)*x^4 + (-114608*nu2 - 163624)*x^3 + (301328*nu2 + 455356)*x^2 + (-471472*nu2 - 676696)*x + (262800*nu2 + 511649))/(x^8 + (-16*nu2 - 24)*x^7 + (304*nu2 + 252)*x^6 + (368*nu2 + 792)*x^5 + (-58576*nu2 - 74970)*x^4 + (739408*nu2 + 1031384)*x^3 + (-4640496*nu2 - 6559300)*x^2 + (14882384*nu2 + 21135528)*x - 19639664*nu2 - 27710815));
Append(~curves, X2);
Append(~maps, phi2);
s`BelyiDBBelyiCurves := curves;
s`BelyiDBBelyiMaps := maps;

/*
auto printing
*/

s`BelyiDBName := "8T30-[4,4,2]-44-422-22211-g0";
s`BelyiDBFilename := "8T30-[4,4,2]-44-422-22211-g0.m";
s`BelyiDBDegree := 8;
s`BelyiDBOrders := \[ 4, 4, 2 ];
s`BelyiDBType := "Euclidean";
s`BelyiDBGenus := 0;
s`BelyiDBSize := 2;
s`BelyiDBPointedSize := 2;
s`BelyiDBPermutationTriple := [ PermutationGroup<8 |  
\[ 1, 6, 7, 4, 5, 2, 3, 8 ],
\[ 3, 2, 1, 8, 7, 6, 5, 4 ],
\[ 2, 3, 8, 5, 6, 7, 4, 1 ]:
 Order := 64 > |
[ 2, 3, 8, 5, 6, 7, 4, 1 ],
[ 4, 3, 2, 5, 8, 7, 6, 1 ],
[ 5, 8, 3, 6, 1, 4, 7, 2 ]
];
s`BelyiDBAutomorphismGroup := PermutationGroup<8 |  
\[ 5, 6, 7, 8, 1, 2, 3, 4 ]:
 Order := 2 >;
s`BelyiDBPointedAutomorphismGroup := PermutationGroup<8 |   >;
s`BelyiDBMonodromyGroup := PermutationGroup<8 |  
\[ 2, 3, 8, 5, 6, 7, 4, 1 ],
\[ 4, 3, 2, 5, 8, 7, 6, 1 ],
\[ 5, 8, 3, 6, 1, 4, 7, 2 ]:
 Order := 64 >;
s`BelyiDBPassport := [ PowerSequence(PermutationGroup<8 |  
\[ 2, 3, 8, 5, 6, 7, 4, 1 ],
\[ 4, 3, 2, 5, 8, 7, 6, 1 ],
\[ 5, 8, 3, 6, 1, 4, 7, 2 ]:
 Order := 64 >) |
[ PermutationGroup<8 |  
\[ 2, 3, 8, 5, 6, 7, 4, 1 ],
\[ 4, 3, 2, 5, 8, 7, 6, 1 ],
\[ 5, 8, 3, 6, 1, 4, 7, 2 ]:
 Order := 64 > |
[ 2, 3, 8, 5, 6, 7, 4, 1 ],
[ 4, 3, 2, 5, 8, 7, 6, 1 ],
[ 5, 8, 3, 6, 1, 4, 7, 2 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 8, 5, 6, 7, 4, 1 ],
\[ 4, 3, 2, 5, 8, 7, 6, 1 ],
\[ 5, 8, 3, 6, 1, 4, 7, 2 ]:
 Order := 64 > |
[ 2, 3, 8, 5, 6, 7, 4, 1 ],
[ 8, 7, 6, 1, 4, 3, 2, 5 ],
[ 1, 4, 7, 2, 5, 8, 3, 6 ]
]
];
s`BelyiDBPointedPassport := [ PowerSequence(PermutationGroup<8 |  
\[ 1, 6, 7, 4, 5, 2, 3, 8 ],
\[ 3, 2, 1, 8, 7, 6, 5, 4 ],
\[ 2, 3, 8, 5, 6, 7, 4, 1 ]:
 Order := 64 >) |
[ PermutationGroup<8 |  
\[ 1, 6, 7, 4, 5, 2, 3, 8 ],
\[ 3, 2, 1, 8, 7, 6, 5, 4 ],
\[ 2, 3, 8, 5, 6, 7, 4, 1 ]:
 Order := 64 > |
[ 2, 3, 8, 5, 6, 7, 4, 1 ],
[ 4, 3, 2, 5, 8, 7, 6, 1 ],
[ 5, 8, 3, 6, 1, 4, 7, 2 ]
],
[ PermutationGroup<8 |  
\[ 1, 6, 7, 4, 5, 2, 3, 8 ],
\[ 3, 2, 1, 8, 7, 6, 5, 4 ],
\[ 2, 3, 8, 5, 6, 7, 4, 1 ]:
 Order := 64 > |
[ 2, 3, 8, 5, 6, 7, 4, 1 ],
[ 8, 7, 6, 1, 4, 3, 2, 5 ],
[ 1, 4, 7, 2, 5, 8, 3, 6 ]
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
