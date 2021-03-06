s := BelyiDBInitialize();

/*
Basic Information about the Passport
*/

s`BelyiDBName := "9T33-[7,15,3]-711-531-333-g1";
s`BelyiDBFilename := "9T33-[7,15,3]-711-531-333-g1.m";
s`BelyiDBDegree := 9;
s`BelyiDBOrders := \[ 7, 15, 3 ];
s`BelyiDBType := "Hyperbolic";
s`BelyiDBGenus := 1;
s`BelyiDBSize := 20;
s`BelyiDBPointedSize := 20;
s`BelyiDBPermutationTriple := [ PermutationGroup<9 |  
\[ 1, 2, 4, 5, 6, 7, 8, 9, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8, 9 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 4, 8, 5, 2, 6, 3, 7, 9, 1 ],
[ 7, 9, 4, 6, 1, 3, 5, 2, 8 ]
];
s`BelyiDBAutomorphismGroup := PermutationGroup<9 |   >;
s`BelyiDBPointedAutomorphismGroup := PermutationGroup<9 |   >;
s`BelyiDBMonodromyGroup := PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
\[ 4, 8, 5, 2, 6, 3, 7, 9, 1 ],
\[ 7, 9, 4, 6, 1, 3, 5, 2, 8 ]:
 Order := 181440 >;
