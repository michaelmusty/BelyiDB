intrinsic NULL(s::BelyiDB) -> MonStgElt
  {}
  return "NULL";
end intrinsic;

intrinsic NULL(s::BelyiDB, inds::SeqEnum[RngIntElt], index::RngIntElt) -> MonStgElt
  {}
  return "NULL";
end intrinsic;

intrinsic BelyiDB_plabel(s::BelyiDB) -> MonStgElt
  {}
  return Name(s);
end intrinsic;

function add_dot_seps(string)
  return Join([string[i] : i in [1..#string]], ".");
end function;


intrinsic PassportLabel(s::BelyiDB) -> MonStgElt
  {return Passport label}
  spl := Split(BelyiDB_plabel(s), "-");
  return Sprintf("%o-%o_%o_%o", spl[1],add_dot_seps(spl[3]),add_dot_seps(spl[4]),add_dot_seps(spl[5]));
end intrinsic;


intrinsic BelyiDB_label(s::BelyiDB, inds::SeqEnum[RngIntElt], index::RngIntElt) -> MonStgElt
  {return BelyiDB label}
  letter := Base26Encode(index - 1);
  // label
  return Sprintf("%o-%o", Name(s), letter);
end intrinsic;

intrinsic GalmapLabel(s::BelyiDB, inds::SeqEnum[RngIntElt], index::RngIntElt) -> MonStgElt
  {return LMFDB label, by converting BelyiDB labels (with square brackets) to new shorter labels}
  spl := Split(BelyiDB_label(s), "-");
  return Sprintf("%o-%o_%o_%o-%o", spl[1], add_dot_seps(spl[3]), add_dot_seps(spl[4]), add_dot_seps(spl[5]), spl[7]);
end intrinsic;

intrinsic PermutationTripleToLMFDBLabel(sigma::SeqEnum[GrpPermElt]) -> MonStgElt
  {Given a permutation triple sigma, return the LMFDB label of its passport}
  assert #sigma eq 3;
  G := sub< Parent(sigma[1]) | sigma >;
  k, d := TransitiveGroupIdentification(G);
  label := Sprintf("%oT%o-", d, k);
  for sig in sigma do
    label *:= PermutationToCycleStructure(sig);
    label *:= "_";
  end for;
  label := label[1..#label-1]; // remove last _
  return label;
end intrinsic;


intrinsic GeomTypeShort(s::BelyiDB) -> MonStgElt
  {retun the short type of geometric type}
  return TriangleType(s)[1];
end intrinsic;


intrinsic PassportSize(s::BelyiDB) -> MonStgElt
  {return the size of the passport}
  return sprint(#(s`BelyiDBPassport));
end intrinsic;

intrinsic PermutationToPartition(perm::GrpPermElt) -> SeqEnum[RngIntElt]
  {}
  cs := CycleStructure(perm);
  part := [];
  for i in {1..#cs} do
    for j in {1..cs[i][2]} do
      Append(~part, cs[i][1]);
    end for;
  end for;
  return part;
end intrinsic;

intrinsic PermutationToCycleStructure(sigma::GrpPermElt) -> MonStgElt
  {}
  s := "";
  struc := CycleStructure(sigma);
  for pair in struc do
    len, m := Explode(pair);
    for i := 1 to m do
      s *:= Sprintf("%o.", len);
    end for;
  end for;
  s := s[1..#s-1]; // remove last dot
  return s;
end intrinsic;



intrinsic SortPermutations(sigma::SeqEnum[GrpPermElt]) -> SeqEnum
  {}
  assert #sigma eq 3;
  decs := [CycleDecomposition(el) : el in sigma];
  lens := [];
  for s in decs do
    s_lens := [];
    for cyc in s do
      Append(~s_lens, #cyc);
    end for;
    Append(~lens, s_lens);
  end for;
  //Sort(~lens);
  ParallelSort(~lens, ~sigma);
  swap := [2,1,3];
  ParallelSort(~swap, ~sigma);
  return sigma;
end intrinsic;

// procedure version
intrinsic SortPermutations(~sigma::SeqEnum[GrpPermElt])
  {}
  sigma := SortPermutations(sigma);
end intrinsic;

intrinsic SortedPointedPassport(s::BelyiDB) -> SeqEnum
  {}
  ppass := s`BelyiDBPointedPassport;
  ppass_sort := [];
  for sigma in ppass do
    Append(~ppass_sort, SortPermutations(sigma));
  end for;
  return ppass_sort;
end intrinsic;


intrinsic ABC(s::BelyiDB) -> MonStgElt
  {}
  sigma := PermutationTriple(s);
  sprint([Order(el) : el in sigma]);
end intrinsic;

intrinsic ABC_sorted(s::BelyiDB, i::RngIntElt) -> MonStgElt
 {}
  sigma := PermutationTriple(s);
  return sprint(Sort([Order(el) : el in sigma])[i]);
end intrinsic;

intrinsic a_s(s::BelyiDB) -> MonStgElt
 {}
  return ABC_sorted(s, 1);
end intrinsic;

intrinsic b_s(s::BelyiDB) -> MonStgElt
  {}
  return ABC_sorted(s, 2);
end intrinsic;

intrinsic c_s(s::BelyiDB) -> MonStgElt
  {}
  return ABC_sorted(s, 3);
end intrinsic;

intrinsic GroupSt(s::BelyiDB) -> MonStgElt
  {}
  return Split(Name(s), "-")[1];
end intrinsic;

intrinsic GenusSt(s::BelyiDB) -> MonStgElt
  {}
  return sprint(s`BelyiDBGenus);
end intrinsic;

intrinsic DegreeSt(s::BelyiDB) -> MonStgElt
  {}
  return sprint(s`BelyiDBDegree);
end intrinsic;

intrinsic MaximumBaseFieldDegree(s::BelyiDB) -> MonStgElt
  {}
  return sprint(Maximum([#el : el in s`BelyiDBGaloisOrbits]));
end intrinsic;



intrinsic NumOrbits(s::BelyiDB) -> MonStgElt
  {}
  return sprint(#s`BelyiDBGaloisOrbits);
end intrinsic;

intrinsic AutGroupStr(s::BelyiDB) -> MonStgElt
  {}
  ppass := SortedPointedPassport(s);
  aut := AutomorphismGroup(ppass[1]);
  for el in ppass do
    assert aut eq AutomorphismGroup(el);
  end for;
  if #aut eq 1 then
    aut_group_str := Sprintf("[%m]", Identity(aut));
  else
    gens := SetToSequence(Generators(aut));
    aut_group_str := ConvertToOneLine(gens);
  end if;
  return sprint(aut_group_str);
end intrinsic;


// for permutation triples
intrinsic ConvertToOneLine(l::SeqEnum[GrpPermElt]) -> MonStgElt
  {}
  str := "[";
  if #l eq 0 then
    str *:= "[]";
  else
    for i := 1 to #l-1 do
      str *:= Sprintf("%m, ", l[i]);
    end for;
    str *:= Sprintf("%m", l[#l]);
  end if;
  str *:= "]";
  return str;
end intrinsic;

// For SeqEnums of permutation triples
intrinsic ConvertToOneLine(l::SeqEnum[SeqEnum[GrpPermElt]]) -> MonStgElt
  {}
  str := "[";
  if #l eq 0 then
    str *:= "[]";
  else
    for i := 1 to #l-1 do
      str *:= ConvertToOneLine(l[i]);
      str *:= ",";
    end for;
    str *:= ConvertToOneLine(l[#l]);
  end if;
  str *:= "]";
  return str;
end intrinsic;

intrinsic ConvertToCycles(tau::GrpPermElt) -> MonStgElt
  {}
  if tau eq Identity(Parent(tau)) then
    return "()";
  else
    return Sprintf("%o", tau);
  end if;
end intrinsic;

intrinsic ConvertToCycles(sigma::SeqEnum[GrpPermElt]) -> MonStgElt
  {}
  assert #sigma eq 3;
  str := "[";
  str *:= "\"";
  str *:= ConvertToCycles(sigma[1]);
  str *:= "\"";
  str *:= ",";
  str *:= "\"";
  str *:= ConvertToCycles(sigma[2]);
  str *:= "\"";
  str *:= ",";
  str *:= "\"";
  str *:= ConvertToCycles(sigma[3]);
  str *:= "\"";
  str *:= "]";
  return str;
end intrinsic;

intrinsic ConvertToCycles(triples::SeqEnum[SeqEnum[GrpPermElt]]) -> MonStgElt
  {}
  str := "";
  str *:= "[";
  for i := 1 to #triples-1 do
    str *:= Sprintf("%o", ConvertToCycles(triples[i]));
    str *:= ",";
  end for;
  str *:= Sprintf("%o", ConvertToCycles(triples[#triples]));
  str *:= "]";
  return str;
end intrinsic;


intrinsic PointedPassportSt(s::BelyiDB) -> MonStgElt // aka triples
  {}
  return sprint(ConvertToOneLine(PointedPassport(s)));
end intrinsic;

intrinsic LambdaSt(s::BelyiDB) -> MonStgElt //lambdas (partitions)
  {}
  sigma := PermutationTriple(s);
  lambdas_str := "[";
  for i := 1 to 2 do
    lambdas_str *:= sprint(PermutationToPartition(sigma[i]));
  end for;
  lambdas_str *:= sprint(PermutationToPartition(sigma[3]));
  lambdas_str *:= "]";
end intrinsic;

intrinsic OrbitSize(s::BelyiDB, inds::SeqEnum[RngIntElt], index::RngIntElt) -> MonStgElt
  {}
  return Sprint(#s`BelyiDBGaloisOrbits[index]);
end intrinsic;

intrinsic Curve(s::BelyiDB, inds::SeqEnum[RngIntElt], index::RngIntElt) -> MonStgElt
  {}
  return Sprint(s`BelyiDBBelyiCurves[inds[1]]);
end intrinsic;

intrinsic BelyiMap(s::BelyiDB, inds::SeqEnum[RngIntElt], index::RngIntElt) -> MonStgElt
  {}
  return Sprint(s`BelyiDBBelyiMaps[inds[1]]);
end intrinsic;


intrinsic BaseField(s::BelyiDB, inds::SeqEnum[RngIntElt], index::RngIntElt) -> MonStgElt
  {}
  base_field_data := s`BelyiDBBaseFieldData;
  orbit_base_field_data := [base_field_data[i] : i in inds];
  minpolys := [DefiningPolynomial(orbit_base_field_data[i][1]) : i in [1..#orbit_base_field_data]];
  assert #SequenceToSet(minpolys) eq 1;
  coeffs := Coefficients(minpolys[1]);
  assert Parent(coeffs[1]) eq Rationals() or Parent(coeffs[1]) eq Integers();
  return Sprint(coeffs);
end intrinsic;


intrinsic Embeddings(s::BelyiDB, inds::SeqEnum[RngIntElt], index::RngIntElt) -> MonStgElt
  {}
  base_field_data := s`BelyiDBBaseFieldData;
  orbit_base_field_data := [base_field_data[i] : i in inds];
  minpolys := [DefiningPolynomial(orbit_base_field_data[i][1]) : i in [1..#orbit_base_field_data]];
  assert #SequenceToSet(minpolys) eq 1;
  coeffs := Coefficients(minpolys[1]);
  assert Parent(coeffs[1]) eq Rationals() or Parent(coeffs[1]) eq Integers();
  str *:= Sprintf("\"base_field\":%o,\n", coeffs);
  // embeddings
  orbit_embeddings := [];
  for i in inds do
    K := base_field_data[i][1];
    // assert DefiningPolynomial(K) eq DefiningPolynomial(Polredabs_db(K));
    v := base_field_data[i][2];
    conj := base_field_data[i][3];
    z := Eval(K.1, v, conj : prec := 16);
    Append(~orbit_embeddings, [Re(z), Im(z)]);
  end for;
  return Sprint(orbit_embeddings);
end intrinsic;

intrinsic OrbitTriples(s::BelyiDB, inds::SeqEnum[RngIntElt], index::RngIntElt) -> MonStgElt
  {}
  triples := [PointedPassport(s)[i] : i in inds];
  triples := ConvertToOneLine(triples);
  return Sprint(triples);
end intrinsic;

intrinsic OrbitTriplesCyc(s::BelyiDB, inds::SeqEnum[RngIntElt], index::RngIntElt) -> MonStgElt
  {}
  triples := [PointedPassport(s)[i] : i in inds];
  triples := ConvertToCycles(triples);
  return Sprint(triples);
end intrinsic;

intrinsic Base26Encode(n::RngIntElt) -> MonStgElt
{ Given a nonnegative integer n, returns its encoding in base-26 (a=0,..., z=25, ba=26,...). }
    require n ge 0: "n must be a nonnegative integer";
    alphabet := "abcdefghijklmnopqrstuvwxyz";
    s := alphabet[1 + n mod 26]; n := (n-(n mod 26)) div 26;
    while n gt 0 do
        s := alphabet[1 + n mod 26] cat s; n := (n-(n mod 26)) div 26;
    end while;
    return s;
end intrinsic;

intrinsic Base26Decode(s::MonStgElt) -> RngIntElt
{ Given string representing a nonnegative integer in base-26 (a=0,..., z=25, ba=26,...) returns the integer. }
    alphabetbase := StringToCode("a");
    n := 0;
    for c in Eltseq(s) do n := 26*n + StringToCode(c) - alphabetbase; end for;
    return n;
end intrinsic;



intrinsic putrecs(filename::MonStgElt, S::SeqEnum[SeqEnum[MonStgElt]] : Delimiter:="|") -> RngIntElt
  {Given a list of lists of strings, creates a Delimiter delimited file with one list per line, returns number of records written.}
  fp := Open(filename,"w");
  n := 0;
  for r in S do Puts(fp,Join(r, Delimiter)); n+:=1; end for;
  Flush(fp);
  return n;
end intrinsic;


intrinsic StringToStrings (s::MonStgElt) -> SeqEnum[MonStgElt]
{ Given a string encoding a list of strings that do not contain commas or whitespace, e.g. "[cat,dog]", returns a list of the strings, e.g [ "cat", "dog" ]. }
    s := StripWhiteSpace(s);
    require s[1] eq "[" and s[#s] eq "]": "Input must be a string representing a list";
    s := s[2..#s-1];
    return Split(s,",");
end intrinsic;

intrinsic sum(X::[]) -> .
{ Sum of a sequence (empty sum is 0). }
    if #X eq 0 then
        try
            return Universe(X)!0;
        catch e
            return Integers()!0;
        end try;
    end if;
    return &+X;
end intrinsic;

intrinsic sum(v::ModTupRngElt) -> .
{ Sum of a vector. }
    return  sum(Eltseq(v));
end intrinsic;

intrinsic prod(X::[]) -> .
{ Product of a sequence (empty product is 1). }
    if #X eq 0 then
        try
            return Universe(X)!1;
        catch e
            return Integers()!1;
        end try;
    end if;
    return &*X;
end intrinsic;

intrinsic prod(v::ModTupRngElt) -> .
{ Product of a vector. }
    return prod(Eltseq(v));
end intrinsic;

intrinsic strip(X::MonStgElt) -> MonStgElt
{ Strips spaces and carraige returns from string; much faster than StripWhiteSpace. }
    return Join(Split(Join(Split(X," "),""),"\n"),"");
end intrinsic;

intrinsic sprint(X::.) -> MonStgElt
{ Sprints object X with spaces and carriage returns stripped. }
    if Type(X) eq Assoc then return Join(Sort([ $$(k) cat "=" cat $$(X[k]) : k in Keys(X)]),":"); end if;
    return strip(Sprintf("%o",X));
end intrinsic;


//S3 stuff
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
