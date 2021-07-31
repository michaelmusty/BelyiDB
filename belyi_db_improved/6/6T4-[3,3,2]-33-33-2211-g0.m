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
maps_improvedg0 := [* *];
maps_improved_factorizedg0 := [* *];
K1<nu1> := K1;
X1 := Curve(ProjectiveSpace(PolynomialRing(K1, 2)));
KX1<x> := FunctionField(X1);
phi1 := KX1!((-357911/2566296*x^6 + 357911/285144*x^4 - 357911/95048*x^2 + 357911/95048)/(x^6 - 20449/1308*x^5 + 8373931/95048*x^4 - 27182/109*x^3 + 36701325/95048*x^2 - 34347/109*x + 855/8));
phi_improvedg01 := KX1!((10158255/357911*x^6 - 160144890075/71*x^4 + 502493930452800*x^3 - 10263283531237469475*x^2 + 147486029597885315667330*x - 1370899400839328133048920400)/(x^6 + 274776*x^5 + 22773796215*x^4 + 329925385115120*x^3 - 18169596404071211685*x^2 + 174903499040372806367256*x - 507843094211969164385452379));
phi_improved_factorizedg01 := [*
[
<x - 13064, 1>,
<x + 33370, 1>,
<x^2 - 10153*x + 332862271, 2>
],
[
<x^2 + 91592*x - 797829059, 3>
],
10158255/357911
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

s`BelyiDBName := "6T4-[3,3,2]-33-33-2211-g0";
s`BelyiDBFilename := "6T4-[3,3,2]-33-33-2211-g0.m";
s`BelyiDBDegree := 6;
s`BelyiDBOrders := \[ 3, 3, 2 ];
s`BelyiDBType := "Spherical";
s`BelyiDBGenus := 0;
s`BelyiDBSize := 1;
s`BelyiDBPointedSize := 1;
s`BelyiDBPermutationTriple := [ PermutationGroup<6 |  
\[ 4, 5, 3, 1, 2, 6 ],
\[ 3, 4, 5, 6, 1, 2 ]:
 Order := 12 > |
[ 3, 4, 5, 6, 1, 2 ],
[ 2, 6, 4, 5, 3, 1 ],
[ 4, 2, 6, 1, 5, 3 ]
];
s`BelyiDBAutomorphismGroup := PermutationGroup<6 |  
\[ 4, 5, 6, 1, 2, 3 ]:
 Order := 2 >;
s`BelyiDBPointedAutomorphismGroup := PermutationGroup<6 |   >;
s`BelyiDBMonodromyGroup := PermutationGroup<6 |  
\[ 3, 4, 5, 6, 1, 2 ],
\[ 2, 6, 4, 5, 3, 1 ],
\[ 4, 2, 6, 1, 5, 3 ]:
 Order := 12 >;
s`BelyiDBPassport := [ PowerSequence(PermutationGroup<6 |  
\[ 3, 4, 5, 6, 1, 2 ],
\[ 2, 6, 4, 5, 3, 1 ],
\[ 4, 2, 6, 1, 5, 3 ]:
 Order := 12 >) |
[ PermutationGroup<6 |  
\[ 3, 4, 5, 6, 1, 2 ],
\[ 2, 6, 4, 5, 3, 1 ],
\[ 4, 2, 6, 1, 5, 3 ]:
 Order := 12 > |
[ 3, 4, 5, 6, 1, 2 ],
[ 2, 6, 4, 5, 3, 1 ],
[ 4, 2, 6, 1, 5, 3 ]
]
];
s`BelyiDBPointedPassport := [ PowerSequence(PermutationGroup<6 |  
\[ 4, 5, 3, 1, 2, 6 ],
\[ 3, 4, 5, 6, 1, 2 ]:
 Order := 12 >) |
[ PermutationGroup<6 |  
\[ 4, 5, 3, 1, 2, 6 ],
\[ 3, 4, 5, 6, 1, 2 ]:
 Order := 12 > |
[ 3, 4, 5, 6, 1, 2 ],
[ 2, 6, 4, 5, 3, 1 ],
[ 4, 2, 6, 1, 5, 3 ]
]
];
s`BelyiDBGaloisOrbits := [ PowerSequence(PowerSequence(PermutationGroup<6 |  
\[ 4, 5, 3, 1, 2, 6 ],
\[ 3, 4, 5, 6, 1, 2 ]:
 Order := 12 >)) |
[ PowerSequence(PermutationGroup<6 |  
\[ 4, 5, 3, 1, 2, 6 ],
\[ 3, 4, 5, 6, 1, 2 ]:
 Order := 12 >) |
[ PermutationGroup<6 |  
\[ 4, 5, 3, 1, 2, 6 ],
\[ 3, 4, 5, 6, 1, 2 ]:
 Order := 12 > |
[ 3, 4, 5, 6, 1, 2 ],
[ 2, 6, 4, 5, 3, 1 ],
[ 4, 2, 6, 1, 5, 3 ]
]
]
];
s`BelyiDBSanityCheckTiming := 0.0100000000000000p15;
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
