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
maps_improvedg0 := [* *];
maps_improved_factorizedg0 := [* *];
K1<nu1> := K1;
X1 := Curve(ProjectiveSpace(PolynomialRing(K1, 2)));
KX1<x> := FunctionField(X1);
phi1 := KX1!((-14/5*x^2 + 16/5*x - 1)/(x^8 - 16/5*x^7 + 14/5*x^6 - 14/5*x^2 + 16/5*x - 1));
phi_improvedg01 := KX1!((-16807/6250*x^8 + 7203/3125*x^6 + 1372/3125*x^5 - 588/625*x^4 - 2016/3125*x^3 + 513/625*x^2 - 41148/153125*x + 8991/306250)/(x^2 - 12/49*x + 3/98));
phi_improved_factorizedg01 := [*
[
<7*x - 3, 5>,
<x + 1, 1>,
<49*x^2 + 56*x + 37, 1>
],
[
<98*x^2 - 24*x + 3, 1>
],
-1/3125
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
