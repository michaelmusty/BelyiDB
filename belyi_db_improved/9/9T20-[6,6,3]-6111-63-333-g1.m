s := BelyiDBInitialize();

/*
Basic Information about the Passport
*/

s`BelyiDBName := "9T20-[6,6,3]-6111-63-333-g1";
s`BelyiDBFilename := "9T20-[6,6,3]-6111-63-333-g1.m";
s`BelyiDBDegree := 9;
s`BelyiDBOrders := \[ 6, 6, 3 ];
s`BelyiDBType := "Hyperbolic";
s`BelyiDBGenus := 1;
s`BelyiDBSize := 1;
s`BelyiDBPointedSize := 1;
s`BelyiDBPermutationTriple := [ PermutationGroup<9 |  
\[ 2, 9, 3, 4, 5, 6, 7, 8, 1 ],
\[ 4, 5, 6, 7, 8, 9, 1, 2, 3 ],
\[ 1, 2, 6, 7, 8, 3, 4, 5, 9 ]:
 Order := 162 > |
[ 5, 3, 9, 1, 2, 6, 7, 8, 4 ],
[ 2, 9, 7, 8, 6, 3, 4, 5, 1 ],
[ 7, 8, 1, 2, 9, 5, 3, 4, 6 ]
];
s`BelyiDBAutomorphismGroup := PermutationGroup<9 |  
\[ 9, 1, 5, 3, 4, 8, 6, 7, 2 ]:
 Order := 3 >;
s`BelyiDBPointedAutomorphismGroup := PermutationGroup<9 |  
\[ 9, 1, 5, 3, 4, 8, 6, 7, 2 ]:
 Order := 3 >;
s`BelyiDBMonodromyGroup := PermutationGroup<9 |  
\[ 5, 3, 9, 1, 2, 6, 7, 8, 4 ],
\[ 2, 9, 7, 8, 6, 3, 4, 5, 1 ],
\[ 7, 8, 1, 2, 9, 5, 3, 4, 6 ]:
 Order := 162 >;
s`BelyiDBPassport := [ PowerSequence(PermutationGroup<9 |  
\[ 5, 3, 9, 1, 2, 6, 7, 8, 4 ],
\[ 2, 9, 7, 8, 6, 3, 4, 5, 1 ],
\[ 7, 8, 1, 2, 9, 5, 3, 4, 6 ]:
 Order := 162 >) |
[ PermutationGroup<9 |  
\[ 5, 3, 9, 1, 2, 6, 7, 8, 4 ],
\[ 2, 9, 7, 8, 6, 3, 4, 5, 1 ],
\[ 7, 8, 1, 2, 9, 5, 3, 4, 6 ]:
 Order := 162 > |
[ 5, 3, 9, 1, 2, 6, 7, 8, 4 ],
[ 2, 9, 7, 8, 6, 3, 4, 5, 1 ],
[ 7, 8, 1, 2, 9, 5, 3, 4, 6 ]
]
];
s`BelyiDBPointedPassport := [ PowerSequence(PermutationGroup<9 |  
\[ 2, 9, 3, 4, 5, 6, 7, 8, 1 ],
\[ 4, 5, 6, 7, 8, 9, 1, 2, 3 ],
\[ 1, 2, 6, 7, 8, 3, 4, 5, 9 ]:
 Order := 162 >) |
[ PermutationGroup<9 |  
\[ 2, 9, 3, 4, 5, 6, 7, 8, 1 ],
\[ 4, 5, 6, 7, 8, 9, 1, 2, 3 ],
\[ 1, 2, 6, 7, 8, 3, 4, 5, 9 ]:
 Order := 162 > |
[ 5, 3, 9, 1, 2, 6, 7, 8, 4 ],
[ 2, 9, 7, 8, 6, 3, 4, 5, 1 ],
[ 7, 8, 1, 2, 9, 5, 3, 4, 6 ]
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
