s := BelyiDBInitialize();

/*
Base Field Data
*/

base_field_data := [* *];
K1<nu1> := NumberField(Polynomial([RationalField() | 1, -1, 1]));
place1 := InfinitePlaces(K1)[1];
conj1 := true;
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
maps_improvedg0 := [* *];
maps_improved_factorizedg0 := [* *];
K1<nu1> := K1;
X1 := Curve(ProjectiveSpace(PolynomialRing(K1, 2)));
KX1<x> := FunctionField(X1);
phi1 := KX1!((117649*x^6 + (100438632*nu1 + 305349576)*x^5 + (252961868880*nu1 + 294486299520)*x^4 + (249757507560960*nu1 + 121857998769920)*x^3 + (120685154700015360*nu1 + 12881522436921600)*x^2 + (28483831934859184128*nu1 - 4639837950983811072)*x + (2618991931111749550080*nu1 - 1009983950540445888512))/(x^7 + (1008*nu1 + 69685)*x^6 + (59964408*nu1 + 1089111576)*x^5 + (785424393936*nu1 - 4332819236032)*x^4 + (-2109076286317056*nu1 + 4513307712639488)*x^3 + (1306377131454597888*nu1 - 1156001180632763136)*x^2 + (-114150262482422175744*nu1 + 67793952422013927424)*x + (2618991931111749550080*nu1 - 1009983950540445888512)));
phi_improvedg01 := KX1!((x^7 + 1/4*(3969*nu1 - 3024)*x^5 + 1/4*(-39690*nu1 + 6237)*x^4 + 1/16*(-1893213*nu1 - 1474767)*x^3 + 1/8*(-3245508*nu1 + 34919829)*x^2 + 1/64*(1505670768*nu1 - 2134365471)*x + 1/64*(-5446384515*nu1 + 3392896491))/(x^7 + (70*nu1 - 112)*x^6 + 1/4*(-18459*nu1 + 13104)*x^5 + 1/4*(402570*nu1 - 42525)*x^4 + 1/16*(-11393865*nu1 - 13281975)*x^3 + 1/8*(-18845379*nu1 + 97411167)*x^2 + 1/64*(2870988624*nu1 - 3642057027)*x + 1/64*(-7613915841*nu1 + 4241155059)));
phi_improved_factorizedg01 := [*
[
<x + 9*nu1 - 9, 1>,
<8*x^3 + (-36*nu1 + 36)*x^2 + (3726*nu1 - 3024)*x - 26082*nu1 + 8667, 2>
],
[
<x + 7*nu1 - 13, 1>,
<2*x + 21*nu1 - 33, 6>
],
1
*];
Append(~curves, X1);
Append(~maps, phi1);
Append(~maps_improvedg0, phi_improvedg01);
Append(~maps_improved_factorizedg0, phi_improved_factorizedg01);
K2<nu2> := K2;
X2 := Curve(ProjectiveSpace(PolynomialRing(K2, 2)));
KX2<x> := FunctionField(X2);
phi2 := KX2!((117649*x^6 + (100438632*nu2 + 305349576)*x^5 + (252961868880*nu2 + 294486299520)*x^4 + (249757507560960*nu2 + 121857998769920)*x^3 + (120685154700015360*nu2 + 12881522436921600)*x^2 + (28483831934859184128*nu2 - 4639837950983811072)*x + (2618991931111749550080*nu2 - 1009983950540445888512))/(x^7 + (1008*nu2 + 69685)*x^6 + (59964408*nu2 + 1089111576)*x^5 + (785424393936*nu2 - 4332819236032)*x^4 + (-2109076286317056*nu2 + 4513307712639488)*x^3 + (1306377131454597888*nu2 - 1156001180632763136)*x^2 + (-114150262482422175744*nu2 + 67793952422013927424)*x + (2618991931111749550080*nu2 - 1009983950540445888512)));
phi_improvedg02 := KX2!((x^7 + 1/4*(-3969*nu2 + 945)*x^5 + 1/4*(39690*nu2 - 33453)*x^4 + 1/16*(1893213*nu2 - 3367980)*x^3 + 1/8*(3245508*nu2 + 31674321)*x^2 + 1/64*(-1505670768*nu2 - 628694703)*x + 1/64*(5446384515*nu2 - 2053488024))/(x^7 + (-70*nu2 - 42)*x^6 + 1/4*(18459*nu2 - 5355)*x^5 + 1/4*(-402570*nu2 + 360045)*x^4 + 1/16*(11393865*nu2 - 24675840)*x^3 + 1/8*(18845379*nu2 + 78565788)*x^2 + 1/64*(-2870988624*nu2 - 771068403)*x + 1/64*(7613915841*nu2 - 3372760782)));
phi_improved_factorizedg02 := [*
[
<x - 9*nu2, 1>,
<8*x^3 + 36*nu2*x^2 + (-3726*nu2 + 702)*x + 26082*nu2 - 17415, 2>
],
[
<x - 7*nu2 - 6, 1>,
<2*x - 21*nu2 - 12, 6>
],
1
*];
Append(~curves, X2);
Append(~maps, phi2);
Append(~maps_improvedg0, phi_improvedg02);
Append(~maps_improved_factorizedg0, phi_improved_factorizedg02);
s`BelyiDBBelyiCurves := curves;
s`BelyiDBBelyiMaps := maps;
s`BelyiDBBelyiMapsImprovedg0 := maps_improvedg0;
s`BelyiDBBelyiMapsImprovedFactorizedg0 := maps_improved_factorizedg0;

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
