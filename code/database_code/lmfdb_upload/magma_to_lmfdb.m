// list of search cols
// <name, type, function, needs inds and lmfdb_index>
galmap_column_handler := [*<"geomtype", "text", GeomTypeShort, false>,
  <"map", "text", BelyiMap, true>,
  <"abc", "smallint[]", ABC, false>,
  <"base_field", "numeric[]", BaseField, true>,
  <"triples", "jsonb", OrbitTriples, true>,
  <"triples_cyc", "jsonb", OrbitTriplesCyc, true>,
  <"group", "text", GroupSt, false>,
  <"group_num", "smallint", GroupNumSt, false>,
  <"g", "smallint", GenusSt, false>,
  <"curve", "text", Curve, true>,
  <"orbit_size", "smallint", OrbitSize, true>,
  <"label", "text", GalmapLabel, true>,
  <"a_s", "smallint", a_s, false>,
  <"b_s", "smallint", b_s, false>,
  <"c_s", "smallint", c_s, false>,
  <"pass_size", "smallint", PassportSize, false>,
  <"aut_group", "jsonb", AutGroupStr, false>,
  <"deg", "smallint", DegreeSt, false>,
  <"embeddings", "jsonb", Embeddings, true>,
  <"plabel", "text", PassportLabel, false>,
  <"lambdas", "jsonb", LambdaSt, false>,
  <"friends", "text[]", NULL, true>,
  <"curve_label", "text", NULL, true>,
  <"BelyiDB_label", "text", BelyiDB_label, true>,
  <"BelyiDB_plabel", "text", BelyiDB_plabel, false>,
  <"specializations", "jsonb", NULL, true>,
  <"models", "jsonb", NULL, true>,
  <"moduli_field", "numeric[]", NULL, true>,
  <"moduli_field_label", "text", NULL, true>,
  <"base_field_label", "text", NULL, true>,
  <"primitivization", "text", NULL, true>,
  <"is_primitive", "boolean", NULL, true>
*];

// <name, type, function>
passports_column_handler := [*
  <"geomtype", "text", GeomTypeShort>,
  <"pass_size", "smallint", PassportSize>,
  <"abc", "smallint[]", ABC>,
  <"group", "text", GroupSt>,
  <"g", "smallint", GenusSt>,
  <"maxdegbf", "smallint", MaximumBaseFieldDegree>,
  <"lambdas", "jsonb", LambdaSt>,
  <"plabel", "text", PassportLabel>,
  <"num_orbits", "smallint", NumOrbits>,
  <"deg", "smallint", DegreeSt>,
  <"BelyiDB_plabel", "text", BelyiDB_plabel>,
  <"a_s", "smallint", a_s>,
  <"b_s", "smallint", b_s>,
  <"c_s", "smallint", c_s>,
  <"triples", "jsonb", PointedPassportSt>,
  <"aut_group", "jsonb", AutGroupStr>
*];


intrinsic BelyiDBToLMFDB(s::BelyiDB, inds::SeqEnum[RngIntElt], lmfdb_index::RngIntElt) -> MonStgElt
  {return string containing one row of data}
  bar := BelyiDBToLMFDBSeq(s, inds, lmfdb_index);
  return Join(bar, "|");
end intrinsic;

intrinsic BelyiDBToLMFDBSeq(s::BelyiDB, inds::SeqEnum[RngIntElt], lmfdb_index::RngIntElt) -> SeqEnum[MonStgElt]
  {return string containing one row of data}
  res := [];
  for fn in galmap_column_handler do
    if fn[4] then
      Append(~res, fn[3](s, inds, lmfdb_index));
    else
      Append(~res, fn[3](s));
    end if;
  end for;
  return res;
end intrinsic;

// this is the top-level function
intrinsic BelyiDBToLMFDB(filename::MonStgElt, seq::SeqEnum[BelyiDB]) -> RngIntElt
  {return string containing one row of data per map}
  headers := [[col[1] : col in galmap_column_handler]];
  headers cat:= [[col[2] : col in galmap_column_handler]];
  headers cat:= [[]];

  data := [];
  for s in seq do
    // galmaps dictionaries
    gal_orbits_before_sorting := GaloisOrbits(s); // we will sort by size (increasing)
    gal_orbits := gal_orbits_before_sorting;
    gal_orbits_sizes := [#orbit : orbit in gal_orbits_before_sorting];
    ParallelSort(~gal_orbits_sizes, ~gal_orbits);
    pass := PointedPassport(s);
    for i := 1 to #gal_orbits do
      if i lt #gal_orbits then assert #gal_orbits[i] le #gal_orbits[i+1]; end if;
      gal_orbit := gal_orbits[i];
      inds := [Index(pass, triple) : triple in gal_orbit];
      Append(~data, BelyiDBToLMFDBSeq(s, inds, i));
    end for;
  end for;
  return putrecs(filename, headers cat data);
end intrinsic;

intrinsic GenerateBelyiData(galmaps_filename::MonStgElt, passports_filename : DegreeBound := 9) -> Any
  {Given a filename, generate a text file of the data of all Galois orbits Belyi maps of degree up to DegreeBound.}

  names := [];
  for d := 1 to DegreeBound do
    names cat:= BelyiDBFilenames(d);
  end for;
  printf "%o BelyiDB filenames found\n", #names;
  print "Loading Belyi maps...";
  t0 := Cputime();
  db := [];
  for name in names do
    s := BelyiDBRead(name);
    if BelyiMapIsComputed(s) then // only BelyiDBs with all data computed
      Append(~db, s);
    end if;
  end for;
  t1 := Cputime();
  printf "...done. That took %o seconds.\n", t1 - t0;
  BelyiDBToLMFDB(galmaps_filename, db);
  BelyiDBPassportToLMFDB(passports_filename, db);
  galmaps_str := Sprintf("Galmap data written to %o\n", galmaps_filename);
  passports_str := Sprintf("Passport data written to %o\n", passports_filename);
  return galmaps_str, passports_str;
end intrinsic;

intrinsic BelyiDBPassportToLMFDBseq(s::BelyiDB) -> MonStgElt
  {return string containing one row of data}
  return [fn[3](s) : fn in passports_column_handler];
end intrinsic;

intrinsic BelyiDBPassportToLMFDBrow(s::BelyiDB) -> MonStgElt
  {return string containing one row of data}
  return Join(BelyiDBPassportToLMFDBseq(s), "|");
end intrinsic;

// this is the top-level function
intrinsic BelyiDBPassportToLMFDB(filename::MonStgElt, seq::SeqEnum[BelyiDB]) -> RngIntElt
  {return string containing one row of data per map}
  headers := [[col[1] : col in passports_column_handler]];
  headers cat:= [[col[2] : col in passports_column_handler]];
  headers cat:= [[]];
  return putrecs(filename, headers cat [BelyiDBPassportToLMFDBseq(s) : s in seq]);
end intrinsic;