s`BelyiDBPassport := [ PowerSequence(PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
\[ 4, 8, 5, 2, 6, 3, 7, 9, 1 ],
\[ 7, 9, 4, 6, 1, 3, 5, 2, 8 ]:
 Order := 181440 >) |
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
\[ 4, 8, 5, 2, 6, 3, 7, 9, 1 ],
\[ 7, 9, 4, 6, 1, 3, 5, 2, 8 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 4, 8, 5, 2, 6, 3, 7, 9, 1 ],
[ 7, 9, 4, 6, 1, 3, 5, 2, 8 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
\[ 4, 8, 5, 2, 6, 3, 7, 9, 1 ],
\[ 7, 9, 4, 6, 1, 3, 5, 2, 8 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 6, 8, 3, 5, 7, 2, 4, 9, 1 ],
[ 5, 9, 6, 3, 7, 4, 1, 2, 8 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
\[ 4, 8, 5, 2, 6, 3, 7, 9, 1 ],
\[ 7, 9, 4, 6, 1, 3, 5, 2, 8 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 6, 8, 4, 7, 5, 2, 3, 9, 1 ],
[ 4, 9, 6, 7, 3, 5, 1, 2, 8 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
\[ 4, 8, 5, 2, 6, 3, 7, 9, 1 ],
\[ 7, 9, 4, 6, 1, 3, 5, 2, 8 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 4, 8, 6, 2, 5, 7, 3, 9, 1 ],
[ 6, 9, 4, 7, 1, 5, 3, 2, 8 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
\[ 4, 8, 5, 2, 6, 3, 7, 9, 1 ],
\[ 7, 9, 4, 6, 1, 3, 5, 2, 8 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 9, 4, 5, 7, 8, 6, 2, 1, 3 ],
[ 4, 8, 7, 9, 2, 3, 6, 5, 1 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
\[ 4, 8, 5, 2, 6, 3, 7, 9, 1 ],
\[ 7, 9, 4, 6, 1, 3, 5, 2, 8 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 9, 5, 3, 6, 7, 8, 2, 1, 4 ],
[ 5, 8, 7, 3, 9, 2, 4, 6, 1 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
\[ 4, 8, 5, 2, 6, 3, 7, 9, 1 ],
\[ 7, 9, 4, 6, 1, 3, 5, 2, 8 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 9, 2, 8, 6, 3, 7, 4, 1, 5 ],
[ 6, 8, 2, 5, 7, 9, 4, 3, 1 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
\[ 4, 8, 5, 2, 6, 3, 7, 9, 1 ],
\[ 7, 9, 4, 6, 1, 3, 5, 2, 8 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 1, 9, 4, 6, 8, 3, 5, 2, 7 ],
[ 9, 1, 8, 6, 3, 7, 4, 5, 2 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
\[ 4, 8, 5, 2, 6, 3, 7, 9, 1 ],
\[ 7, 9, 4, 6, 1, 3, 5, 2, 8 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 3, 2, 9, 5, 6, 7, 8, 4, 1 ],
[ 6, 9, 2, 1, 8, 4, 5, 7, 3 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
\[ 4, 8, 5, 2, 6, 3, 7, 9, 1 ],
\[ 7, 9, 4, 6, 1, 3, 5, 2, 8 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 5, 4, 3, 6, 9, 8, 2, 7, 1 ],
[ 8, 9, 7, 3, 2, 1, 4, 6, 5 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
\[ 4, 8, 5, 2, 6, 3, 7, 9, 1 ],
\[ 7, 9, 4, 6, 1, 3, 5, 2, 8 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 8, 9, 3, 5, 7, 2, 1, 4, 6 ],
[ 5, 7, 6, 3, 8, 4, 9, 1, 2 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
\[ 4, 8, 5, 2, 6, 3, 7, 9, 1 ],
\[ 7, 9, 4, 6, 1, 3, 5, 2, 8 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 4, 3, 5, 9, 8, 6, 2, 7, 1 ],
[ 8, 9, 7, 2, 1, 3, 6, 5, 4 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
\[ 4, 8, 5, 2, 6, 3, 7, 9, 1 ],
\[ 7, 9, 4, 6, 1, 3, 5, 2, 8 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 8, 3, 7, 6, 5, 9, 1, 2, 4 ],
[ 3, 7, 8, 2, 9, 5, 4, 1, 6 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
\[ 4, 8, 5, 2, 6, 3, 7, 9, 1 ],
\[ 7, 9, 4, 6, 1, 3, 5, 2, 8 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 8, 2, 6, 5, 7, 9, 1, 4, 3 ],
[ 5, 7, 2, 9, 8, 4, 3, 1, 6 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
\[ 4, 8, 5, 2, 6, 3, 7, 9, 1 ],
\[ 7, 9, 4, 6, 1, 3, 5, 2, 8 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 4, 3, 7, 9, 2, 6, 8, 5, 1 ],
[ 3, 9, 5, 2, 1, 8, 6, 7, 4 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
\[ 4, 8, 5, 2, 6, 3, 7, 9, 1 ],
\[ 7, 9, 4, 6, 1, 3, 5, 2, 8 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 5, 7, 6, 4, 8, 1, 9, 3, 2 ],
[ 2, 6, 9, 8, 4, 1, 3, 5, 7 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
\[ 4, 8, 5, 2, 6, 3, 7, 9, 1 ],
\[ 7, 9, 4, 6, 1, 3, 5, 2, 8 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 4, 3, 6, 9, 5, 7, 8, 2, 1 ],
[ 6, 9, 8, 2, 1, 5, 3, 7, 4 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
\[ 4, 8, 5, 2, 6, 3, 7, 9, 1 ],
\[ 7, 9, 4, 6, 1, 3, 5, 2, 8 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 6, 5, 7, 4, 8, 9, 2, 3, 1 ],
[ 3, 9, 7, 8, 4, 2, 1, 5, 6 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
\[ 4, 8, 5, 2, 6, 3, 7, 9, 1 ],
\[ 7, 9, 4, 6, 1, 3, 5, 2, 8 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 3, 2, 9, 8, 6, 4, 5, 7, 1 ],
[ 8, 9, 2, 1, 6, 7, 5, 4, 3 ]
],
[ PermutationGroup<9 |  
\[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
\[ 4, 8, 5, 2, 6, 3, 7, 9, 1 ],
\[ 7, 9, 4, 6, 1, 3, 5, 2, 8 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 8, 9, 4, 7, 5, 2, 1, 3, 6 ],
[ 4, 7, 6, 8, 3, 5, 9, 1, 2 ]
]
];
s`BelyiDBPointedPassport := [ PowerSequence(PermutationGroup<9 |  
\[ 1, 2, 4, 5, 6, 7, 8, 9, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8, 9 ]:
 Order := 181440 >) |
[ PermutationGroup<9 |  
\[ 1, 2, 4, 5, 6, 7, 8, 9, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8, 9 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 4, 8, 5, 2, 6, 3, 7, 9, 1 ],
[ 7, 9, 4, 6, 1, 3, 5, 2, 8 ]
],
[ PermutationGroup<9 |  
\[ 1, 2, 4, 5, 6, 7, 8, 9, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8, 9 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 6, 8, 3, 5, 7, 2, 4, 9, 1 ],
[ 5, 9, 6, 3, 7, 4, 1, 2, 8 ]
],
[ PermutationGroup<9 |  
\[ 1, 2, 4, 5, 6, 7, 8, 9, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8, 9 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 6, 8, 4, 7, 5, 2, 3, 9, 1 ],
[ 4, 9, 6, 7, 3, 5, 1, 2, 8 ]
],
[ PermutationGroup<9 |  
\[ 1, 2, 4, 5, 6, 7, 8, 9, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8, 9 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 4, 8, 6, 2, 5, 7, 3, 9, 1 ],
[ 6, 9, 4, 7, 1, 5, 3, 2, 8 ]
],
[ PermutationGroup<9 |  
\[ 1, 2, 4, 5, 6, 7, 8, 9, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8, 9 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 9, 4, 5, 7, 8, 6, 2, 1, 3 ],
[ 4, 8, 7, 9, 2, 3, 6, 5, 1 ]
],
[ PermutationGroup<9 |  
\[ 1, 2, 4, 5, 6, 7, 8, 9, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8, 9 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 9, 5, 3, 6, 7, 8, 2, 1, 4 ],
[ 5, 8, 7, 3, 9, 2, 4, 6, 1 ]
],
[ PermutationGroup<9 |  
\[ 1, 2, 4, 5, 6, 7, 8, 9, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8, 9 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 9, 2, 8, 6, 3, 7, 4, 1, 5 ],
[ 6, 8, 2, 5, 7, 9, 4, 3, 1 ]
],
[ PermutationGroup<9 |  
\[ 1, 2, 4, 5, 6, 7, 8, 9, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8, 9 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 1, 9, 4, 6, 8, 3, 5, 2, 7 ],
[ 9, 1, 8, 6, 3, 7, 4, 5, 2 ]
],
[ PermutationGroup<9 |  
\[ 1, 2, 4, 5, 6, 7, 8, 9, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8, 9 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 3, 2, 9, 5, 6, 7, 8, 4, 1 ],
[ 6, 9, 2, 1, 8, 4, 5, 7, 3 ]
],
[ PermutationGroup<9 |  
\[ 1, 2, 4, 5, 6, 7, 8, 9, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8, 9 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 5, 4, 3, 6, 9, 8, 2, 7, 1 ],
[ 8, 9, 7, 3, 2, 1, 4, 6, 5 ]
],
[ PermutationGroup<9 |  
\[ 1, 2, 4, 5, 6, 7, 8, 9, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8, 9 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 8, 9, 3, 5, 7, 2, 1, 4, 6 ],
[ 5, 7, 6, 3, 8, 4, 9, 1, 2 ]
],
[ PermutationGroup<9 |  
\[ 1, 2, 4, 5, 6, 7, 8, 9, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8, 9 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 4, 3, 5, 9, 8, 6, 2, 7, 1 ],
[ 8, 9, 7, 2, 1, 3, 6, 5, 4 ]
],
[ PermutationGroup<9 |  
\[ 1, 2, 4, 5, 6, 7, 8, 9, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8, 9 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 8, 3, 7, 6, 5, 9, 1, 2, 4 ],
[ 3, 7, 8, 2, 9, 5, 4, 1, 6 ]
],
[ PermutationGroup<9 |  
\[ 1, 2, 4, 5, 6, 7, 8, 9, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8, 9 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 8, 2, 6, 5, 7, 9, 1, 4, 3 ],
[ 5, 7, 2, 9, 8, 4, 3, 1, 6 ]
],
[ PermutationGroup<9 |  
\[ 1, 2, 4, 5, 6, 7, 8, 9, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8, 9 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 4, 3, 7, 9, 2, 6, 8, 5, 1 ],
[ 3, 9, 5, 2, 1, 8, 6, 7, 4 ]
],
[ PermutationGroup<9 |  
\[ 1, 2, 4, 5, 6, 7, 8, 9, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8, 9 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 5, 7, 6, 4, 8, 1, 9, 3, 2 ],
[ 2, 6, 9, 8, 4, 1, 3, 5, 7 ]
],
[ PermutationGroup<9 |  
\[ 1, 2, 4, 5, 6, 7, 8, 9, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8, 9 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 4, 3, 6, 9, 5, 7, 8, 2, 1 ],
[ 6, 9, 8, 2, 1, 5, 3, 7, 4 ]
],
[ PermutationGroup<9 |  
\[ 1, 2, 4, 5, 6, 7, 8, 9, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8, 9 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 6, 5, 7, 4, 8, 9, 2, 3, 1 ],
[ 3, 9, 7, 8, 4, 2, 1, 5, 6 ]
],
[ PermutationGroup<9 |  
\[ 1, 2, 4, 5, 6, 7, 8, 9, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8, 9 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 3, 2, 9, 8, 6, 4, 5, 7, 1 ],
[ 8, 9, 2, 1, 6, 7, 5, 4, 3 ]
],
[ PermutationGroup<9 |  
\[ 1, 2, 4, 5, 6, 7, 8, 9, 3 ],
\[ 2, 3, 1, 4, 5, 6, 7, 8, 9 ]:
 Order := 181440 > |
[ 2, 3, 4, 5, 6, 7, 1, 8, 9 ],
[ 8, 9, 4, 7, 5, 2, 1, 3, 6 ],
[ 4, 7, 6, 8, 3, 5, 9, 1, 2 ]
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
