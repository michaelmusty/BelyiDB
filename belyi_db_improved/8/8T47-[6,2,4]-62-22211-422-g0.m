s := BelyiDBInitialize();

/*
Base Field Data
*/

base_field_data := [* *];
K1<nu1> := NumberField(Polynomial([RationalField() | -2, 3, 0, 1]));
place1 := InfinitePlaces(K1)[2];
conj1 := true;
CC<I> := ComplexField(600);
z1 := -0.0754258877375395073081835725560642319758360533168134221400487876181234607866191586911568240855671476285637220428240862302824108822574689239554922220797361916819729176217472699784070936645237228609615914751737145061046367409099199510020476092933876356668960022306021305183309507200225749307544931717771117698264421945216762705483878545151069732979906785999662790150383857094944013093472477985470855870772004156592211791954548052642662501500217641906997619197345244176584721703453509912150880292769341715634364417492221722879529606482828607342566076982139153156081879050024398589782854572145029238525380p600 + 0.845791725351359599488445034182308350215197193636808387034556510880136991413230392883572432369409102736691389140554362953183022543527014614097169563774926479107260396174560128254212181298308650715915620782521321501668779605538380026652786674888171162479872684310321905702056845425459265500060612212614270014055391554177663584237772311843231535036820504376855705863544757671143898801898781941827695921363607975838831987447201863592332072099501312623884413400283218903460693084958496459065439736316784883000698781464940253084683641973441997483851290370985745412449250289052294166591640734271494628351779p600*I;
base_field_data_1 := [* K1, place1, conj1, z1 *];
Append(~base_field_data, base_field_data_1);
K2<nu2> := NumberField(Polynomial([RationalField() | -2, 3, 0, 1]));
place2 := InfinitePlaces(K2)[2];
conj2 := false;
CC<I> := ComplexField(600);
z2 := -0.0754258877375395073081835725560642319758360533168134221400487876181234607866191586911568240855671476285637220428240862302824108822574689239554922220797361916819729176217472699784070936645237228609615914751737145061046367409099199510020476092933876356668960022306021305183309507200225749307544931717771117698264421945216762705483878545151069732979906785999662790150383857094944013093472477985470855870772004156592211791954548052642662501500217641906997619197345244176584721703453509912150880292769341715634364417492221722879529606482828607342566076982139153156081879050024398589782854572145029238525339p600 - 0.845791725351359599488445034182308350215197193636808387034556510880136991413230392883572432369409102736691389140554362953183022543527014614097169563774926479107260396174560128254212181298308650715915620782521321501668779605538380026652786674888171162479872684310321905702056845425459265500060612212614270014055391554177663584237772311843231535036820504376855705863544757671143898801898781941827695921363607975838831987447201863592332072099501312623884413400283218903460693084958496459065439736316784883000698781464940253084683641973441997483851290370985745412449250289052294166591640734271494628351772p600*I;
base_field_data_2 := [* K2, place2, conj2, z2 *];
Append(~base_field_data, base_field_data_2);
K3<nu3> := NumberField(Polynomial([RationalField() | -2, 3, 0, 1]));
place3 := InfinitePlaces(K3)[1];
conj3 := false;
CC<I> := ComplexField(600);
z3 := -1.84914822452492098538363285488787153604832789336637315571990242476375307842676168261768635182886570474287255591435182753943517823548506215208901555584052761663605416475650546004318581267095255427807681704965257098779072651818016009799590478141322472866620799553879573896333809855995485013849101365644577646034711561095664745890322429096978605340401864280006744196992322858101119738130550440290582882584559916868155764160909038947146749969995647161860047616053095116468305565930929801756982394144613165687312711650155565542409407870343427853148678460357216936878362418999512028204342908557099415229495p600 + 3.35770033886538249275230604856667167782304159512261125374627691705957148391399049401299657001407684568404683679113311862815529508978212774239275880376471153881314017025853645699456925770004391729878555220101873229117691604989812942374599064661900406592625108961827867107823010165294685371262041124839307847843616073221330474304755978141710158155382138098126963899597889816161283413539496992199452501019399600139231091654824474439965482887645010668650816300482475931729921120535440442272054059236301519487228984105424402480011348015651321390847581263644888987882597637517629723323921789740510180145056E-1514p600*I;
base_field_data_3 := [* K3, place3, conj3, z3 *];
Append(~base_field_data, base_field_data_3);
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
phi1 := KX1!((1/707281*(13421044335*nu1^2 + 7999572786*nu1 + 45034667977)*x^8 + 1/2121843*(-74454857884*nu1^2 - 44384731400*nu1 - 249821994820)*x^7 + 1/2121843*(34420526292*nu1^2 + 20517440792*nu1 + 115489739468)*x^6)/(x^8 + 1/87*(-30764*nu1^2 - 18472*nu1 - 103364)*x^7 + 1/2523*(322633224*nu1^2 + 192315632*nu1 + 1082526728)*x^6 + 1/24389*(-5718070696*nu1^2 - 3408372016*nu1 - 19185824984)*x^5 + 1/2121843*(-310411787660*nu1^2 - 185027179048*nu1 - 1041524819636)*x^4 + 1/2121843*(994482456000*nu1^2 + 592782666880*nu1 + 3336789085504)*x^3 + 1/707281*(-63444386432*nu1^2 - 37817416448*nu1 - 212875049600)*x^2 + 1/2121843*(-496262066176*nu1^2 - 295807766528*nu1 - 1665108788224)*x + 1/2121843*(229415532288*nu1^2 + 136748089856*nu1 + 769758245888)));
phi_improvedg01 := KX1!((1/1024*x^8 + 1/256*(-3*nu1^2 - 6*nu1 - 9)*x^6 + 1/16*x^5 + 1/512*(141*nu1^2 + 54*nu1 + 363)*x^4 + 1/8*(-3*nu1^2 - 6*nu1 - 9)*x^3 + 1/256*(-279*nu1^2 - 162*nu1 - 545)*x^2 + 1/16*(15*nu1^2 + 18*nu1 + 57)*x + 1/1024*(1359*nu1^2 + 882*nu1 + 4329))/(x^2 + (-3*nu1^2 - 6)*x + 1/4*(9*nu1^2 + 18*nu1 + 36)));
phi_improved_factorizedg01 := [*
[
<x - nu1^2 - 3, 4>,
<x^2 + (2*nu1^2 + 6)*x + 3*nu1^2 - 6*nu1 + 9, 2>
],
[
<(nu1^2 + 3)*x - 3*nu1^2 - 3*nu1 - 9, 2>
],
1/1024*(3*nu1^2 + 2*nu1 + 9)
*];
Append(~curves, X1);
Append(~maps, phi1);
Append(~maps_improvedg0, phi_improvedg01);
Append(~maps_improved_factorizedg0, phi_improved_factorizedg01);
K2<nu2> := K2;
X2 := Curve(ProjectiveSpace(PolynomialRing(K2, 2)));
KX2<x> := FunctionField(X2);
phi2 := KX2!((1/707281*(13421044335*nu2^2 + 7999572786*nu2 + 45034667977)*x^8 + 1/2121843*(-74454857884*nu2^2 - 44384731400*nu2 - 249821994820)*x^7 + 1/2121843*(34420526292*nu2^2 + 20517440792*nu2 + 115489739468)*x^6)/(x^8 + 1/87*(-30764*nu2^2 - 18472*nu2 - 103364)*x^7 + 1/2523*(322633224*nu2^2 + 192315632*nu2 + 1082526728)*x^6 + 1/24389*(-5718070696*nu2^2 - 3408372016*nu2 - 19185824984)*x^5 + 1/2121843*(-310411787660*nu2^2 - 185027179048*nu2 - 1041524819636)*x^4 + 1/2121843*(994482456000*nu2^2 + 592782666880*nu2 + 3336789085504)*x^3 + 1/707281*(-63444386432*nu2^2 - 37817416448*nu2 - 212875049600)*x^2 + 1/2121843*(-496262066176*nu2^2 - 295807766528*nu2 - 1665108788224)*x + 1/2121843*(229415532288*nu2^2 + 136748089856*nu2 + 769758245888)));
phi_improvedg02 := KX2!((1/1024*x^8 + 1/256*(-3*nu2^2 - 6*nu2 - 9)*x^6 + 1/16*x^5 + 1/512*(141*nu2^2 + 54*nu2 + 363)*x^4 + 1/8*(-3*nu2^2 - 6*nu2 - 9)*x^3 + 1/256*(-279*nu2^2 - 162*nu2 - 545)*x^2 + 1/16*(15*nu2^2 + 18*nu2 + 57)*x + 1/1024*(1359*nu2^2 + 882*nu2 + 4329))/(x^2 + (-3*nu2^2 - 6)*x + 1/4*(9*nu2^2 + 18*nu2 + 36)));
phi_improved_factorizedg02 := [*
[
<x - nu2^2 - 3, 4>,
<x^2 + (2*nu2^2 + 6)*x + 3*nu2^2 - 6*nu2 + 9, 2>
],
[
<(nu2^2 + 3)*x - 3*nu2^2 - 3*nu2 - 9, 2>
],
1/1024*(3*nu2^2 + 2*nu2 + 9)
*];
Append(~curves, X2);
Append(~maps, phi2);
Append(~maps_improvedg0, phi_improvedg02);
Append(~maps_improved_factorizedg0, phi_improved_factorizedg02);
K3<nu3> := K3;
X3 := Curve(ProjectiveSpace(PolynomialRing(K3, 2)));
KX3<x> := FunctionField(X3);
phi3 := KX3!((1/707281*(13421044335*nu3^2 + 7999572786*nu3 + 45034667977)*x^8 + 1/2121843*(-74454857884*nu3^2 - 44384731400*nu3 - 249821994820)*x^7 + 1/2121843*(34420526292*nu3^2 + 20517440792*nu3 + 115489739468)*x^6)/(x^8 + 1/87*(-30764*nu3^2 - 18472*nu3 - 103364)*x^7 + 1/2523*(322633224*nu3^2 + 192315632*nu3 + 1082526728)*x^6 + 1/24389*(-5718070696*nu3^2 - 3408372016*nu3 - 19185824984)*x^5 + 1/2121843*(-310411787660*nu3^2 - 185027179048*nu3 - 1041524819636)*x^4 + 1/2121843*(994482456000*nu3^2 + 592782666880*nu3 + 3336789085504)*x^3 + 1/707281*(-63444386432*nu3^2 - 37817416448*nu3 - 212875049600)*x^2 + 1/2121843*(-496262066176*nu3^2 - 295807766528*nu3 - 1665108788224)*x + 1/2121843*(229415532288*nu3^2 + 136748089856*nu3 + 769758245888)));
phi_improvedg03 := KX3!((1/1024*x^8 + 1/256*(-3*nu3^2 - 6*nu3 - 9)*x^6 + 1/16*x^5 + 1/512*(141*nu3^2 + 54*nu3 + 363)*x^4 + 1/8*(-3*nu3^2 - 6*nu3 - 9)*x^3 + 1/256*(-279*nu3^2 - 162*nu3 - 545)*x^2 + 1/16*(15*nu3^2 + 18*nu3 + 57)*x + 1/1024*(1359*nu3^2 + 882*nu3 + 4329))/(x^2 + (-3*nu3^2 - 6)*x + 1/4*(9*nu3^2 + 18*nu3 + 36)));
phi_improved_factorizedg03 := [*
[
<x - nu3^2 - 3, 4>,
<x^2 + (2*nu3^2 + 6)*x + 3*nu3^2 - 6*nu3 + 9, 2>
],
[
<(nu3^2 + 3)*x - 3*nu3^2 - 3*nu3 - 9, 2>
],
1/1024*(3*nu3^2 + 2*nu3 + 9)
*];
Append(~curves, X3);
Append(~maps, phi3);
Append(~maps_improvedg0, phi_improvedg03);
Append(~maps_improved_factorizedg0, phi_improved_factorizedg03);
s`BelyiDBBelyiCurves := curves;
s`BelyiDBBelyiMaps := maps;
s`BelyiDBBelyiMapsImprovedg0 := maps_improvedg0;
s`BelyiDBBelyiMapsImprovedFactorizedg0 := maps_improved_factorizedg0;

