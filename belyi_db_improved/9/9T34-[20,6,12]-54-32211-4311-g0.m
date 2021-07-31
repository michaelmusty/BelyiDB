s := BelyiDBInitialize();

/*
Basic Information about the Passport
*/

s`BelyiDBName := "9T34-[20,6,12]-54-32211-4311-g0";
s`BelyiDBFilename := "9T34-[20,6,12]-54-32211-4311-g0.m";
s`BelyiDBDegree := 9;
s`BelyiDBOrders := \[ 20, 6, 12 ];
s`BelyiDBType := "Hyperbolic";
s`BelyiDBGenus := 0;
s`BelyiDBSize := 25;
s`BelyiDBPointedSize := 25;
s`BelyiDBPermutationTriple := [ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]
];
s`BelyiDBAutomorphismGroup := PermutationGroup<9 |   >;
s`BelyiDBPointedAutomorphismGroup := PermutationGroup<9 |   >;
s`BelyiDBMonodromyGroup := PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 >;
s`BelyiDBPassport := [ PowerSequence(PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 >) |
[ PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 9, 6, 7, 8 ],
[ 3, 9, 1, 4, 5, 7, 8, 6, 2 ],
[ 9, 1, 4, 5, 3, 6, 7, 2, 8 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 9, 6, 7, 8 ],
[ 9, 1, 4, 3, 5, 7, 6, 8, 2 ],
[ 9, 4, 3, 5, 2, 6, 8, 1, 7 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 9, 6, 7, 8 ],
[ 9, 1, 3, 5, 4, 7, 6, 8, 2 ],
[ 9, 3, 5, 4, 2, 6, 8, 1, 7 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 9, 6, 7, 8 ],
[ 8, 1, 4, 3, 5, 7, 6, 2, 9 ],
[ 8, 4, 3, 5, 2, 6, 1, 9, 7 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 9, 6, 7, 8 ],
[ 8, 1, 3, 5, 4, 7, 6, 2, 9 ],
[ 8, 3, 5, 4, 2, 6, 1, 9, 7 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 9, 6, 7, 8 ],
[ 5, 3, 7, 8, 1, 6, 2, 4, 9 ],
[ 7, 2, 8, 1, 5, 3, 4, 9, 6 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 9, 6, 7, 8 ],
[ 5, 7, 4, 8, 1, 6, 2, 3, 9 ],
[ 7, 8, 3, 1, 5, 2, 4, 9, 6 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 9, 6, 7, 8 ],
[ 4, 7, 8, 5, 1, 6, 2, 3, 9 ],
[ 7, 8, 1, 4, 5, 2, 3, 9, 6 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 9, 6, 7, 8 ],
[ 9, 3, 7, 5, 4, 6, 2, 8, 1 ],
[ 7, 2, 5, 4, 9, 3, 8, 1, 6 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 9, 6, 7, 8 ],
[ 9, 7, 4, 3, 1, 6, 2, 8, 5 ],
[ 7, 4, 3, 9, 5, 2, 8, 1, 6 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 9, 6, 7, 8 ],
[ 7, 3, 4, 2, 9, 6, 1, 8, 5 ],
[ 4, 2, 3, 9, 7, 1, 8, 5, 6 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 9, 6, 7, 8 ],
[ 2, 1, 7, 5, 4, 3, 6, 8, 9 ],
[ 1, 6, 5, 4, 2, 3, 8, 9, 7 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 9, 6, 7, 8 ],
[ 6, 7, 3, 5, 4, 1, 8, 2, 9 ],
[ 8, 3, 5, 4, 6, 2, 7, 9, 1 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 9, 6, 7, 8 ],
[ 6, 7, 4, 3, 5, 1, 8, 2, 9 ],
[ 8, 4, 3, 5, 6, 2, 7, 9, 1 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 9, 6, 7, 8 ],
[ 6, 7, 3, 4, 1, 5, 2, 9, 8 ],
[ 7, 3, 4, 6, 5, 2, 9, 8, 1 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 9, 6, 7, 8 ],
[ 6, 3, 7, 4, 5, 1, 2, 9, 8 ],
[ 7, 2, 4, 5, 6, 3, 9, 8, 1 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 9, 6, 7, 8 ],
[ 9, 7, 3, 5, 4, 1, 2, 8, 6 ],
[ 7, 3, 5, 4, 6, 2, 8, 1, 9 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 9, 6, 7, 8 ],
[ 9, 7, 4, 3, 5, 1, 2, 8, 6 ],
[ 7, 4, 3, 5, 6, 2, 8, 1, 9 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 9, 6, 7, 8 ],
[ 7, 3, 2, 9, 5, 4, 1, 8, 6 ],
[ 3, 2, 6, 5, 7, 1, 8, 4, 9 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 9, 6, 7, 8 ],
[ 2, 1, 7, 4, 9, 5, 3, 8, 6 ],
[ 1, 7, 4, 6, 2, 3, 8, 5, 9 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 9, 6, 7, 8 ],
[ 3, 8, 1, 4, 5, 7, 6, 9, 2 ],
[ 9, 1, 4, 5, 3, 6, 2, 8, 7 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 9, 6, 7, 8 ],
[ 2, 1, 7, 4, 6, 5, 8, 3, 9 ],
[ 1, 8, 4, 6, 2, 3, 7, 9, 5 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 9, 6, 7, 8 ],
[ 2, 1, 6, 4, 7, 3, 8, 5, 9 ],
[ 1, 6, 4, 8, 2, 5, 7, 9, 3 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 9, 6, 7, 8 ],
[ 2, 7, 3, 6, 5, 4, 1, 9, 8 ],
[ 1, 3, 6, 5, 7, 2, 9, 8, 4 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
\[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
\[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 9, 6, 7, 8 ],
[ 2, 6, 3, 7, 5, 1, 4, 9, 8 ],
[ 1, 3, 7, 5, 6, 4, 9, 8, 2 ]
]
];
s`BelyiDBPointedPassport := [ PowerSequence(PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 >) |
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 2, 3, 4, 7, 9, 5, 1, 6, 8 ],
[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
[ 7, 9, 1, 4, 5, 8, 3, 2, 6 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 2, 8, 9, 5, 1, 3, 6, 4, 7 ],
[ 2, 3, 1, 5, 4, 7, 6, 8, 9 ],
[ 4, 3, 7, 8, 5, 6, 9, 1, 2 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 2, 4, 7, 5, 9, 8, 6, 3, 1 ],
[ 2, 3, 1, 5, 4, 7, 6, 8, 9 ],
[ 9, 3, 8, 1, 5, 6, 2, 7, 4 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 2, 8, 4, 1, 7, 5, 9, 3, 6 ],
[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
[ 3, 9, 8, 4, 5, 2, 6, 1, 7 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 2, 5, 1, 3, 4, 9, 6, 7, 8 ],
[ 9, 3, 2, 4, 5, 7, 8, 6, 1 ],
[ 2, 9, 4, 5, 3, 6, 7, 1, 8 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 3, 7, 2, 1, 9, 5, 4, 6, 8 ],
[ 2, 3, 1, 5, 4, 7, 6, 8, 9 ],
[ 5, 2, 3, 6, 7, 8, 1, 9, 4 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 3, 1, 6, 9, 2, 5, 8, 4, 7 ],
[ 2, 3, 1, 5, 4, 7, 6, 8, 9 ],
[ 1, 4, 3, 8, 7, 2, 9, 6, 5 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 6, 8, 2, 3, 9, 7, 5, 4, 1 ],
[ 2, 3, 1, 5, 4, 7, 6, 8, 9 ],
[ 9, 2, 5, 8, 6, 3, 7, 1, 4 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 6, 1, 9, 3, 2, 7, 5, 4, 8 ],
[ 2, 3, 1, 5, 4, 7, 6, 8, 9 ],
[ 1, 4, 5, 8, 6, 3, 7, 9, 2 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 9, 1, 6, 2, 3, 7, 5, 4, 8 ],
[ 2, 3, 1, 5, 4, 7, 6, 8, 9 ],
[ 1, 5, 4, 8, 6, 2, 7, 9, 3 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 7, 4, 5, 8, 6, 1, 3, 9, 2 ],
[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
[ 5, 2, 7, 1, 4, 6, 9, 3, 8 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 3, 5, 4, 6, 9, 7, 1, 2, 8 ],
[ 2, 3, 1, 5, 4, 7, 6, 8, 9 ],
[ 6, 8, 3, 2, 1, 5, 7, 9, 4 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 4, 1, 5, 8, 6, 9, 2, 7, 3 ],
[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
[ 1, 7, 2, 9, 4, 6, 8, 3, 5 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 5, 1, 2, 3, 4, 7, 8, 9, 6 ],
[ 8, 3, 2, 5, 4, 6, 7, 9, 1 ],
[ 3, 2, 5, 4, 9, 8, 6, 7, 1 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 8, 7, 1, 9, 3, 5, 4, 6, 2 ],
[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
[ 4, 2, 6, 7, 5, 8, 1, 9, 3 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 7, 5, 2, 9, 8, 4, 6, 3, 1 ],
[ 2, 3, 1, 5, 4, 7, 6, 8, 9 ],
[ 9, 2, 8, 7, 1, 6, 3, 4, 5 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 3, 7, 9, 2, 8, 4, 6, 1, 5 ],
[ 2, 3, 1, 5, 4, 7, 6, 8, 9 ],
[ 8, 5, 3, 7, 9, 6, 1, 4, 2 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 6, 1, 2, 7, 3, 5, 9, 4, 8 ],
[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
[ 1, 4, 6, 8, 5, 9, 3, 2, 7 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 6, 7, 1, 9, 8, 5, 4, 3, 2 ],
[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
[ 4, 2, 8, 7, 5, 9, 1, 6, 3 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 4, 3, 8, 7, 1, 5, 6, 9, 2 ],
[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
[ 6, 2, 1, 9, 5, 7, 3, 4, 8 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 2, 7, 1, 9, 4, 3, 6, 5, 8 ],
[ 8, 3, 2, 5, 4, 6, 7, 9, 1 ],
[ 2, 9, 6, 4, 1, 7, 3, 8, 5 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 3, 9, 6, 5, 1, 4, 8, 2, 7 ],
[ 2, 3, 1, 5, 4, 7, 6, 8, 9 ],
[ 4, 8, 3, 7, 5, 2, 9, 6, 1 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 8, 1, 4, 9, 3, 7, 2, 6, 5 ],
[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
[ 1, 7, 6, 4, 2, 8, 5, 9, 3 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 8, 9, 2, 5, 1, 4, 3, 6, 7 ],
[ 2, 3, 1, 5, 4, 7, 6, 8, 9 ],
[ 4, 2, 6, 7, 5, 8, 9, 3, 1 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
\[ 2, 1, 3, 4, 5, 6, 7, 8, 9 ]:
 Order := 362880 > |
[ 5, 6, 4, 7, 3, 8, 1, 9, 2 ],
[ 2, 9, 4, 3, 6, 5, 7, 8, 1 ],
[ 7, 2, 6, 4, 9, 1, 3, 5, 8 ]
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
