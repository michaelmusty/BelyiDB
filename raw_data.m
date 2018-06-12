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
objs := [BelyiDBRead(filename) : filename in filenames];

for s in objs do
	printf "%o:\n", Name(s);
	bool1 := BelyiMapSanityCheck(s);
	bool2 := GaloisOrbitsSanityCheck(s);
	bool3 := IsPolredabsMatch(s);
	printf "  %o\n", bool1;
	printf "  %o\n", bool2;
	printf "  %o\n", bool3;
	if bool1 then
		t := Polredabs(s);
		assert BelyiMapSanityCheck(t);
		BelyiDBWrite(t);
		t := BelyiDBRead(Filename(t));
		BelyiMapSanityCheck(t);
	else
		error "Belyi maps not computed";
	end if;
end for;

// objs := [BelyiDBRead(filename) : filename in filenames];

ola := [];
for s in objs do
	Append(~ola, BelyiDBToDictionary(s));
end for;

Write("raw_data.py", Sprintf("ola = %o", ola) : Overwrite := true);

print ola[#ola];