/*
auto printing
*/

s`BelyiDBName := "8T47-[6,2,4]-62-22211-422-g0";
s`BelyiDBFilename := "8T47-[6,2,4]-62-22211-422-g0.m";
s`BelyiDBDegree := 8;
s`BelyiDBOrders := \[ 6, 2, 4 ];
s`BelyiDBType := "Hyperbolic";
s`BelyiDBGenus := 0;
s`BelyiDBSize := 3;
s`BelyiDBPointedSize := 3;
s`BelyiDBPermutationTriple := [ PermutationGroup<8 |  
\[ 2, 3, 8, 4, 5, 6, 7, 1 ],
\[ 1, 3, 2, 4, 5, 6, 7, 8 ],
\[ 5, 6, 7, 8, 1, 2, 3, 4 ]:
 Order := 1152 > |
[ 5, 4, 6, 8, 2, 3, 1, 7 ],
[ 1, 3, 2, 6, 7, 4, 5, 8 ],
[ 5, 7, 4, 3, 1, 2, 8, 6 ]
];
s`BelyiDBAutomorphismGroup := PermutationGroup<8 |   >;
s`BelyiDBPointedAutomorphismGroup := PermutationGroup<8 |   >;
s`BelyiDBMonodromyGroup := PermutationGroup<8 |  
\[ 5, 4, 6, 8, 2, 3, 1, 7 ],
\[ 1, 3, 2, 6, 7, 4, 5, 8 ],
\[ 5, 7, 4, 3, 1, 2, 8, 6 ]:
 Order := 1152 >;
