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
sIn;
Gammas := BelyiDBToGammas(sIn);
for Gamma in Gammas do
  try 
    X, phi := BelyiMap(Gamma : prec := 30);
  catch e
    if "smaller m" in e`Object then
      m0 := #PassportRepresentatives(DefiningPermutation(Gamma) : Pointed := true);
      for m := m0-1 to 1 by -1 do
        try 
          X, phi := BelyiMap(Gamma : prec := 30, DegreeBound := m);
        catch e;
        end try;
        if assigned Gamma`TriangleBelyiCurve then assert BelyiMapSanityCheck(Gamma); break; end if;
      end for;
    end if;
  end try;
end for;

sOut := GammasToBelyiDB(Gammas); BelyiDBWrite(sOut);
