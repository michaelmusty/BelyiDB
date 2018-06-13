load "config.m";


// i=1 : prec=20, precNewton=1000
// time=6.68s
// (1, 9, 5, 8, 3)(2, 7)(4, 6),
// (1, 6, 9)(2, 3, 7)(4, 8, 5),
// (1, 2, 3, 4)(5, 6)

// i := 2;


i := 2;
prec := 30;
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
time BelyiMap(Gammas[1] : prec := prec, precNewton := precNewton);
