s := BelyiDBInitialize();

/*
Basic Information about the Passport
*/

s`BelyiDBName := "8T50-[8,4,5]-8-422-5111-g1";
s`BelyiDBFilename := "8T50-[8,4,5]-8-422-5111-g1.m";
s`BelyiDBDegree := 8;
s`BelyiDBOrders := \[ 8, 4, 5 ];
s`BelyiDBType := "Hyperbolic";
s`BelyiDBGenus := 1;
s`BelyiDBSize := 13;
s`BelyiDBPointedSize := 13;
s`BelyiDBPermutationTriple := [ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 4, 7, 8, 3, 2, 5, 1, 6 ],
[ 2, 3, 4, 1, 6, 5, 8, 7 ],
[ 8, 6, 3, 4, 5, 7, 1, 2 ]
];
s`BelyiDBAutomorphismGroup := PermutationGroup<8 |   >;
s`BelyiDBPointedAutomorphismGroup := PermutationGroup<8 |   >;
s`BelyiDBMonodromyGroup := PermutationGroup<8 |  
\[ 4, 7, 8, 3, 2, 5, 1, 6 ],
\[ 2, 3, 4, 1, 6, 5, 8, 7 ],
\[ 8, 6, 3, 4, 5, 7, 1, 2 ]:
 Order := 40320 >;
