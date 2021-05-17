s := BelyiDBInitialize();

/*
Basic Information about the Passport
*/

s`BelyiDBName := "9T32-[9,3,6]-9-333-621-g2";
s`BelyiDBFilename := "9T32-[9,3,6]-9-333-621-g2.m";
s`BelyiDBDegree := 9;
s`BelyiDBOrders := \[ 9, 3, 6 ];
s`BelyiDBType := "Hyperbolic";
s`BelyiDBGenus := 2;
s`BelyiDBSize := 8;
s`BelyiDBPointedSize := 8;
s`BelyiDBPermutationTriple := [ PermutationGroup<9 |  
\[ 9, 3, 2, 5, 4, 7, 6, 8, 1 ],
\[ 2, 4, 6, 3, 1, 7, 5, 8, 9 ],
\[ 1, 5, 6, 7, 2, 3, 4, 9, 8 ],
\[ 1, 4, 5, 6, 7, 2, 3, 8, 9 ]:
 Order := 1512 > |
[ 9, 6, 2, 5, 3, 8, 4, 1, 7 ],
[ 2, 8, 4, 5, 3, 7, 9, 1, 6 ],
[ 2, 5, 4, 6, 3, 1, 7, 9, 8 ]
];
s`BelyiDBAutomorphismGroup := PermutationGroup<9 |   >;
s`BelyiDBPointedAutomorphismGroup := PermutationGroup<9 |   >;
s`BelyiDBMonodromyGroup := PermutationGroup<9 |  
\[ 9, 6, 2, 5, 3, 8, 4, 1, 7 ],
\[ 2, 8, 4, 5, 3, 7, 9, 1, 6 ],
\[ 2, 5, 4, 6, 3, 1, 7, 9, 8 ]:
 Order := 1512 >;
