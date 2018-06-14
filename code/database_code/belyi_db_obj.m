declare verbose BelyiDB, 1;
declare type BelyiDB;
declare attributes BelyiDB:
// easy attrs
  BelyiDBName,
  BelyiDBFilename,
  BelyiDBDegree,
  BelyiDBOrders, // formerly known as ABC
  BelyiDBType, // Hyperbolic, Euclidean, or Spherical
  BelyiDBGenus,
  BelyiDBSize,
  BelyiDBPointedSize,
// permutation attrs
  BelyiDBPermutationTriple,
  BelyiDBAutomorphismGroup,
  BelyiDBPointedAutomorphismGroup,
  BelyiDBMonodromyGroup,
  BelyiDBPassport,
  BelyiDBPointedPassport,
  BelyiDBGaloisOrbits,
// field attrs
  BelyiDBBaseFieldData, // [* [* K, Kv, conj, complex embeddding *],... *]
// exact attrs: scheduled for deletion
  BelyiDBExactCurveInvariants,
  BelyiDBExactCurveCoefficients,
  BelyiDBExactBelyiMapLeadingCoefficients,
  BelyiDBExactBelyiMapNumeratorCoefficients,
  BelyiDBExactBelyiMapDenominatorCoefficients,
// belyimap attrs
  BelyiDBBelyiCurves,
  BelyiDBBelyiMaps,
// timing
  BelyiDBComputationTime,
  BelyiDBSanityCheckTiming,
  BelyiDBLocalSanityCheckTiming,
  BelyiDBLocalSanityCheckPrime,
// numerical attrs
  BelyiDBRescalingFactors, // list of complex numbers
  BelyiDBPowserIndat,
  BelyiDBPowserBases; // fout_ech in Gamma`TrianglePowserBases = [* indat, [* fout_ech, minsing, fout *] *]

intrinsic BelyiDBInitialize() -> BelyiDB
  {Create an empty BelyiDB object.}
  s := New(BelyiDB);
  return s;
end intrinsic;

intrinsic BelyiDBCopy(s::BelyiDB) -> BelyiDB
  {new instance of BelyiDB.}
  s1 := BelyiDBInitialize();
  for attr in GetAttributes(Type(s)) do
    if assigned s``attr then
      s1``attr := s``attr;
    end if;
  end for;
  return s1;
end intrinsic;

intrinsic Print(s::BelyiDB)
  {Print BelyiDB}
  printf "BelyiDB %o:\n", s`BelyiDBName;
  printf "  Degree %o\n", s`BelyiDBDegree;
  printf "  Genus %o\n", s`BelyiDBGenus;
  printf "  %o\n", s`BelyiDBType;
  printf "  Size %o\n", s`BelyiDBSize;
  printf "  PointedSize %o\n", s`BelyiDBPointedSize;
  if assigned s`BelyiDBGaloisOrbits then
    printf "  #GaloisOrbits = %o\n", #s`BelyiDBGaloisOrbits;
  end if;
  if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
    if #s`BelyiDBBelyiCurves eq #s`BelyiDBPointedPassport and #s`BelyiDBBelyiMaps eq #s`BelyiDBPointedPassport then
      printf "  BelyiMaps computed\n";
    else
      printf "  BelyiMaps assigned but numbers don't match up! Check this BelyiDBObject!\n";
    end if;
  else
    printf "  BelyiMaps NOT computed\n";
  end if;
end intrinsic;

/* user convenience */

intrinsic Name(s::BelyiDB) -> MonStgElt
  {}
  return s`BelyiDBName;
end intrinsic;

intrinsic Filename(s::BelyiDB) -> MonStgElt
  {}
  return s`BelyiDBFilename;
end intrinsic;

intrinsic Degree(s::BelyiDB) -> RngIntElt
  {}
  return s`BelyiDBDegree;
end intrinsic;

intrinsic Orders(s::BelyiDB) -> SeqEnum[RngIntElt]
  {}
  return s`BelyiDBOrders;
end intrinsic;