s`BelyiDBPassport := [ PowerSequence(PermutationGroup<8 |  
\[ 4, 7, 8, 3, 2, 5, 1, 6 ],
\[ 2, 3, 4, 1, 6, 5, 8, 7 ],
\[ 8, 6, 3, 4, 5, 7, 1, 2 ]:
 Order := 40320 >) |
[ PermutationGroup<8 |  
\[ 4, 7, 8, 3, 2, 5, 1, 6 ],
\[ 2, 3, 4, 1, 6, 5, 8, 7 ],
\[ 8, 6, 3, 4, 5, 7, 1, 2 ]:
 Order := 40320 > |
[ 8, 1, 2, 3, 4, 5, 6, 7 ],
[ 5, 3, 2, 6, 7, 4, 8, 1 ],
[ 3, 2, 6, 1, 4, 5, 7, 8 ]
],
[ PermutationGroup<8 |  
\[ 4, 7, 8, 3, 2, 5, 1, 6 ],
\[ 2, 3, 4, 1, 6, 5, 8, 7 ],
\[ 8, 6, 3, 4, 5, 7, 1, 2 ]:
 Order := 40320 > |
[ 8, 1, 2, 3, 4, 5, 6, 7 ],
[ 7, 3, 4, 5, 2, 8, 1, 6 ],
[ 5, 2, 3, 4, 8, 1, 6, 7 ]
],
[ PermutationGroup<8 |  
\[ 4, 7, 8, 3, 2, 5, 1, 6 ],
\[ 2, 3, 4, 1, 6, 5, 8, 7 ],
\[ 8, 6, 3, 4, 5, 7, 1, 2 ]:
 Order := 40320 > |
[ 8, 1, 2, 3, 4, 5, 6, 7 ],
[ 2, 4, 8, 5, 1, 7, 6, 3 ],
[ 1, 8, 2, 4, 7, 6, 3, 5 ]
],
[ PermutationGroup<8 |  
\[ 4, 7, 8, 3, 2, 5, 1, 6 ],
\[ 2, 3, 4, 1, 6, 5, 8, 7 ],
\[ 8, 6, 3, 4, 5, 7, 1, 2 ]:
 Order := 40320 > |
[ 8, 1, 2, 3, 4, 5, 6, 7 ],
[ 5, 3, 2, 6, 1, 7, 8, 4 ],
[ 3, 2, 8, 1, 4, 6, 7, 5 ]
],
[ PermutationGroup<8 |  
\[ 4, 7, 8, 3, 2, 5, 1, 6 ],
\[ 2, 3, 4, 1, 6, 5, 8, 7 ],
\[ 8, 6, 3, 4, 5, 7, 1, 2 ]:
 Order := 40320 > |
[ 8, 1, 2, 3, 4, 5, 6, 7 ],
[ 6, 3, 2, 5, 7, 1, 8, 4 ],
[ 3, 2, 8, 4, 1, 5, 7, 6 ]
],
[ PermutationGroup<8 |  
\[ 4, 7, 8, 3, 2, 5, 1, 6 ],
\[ 2, 3, 4, 1, 6, 5, 8, 7 ],
\[ 8, 6, 3, 4, 5, 7, 1, 2 ]:
 Order := 40320 > |
[ 8, 1, 2, 3, 4, 5, 6, 7 ],
[ 2, 1, 4, 5, 7, 8, 3, 6 ],
[ 1, 7, 3, 4, 8, 5, 6, 2 ]
],
[ PermutationGroup<8 |  
\[ 4, 7, 8, 3, 2, 5, 1, 6 ],
\[ 2, 3, 4, 1, 6, 5, 8, 7 ],
\[ 8, 6, 3, 4, 5, 7, 1, 2 ]:
 Order := 40320 > |
[ 8, 1, 2, 3, 4, 5, 6, 7 ],
[ 8, 3, 2, 6, 4, 7, 5, 1 ],
[ 3, 2, 5, 7, 4, 6, 1, 8 ]
],
[ PermutationGroup<8 |  
\[ 4, 7, 8, 3, 2, 5, 1, 6 ],
\[ 2, 3, 4, 1, 6, 5, 8, 7 ],
\[ 8, 6, 3, 4, 5, 7, 1, 2 ]:
 Order := 40320 > |
[ 8, 1, 2, 3, 4, 5, 6, 7 ],
[ 2, 1, 7, 5, 6, 8, 3, 4 ],
[ 1, 7, 8, 4, 5, 3, 6, 2 ]
],
[ PermutationGroup<8 |  
\[ 4, 7, 8, 3, 2, 5, 1, 6 ],
\[ 2, 3, 4, 1, 6, 5, 8, 7 ],
\[ 8, 6, 3, 4, 5, 7, 1, 2 ]:
 Order := 40320 > |
[ 8, 1, 2, 3, 4, 5, 6, 7 ],
[ 2, 1, 4, 8, 6, 5, 3, 7 ],
[ 1, 7, 3, 6, 5, 8, 4, 2 ]
],
[ PermutationGroup<8 |  
\[ 4, 7, 8, 3, 2, 5, 1, 6 ],
\[ 2, 3, 4, 1, 6, 5, 8, 7 ],
\[ 8, 6, 3, 4, 5, 7, 1, 2 ]:
 Order := 40320 > |
[ 8, 1, 2, 3, 4, 5, 6, 7 ],
[ 8, 6, 4, 3, 2, 7, 5, 1 ],
[ 5, 4, 3, 7, 2, 6, 1, 8 ]
],
[ PermutationGroup<8 |  
\[ 4, 7, 8, 3, 2, 5, 1, 6 ],
\[ 2, 3, 4, 1, 6, 5, 8, 7 ],
\[ 8, 6, 3, 4, 5, 7, 1, 2 ]:
 Order := 40320 > |
[ 8, 1, 2, 3, 4, 5, 6, 7 ],
[ 2, 1, 4, 3, 6, 8, 5, 7 ],
[ 1, 4, 3, 7, 5, 8, 6, 2 ]
],
[ PermutationGroup<8 |  
\[ 4, 7, 8, 3, 2, 5, 1, 6 ],
\[ 2, 3, 4, 1, 6, 5, 8, 7 ],
\[ 8, 6, 3, 4, 5, 7, 1, 2 ]:
 Order := 40320 > |
[ 8, 1, 2, 3, 4, 5, 6, 7 ],
[ 2, 1, 4, 8, 3, 7, 6, 5 ],
[ 1, 5, 3, 8, 7, 6, 4, 2 ]
],
[ PermutationGroup<8 |  
\[ 4, 7, 8, 3, 2, 5, 1, 6 ],
\[ 2, 3, 4, 1, 6, 5, 8, 7 ],
\[ 8, 6, 3, 4, 5, 7, 1, 2 ]:
 Order := 40320 > |
[ 8, 1, 2, 3, 4, 5, 6, 7 ],
[ 7, 3, 2, 5, 4, 1, 8, 6 ],
[ 3, 2, 5, 4, 8, 1, 7, 6 ]
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
[ 4, 7, 8, 3, 2, 5, 1, 6 ],
[ 2, 3, 4, 1, 6, 5, 8, 7 ],
[ 8, 6, 3, 4, 5, 7, 1, 2 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 4, 8, 2, 3, 7, 1, 6, 5 ],
[ 2, 3, 4, 1, 6, 5, 8, 7 ],
[ 5, 2, 3, 4, 7, 8, 6, 1 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 4, 6, 8, 3, 7, 5, 1, 2 ],
[ 2, 3, 4, 1, 6, 5, 8, 7 ],
[ 8, 7, 3, 4, 5, 1, 6, 2 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 4, 8, 7, 3, 1, 5, 2, 6 ],
[ 2, 3, 4, 1, 6, 5, 8, 7 ],
[ 6, 8, 3, 4, 5, 7, 2, 1 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 4, 8, 6, 3, 7, 5, 2, 1 ],
[ 2, 3, 4, 1, 6, 5, 8, 7 ],
[ 7, 8, 3, 4, 5, 2, 6, 1 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 3, 1, 7, 2, 6, 4, 8, 5 ],
[ 2, 3, 4, 1, 6, 5, 8, 7 ],
[ 1, 3, 4, 5, 7, 6, 2, 8 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 5, 1, 7, 3, 4, 2, 8, 6 ],
[ 2, 3, 4, 1, 6, 5, 8, 7 ],
[ 1, 5, 3, 6, 4, 7, 2, 8 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 5, 1, 7, 2, 6, 3, 8, 4 ],
[ 2, 3, 4, 1, 6, 5, 8, 7 ],
[ 1, 3, 5, 7, 4, 6, 2, 8 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 3, 7, 2, 1, 6, 4, 8, 5 ],
[ 2, 3, 4, 1, 6, 5, 8, 7 ],
[ 3, 2, 4, 5, 7, 6, 1, 8 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 5, 1, 6, 3, 7, 2, 8, 4 ],
[ 2, 3, 4, 1, 6, 5, 8, 7 ],
[ 1, 5, 3, 7, 4, 2, 6, 8 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 3, 1, 5, 8, 6, 4, 2, 7 ],
[ 2, 3, 4, 1, 6, 5, 8, 7 ],
[ 1, 8, 4, 5, 2, 6, 7, 3 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 5, 7, 2, 1, 6, 3, 8, 4 ],
[ 2, 3, 4, 1, 6, 5, 8, 7 ],
[ 3, 2, 5, 7, 4, 6, 1, 8 ]
],
[ PermutationGroup<8 |  
\[ 2, 3, 4, 5, 6, 7, 8, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8 ]:
 Order := 40320 > |
[ 2, 7, 1, 3, 6, 4, 8, 5 ],
[ 2, 3, 4, 1, 6, 5, 8, 7 ],
[ 2, 4, 3, 5, 7, 6, 1, 8 ]
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
