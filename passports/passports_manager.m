d := 14;
S := Sym(d);
passports := [];
for n := 1 to #TransitiveGroups(d) do
  G := TransitiveGroup(d,n);
  if #G ge Factorial(d)/2 then // skip A_d and S_d
    continue;
  end if;
  CCs := ConjugacyClasses(G);
  cycs := Reverse(Sort(SetToSequence({CycleStructure(C[3]) : C in CCs})));
  CCs := [[CC : CC in CCs | CycleStructure(CC[3]) eq cycs[i]][1] : i in [1..#cycs]];
  for i := 1 to #cycs do for j := i to #cycs do for k := j to #cycs do
    cyc := [cycs[i], cycs[j], cycs[k]];
    Cs := [CCs[i], CCs[j], CCs[k]];
    Append(~passports, [* d, n, cyc, Cs *]);
  end for; end for; end for;
end for;

print "passport labels computed", #passports;

socket := Socket(: LocalHost := "localhost", LocalPort := 10000);
SetVerbose("ManagerWorker", 2);

for i in [1..16] do
  System("magma passports_worker.m &"); // Launch and detach the worker.
end for;

passportData := DistributedManager(socket, passports);

for n := 1 to #TransitiveGroups(d) do
  filename := IntegerToString(d) cat "/" cat IntegerToString(d) cat "T" cat
              IntegerToString(n) cat "pass.out";
  PrintFileMagma(filename, [p : p in passportData | p[1][2] eq n]);
  PrintFile(filename, ";");
end for;

delete socket;