s`BelyiDBPassport := [ PowerSequence(PermutationGroup<8 |  
\[ 5, 4, 6, 8, 2, 3, 1, 7 ],
\[ 1, 3, 2, 6, 7, 4, 5, 8 ],
\[ 5, 7, 4, 3, 1, 2, 8, 6 ]:
 Order := 1152 >) |
[ PermutationGroup<8 |  
\[ 5, 4, 6, 8, 2, 3, 1, 7 ],
\[ 1, 3, 2, 6, 7, 4, 5, 8 ],
\[ 5, 7, 4, 3, 1, 2, 8, 6 ]:
 Order := 1152 > |
[ 7, 5, 6, 2, 1, 3, 8, 4 ],
[ 2, 1, 8, 6, 5, 4, 7, 3 ],
[ 5, 6, 4, 3, 1, 8, 2, 7 ]
],
[ PermutationGroup<8 |  
\[ 5, 4, 6, 8, 2, 3, 1, 7 ],
\[ 1, 3, 2, 6, 7, 4, 5, 8 ],
\[ 5, 7, 4, 3, 1, 2, 8, 6 ]:
 Order := 1152 > |
[ 7, 5, 6, 2, 1, 3, 8, 4 ],
[ 3, 8, 1, 4, 6, 5, 7, 2 ],
[ 6, 4, 5, 2, 8, 1, 3, 7 ]
],
[ PermutationGroup<8 |  
\[ 5, 4, 6, 8, 2, 3, 1, 7 ],
\[ 1, 3, 2, 6, 7, 4, 5, 8 ],
\[ 5, 7, 4, 3, 1, 2, 8, 6 ]:
 Order := 1152 > |
[ 7, 5, 6, 2, 1, 3, 8, 4 ],
[ 1, 8, 3, 6, 7, 4, 5, 2 ],
[ 7, 6, 4, 2, 8, 3, 1, 5 ]
]
];
s`BelyiDBPointedPassport := [ PowerSequence(PermutationGroup<8 |  
\[ 2, 3, 8, 4, 5, 6, 7, 1 ],
\[ 1, 3, 2, 4, 5, 6, 7, 8 ],
\[ 5, 6, 7, 8, 1, 2, 3, 4 ]:
 Order := 1152 >) |
[ PermutationGroup<8 |  
\[ 2, 3, 8, 4, 5, 6, 7, 1 ],
\[ 1, 3, 2, 4, 5, 6, 7, 8 ],
\[ 5, 6, 7, 8, 1, 2, 3, 4 ]:
 Order := 1152 > |
[ 5, 4, 6, 8, 2, 3, 1, 7 ],
[ 1, 3, 2, 6, 7, 4, 5, 8 ],
[ 5, 7, 4, 3, 1, 2, 8, 6 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 8, 4, 5, 6, 7, 1 ],
\[ 1, 3, 2, 4, 5, 6, 7, 8 ],
\[ 5, 6, 7, 8, 1, 2, 3, 4 ]:
 Order := 1152 > |
[ 7, 5, 4, 3, 1, 2, 8, 6 ],
[ 1, 3, 2, 6, 7, 4, 5, 8 ],
[ 7, 4, 6, 2, 3, 8, 1, 5 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 8, 4, 5, 6, 7, 1 ],
\[ 1, 3, 2, 4, 5, 6, 7, 8 ],
\[ 5, 6, 7, 8, 1, 2, 3, 4 ]:
 Order := 1152 > |
[ 7, 5, 4, 2, 1, 8, 3, 6 ],
[ 1, 3, 2, 6, 7, 4, 5, 8 ],
[ 7, 6, 5, 2, 3, 8, 1, 4 ]
]
];
s`BelyiDBGaloisOrbits := [ PowerSequence(PowerSequence(PermutationGroup<8 |  
\[ 2, 3, 8, 4, 5, 6, 7, 1 ],
\[ 1, 3, 2, 4, 5, 6, 7, 8 ],
\[ 5, 6, 7, 8, 1, 2, 3, 4 ]:
 Order := 1152 >)) |
[ PowerSequence(PermutationGroup<8 |  
\[ 2, 3, 8, 4, 5, 6, 7, 1 ],
\[ 1, 3, 2, 4, 5, 6, 7, 8 ],
\[ 5, 6, 7, 8, 1, 2, 3, 4 ]:
 Order := 1152 >) |
[ PermutationGroup<8 |  
\[ 2, 3, 8, 4, 5, 6, 7, 1 ],
\[ 1, 3, 2, 4, 5, 6, 7, 8 ],
\[ 5, 6, 7, 8, 1, 2, 3, 4 ]:
 Order := 1152 > |
[ 5, 4, 6, 8, 2, 3, 1, 7 ],
[ 1, 3, 2, 6, 7, 4, 5, 8 ],
[ 5, 7, 4, 3, 1, 2, 8, 6 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 8, 4, 5, 6, 7, 1 ],
\[ 1, 3, 2, 4, 5, 6, 7, 8 ],
\[ 5, 6, 7, 8, 1, 2, 3, 4 ]:
 Order := 1152 > |
[ 7, 5, 4, 3, 1, 2, 8, 6 ],
[ 1, 3, 2, 6, 7, 4, 5, 8 ],
[ 7, 4, 6, 2, 3, 8, 1, 5 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 8, 4, 5, 6, 7, 1 ],
\[ 1, 3, 2, 4, 5, 6, 7, 8 ],
\[ 5, 6, 7, 8, 1, 2, 3, 4 ]:
 Order := 1152 > |
[ 7, 5, 4, 2, 1, 8, 3, 6 ],
[ 1, 3, 2, 6, 7, 4, 5, 8 ],
[ 7, 6, 5, 2, 3, 8, 1, 4 ]
]
]
];
s`BelyiDBComputationTime := 6.96000000000000p15;
s`BelyiDBLocalSanityCheckTiming := 0.0300000000000000p15;
s`BelyiDBLocalSanityCheckPrime := 9721;
s`BelyiDBLFTInfo := [ PowerSequence(IntegerRing()) |
\[ 0, 1 ],
\[ 1, 0 ]
];

/*
Numerical Data
*/

CC<I> := ComplexField(20);
s`BelyiDBRescalingFactors := [* -0.31129916976189508243p20 - 0.74623059623396654807p20*I, -0.31129916976188747759p20 + 0.74623059623390051142p20*I, -0.25161078963324911844p20 + 3.4864775548818061547E-14p20*I *];

