/* SETTINGS */

// 50 attempts @ prec=35, precNewton=300
// 28 success
// 18 blows up
// 4 Newton fails

load "config.m";
s := BelyiDBRead("8T48-[7,3,4]-71-3311-44-g1.m");
Gammas := BelyiDBToGammas(s);
time X, phi := BelyiMap(Gammas[8] : prec := 35, precNewton := 300);
K<nu> := BaseField(X);
