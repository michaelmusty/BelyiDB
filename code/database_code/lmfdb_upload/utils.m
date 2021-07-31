intrinsic PassportLabel(s::BelyiDB) -> MonStgElt
  {return Passport label}
  function add_dot_seps(string):
    return Join([string[i] : i in [1..#string]], ".");
  end function;
  spl = Split(BelyiDB_plabel(s));
  return "%o-%o_%o_%o".format(spl[1],add_dot_seps(spl[3]),add_dot_seps(spl[4]),add_dot_seps(spl[5]))
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


intrinsic PassportSize(s::BelyiDB) -> MongStgElt
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
  sprint([Order(el) : el in sigma]);
end;

intrinsic ABC_sorted(s::BelyiDB, i::RngIntElt) -> MonStgElt
 {}
  return sprint(Sort([Order(el) : el in sigma])[i]);
end;

intrinsic a_s(s::BelyiDB) -> MonStgElt
 {}
  return ABC_sorted(s, 1);
end;

intrinsic b_s(s::BelyiDB) -> MonStgElt
  {}
  return ABC_sorted(s, 2);
end;

intrinsic c_s(s::BelyiDB) -> MonStgElt
  {}
  return ABC_sorted(s, 3);
end;

intrisic GroupSt(s::BelyiDB) -> MongStgElt
  {}
  return Split(s`BelyiDBFilename,"-")[1];
end intrinsic;

intrinsic GenusSt(s::BelyiDB) -> MonStgElt
  {}
  return sprint(s`BelyiDBGenus);
end intrinsic;

intrinsic DegreegSt(s::BelyiDB) -> MonStgElt
  {}
  return sprint(s`BelyiDBDegree);
end intrinsic;

intrinsic MaximumBaseFieldDegree(s::BelyiDB) -> MonStgElt
  {}
  return sprint(Maximum([#el : el in s`BelyiDBGaloisOrbits]));
end intrinsic;

intrinsic BelyiDB_plabel(s::BelyiDB) -> MonStgElt
  {}
  return Split(s`BelyiDBFilename,".")[1];
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

intrinsic PointedPassportSt(s::BelyiDB) -> MonStgElt // aka triples
  {}
  return sprint(ConvertToOneLine(PointedPassport(s)));
end intrinsic;

intrinsic LambdaSt(s::BelyiDB) -> MonStgElt //lambdas (partitions)
  {}
  lambdas_str := "[";
  for i := 1 to 2 do
    lambdas_str *:= sprint(PermutationToPartition(sigma[i]));
  end for;
  lambdas_str *:= sprint(PermutationToPartition(sigma[3]));
  lambdas_str *:= "]";
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
