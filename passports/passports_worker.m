// Same as the manager process.
host := "localhost";
port := 10000;

function PassportInfo(passport)
  d := passport[1];
  n := passport[2];
  G := TransitiveGroup(d,n);
  cycstrs := passport[3];
  Cs := passport[4];
  massest := Rationals()!DessinEstimate(Cs, G, Sym(d) : depth := 0);
  if massest lt 1000 then
    passportData := PassportRepresentatives(G,cycstrs);
  else
    passportData := [ [] ];  // don't even try
  end if;
  return <[* d, n, cycstrs, massest *], SequenceToList(passportData)>;
end function;

_ := WaitForIO([] : TimeLimit := 10);  // give time to set up

DistributedWorker(host, port, PassportInfo);

quit;
