intrinsic BelyiDBGenerateName(sigma::SeqEnum[GrpPermElt]) -> MonStgElt
  {Generate a unique string identifying the passport corresponding to sigma.}
  assert #sigma eq 3;
  H := Parent(sigma[1]);
  d := Degree(H);
  G := sub<Sym(d)|sigma>;
  assert IsTransitive(G);
  a,b,c := Explode([Order(sigma[1]), Order(sigma[2]), Order(sigma[3])]);
  if (a lt 10) and (b lt 10) and (c lt 10) then
    g,d_test := TransitiveGroupIdentification(G);
    assert d eq d_test;
    name := Sprintf("%oT%o-[%o,%o,%o]-", d, g, a, b, c);
    cs0, cs1, csoo := Explode([CycleStructure(sigma[i]) : i in {1..3}]);
    for i in {1..#cs0-1} do
      for j in {1..cs0[i][2]} do
        name *:= Sprintf("%o", cs0[i][1]);
      end for;
    end for;
    for j in {1..cs0[#cs0][2]} do
      name *:= Sprintf("%o", cs0[#cs0][1]);
    end for;
    name *:= "-";
    for i in {1..#cs1-1} do
      for j in {1..cs1[i][2]} do
        name *:= Sprintf("%o", cs1[i][1]);
      end for;
    end for;
    for j in {1..cs1[#cs1][2]} do
      name *:= Sprintf("%o", cs1[#cs1][1]);
    end for;
    name *:= "-";
    for i in {1..#csoo} do
      for j in {1..csoo[i][2]} do
        name *:= Sprintf("%o", csoo[i][1]);
      end for;
    end for;
    c0 := #CycleDecomposition(sigma[1]);
    c1 := #CycleDecomposition(sigma[2]);
    coo := #CycleDecomposition(sigma[3]);
    genus := (d+2-c0-c1-coo)/2;
    name *:= Sprintf("-g%o", genus);
  else
    if d le 31 then
      g,d_test := TransitiveGroupIdentification(G);
      assert d eq d_test;
      name := Sprintf("%oT%o-[%o,%o,%o]-", d, g, a, b, c);
    else
      size, g := Explode(IdentifyGroup(G));
      name := Sprintf("%oS%o,%o-[%o,%o,%o]-", d, size, g, a, b, c);
    end if;
    cs0, cs1, csoo := Explode([CycleStructure(sigma[i]) : i in {1..3}]);
    for i in {1..#cs0-1} do
      for j in {1..cs0[i][2]} do
        name *:= Sprintf("%o,", cs0[i][1]);
      end for;
    end for;
    for j in {1..cs0[#cs0][2]-1} do
      name *:= Sprintf("%o,", cs0[#cs0][1]);
    end for;
    name *:= Sprintf("%o", cs0[#cs0][1]);
    name *:= "-";
    for i in {1..#cs1-1} do
      for j in {1..cs1[i][2]} do
        name *:= Sprintf("%o,", cs1[i][1]);
      end for;
    end for;
    for j in {1..cs1[#cs1][2]-1} do
      name *:= Sprintf("%o,", cs1[#cs1][1]);
    end for;
    name *:= Sprintf("%o", cs1[#cs1][1]);
    name *:= "-";
    for i in {1..#csoo-1} do
      for j in {1..csoo[i][2]} do
        name *:= Sprintf("%o,", csoo[i][1]);
      end for;
    end for;
    for j in {1..csoo[#csoo][2]-1} do
      name *:= Sprintf("%o,", csoo[#csoo][1]);
    end for;
    name *:= Sprintf("%o", csoo[#csoo][1]);
    c0 := #CycleDecomposition(sigma[1]);
    c1 := #CycleDecomposition(sigma[2]);
    coo := #CycleDecomposition(sigma[3]);
    genus := (d+2-c0-c1-coo)/2;
    name *:= Sprintf("-g%o", genus);
  end if;
  return name;
end intrinsic;

intrinsic BelyiDBExample(ppass::SeqEnum[SeqEnum[GrpPermElt]]) -> BelyiDB
  {Creates a BelyiDB object corresponding to pointed passport ppass.}
  // some sanity checks
    assert #ppass gt 0;
    sigma := ppass[1];
    pass := PassportRepresentatives(sigma);
    assert #ppass ge #pass;
    // assert #ppass eq #pass; // just for fun
    d := Degree(Parent(sigma[1]));
    G := sub< Sym(d) | sigma >;
    assert IsTransitive(G);
    assert Parent(ppass[1][1]) eq G;
  // BelyiDBName
    if Degree(sigma[1]) gt TransitiveGroupDatabaseLimit() then
      error "group not in transitive database!";
    else
      newname := BelyiDBGenerateName(sigma);
    end if;
  // create one BelyiDB per passport
    s := BelyiDBInitialize();
  // easy attrs
    s`BelyiDBName := newname;
    s`BelyiDBFilename := newname cat ".m";
    s`BelyiDBDegree := d;
    s`BelyiDBOrders := [Order(sigma[i]) : i in {1..3}];
    // BelyiDBType
      a,b,c := Explode(s`BelyiDBOrders);
      if 1/a+1/b+1/c gt 1 then
        s`BelyiDBType := "Spherical";
      elif 1/a+1/b+1/c eq 1 then
        s`BelyiDBType := "Euclidean";
      else
        s`BelyiDBType := "Hyperbolic";
      end if;
    // BelyiDBGenus
      c0 := #CycleDecomposition(sigma[1]);
      c1 := #CycleDecomposition(sigma[2]);
      coo := #CycleDecomposition(sigma[3]);
      genus := (d+2-c0-c1-coo)/2;
      s`BelyiDBGenus := genus;
    s`BelyiDBSize := #pass;
    s`BelyiDBPointedSize := #ppass;
  // permutation attrs
    s`BelyiDBPermutationTriple := sigma;
    // BelyiDBAutomorphismGroup
    s`BelyiDBAutomorphismGroup := AutomorphismGroup(sigma);
    s`BelyiDBPointedAutomorphismGroup := PointedAutomorphismGroup(sigma);
    s`BelyiDBMonodromyGroup := G;
    s`BelyiDBPassport := pass;
    s`BelyiDBPointedPassport := ppass;
    // s`BelyiDBGaloisOrbits computed later
  return s;
end intrinsic;

intrinsic BelyiDBPlaceIndex(base_field_data::List) -> RngIntElt
  {returns integer that records the infinite place of a number field.}
  K := base_field_data[1];
  Kv := base_field_data[2];
  places := InfinitePlaces(K);
  for i := 1 to #places do
    if places[i] eq Kv then
      return i;
    end if;
  end for;
  error "Didn't find a place!";
end intrinsic;

intrinsic BelyiDBGenerate(d::RngIntElt) -> MonStgElt
  {Creates the folder /d in BelyiDB with all BelyiDB files for degree d. This assumes the current directory is /BelyiDB.}
  // directory stuff
    dir := GetCurrentDirectory();
    parentdir := Pipe(Sprintf("basename 'dirname %o'", dir), "");
    if parentdir eq "BelyiDB\n" then
      dbdirectory := dir;
    else
      error "make sure your working directory is /BelyiDB";
    end if;
    directory := dbdirectory cat Sprintf("/%o/", d);
    System(Sprintf("mkdir %o", d)); // if directory already exists this throws a system error but all good
    System(Sprintf("chmod 777 %o", d)); // set permissions for directory
  // generate all degree d passports
  db := TransitiveGroups(d);
  for G in db do
    ppassesG := PassportRepresentatives(G : Pointed := true);
    for j in {1..#ppassesG} do // j indexes the passports of a group
      ppass := ppassesG[j][2]; // this is a single passport
      s := BelyiDBExample(ppass);
      // write the object to file
      BelyiDBWrite(s);
    end for;
  end for;
  returnText := Sprintf("BelyiDB for degree %o constructed in directory %o/%o\n", d, dbdirectory, d);
  return returnText;
end intrinsic;

/* */

intrinsic MakeBaseFieldData(sigma::SeqEnum[GrpPermElt], X::Crv, phi::FldFunFracSchElt : conj := false, plc_index := 1, prec := 20, field_index := 1) -> Any
  {returns [* K, Kv, conj, zCC *] with zCC = 0 for use with BelyiDBWrite.}
  assert Parent(phi) eq FunctionField(X);
  assert BelyiMapSanityCheck(sigma, X, phi);
  K := BaseField(X);
  if not ISA(Type(K), FldNum) then
    assert field_index eq 1;
    assert K eq Rationals();
    K<nu1> := RationalsAsNumberField();
  else
    AssignNames(~K, [Sprintf("nu%o", field_index)]);
  end if;
  zCC := ComplexField(prec)!0;
  conj := conj;
  Kv := InfinitePlaces(K)[plc_index];
  return [* K, Kv, conj, zCC *];
end intrinsic;
