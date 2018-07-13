load "config.m";
s := BelyiDBRead("8T48-[7,3,4]-71-3311-44-g1.m");
Gammas := BelyiDBToGammas(s);
prec := 40;
time X,phi := BelyiMap(Gammas[8] : prec := prec);
