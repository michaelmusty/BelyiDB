load "config.m";
SetVerbose("Shimura", true);

getnext := function(d);
  objs := BelyiDBGetNotComputed(d,0);
  ms := [m : m in [1..#objs] | objs[m]`BelyiDBType eq "Hyperbolic"];
  if #ms eq 0 then 
    return false; 
  else
    return objs[Random(ms)];
  end if;
end function;

sIn := getnext(8);
Gammas := BelyiDBToGammas(sIn);
for Gamma in Gammas do
  X, phi := BelyiMap(Gamma : prec := 30);
end for;

sOut := GammasToBelyiDB(Gammas); BelyiDBWrite(sOut);
