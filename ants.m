load "config.m";
//s := BelyiDBRead("8T48-[7,3,4]-71-3311-44-g1.m");
s := BelyiDBRead("6T15-[5,5,5]-51-51-51-g1.m");
Gammas := BelyiDBToGammas(s);
Gamma := Gammas[1];
prec := 30;
time X,phi := BelyiMap(Gamma : prec := prec, precNewton := 800);
K<nu> := BaseField(X);