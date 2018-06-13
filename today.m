SetColumns(0);

AttachSpec("code/spec_database");
// SetVerbose("BelyiDB", 1);

AttachSpec("code/spec_triangle");
SetVerbose("Shimura", 1);

Attach("code/database_code/read_toby_db.m");

// s := BelyiDBRead("6T15-[4,4,4]-42-42-42-g1.m");
// bool, a, b, c := BelyiDBStatusReport(6);


/*
filenames := BelyiDBFilenames(1);
filenames cat:= BelyiDBFilenames(2);
filenames cat:= BelyiDBFilenames(3);
filenames cat:= BelyiDBFilenames(4);
filenames cat:= BelyiDBFilenames(5);
filenames cat:= BelyiDBFilenames(6);
*/

// filenames := BelyiDBFilenames(7);
filenames := BelyiDBFilenames(8);
filenames cat:= BelyiDBFilenames(9);

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

for i := 1 to #computed_objs do
	s := computed_objs[i];
	if not IsPolredabsMatch(s) or not assigned s`BelyiDBGaloisOrbits then
		printf "%o: (%o out of %o)\n", Name(s), i, #computed_objs;
		bool1 := EmbeddingsSanityCheck(s);
		printf "  embeddings before polredabs: %o\n", bool1;
		assert bool1;
		t := Polredabs_db(s);
		bool2 := EmbeddingsSanityCheck(t);
		assert bool2;
		printf "  embeddings after polredabs: %o\n", bool2;
		t := BelyiDBGaloisOrbitsComputer(t);
		bool3 := EmbeddingsSanityCheck(t);
		assert bool3;
		printf "  embeddings after GaloisOrbitsComputer: %o\n", bool3;
		printf "  GaloisOrbitsSanityCheck: %o\n", GaloisOrbitsSanityCheck(t);
		// printf "  BelyiMapSanity p=17: %o\n", BelyiLocalSanityCheck(t,17);
		// assert GaloisOrbitsSanityCheck(t);
		// assert BelyiLocalSanityCheck(t,17);
		BelyiDBWrite(t);
		t := BelyiDBRead(Filename(t));
		printf "  embeddings after writeread: %o\n", EmbeddingsSanityCheck(t);
		printf "  GaloisOrbitsSanityCheck after writeread: %o\n", GaloisOrbitsSanityCheck(t);
		// printf "  sanity p=17 after writeread: %o\n", BelyiLocalSanityCheck(t,17);
	else
		assert GaloisOrbitsSanityCheck(s);
		assert EmbeddingsSanityCheck(s);
		printf "%o: (%o out of %o) already computed\n", Name(s), i, #computed_objs;
	end if;
end for;

/*
b1 := [];
b2 := [];
b3 := [];
b4 := [];
for i := 1 to #computed_objs do
	s := computed_objs[i];
	printf "%o: (%o out of %o)\n", Name(s), i, #objs;
	bool1 := BelyiLocalSanityCheck(s, 17);
	bool2 := GaloisOrbitsSanityCheck(s);
	bool3 := IsPolredabsMatch(s);
	bool4 := EmbeddingsSanityCheck(s);
	if not bool1 then
		Append(~b1, s);
	end if;
	if not bool2 then
		Append(~b2, s);
	end if;
	if not bool3 then
		Append(~b3, s);
	end if;
	if not bool4 then
		Append(~b4, s);
	end if;
	printf "  %o\n", bool1;
	printf "  %o\n", bool2;
	printf "  %o\n", bool3;
	printf "  %o\n", bool4;
end for;
*/