/*
Powser Bases
*/

CC<I> := ComplexField(20);
Ser<w> := PowerSeriesRing(CC, 71);
s`BelyiDBPowserIndat := [* 4, 20, 0, 0, 2, true, "Arnoldi", true *];
s`BelyiDBPowserBases := [];
expansions := [];
Append(~expansions, Ser!([ ComplexField(20) | 0.99999999999999999999p20, -6.7762635780344027125E-21p20, 5.2638355672791453603p20 - 6.7635885770116893623E-15p20*I, 0.10160996620354421039p20 - 5.0825975307225093472E-14p20*I, -0.31134481078293842666p20 + 8.9694408838555212890E-15p20*I, 0.80349473820120001831p20 + 2.4597134640303255394E-13p20*I, -16.609308516787112030p20 + 7.7138843273052981608E-14p20*I, 3.6905573855585685854p20 + 3.6965602020350152301E-15p20*I, 15.707464003569243868p20 + 1.2121813969256933774E-13p20*I, 10.927494681498401805p20 + 2.9504760722283418506E-12p20*I, -16.482053135248857789p20 + 4.2300866043461227139E-14p20*I, 22.609237583599818034p20 - 1.0484471743479190087E-11p20*I, 17.983052307888684536p20 - 2.9476476733633974470E-12p20*I, 31.831612425717803310p20 + 2.1606964915182880205E-11p20*I, -37.416801664050129781p20 - 1.2600857857147929053E-12p20*I, 26.031616187508510810p20 - 1.2445653526044295895E-10p20*I, -15.883518784619011934p20 - 6.4871799067538898909E-12p20*I, 3.0684573353758361427p20 + 3.4596111368790131383E-10p20*I, 61.588477268695553321p20 - 2.1495030148172000750E-12p20*I, -18.969026750258666302p20 - 1.5085719772445389808E-9p20*I, 7.5380158842984388726p20 - 9.3737081200654260443E-11p20*I, -2.0072793331168959889p20 + 4.6375634308440708518E-9p20*I, -20.774690402083573512p20 + 4.6787744705856833954E-10p20*I, 52.811855192911306039p20 - 1.0437820591895942413E-8p20*I, 31.207735452969856162p20 + 4.2792480583336844902E-9p20*I, 98.628404145819705101p20 + 7.2113363507432873267E-8p20*I, 53.044743641177073161p20 + 9.0109786857130343141E-9p20*I, 77.582281808483491463p20 - 1.7470626558808858078E-7p20*I, -32.250263595725189934p20 - 4.2066572079782309224E-8p20*I, -34.213442973300846811p20 + 2.9849697581339675739E-7p20*I, 25.567112586142166492p20 - 3.0013695333439547631E-7p20*I, -95.758262445838105830p20 - 3.1169246110110073898E-6p20*I, -102.23254630320813975p20 - 4.1187503989955492889E-7p20*I, -112.94193215235586659p20 + 7.3619065907498454013E-6p20*I, 46.437999111030072354p20 + 3.4450485831930292759E-6p20*I, -42.795660380948734062p20 - 8.7216526375602325665E-6p20*I, -71.801453604039058503p20 + 1.6515857882236915141E-5p20*I, 10.813783493106162173p20 + 0.00013546547309574235533p20*I, -103.39658667612747332p20 + 7.0474186312857126785E-6p20*I, -77.259273125547984973p20 - 0.00037492198059328751564p20*I, 32.582385644371154495p20 - 0.00024685451392103828537p20*I, 37.443881510515252471p20 + 0.00036763191525419485232p20*I, 188.90393417232867974p20 - 0.00084287450427773964994p20*I, -42.205293361273414254p20 - 0.0063988661118240326882p20*I, -252.24297966123501349p20 + 0.00078036808511165170130p20*I, 86.309720738127618939p20 + 0.022937677027197778438p20*I, 51.127715177865720664p20 + 0.015831233680081805299p20*I, 53.555132999695911434p20 - 0.028476152264128683380p20*I, 86.489396586274066249p20 + 0.041563117806487520438p20*I, -147.53980856319165329p20 + 0.34680649464852618099p20*I, -38.811292278440978013p20 - 0.10992531764106327685p20*I, 161.30099313745418141p20 - 1.5519058515157743926p20*I, -20.958701422279065070p20 - 0.90923870433805344839p20*I, -216.80970650405156583p20 + 2.7622356644832842138p20*I, 108.19409425036785644p20 - 1.9556092645592292525p20*I, -36.305710049947859665p20 - 21.586761987794602758p20*I, -184.68654914324869695p20 + 8.8164996042508896069p20*I, -534.12602519417954264p20 + 106.53719412629986774p20*I, -52.548085484632530363p20 + 44.165491770467856270p20*I, -400.56313254603507282p20 - 259.53830121619708496p20*I, -525.66633961096770489p20 + 80.629350124361773431p20*I, 1699.2240931113737806p20 + 1478.5693308883043980p20*I, 6134.0283187321654863p20 - 457.07769470069516659p20*I, 8681.1305331212322072p20 - 6891.1744232718488026p20*I, -102.15111413305152777p20 - 1279.6871140129721042p20*I, 2445.9775224887039125p20 + 22722.256289198491386p20*I, -4861.2755261294797671p20 - 1951.3608449314625145p20*I, -14234.387365179781494p20 - 106533.20980847671946p20*I, 1849.4503171937384403p20 - 8695.9149505319644553p20*I, 316660.41072125757941p20 + 357291.24311167839956p20*I, -258233.80105266480480p20 - 89949.977406443048770p20*I ]));
Append(~expansions, Ser!([ ComplexField(20) | 146.02652535927383456p20 + 1.9648768289498574902E-13p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, 31.729675293346152790p20 - 3.8297061919281838449E-13p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, -394.84371853078492001p20 - 4.1566155899175338817E-12p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, 1679.7138607633383687p20 + 2.8302438517813222063E-12p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, -63.457342148104467140p20 + 8.2823956026878420289E-11p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, 1618.7162146515988474p20 - 7.1656921715734789302E-11p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, -341.14299624460275905p20 - 1.9888444224847035002E-9p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, 2117.1837707152381790p20 + 8.9669633784178470748E-9p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, 5415.2253740561623871p20 + 5.9406972313658101825E-8p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, 3286.6788297038669560p20 - 6.3229962690529439850E-7p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, -8119.6617456350460595p20 - 2.1252098576160505239E-6p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, -4732.5751448879591001p20 + 3.6431379069511854452E-5p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, -2166.1854023897932460p20 + 8.8774303025958289926E-5p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, -3320.5317392296329351p20 - 0.0019686547582735518247p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, 7621.2828801474784048p20 - 0.0038981729559244976402p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, -5209.7709311642344989p20 + 0.10428843272634157752p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, 7518.8347232601128438p20 + 0.16969918269458082738p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, 2083.7112283548400882p20 - 5.4414254820723586218p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, -10469.842521364689487p20 - 7.0728136427212388061p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, 8377.0660215394577560p20 + 282.00052880204150488p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, -47669.935315483419261p20 + 272.22774156700560468p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, -43080.794801095165557p20 - 14475.159205961349498p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, 2082076.8971649432778p20 - 8392.8129964446304646p20*I ]));
Append(~s`BelyiDBPowserBases, expansions);
expansions := [];
Append(~expansions, Ser!([ ComplexField(20) | 1.0587911840678754238E-22p20*I, 1.0000000000000000000p20, 1.6806082350426243543E-15p20 + 9.3933751564839046422E-16p20*I, 2.2446640552892054531E-14p20 + 6.7556982533497787410E-15p20*I, 8.8476148879090138477E-16p20 - 1.3826028271385706631E-15p20*I, -6.9638502050387712794E-14p20 - 3.4006650390761916994E-14p20*I, 4.0174151982527717131E-13p20 - 2.0017736518948905933E-14p20*I, -5.2795521249514466705p20 - 7.1695816330260425664E-15p20*I, 4.5380368842058704804E-13p20 - 2.8684267621196211928E-14p20*I, -3.8967508148197993467E-13p20 - 4.1785006207331002598E-13p20*I, 9.3636367106200713017E-13p20 - 2.6506110538870517046E-14p20*I, -2.6041552269630285910E-13p20 + 1.5081335736721965951E-12p20*I, -2.6990840660580384114E-12p20 + 4.7094832984003083542E-13p20*I, -22.649793904755934232p20 - 2.6394245946845251716E-12p20*I, 1.6143653037634098091E-11p20 - 2.6457958409885004580E-13p20*I, -2.5475091654236781125E-11p20 + 1.8568055828381254194E-11p20*I, -4.2707145084903627708E-11p20 + 1.8787950287603525507E-12p20*I, 9.3200313691144988371E-11p20 - 5.1564834848232113168E-11p20*I, -5.5278357423155927153E-10p20 + 1.3578387403985394538E-11p20*I, 10.902283264753105087p20 + 1.9604609608812428694E-10p20*I, -1.3454897597686915969E-9p20 + 4.9385693394613579699E-11p20*I, 2.2177003716128331368E-9p20 - 7.1954824630386412089E-10p20*I, 1.3130039088317738138E-9p20 - 9.7748304215368106429E-11p20*I, -4.0024996437841575680E-9p20 + 1.5798340684906853580E-9p20*I, 3.6886007325962182762E-8p20 - 1.4842446015661081397E-9p20*I, -31.748764582612436169p20 - 9.6205357126167971062E-9p20*I, 5.6281279123488250904E-8p20 - 2.8173230674725783552E-9p20*I, -1.2271734456273473285E-7p20 + 2.7962942297614368226E-8p20*I, -3.6190678971280854787E-8p20 + 7.0487729538238892528E-9p20*I, 1.1555029945316307519E-7p20 - 4.4996564004490355749E-8p20*I, -1.7769875587873959662E-6p20 + 8.4825625806967135025E-8p20*I, 11.225518618563703983p20 + 4.2347467609333910117E-7p20*I, -1.7130018442137757290E-6p20 + 1.0766075043847165432E-7p20*I, 6.3367116016359217173E-6p20 - 1.2049837034668525520E-6p20*I, 9.8300416401068957395E-7p20 - 5.3559585677977070367E-7p20*I, -2.0097719490537522928E-6p20 + 1.2701210078953811583E-6p20*I, 7.7829020405985023870E-5p20 - 4.1972563995813224691E-6p20*I, -22.380851052407516198p20 - 1.8647646853624496644E-5p20*I, 2.4417791737494460788E-5p20 - 1.9002221205250357204E-6p20*I, -0.00032717879976331765493p20 + 6.1555987333750878982E-5p20*I, -3.1130332424123528540E-5p20 + 3.7634748964689752491E-5p20*I, -3.1309729344351116317E-5p20 - 5.0331121868433601331E-5p20*I, -0.0032866034904848152268p20 + 0.00019829619639619749569p20*I, 81.634778337330575197p20 + 0.00088812093499058679955p20*I, 0.0018674831522549838712p20 - 0.00014535397276962635474p20*I, 0.017005027973952745743p20 - 0.0037030995235492936602p20*I, 0.0012886389122237243378p20 - 0.0024042912516239868206p20*I, 0.0053751367506983466693p20 + 0.0038624096578855187918p20*I, 0.13547559277494643280p20 - 0.0091540404236672227303p20*I, 154.98735016454162573p20 - 0.048338285087704609242p20*I, -0.23988382546337956114p20 + 0.021144692751642861131p20*I, -0.87054267930093271670p20 + 0.24432668868349133529p20*I, -0.062786797612988885385p20 + 0.13847593030574914283p20*I, -0.34313243659608975511p20 - 0.38264927029254684694p20*I, -5.2964847628760191475p20 + 0.40506527368928983719p20*I, -72.177251816462811330p20 + 3.0191456166198862848p20*I, 17.716172449798968122p20 - 1.6829733776269620970p20*I, 41.155480882946578371p20 - 16.339054415577110236p20*I, 3.5743759394121354315p20 - 6.7925830044053795669p20*I, 17.131333213831833637p20 + 36.551433955830504471p20*I, 168.95213972824221755p20 - 15.453662431323101650p20*I, -376.10774015172987370p20 - 208.28025300121645261p20*I, -901.09566701850672452p20 + 87.595352073203821759p20*I, -1386.7068842369885708p20 + 1025.3629928615327823p20*I, -339.04267944968749605p20 + 208.18620403289751790p20*I, -1025.1834164443751273p20 - 3227.7700577420027036p20*I, -150.02856481044809080p20 + 270.26986447882028210p20*I, 3871.5430077025427006p20 + 15237.670592073622121p20*I, -670.22134246411875597p20 + 1190.7162498293593422p20*I, -50993.467475281412952p20 - 49983.832988804502720p20*I, 47426.906369944149909p20 + 11753.797857798587709p20*I ]));
Append(~expansions, Ser!([ ComplexField(20) | -33.970562748476944306p20 - 3.3452172035577411313E-14p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, -5.2310250315407147426E-13p20 + 6.7852140057814494534E-14p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, 179.34935674451808335p20 + 7.7677702594800002167E-13p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, 1.7311447414458669414E-11p20 - 8.0222699143372988573E-13p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, 769.42624508131899247p20 - 2.0587358640772324136E-11p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, -3.9317353192624970859E-10p20 + 1.8559405314672039466E-11p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, -370.35669773217155212p20 + 6.7665388114694635657E-10p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, 7.3664285435426357651E-10p20 - 1.2794941783595553675E-9p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, 1078.5233989490871075p20 - 2.5811708520562248736E-8p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, 6.8212030029934922482E-7p20 + 7.3917400650411885232E-8p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, -381.33717307768536363p20 + 1.0848242530687307594E-6p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, -4.9605427029024429242E-5p20 - 4.0155351809989178746E-6p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, 760.28995253232040695p20 - 4.8669132217763746637E-5p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, 0.0026377031517801075022p20 + 0.00021748813800304611296p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, -2773.1802803590235981p20 + 0.0022305264479637772201p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, -0.12392354334898274953p20 - 0.011914023362810538705p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, -5265.0474553253162907p20 - 0.10204067302623788180p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, 5.4648221121327304334p20 + 0.64750435623318955219p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, 2470.6891753614468661p20 + 4.6090793509582916108p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, -233.49202793972537953p20 - 34.970303826610246974p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, 11863.856083971935712p20 - 203.42968980017460142p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, 9945.7855448137405008p20 + 1858.7990749213442791p20*I, 0.00000000000000000000p20, 0.00000000000000000000p20, -330071.52207155306506p20 + 8570.2372226348003322p20*I ]));
Append(~s`BelyiDBPowserBases, expansions);

/*
Return for eval
*/

return s;