intrinsic TriangleType(s::BelyiDB) -> MonStgElt
  {}
  return s`BelyiDBType;
end intrinsic;

intrinsic Genus(s::BelyiDB) -> RngIntElt
  {}
  return s`BelyiDBGenus;
end intrinsic;

intrinsic Size(s::BelyiDB) -> RngIntElt
  {}
  return s`BelyiDBSize;
end intrinsic;

intrinsic PointedSize(s::BelyiDB) -> RngIntElt
  {}
  return s`BelyiDBPointedSize;
end intrinsic;

intrinsic PermutationTriple(s::BelyiDB) -> SeqEnum[SeqEnum[GrpPermElt]]
  {}
  return s`BelyiDBPermutationTriple;
end intrinsic;

intrinsic MonodromyGroup(s::BelyiDB) -> GrpPerm
  {}
  return s`BelyiDBMonodromyGroup;
end intrinsic;

intrinsic AutomorphismGroup(s::BelyiDB) -> GrpPerm
  {}
  return s`BelyiDBAutomorphismGroup;
end intrinsic;

intrinsic PointedAutomorphismGroup(s::BelyiDB) -> GrpPerm
  {}
  return s`BelyiDBPointedAutomorphismGroup;
end intrinsic;

intrinsic Passport(s::BelyiDB) -> SeqEnum
  {}
  return s`BelyiDBPassport;
end intrinsic;

intrinsic PointedPassport(s::BelyiDB) -> SeqEnum
  {}
  return s`BelyiDBPointedPassport;
end intrinsic;

intrinsic GaloisOrbits(s::BelyiDB) -> SeqEnum
  {}
  return s`BelyiDBGaloisOrbits;
end intrinsic;

intrinsic BaseFieldData(s::BelyiDB) -> Any
  {}
  return s`BelyiDBBaseFieldData; // [* [* K, Kv, conj, complex embeddding *],... *]
end intrinsic;

intrinsic BaseFieldDataShort(s::BelyiDB) -> Any
  {}
  base_field_data := BaseFieldData(s);
  base_field_data_short := [* *];
  for i := 1 to #base_field_data do
    vprintf BelyiDB : "i=%o:\n", i;
    l := [* *];
    Append(~l, base_field_data[i][1]);
    Append(~l, base_field_data[i][2]);
    Append(~l, base_field_data[i][3]);
    Append(~l, ComplexField(6)!base_field_data[i][4]);
    Append(~base_field_data_short, l);
    vprintf BelyiDB : "  %o\n", l[1];
    vprintf BelyiDB : "  %o\n", l[2];
    vprintf BelyiDB : "  %o\n", l[3];
    vprintf BelyiDB : "  %o\n", l[4];
  end for;
  return base_field_data_short;
end intrinsic;

intrinsic BelyiCurves(s::BelyiDB) -> Any
  {}
  return s`BelyiDBBelyiCurves;
end intrinsic;

intrinsic BelyiMaps(s::BelyiDB) -> Any
  {}
  return s`BelyiDBBelyiMaps;
end intrinsic;

intrinsic SanityCheckTiming(s::BelyiDB) -> Any
  {}
  return s`BelyiDBSanityCheckTiming;
end intrinsic;

intrinsic LocalSanityCheckTiming(s::BelyiDB) -> Any
  {}
  return s`BelyiDBLocalSanityCheckTiming;
end intrinsic;

intrinsic LocalSanityCheckPrime(s::BelyiDB) -> Any
  {}
  return s`BelyiDBLocalSanityCheckPrime;
end intrinsic;

intrinsic RescalingFactors(s::BelyiDB) -> Any
  {}
  return s`BelyiDBRescalingFactors;
end intrinsic;

intrinsic PowserIndat(s::BelyiDB) -> Any
  {}
  return s`BelyiDBPowserIndat;
end intrinsic;

intrinsic PowserBases(s::BelyiDB) -> Any
  {}
  return s`BelyiDBPowserBases; // fout_ech in Gamma`TrianglePowserBases = [* indat, [* fout_ech, minsing, fout *] *]
end intrinsic;
