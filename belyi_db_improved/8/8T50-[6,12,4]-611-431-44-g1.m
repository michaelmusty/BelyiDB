s := BelyiDBInitialize();

/*
Basic Information about the Passport
*/

s`BelyiDBName := "8T50-[6,12,4]-611-431-44-g1";
s`BelyiDBFilename := "8T50-[6,12,4]-611-431-44-g1.m";
s`BelyiDBDegree := 8;
s`BelyiDBOrders := \[ 6, 12, 4 ];
s`BelyiDBType := "Hyperbolic";
s`BelyiDBGenus := 1;
s`BelyiDBSize := 18;
s`BelyiDBPointedSize := 18;
s`BelyiDBPermutationTriple := [ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 3, 7, 4, 1, 5, 8, 6, 2 ],
[ 7, 4, 8, 1, 3, 5, 2, 6 ]
];
s`BelyiDBAutomorphismGroup := PermutationGroup<8 |   >;
s`BelyiDBPointedAutomorphismGroup := PermutationGroup<8 |   >;
s`BelyiDBMonodromyGroup := PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 1, 7, 8 ],
\[ 3, 7, 4, 1, 5, 8, 6, 2 ],
\[ 7, 4, 8, 1, 3, 5, 2, 6 ]:
 Order := 40320 >;
