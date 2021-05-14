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
maps_improvedg0 := [* *];
maps_improved_factorizedg0 := [* *];
K1<nu1> := K1;
X1 := Curve(ProjectiveSpace(PolynomialRing(K1, 2)));
KX1<x> := FunctionField(X1);
phi1 := KX1!(x);
phi_improvedg01 := KX1!(x);
phi_improved_factorizedg01 := [*
[
<x, 1>
],
[
<1, 1>
],
1
*];
Append(~curves, X1);
Append(~maps, phi1);
Append(~maps_improvedg0, phi_improvedg01);
Append(~maps_improved_factorizedg0, phi_improved_factorizedg01);
s`BelyiDBBelyiCurves := curves;
s`BelyiDBBelyiMaps := maps;
s`BelyiDBBelyiMapsImprovedg0 := maps_improvedg0;
s`BelyiDBBelyiMapsImprovedFactorizedg0 := maps_improved_factorizedg0;

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
s`BelyiDBSanityCheckTiming := 0.000000000000000p15;
s`BelyiDBLocalSanityCheckTiming := 0.000000000000000p15;
s`BelyiDBLocalSanityCheckPrime := 101;
s`BelyiDBLFTInfo := [ PowerSequence(IntegerRing()) |
\[ 0, 1 ],
\[ 1, 0 ]
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
