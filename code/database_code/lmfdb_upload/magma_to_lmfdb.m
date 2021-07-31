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
column_handler := [
  <"geomtype", GeomTypeShort>,
  <"map", BelyiMap>,
  <"abc", ABC>,
  <"base_field", BaseField>,
  <"triples", OrbitTriples>,
  <"triples_cyc", OrbitTriplesCyc>,
  <"g", >,
  <"curve", Curve>,
  <"orbit_size", OrbitSize>,
  <"label", >, // see new_labels.py in lmfdb/scripts/belyi
  <"a_s", >,
  <"pass_size", >,
  <"c_s", >
  <"aut_group", >,
  <"deg", >,
  <"embeddings", Embeddings>,
  <"group", >,
  <"b_s", >,
  <"plabel", >,
  <"lambdas", >,
  <"friends", >,
  <"curve_label", >,
  <"BelyiDB_label", >,
  <"BelyiDB_plabel", >,
  <"specializations", >,
  <"models", >,
  <"moduli_field", >,
  <"moduli_field_label", >,
  <"base_field_label", >,
  <"primitivization", >,
  <"is_primitive", >
];

intrinsic BelyiDBToLMFDB(s::BelyiDB) -> MonStgElt
  {}
end intrinsic;
