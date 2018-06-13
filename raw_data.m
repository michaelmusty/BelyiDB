SetColumns(0);

AttachSpec("code/spec_database");
// SetVerbose("BelyiDB", 1);

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

computed_objs := [];
for s in objs do
	if BelyiMapIsComputed(s) then
		Append(~computed_objs, s);
	end if;
end for;

ola := [];
for i := 1 to #computed_objs do
	printf "mongo %o: (%o out of %o)\n", Name(s), i, #computed_objs;
	s := computed_objs[i];
	Append(~ola, BelyiDBToDictionary(s));
end for;

Write("/Users/mjmusty/github/lmfdb/scripts/belyi/raw_data.py", Sprintf("ola = %o", ola) : Overwrite := true);
