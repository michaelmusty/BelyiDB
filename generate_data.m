t0 := Cputime();

SetColumns(0);

AttachSpec("code/spec_database");
// SetVerbose("BelyiDB", 1);

filenames := [];
for i := 1 to 9 do
  filenames cat:= BelyiDBFilenames(i);
end for;
/*
filenames := BelyiDBFilenames(1);
filenames cat:= BelyiDBFilenames(2);
filenames cat:= BelyiDBFilenames(3);
filenames cat:= BelyiDBFilenames(4);
filenames cat:= BelyiDBFilenames(5);
filenames cat:= BelyiDBFilenames(6);
filenames cat:= BelyiDBFilenames(7);
filenames cat:= BelyiDBFilenames(8);
filenames cat:= BelyiDBFilenames(9);
*/

objs := [];
for i := 1 to #filenames do
  printf "reading %o: (%o out of %o)\n", filenames[i], i, #filenames;
  s := BelyiDBRead(filenames[i]);
  Append(~objs, s);
end for;

computed_objs := [];
for s in objs do
  if BelyiMapIsComputed(s) then
    Append(~computed_objs, s);
  end if;
end for;

BelyiDBToLMFDB("belyi_galmap_data.txt", computed_objs);
BelyiDBPassportToLMFDB("belyi_passport_data.txt", computed_objs);

t1 := Cputime();

printf "that took %o seconds", t1-t0;

// for 550 passports on 061318 this took 298s to generate raw_data.py

exit;
