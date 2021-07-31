// define which attributes can be acted on by S3
intrinsic GetS3Attrs(s::BelyiDB) -> SeqEnum[MonStgElt]
  {}
  l := [];
  Append(~l, "BelyiDBPermutationTriple");
  Append(~l, "BelyiDBPassport");
  Append(~l, "BelyiDBPointedPassport");
  Append(~l, "BelyiDBGaloisOrbits");
  Append(~l, "BelyiDBBelyiMaps");
  return l;
end intrinsic;

// S3Action on (attributes of) s by tau
intrinsic S3Action(tau::GrpPermElt, s::BelyiDB) -> BelyiDB
  {}
  for attr in GetS3Attrs(s) do
    s``attr := S3Action(tau, s``attr);
  end for;
  return s;
end intrinsic;

// S3Action for a list of triples
intrinsic S3Action(tau::GrpPermElt, l::SeqEnum[SeqEnum[GrpPermElt]]) -> SeqEnum[SeqEnum[GrpPermElt]]
  {}
  return [S3Action(tau, x) : x in l];
end intrinsic;

// S3Action for Galois orbits lists of (lists of triples)
intrinsic S3Action(tau::GrpPermElt, l::SeqEnum[SeqEnum[SeqEnum[GrpPermElt]]]) -> SeqEnum[SeqEnum[SeqEnum[GrpPermElt]]]
  {}
  return [S3Action(tau, x) : x in l];
end intrinsic;

// S3Action for maps
intrinsic S3Action(tau::GrpPermElt, phi::FldFunFracSchElt) -> FldFunFracSchElt
  {}
  S := Sym(3);
  assert Parent(tau) eq S;
  if tau eq S!(1,2) then
    return 1-phi;
  elif tau eq S!(1,3) then
    return 1/phi;
  elif tau eq S!(2,3) then
    return phi/(1-phi);
  elif tau eq S!(1,2,3) then
    return 1/phi-1;
  elif tau eq S!(1,3,2) then
    return 1/(1-phi);
  else
    return phi;
  end if;
end intrinsic;

// S3Action for list of maps
intrinsic S3Action(tau::GrpPermElt, l::List) -> List
  {}
  return [* S3Action(tau, x) : x in l *];
end intrinsic;

// list of search cols
galmap_column_handler := [
// <name, type, function, needs inds and index>
  <"geomtype", "text", GeomTypeShort, false>,
  <"map", "text", BelyiMap, true>,
  <"abc", "smallint[]", ABC, false>,
  <"base_field", "numeric[]", BaseField, true>,
  <"triples", "jsonb", OrbitTriples, true>,
  <"triples_cyc", "jsonb", OrbitTriplesCyc, true>,
  <"group", "text", GroupSt, false>,
  <"g", "smallint", GenusSt>,
  <"curve", "text", Curve, true>,
  <"orbit_size", OrbitSize, true>,
  <"label", GalmapLabel, true>,
  <"a_s", "smallint", a_s, false>,
  <"b_s", "smallint", b_s, false>,
  <"c_s", "smallint", c_s, false>,
  <"pass_size", "smallint", PassportSize, false>,
  <"aut_group", "jsonb", AutGroupStr, false>
  <"deg", "smallint", DegreegSt, false>,
  <"embeddings", "jsonb", Embeddings, true>,
  <"plabel", "test", PassportLabel, false>,
  <"lambdas", "jsonb", LambdaSt, false>,
  <"friends", >,
  <"curve_label", >,
  <"BelyiDB_label", BelyiDB_label, true>,
  <"BelyiDB_plabel", "text", BelyiDB_plabel, false>,
  <"specializations", >,
  <"models", >,
  <"moduli_field", >,
  <"moduli_field_label", >,
  <"base_field_label", >,
  <"primitivization", >,
  <"is_primitive", >
];

intrinsic BelyiDBToLMFDB(s::BelyiDB) -> MonStgElt
  {return string containing one row of data}
  return Join([fn[3](s): for fn in galmap_column_handler], '|');
end intrinsic;



passports_column_handler := [
// <name, type, function>
 <"geomtype", "text", GeomTypeShort>,
 <"pass_size", "smallint", PassportSize>,
 <"abc", "smallint[]", ABC>,
 <"group", "text", GroupSt>,
 <"g", "smallint", GenusSt>,
 <"maxdegbf", "smallint", MaximumBaseFieldDegree>,
 <"lambdas", "jsonb", LambdaSt>,
 <"plabel", "test", PassportLabel>,
 <"num_orbits", "smallint", NumOrbits>,
 <"deg", "smallint", DegreegSt>,
 <"BelyiDB_plabel", "text", BelyiDB_plabel>,
 <"a_s", "smallint", a_s>,
 <"b_s", "smallint", b_s>,
 <"c_s", "smallint", c_s>,
 <"triples", "jsonb", PointedPassportSt>,
 <"aut_group", "jsonb", AutGroupStr>
];


intrinsic BelyiDBPassportToLMFDBrow(s::BelyiDB, inds::SeqEnum[RngIntElt], index::RngIntElt) -> MonStgElt
  {return string containing one row of data}
  return Join([fn[3](s): for fn in passports_column_handler], '|');
end intrinsic;


intrinsic BelyiDBPassportToLMFDB(filename::MonStgElt, seq::SeqEnum[BelyiDB]) -> MonStgElt
  {return string containing one row of data per map}
  headers := [[col[1] : col in passports_column_handler]];
  headers cat:= [[col[2] : col in passports_column_handler]];
  headers cat:= [[]]
  putrecs(filename, headers cat [[col[3](s) : col in passports_column_handler] : s in seq]);
end intrinsic;