s`BelyiDBPassport := [ PowerSequence(PermutationGroup<9 |  
\[ 9, 6, 2, 5, 3, 8, 4, 1, 7 ],
\[ 2, 8, 4, 5, 3, 7, 9, 1, 6 ],
\[ 2, 5, 4, 6, 3, 1, 7, 9, 8 ]:
 Order := 1512 >) |
[ PermutationGroup<9 |  
\[ 9, 6, 2, 5, 3, 8, 4, 1, 7 ],
\[ 2, 8, 4, 5, 3, 7, 9, 1, 6 ],
\[ 2, 5, 4, 6, 3, 1, 7, 9, 8 ]:
 Order := 1512 > |
[ 8, 3, 5, 7, 4, 2, 9, 6, 1 ],
[ 6, 3, 5, 8, 2, 9, 4, 7, 1 ],
[ 6, 1, 5, 3, 2, 4, 7, 9, 8 ]
],
[ PermutationGroup<9 |  
\[ 9, 6, 2, 5, 3, 8, 4, 1, 7 ],
\[ 2, 8, 4, 5, 3, 7, 9, 1, 6 ],
\[ 2, 5, 4, 6, 3, 1, 7, 9, 8 ]:
 Order := 1512 > |
[ 8, 3, 5, 7, 4, 2, 9, 6, 1 ],
[ 6, 4, 9, 5, 2, 7, 1, 3, 8 ],
[ 3, 1, 5, 4, 8, 9, 2, 7, 6 ]
],
[ PermutationGroup<9 |  
\[ 9, 6, 2, 5, 3, 8, 4, 1, 7 ],
\[ 2, 8, 4, 5, 3, 7, 9, 1, 6 ],
\[ 2, 5, 4, 6, 3, 1, 7, 9, 8 ]:
 Order := 1512 > |
[ 8, 3, 5, 7, 4, 2, 9, 6, 1 ],
[ 8, 7, 6, 2, 1, 9, 4, 5, 3 ],
[ 6, 3, 4, 8, 9, 1, 7, 5, 2 ]
],
[ PermutationGroup<9 |  
\[ 9, 6, 2, 5, 3, 8, 4, 1, 7 ],
\[ 2, 8, 4, 5, 3, 7, 9, 1, 6 ],
\[ 2, 5, 4, 6, 3, 1, 7, 9, 8 ]:
 Order := 1512 > |
[ 8, 3, 5, 7, 4, 2, 9, 6, 1 ],
[ 8, 9, 2, 1, 7, 5, 6, 4, 3 ],
[ 2, 7, 3, 6, 9, 1, 8, 4, 5 ]
],
[ PermutationGroup<9 |  
\[ 9, 6, 2, 5, 3, 8, 4, 1, 7 ],
\[ 2, 8, 4, 5, 3, 7, 9, 1, 6 ],
\[ 2, 5, 4, 6, 3, 1, 7, 9, 8 ]:
 Order := 1512 > |
[ 6, 5, 4, 9, 7, 3, 1, 2, 8 ],
[ 5, 6, 2, 1, 4, 3, 8, 9, 7 ],
[ 9, 7, 2, 6, 3, 4, 1, 8, 5 ]
],
[ PermutationGroup<9 |  
\[ 9, 6, 2, 5, 3, 8, 4, 1, 7 ],
\[ 2, 8, 4, 5, 3, 7, 9, 1, 6 ],
\[ 2, 5, 4, 6, 3, 1, 7, 9, 8 ]:
 Order := 1512 > |
[ 6, 5, 4, 9, 7, 3, 1, 2, 8 ],
[ 4, 8, 9, 7, 3, 2, 1, 6, 5 ],
[ 4, 2, 8, 5, 6, 7, 9, 3, 1 ]
],
[ PermutationGroup<9 |  
\[ 9, 6, 2, 5, 3, 8, 4, 1, 7 ],
\[ 2, 8, 4, 5, 3, 7, 9, 1, 6 ],
\[ 2, 5, 4, 6, 3, 1, 7, 9, 8 ]:
 Order := 1512 > |
[ 6, 5, 4, 9, 7, 3, 1, 2, 8 ],
[ 3, 1, 2, 7, 8, 4, 6, 9, 5 ],
[ 4, 5, 7, 1, 3, 2, 9, 8, 6 ]
],
[ PermutationGroup<9 |  
\[ 9, 6, 2, 5, 3, 8, 4, 1, 7 ],
\[ 2, 8, 4, 5, 3, 7, 9, 1, 6 ],
\[ 2, 5, 4, 6, 3, 1, 7, 9, 8 ]:
 Order := 1512 > |
[ 6, 5, 4, 9, 7, 3, 1, 2, 8 ],
[ 2, 7, 6, 9, 3, 5, 1, 4, 8 ],
[ 2, 9, 3, 5, 1, 7, 6, 4, 8 ]
]
];
s`BelyiDBPointedPassport := [ PowerSequence(PermutationGroup<9 |  
\[ 9, 3, 2, 5, 4, 7, 6, 8, 1 ],
\[ 2, 4, 6, 3, 1, 7, 5, 8, 9 ],
\[ 1, 5, 6, 7, 2, 3, 4, 9, 8 ],
\[ 1, 4, 5, 6, 7, 2, 3, 8, 9 ]:
 Order := 1512 >) |
[ PermutationGroup<9 |  
\[ 9, 3, 2, 5, 4, 7, 6, 8, 1 ],
\[ 2, 4, 6, 3, 1, 7, 5, 8, 9 ],
\[ 1, 5, 6, 7, 2, 3, 4, 9, 8 ],
\[ 1, 4, 5, 6, 7, 2, 3, 8, 9 ]:
 Order := 1512 > |
[ 9, 6, 2, 5, 3, 8, 4, 1, 7 ],
[ 2, 8, 4, 5, 3, 7, 9, 1, 6 ],
[ 2, 5, 4, 6, 3, 1, 7, 9, 8 ]
],
[ PermutationGroup<9 |  
\[ 9, 3, 2, 5, 4, 7, 6, 8, 1 ],
\[ 2, 4, 6, 3, 1, 7, 5, 8, 9 ],
\[ 1, 5, 6, 7, 2, 3, 4, 9, 8 ],
\[ 1, 4, 5, 6, 7, 2, 3, 8, 9 ]:
 Order := 1512 > |
[ 9, 8, 1, 6, 7, 2, 4, 3, 5 ],
[ 4, 3, 9, 8, 6, 7, 5, 1, 2 ],
[ 2, 5, 4, 6, 3, 1, 7, 9, 8 ]
],
[ PermutationGroup<9 |  
\[ 9, 3, 2, 5, 4, 7, 6, 8, 1 ],
\[ 2, 4, 6, 3, 1, 7, 5, 8, 9 ],
\[ 1, 5, 6, 7, 2, 3, 4, 9, 8 ],
\[ 1, 4, 5, 6, 7, 2, 3, 8, 9 ]:
 Order := 1512 > |
[ 2, 9, 1, 8, 7, 3, 6, 5, 4 ],
[ 7, 3, 8, 6, 1, 9, 5, 2, 4 ],
[ 2, 5, 4, 6, 3, 1, 7, 9, 8 ]
],
[ PermutationGroup<9 |  
\[ 9, 3, 2, 5, 4, 7, 6, 8, 1 ],
\[ 2, 4, 6, 3, 1, 7, 5, 8, 9 ],
\[ 1, 5, 6, 7, 2, 3, 4, 9, 8 ],
\[ 1, 4, 5, 6, 7, 2, 3, 8, 9 ]:
 Order := 1512 > |
[ 3, 6, 9, 1, 4, 8, 5, 7, 2 ],
[ 2, 4, 7, 1, 9, 5, 8, 3, 6 ],
[ 2, 5, 4, 6, 3, 1, 7, 9, 8 ]
],
[ PermutationGroup<9 |  
\[ 9, 3, 2, 5, 4, 7, 6, 8, 1 ],
\[ 2, 4, 6, 3, 1, 7, 5, 8, 9 ],
\[ 1, 5, 6, 7, 2, 3, 4, 9, 8 ],
\[ 1, 4, 5, 6, 7, 2, 3, 8, 9 ]:
 Order := 1512 > |
[ 3, 6, 8, 7, 9, 4, 5, 2, 1 ],
[ 8, 7, 6, 2, 1, 9, 4, 5, 3 ],
[ 6, 1, 5, 3, 2, 4, 7, 9, 8 ]
],
[ PermutationGroup<9 |  
\[ 9, 3, 2, 5, 4, 7, 6, 8, 1 ],
\[ 2, 4, 6, 3, 1, 7, 5, 8, 9 ],
\[ 1, 5, 6, 7, 2, 3, 4, 9, 8 ],
\[ 1, 4, 5, 6, 7, 2, 3, 8, 9 ]:
 Order := 1512 > |
[ 5, 6, 7, 2, 8, 3, 9, 4, 1 ],
[ 4, 1, 8, 2, 6, 9, 3, 7, 5 ],
[ 6, 1, 5, 3, 2, 4, 7, 9, 8 ]
],
[ PermutationGroup<9 |  
\[ 9, 3, 2, 5, 4, 7, 6, 8, 1 ],
\[ 2, 4, 6, 3, 1, 7, 5, 8, 9 ],
\[ 1, 5, 6, 7, 2, 3, 4, 9, 8 ],
\[ 1, 4, 5, 6, 7, 2, 3, 8, 9 ]:
 Order := 1512 > |
[ 8, 3, 5, 7, 4, 2, 9, 6, 1 ],
[ 6, 3, 5, 8, 2, 9, 4, 7, 1 ],
[ 6, 1, 5, 3, 2, 4, 7, 9, 8 ]
],
[ PermutationGroup<9 |  
\[ 9, 3, 2, 5, 4, 7, 6, 8, 1 ],
\[ 2, 4, 6, 3, 1, 7, 5, 8, 9 ],
\[ 1, 5, 6, 7, 2, 3, 4, 9, 8 ],
\[ 1, 4, 5, 6, 7, 2, 3, 8, 9 ]:
 Order := 1512 > |
[ 3, 1, 6, 9, 8, 7, 5, 4, 2 ],
[ 9, 7, 8, 3, 1, 2, 6, 4, 5 ],
[ 6, 1, 5, 3, 2, 4, 7, 9, 8 ]
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
