s := BelyiDBInitialize();

/*
Basic Information about the Passport
*/

s`BelyiDBName := "8T50-[5,10,10]-5111-521-521-g0";
s`BelyiDBFilename := "8T50-[5,10,10]-5111-521-521-g0.m";
s`BelyiDBDegree := 8;
s`BelyiDBOrders := \[ 5, 10, 10 ];
s`BelyiDBType := "Hyperbolic";
s`BelyiDBGenus := 0;
s`BelyiDBSize := 11;
s`BelyiDBPointedSize := 11;
s`BelyiDBPermutationTriple := [ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 1, 6, 7, 8 ],
[ 6, 3, 2, 4, 7, 5, 8, 1 ],
[ 6, 8, 3, 2, 4, 1, 5, 7 ]
];
s`BelyiDBAutomorphismGroup := PermutationGroup<8 |   >;
s`BelyiDBPointedAutomorphismGroup := PermutationGroup<8 |   >;
s`BelyiDBMonodromyGroup := PermutationGroup<8 |  
\[ 2, 3, 4, 5, 1, 6, 7, 8 ],
\[ 6, 3, 2, 4, 7, 5, 8, 1 ],
\[ 6, 8, 3, 2, 4, 1, 5, 7 ]:
 Order := 40320 >;
s`BelyiDBPassport := [ PowerSequence(PermutationGroup<8 |  
\[ 2, 3, 4, 5, 1, 6, 7, 8 ],
\[ 6, 3, 2, 4, 7, 5, 8, 1 ],
\[ 6, 8, 3, 2, 4, 1, 5, 7 ]:
 Order := 40320 >) |
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 1, 6, 7, 8 ],
\[ 6, 3, 2, 4, 7, 5, 8, 1 ],
\[ 6, 8, 3, 2, 4, 1, 5, 7 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 1, 6, 7, 8 ],
[ 6, 3, 2, 4, 7, 5, 8, 1 ],
[ 6, 8, 3, 2, 4, 1, 5, 7 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 1, 6, 7, 8 ],
\[ 6, 3, 2, 4, 7, 5, 8, 1 ],
\[ 6, 8, 3, 2, 4, 1, 5, 7 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 1, 6, 7, 8 ],
[ 8, 2, 6, 3, 7, 5, 4, 1 ],
[ 6, 8, 2, 4, 7, 3, 5, 1 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 1, 6, 7, 8 ],
\[ 6, 3, 2, 4, 7, 5, 8, 1 ],
\[ 6, 8, 3, 2, 4, 1, 5, 7 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 1, 6, 7, 8 ],
[ 1, 8, 6, 3, 7, 5, 4, 2 ],
[ 6, 1, 8, 4, 7, 3, 5, 2 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 1, 6, 7, 8 ],
\[ 6, 3, 2, 4, 7, 5, 8, 1 ],
\[ 6, 8, 3, 2, 4, 1, 5, 7 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 1, 6, 7, 8 ],
[ 8, 6, 3, 2, 4, 7, 5, 1 ],
[ 7, 8, 4, 3, 5, 2, 6, 1 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 1, 6, 7, 8 ],
\[ 6, 3, 2, 4, 7, 5, 8, 1 ],
\[ 6, 8, 3, 2, 4, 1, 5, 7 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 1, 6, 7, 8 ],
[ 1, 8, 6, 3, 7, 2, 5, 4 ],
[ 7, 1, 6, 4, 8, 3, 5, 2 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 1, 6, 7, 8 ],
\[ 6, 3, 2, 4, 7, 5, 8, 1 ],
\[ 6, 8, 3, 2, 4, 1, 5, 7 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 1, 6, 7, 8 ],
[ 5, 4, 3, 2, 6, 7, 8, 1 ],
[ 1, 8, 4, 3, 2, 5, 6, 7 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 1, 6, 7, 8 ],
\[ 6, 3, 2, 4, 7, 5, 8, 1 ],
\[ 6, 8, 3, 2, 4, 1, 5, 7 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 1, 6, 7, 8 ],
[ 4, 3, 2, 6, 5, 7, 8, 1 ],
[ 5, 8, 3, 2, 1, 4, 6, 7 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 1, 6, 7, 8 ],
\[ 6, 3, 2, 4, 7, 5, 8, 1 ],
\[ 6, 8, 3, 2, 4, 1, 5, 7 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 1, 6, 7, 8 ],
[ 2, 1, 5, 4, 6, 7, 8, 3 ],
[ 3, 2, 1, 8, 4, 5, 6, 7 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 1, 6, 7, 8 ],
\[ 6, 3, 2, 4, 7, 5, 8, 1 ],
\[ 6, 8, 3, 2, 4, 1, 5, 7 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 1, 6, 7, 8 ],
[ 1, 5, 6, 7, 4, 3, 8, 2 ],
[ 2, 1, 8, 6, 5, 3, 4, 7 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 1, 6, 7, 8 ],
\[ 6, 3, 2, 4, 7, 5, 8, 1 ],
\[ 6, 8, 3, 2, 4, 1, 5, 7 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 1, 6, 7, 8 ],
[ 6, 2, 4, 3, 7, 5, 8, 1 ],
[ 6, 8, 2, 4, 3, 1, 5, 7 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 1, 6, 7, 8 ],
\[ 6, 3, 2, 4, 7, 5, 8, 1 ],
\[ 6, 8, 3, 2, 4, 1, 5, 7 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 1, 6, 7, 8 ],
[ 5, 2, 8, 7, 6, 4, 1, 3 ],
[ 1, 7, 2, 8, 6, 5, 4, 3 ]
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
[ 2, 3, 4, 5, 1, 6, 7, 8 ],
[ 6, 3, 2, 4, 7, 5, 8, 1 ],
[ 6, 8, 3, 2, 4, 1, 5, 7 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 1, 6, 7, 8 ],
[ 8, 2, 6, 3, 7, 5, 4, 1 ],
[ 6, 8, 2, 4, 7, 3, 5, 1 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 1, 6, 7, 8 ],
[ 1, 8, 6, 3, 7, 5, 4, 2 ],
[ 6, 1, 8, 4, 7, 3, 5, 2 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 1, 6, 7, 8 ],
[ 8, 6, 3, 2, 4, 7, 5, 1 ],
[ 7, 8, 4, 3, 5, 2, 6, 1 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 1, 6, 7, 8 ],
[ 1, 8, 6, 3, 7, 2, 5, 4 ],
[ 7, 1, 6, 4, 8, 3, 5, 2 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 1, 6, 7, 8 ],
[ 5, 4, 3, 2, 6, 7, 8, 1 ],
[ 1, 8, 4, 3, 2, 5, 6, 7 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 1, 6, 7, 8 ],
[ 4, 3, 2, 6, 5, 7, 8, 1 ],
[ 5, 8, 3, 2, 1, 4, 6, 7 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 1, 6, 7, 8 ],
[ 2, 1, 5, 4, 6, 7, 8, 3 ],
[ 3, 2, 1, 8, 4, 5, 6, 7 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 1, 6, 7, 8 ],
[ 4, 8, 7, 3, 5, 1, 6, 2 ],
[ 5, 6, 8, 4, 1, 7, 3, 2 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 1, 6, 7, 8 ],
[ 6, 2, 4, 3, 7, 5, 8, 1 ],
[ 6, 8, 2, 4, 3, 1, 5, 7 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 3, 4, 5, 1, 6, 7, 8 ],
[ 5, 2, 8, 7, 6, 4, 1, 3 ],
[ 1, 7, 2, 8, 6, 5, 4, 3 ]
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
