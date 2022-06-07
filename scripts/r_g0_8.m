load "config.m";
SetVerbose("Shimura", true);

filenames := [ "8T50-[12,12,6]-431-431-3221-g0.m",
"8T50-[15,10,6]-53-521-32111-g0.m",
"8T50-[5,10,10]-5111-521-521-g0.m",
"8T50-[6,10,4]-611-521-4211-g0.m",
"8T50-[7,12,6]-71-431-32111-g0.m",
"8T50-[8,4,6]-8-4211-32111-g0.m" ];

// asg := 1;

sIn := BelyiDBRead(filenames[asg]);
if sIn`BelyiDBPointedSize gt 32 or BelyiMapIsComputed(sIn) then
  print "Already computed or too large degree";
else
  Gammas := BelyiDBToGammas(sIn);
  prec := 30;
  d := Degree(Universe(DefiningPermutation(Gammas[1])));
  m0 := #PassportRepresentatives(DefiningPermutation(Gammas[1]) : Pointed := true);
  precNewton := 200*m0*Round(Log(d));
  halfbaseprecNewton := precNewton div 2;
  for i := 1 to #Gammas do
    Gamma := Gammas[i];
    while not assigned Gamma`TriangleBelyiCurve do
      try 
        X, phi := BelyiMap(Gamma : prec := prec, precNewton := precNewton);
      catch e
        print "ERROR ERROR ERROR ERROR, increasing precision: ", e`Object;
        prec +:= 15;
        precNewton +:= halfbaseprecNewton;
        Gamma := TriangleSubgroup(sIn`BelyiDBPointedPassport[i]);
        Gammas[i] := Gamma;
      end try;
    end while;
  end for;

  print "Final precision:", prec;
  sOut := GammasToBelyiDB(Gammas); BelyiDBWrite(sOut);
end if;