s`BelyiDBPassport := [ PowerSequence(PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 1, 7, 8 ],
\[ 3, 7, 4, 1, 5, 8, 6, 2 ],
\[ 7, 4, 8, 1, 3, 5, 2, 6 ]:
 Order := 40320 >) |
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 1, 7, 8 ],
\[ 3, 7, 4, 1, 5, 8, 6, 2 ],
\[ 7, 4, 8, 1, 3, 5, 2, 6 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 3, 7, 4, 1, 5, 8, 6, 2 ],
[ 7, 4, 8, 1, 3, 5, 2, 6 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 1, 7, 8 ],
\[ 3, 7, 4, 1, 5, 8, 6, 2 ],
\[ 7, 4, 8, 1, 3, 5, 2, 6 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 5, 3, 7, 4, 8, 2, 6, 1 ],
[ 7, 8, 6, 2, 4, 1, 3, 5 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 1, 7, 8 ],
\[ 3, 7, 4, 1, 5, 8, 6, 2 ],
\[ 7, 4, 8, 1, 3, 5, 2, 6 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 3, 5, 8, 4, 7, 2, 6, 1 ],
[ 7, 8, 6, 1, 4, 2, 5, 3 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 1, 7, 8 ],
\[ 3, 7, 4, 1, 5, 8, 6, 2 ],
\[ 7, 4, 8, 1, 3, 5, 2, 6 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 5, 3, 6, 4, 8, 7, 2, 1 ],
[ 3, 8, 7, 2, 4, 1, 6, 5 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 1, 7, 8 ],
\[ 3, 7, 4, 1, 5, 8, 6, 2 ],
\[ 7, 4, 8, 1, 3, 5, 2, 6 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 1, 5, 7, 2, 6, 4, 8, 3 ],
[ 5, 1, 4, 8, 6, 2, 3, 7 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 1, 7, 8 ],
\[ 3, 7, 4, 1, 5, 8, 6, 2 ],
\[ 7, 4, 8, 1, 3, 5, 2, 6 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 1, 3, 6, 2, 7, 4, 8, 5 ],
[ 3, 1, 4, 2, 6, 8, 5, 7 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 1, 7, 8 ],
\[ 3, 7, 4, 1, 5, 8, 6, 2 ],
\[ 7, 4, 8, 1, 3, 5, 2, 6 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 4, 5, 7, 2, 1, 6, 8, 3 ],
[ 6, 5, 4, 8, 1, 2, 3, 7 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 1, 7, 8 ],
\[ 3, 7, 4, 1, 5, 8, 6, 2 ],
\[ 7, 4, 8, 1, 3, 5, 2, 6 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 5, 2, 4, 6, 7, 8, 1, 3 ],
[ 4, 7, 2, 8, 3, 1, 5, 6 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 1, 7, 8 ],
\[ 3, 7, 4, 1, 5, 8, 6, 2 ],
\[ 7, 4, 8, 1, 3, 5, 2, 6 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 4, 3, 5, 7, 2, 6, 8, 1 ],
[ 6, 8, 5, 2, 1, 3, 4, 7 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 1, 7, 8 ],
\[ 3, 7, 4, 1, 5, 8, 6, 2 ],
\[ 7, 4, 8, 1, 3, 5, 2, 6 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 4, 2, 5, 6, 7, 8, 3, 1 ],
[ 4, 8, 2, 7, 1, 3, 5, 6 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 1, 7, 8 ],
\[ 3, 7, 4, 1, 5, 8, 6, 2 ],
\[ 7, 4, 8, 1, 3, 5, 2, 6 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 1, 4, 8, 6, 3, 7, 2, 5 ],
[ 4, 1, 7, 5, 2, 8, 6, 3 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 1, 7, 8 ],
\[ 3, 7, 4, 1, 5, 8, 6, 2 ],
\[ 7, 4, 8, 1, 3, 5, 2, 6 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 7, 3, 4, 2, 1, 6, 8, 5 ],
[ 6, 5, 4, 2, 3, 8, 1, 7 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 1, 7, 8 ],
\[ 3, 7, 4, 1, 5, 8, 6, 2 ],
\[ 7, 4, 8, 1, 3, 5, 2, 6 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 3, 6, 5, 4, 1, 7, 8, 2 ],
[ 2, 5, 8, 1, 4, 3, 6, 7 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 1, 7, 8 ],
\[ 3, 7, 4, 1, 5, 8, 6, 2 ],
\[ 7, 4, 8, 1, 3, 5, 2, 6 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 4, 8, 3, 5, 1, 7, 2, 6 ],
[ 8, 5, 7, 3, 1, 4, 6, 2 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 1, 7, 8 ],
\[ 3, 7, 4, 1, 5, 8, 6, 2 ],
\[ 7, 4, 8, 1, 3, 5, 2, 6 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 3, 5, 4, 1, 7, 6, 8, 2 ],
[ 6, 4, 8, 1, 3, 2, 5, 7 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 1, 7, 8 ],
\[ 3, 7, 4, 1, 5, 8, 6, 2 ],
\[ 7, 4, 8, 1, 3, 5, 2, 6 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 4, 6, 3, 5, 8, 7, 2, 1 ],
[ 2, 8, 7, 3, 1, 4, 6, 5 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 1, 7, 8 ],
\[ 3, 7, 4, 1, 5, 8, 6, 2 ],
\[ 7, 4, 8, 1, 3, 5, 2, 6 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 8, 2, 5, 1, 7, 3, 6, 4 ],
[ 7, 4, 2, 6, 8, 3, 5, 1 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 1, 7, 8 ],
\[ 3, 7, 4, 1, 5, 8, 6, 2 ],
\[ 7, 4, 8, 1, 3, 5, 2, 6 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 4, 7, 5, 8, 2, 6, 3, 1 ],
[ 6, 8, 5, 7, 1, 3, 2, 4 ]
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
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 3, 7, 4, 1, 5, 8, 6, 2 ],
[ 7, 4, 8, 1, 3, 5, 2, 6 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 5, 3, 7, 4, 8, 2, 6, 1 ],
[ 7, 8, 6, 2, 4, 1, 3, 5 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 3, 5, 8, 4, 7, 2, 6, 1 ],
[ 7, 8, 6, 1, 4, 2, 5, 3 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 5, 3, 6, 4, 8, 7, 2, 1 ],
[ 3, 8, 7, 2, 4, 1, 6, 5 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 1, 5, 7, 2, 6, 4, 8, 3 ],
[ 5, 1, 4, 8, 6, 2, 3, 7 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 1, 3, 6, 2, 7, 4, 8, 5 ],
[ 3, 1, 4, 2, 6, 8, 5, 7 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 4, 5, 7, 2, 1, 6, 8, 3 ],
[ 6, 5, 4, 8, 1, 2, 3, 7 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 5, 2, 4, 6, 7, 8, 1, 3 ],
[ 4, 7, 2, 8, 3, 1, 5, 6 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 4, 3, 5, 7, 2, 6, 8, 1 ],
[ 6, 8, 5, 2, 1, 3, 4, 7 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 4, 2, 5, 6, 7, 8, 3, 1 ],
[ 4, 8, 2, 7, 1, 3, 5, 6 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 8, 2, 5, 7, 1, 4, 6, 3 ],
[ 7, 5, 2, 8, 6, 3, 4, 1 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 7, 3, 4, 2, 1, 6, 8, 5 ],
[ 6, 5, 4, 2, 3, 8, 1, 7 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 3, 6, 5, 4, 1, 7, 8, 2 ],
[ 2, 5, 8, 1, 4, 3, 6, 7 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 4, 8, 3, 5, 1, 7, 2, 6 ],
[ 8, 5, 7, 3, 1, 4, 6, 2 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 3, 5, 4, 1, 7, 6, 8, 2 ],
[ 6, 4, 8, 1, 3, 2, 5, 7 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 4, 6, 3, 5, 8, 7, 2, 1 ],
[ 2, 8, 7, 3, 1, 4, 6, 5 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 1, 4, 6, 8, 2, 7, 3, 5 ],
[ 3, 1, 5, 7, 2, 8, 6, 4 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 6, 1, 7, 8 ],
[ 4, 7, 5, 8, 2, 6, 3, 1 ],
[ 6, 8, 5, 7, 1, 3, 2, 4 ]
]
];

/*
Base Field Data
*/


/*
Belyi Maps
*/


/*
Powser Bases
*/


/*
Return for eval
*/

return s;
