SetColumns(0);

AttachSpec("code/spec_database");
// SetVerbose("BelyiDB", 1);

AttachSpec("code/spec_triangle");
SetVerbose("Shimura", 1);

filenames := BelyiDBFilenames(1);
filenames cat:= BelyiDBFilenames(2);
filenames cat:= BelyiDBFilenames(3);
filenames cat:= BelyiDBFilenames(4);
filenames cat:= BelyiDBFilenames(5);
filenames cat:= BelyiDBFilenames(6);
filenames cat:= BelyiDBFilenames(7);
filenames cat:= BelyiDBFilenames(8);
filenames cat:= BelyiDBFilenames(9);

objs := [];
for i := 1 to #filenames do
	printf "reading %o: (%o out of %o)\n", filenames[i], i, #filenames;
	s := BelyiDBRead(filenames[i]);
	Append(~objs, s);
end for;
// objs := [BelyiDBRead(filename) : filename in filenames];

computed_objs := [];
for s in objs do
	if BelyiMapIsComputed(s) then
		t := BelyiDBGaloisOrbitsComputer(s : ignore := true);
		Append(~computed_objs, t);
	end if;
end for;

/*
for i := 1 to #objs do
	s := objs[i];
	printf "%o: (%o out of %o)\n", Name(s), i, #objs;
	bool1 := BelyiLocalSanityCheck(s, 101);
	bool2 := GaloisOrbitsSanityCheck(s);
	bool3 := IsPolredabsMatch(s);
	printf "  %o\n", bool1;
	printf "  %o\n", bool2;
	printf "  %o\n", bool3;
	if bool1 then
		t := Polredabs_db(s);
		assert BelyiLocalSanityCheck(t, 101);
		BelyiDBWrite(t);
		t := BelyiDBRead(Filename(t));
		BelyiLocalSanityCheck(t,101);
	else
		error "Belyi maps not computed";
	end if;
end for;
*/

// objs := [BelyiDBRead(filename) : filename in filenames];

ola := [];
// for s in objs do
for i := 1 to #computed_objs do
	printf "%o: (%o out of %o)\n", Name(s), i, #computed_objs;
	s := computed_objs[i];
	Append(~ola, BelyiDBToDictionary(s));
end for;

Write("raw_data.py", Sprintf("ola = %o", ola) : Overwrite := true);

print ola[#ola];
