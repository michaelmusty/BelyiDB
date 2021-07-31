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
  if TriangleType(s) eq "Hyperbolic" then
    return "H";
  elif TriangleType(s) eq "Euclidean" then
    return "E";
  else
    assert TriangleType(s) eq "Spherical";
    return "S";
  end if;
end intrinsic;


intrinsic PassportSize(s::BelyiDB) -> MongStgElt
 {return the size of the passport}
 return Sprintf("%o", #(s`BelyiDBPassport));
end intrinsic;


intrinsic ABC(s::BelyiDB) -> MonStgElt
 {}
    Sprintf("%o", [Order(el) : el in sigma]);
end;

intrisic GroupSt(s::BelyiDB) -> MongStgElt
  {}
  return Split(s`BelyiDBFilename,"-")[1];
end intrinsic;

intrinsic GenusSt(s::BelyiDB) -> MonStgElt
  {}
  return Sprintf("%o", s`BelyiDBGenus);
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
  base_field_data := s`BelyiDBBaseFieldData;
  orbit_base_field_data := [base_field_data[i] : i in inds];
  minpolys := [DefiningPolynomial(orbit_base_field_data[i][1]) : i in [1..#orbit_base_field_data]];
  assert #SequenceToSet(minpolys) eq 1;
  coeffs := Coefficients(minpolys[1]);
  assert Parent(coeffs[1]) eq Rationals() or Parent(coeffs[1]) eq Integers();
  str *:= Sprintf("\'base_field\':%o,\n", coeffs);
  // embeddings
  orbit_embeddings := [];
  for i in inds do
    K := base_field_data[i][1];
    // assert DefiningPolynomial(K) eq DefiningPolynomial(Polredabs_db(K));
    v := base_field_data[i][2];
    conj := base_field_data[i][3];
    z := Eval(K.1, v, conj : prec := 16);
    Append(~orbit_embeddings, [Re(z), Im(z)]);
    return Sprint(orbit_embeddings);
  end for;


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


intrinsic putrecs(filename::MonStgElt,S::SeqEnum[SeqEnum[MonStgElt]]) -> RngIntElt
{ Given a list of lists of strings, creates a colon delimited file with one list per line, returns number of records written. }
    fp := Open(filename,"w");
    n := 0;
    for r in S do Puts(fp,Join(r,":")); n+:=1; end for;
    Flush(fp);
    return n;
end intrinsic;

intrinsic getrecs(filename::MonStgElt:Delimiter:=":") -> SeqEnum
{ Reads a delimited file, returns list of lists of strings (one list per line). }
    return [Split(r,Delimiter:IncludeEmpty):r in Split(Read(filename))];
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

intrinsic atoi(s::MonStgElt) -> RngIntElt
{ Converts a string to an integer (alias for StringToInteger). }
    return #s gt 0 select StringToInteger(s) else 0;
end intrinsic;

intrinsic StringToReal(s::MonStgElt) -> RngIntElt
{ Converts a decimal string (like 123.456 or 1.23456e40 or 1.23456e-10) to a real number at default precision. }
    if #s eq 0 then return 0.0; end if;
    if "e" in s then
        t := Split(s,"e");
        require #t eq 2: "Input should have the form 123.456e20 or 1.23456e-10";
        return StringToReal(t[1])*10.0^StringToInteger(t[2]);
    end if;
    t := Split(s,".");
    require #t le 2: "Input should have the form 123 or 123.456 or 1.23456e-10";
    n := StringToInteger(t[1]);  s := t[1][1] eq "-" select -1 else 1;
    return #t eq 1 select RealField()!n else RealField()!n + s*RealField()!StringToInteger(t[2])/10^#t[2];
end intrinsic;

intrinsic atof (s::MonStgElt) -> RngIntElt
{ Converts a decimal string (like "123.456") to a real number at default precision. }
    return StringToReal(s);
end intrinsic;

intrinsic StringsToAssociativeArray(s::SeqEnum[MonStgElt]) -> Assoc
{ Converts a list of strings "a=b" to an associative array A with string keys and values such that A[a]=b. Ignores strings not of the form "a=b". }
    A := AssociativeArray(Universe(["string"]));
    for a in s do t:=Split(a,"="); if #t eq 2 then A[t[1]]:=t[2]; end if; end for;
    return A;
end intrinsic;

intrinsic atod(s::SeqEnum[MonStgElt]) -> Assoc
{ Converts a list of strings "a=b" to an associative array A with string keys and values such that A[a]=b (alias for StringsToAssociativeArray). }
    return StringsToAssociativeArray(s);
end intrinsic;

intrinsic StringToIntegerArray(s::MonStgElt) -> SeqEnum[RngIntElt]
{ Given string representing a sequence of integers, returns the sequence (faster and safer than eval). }
    t := strip(s);
    if t eq "[]" then return [Integers()|]; end if;
    assert #t ge 2 and t[1] eq "[" and t[#t] eq "]";
    return [Integers()|StringToInteger(n):n in Split(t[2..#t-1],",")];
end intrinsic;

intrinsic atoii(s::MonStgElt) -> SeqEnum[RngIntElt]
{ Converts a string to a sequence of integers (alias for StringToIntegerArray). }
    return StringToIntegerArray(s);
end intrinsic;

intrinsic atoiii(s::MonStgElt) -> SeqEnum[RngIntElt]
{ Converts a string to a sequence of sequences of integers. }
    t := strip(s);
    if t eq "[]" then return []; end if;
    if t eq "[[]]" then return [[Integers()|]]; end if;
    assert #t gt 4 and t[1..2] eq "[[" and t[#t-1..#t] eq "]]";
    r := Split(t[2..#t-1],"[");
    return [[Integers()|StringToInteger(n):n in Split(a[1] eq "]" select "" else Split(a,"]")[1],",")]:a in r];
end intrinsic;

intrinsic StringToRationalArray(s::MonStgElt) -> SeqEnum[RatFldElt]
{ Given string representing a sequence of rational numbers, returns the sequence (faster and safer than eval). }
    if s eq "[]" then return []; end if;
    t := strip(s);
    assert #t ge 2 and t[1] eq "[" and t[#t] eq "]";
    return [StringToRational(n):n in Split(t[2..#t-1],",")];
end intrinsic;

intrinsic StringToRealArray(s::MonStgElt) -> SeqEnum[RatFldElt]
{ Given string representing a sequence of real numbers, returns the sequence (faster and safer than eval). }
    if s eq "[]" then return []; end if;
    t := strip(s);
    assert #t ge 2 and t[1] eq "[" and t[#t] eq "]";
    return [atof(n):n in Split(t[2..#t-1],",")];
end intrinsic;

intrinsic atoff(s::MonStgElt) -> SeqEnum[RngIntElt]
{ Converts a string to a sequence of reals (alias for StringToRealArray). }
    return StringToRealArray(s);
end intrinsic;

intrinsic atofff(s::MonStgElt) -> SeqEnum[RngIntElt]
{ Converts a string to a sequence of sequences of real numbers. }
    t := strip(s);
    if t eq "[]" then return []; end if;
    if t eq "[[]]" then return [[RealField()|]]; end if;
    assert #t gt 4 and t[1..2] eq "[[" and t[#t-1..#t] eq "]]";
    r := Split(t[2..#t-1],"[");
    return [[RealField()|StringToReal(n):n in Split(a[1] eq "]" select "" else Split(a,"]")[1],",")]:a in r];
end intrinsic;






