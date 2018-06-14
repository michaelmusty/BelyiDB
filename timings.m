load "config.m";
SetDebugOnError(true);

// i=1 : prec=20, precNewton=1000
// time=6.68s
// (1, 9, 5, 8, 3)(2, 7)(4, 6),
// (1, 6, 9)(2, 3, 7)(4, 8, 5),
// (1, 2, 3, 4)(5, 6)

// i := 2;

// i := 3 : prec=30, precNewton=1000
// time=22.73s
// (1, 4, 6, 2, 7, 5, 3),
// (1, 2, 3)(4, 5)(6, 7),
// (1, 2, 7)(3, 4)(5, 6)

// i := 4 : prec=40, precNewton=1500
// time=167.95
// (1, 2, 3, 4, 5)(6, 7),
// (1, 7, 2, 3, 4)(5, 6),
// (1, 6)(2, 4)(3, 7, 5)

// i := 5 : prec=20, precNewton=1500, DegreeBound=8
// time=9.83s
// time= 348.92s without degreebound
// (1, 5, 6, 4, 2, 7, 3),
// (1, 2, 3, 4)(5, 6),
// (1, 2, 3, 7)(4, 5)

// i := 6 : prec=


i := 6;
prec := 20;
precNewton := 1000;

objs := [];
Append(~objs, BelyiDBRead("9T33-[10,3,4]-522-333-42111-g0.m"));
Append(~objs, BelyiDBRead("9T34-[14,4,4]-72-42111-4221-g0.m"));
Append(~objs, BelyiDBRead("7T6-[7,6,6]-7-322-322-g1.m"));
Append(~objs, BelyiDBRead("7T7-[10,10,6]-52-52-322-g1.m"));
Append(~objs, BelyiDBRead("7T6-[7,4,4]-7-421-421-g1.m"));
Append(~objs, BelyiDBRead("7T5-[7,7,3]-7-7-331-g2.m"));
Append(~objs, BelyiDBRead("7T6-[7,7,5]-7-7-511-g2.m"));

s := objs[i];
Gammas := BelyiDBToGammas(s);
time BelyiMap(Gammas[1] : prec := prec, precNewton := precNewton, DegreeBound := 2);
