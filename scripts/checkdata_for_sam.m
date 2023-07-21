// AttachSpec("../MagmaPolred/spec");
AttachSpec("code/spec_database");

// SetVerbose("BelyiDB", 1);

filenames := [];
for i := 1 to 9 do
  filenames cat:= BelyiDBFilenames(i);
end for;

for i := 1 to #filenames do
  printf "reading %o: (%o out of %o)\n", filenames[i], i, #filenames;
  s := BelyiDBRead(filenames[i]);
  try
    for Ks in s`BelyiDBBaseFieldData do
      assert DefiningPolynomial(Polredabs(Ks[1])) eq DefiningPolynomial(Ks[1]);
    end for;
  catch e;
    print "no field data for", filenames[i];
  end try;
  print i, #filenames; 
end for;

baddys := [];
for i := 1 to #filenames do
  printf "reading %o: (%o out of %o)\n", filenames[i], i, #filenames;
  s := BelyiDBRead(filenames[i]);
  if not assigned s`BelyiDBBaseFieldData then continue; end if;
  if not assigned s`BelyiDBGaloisOrbits then continue; end if;
  Ks := s`BelyiDBBaseFieldData;
  orbs := s`BelyiDBGaloisOrbits;
  degseq := [Degree(K[1]) : K in Ks];
  orbseq := [];
  for i := 1 to #orbs do
    for j := 1 to #orbs[i] do
      Append(~orbseq, #orbs[i]);
    end for;
  end for;
  if Sort(degseq) ne Sort(orbseq) then 
    Append(baddys, filenames[i]);
  end if;
  print i, #filenames; 
end for;
