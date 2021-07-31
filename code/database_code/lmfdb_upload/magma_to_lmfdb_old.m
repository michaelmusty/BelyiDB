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

intrinsic OneLineConverter(l::SeqEnum[GrpPermElt]) -> MonStgElt
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

intrinsic CycleConverter(tau::GrpPermElt) -> MonStgElt
  {}
  if tau eq Identity(Parent(tau)) then
    return "()";
  else
    return Sprintf("%o", tau);
  end if;
end intrinsic;

intrinsic CycleConverter(sigma::SeqEnum[GrpPermElt]) -> MonStgElt
  {}
  assert #sigma eq 3;
  str := "[";
  str *:= "\'";
  str *:= CycleConverter(sigma[1]);
  str *:= "\'";
  str *:= ",";
  str *:= "\'";
  str *:= CycleConverter(sigma[2]);
  str *:= "\'";
  str *:= ",";
  str *:= "\'";
  str *:= CycleConverter(sigma[3]);
  str *:= "\'";
  str *:= "]";
  return str;
end intrinsic;

intrinsic CycleConverter(triples::SeqEnum[SeqEnum[GrpPermElt]]) -> MonStgElt
  {}
  str := "";
  str *:= "[";
  for i := 1 to #triples-1 do
    str *:= Sprintf("%o", CycleConverter(triples[i]));
    str *:= ",";
  end for;
  str *:= Sprintf("%o", CycleConverter(triples[#triples]));
  str *:= "]";
  return str;
end intrinsic;

intrinsic OneLineConverter(l::SeqEnum[SeqEnum[GrpPermElt]]) -> MonStgElt
  {}
  str := "[";
  if #l eq 0 then
    str *:= "[]";
  else
    for i := 1 to #l-1 do
      str *:= OneLineConverter(l[i]);
      str *:= ",";
    end for;
    str *:= OneLineConverter(l[#l]);
  end if;
  str *:= "]";
  return str;
end intrinsic;



intrinsic GalmapsDictionary(s::BelyiDB, inds::SeqEnum[RngIntElt], index::RngIntElt) -> MonStgElt
  {Return a dictionary with the attributes of the galois orbit map.
    inds is the indices of the triples belonging to the orbit in the pointed passport (which contains all triples of the passport).
    index is the index of the Galois orbit in the list of Galois orbits.
  }
  str := "";
  letter := IntegerToLetter(index);
  // label
  label_str := Sprintf("%o-%o", Name(s), letter);
  str *:= Sprintf("\'label\':\'%o\',\n", label_str);
  // plabel
  plabel_str := Sprintf("%o", Name(s));
  str *:= Sprintf("\'plabel\':\'%o\',\n", plabel_str);
  // triples
  triples := [PointedPassport(s)[i] : i in inds];
  triples_str := OneLineConverter(triples);
  str *:= Sprintf("\'triples\':%o,\n", triples_str);
  // triples_cyc
  triples_cyc_str := CycleConverter(triples);
  str *:= Sprintf("\'triples_cyc\':%o,\n", triples_cyc_str);
  // aut_group
    pass := PointedPassport(s);
    aut := AutomorphismGroup(pass[inds[1]]);
    for i in inds do
      assert aut eq AutomorphismGroup(pass[i]);
    end for;
    if #aut eq 1 then
      aut_group_str := Sprintf("[%m]", Identity(aut));
    else
      gens := SetToSequence(Generators(aut));
      aut_group_str := OneLineConverter(gens);
    end if;
    str *:= Sprintf("\'aut_group\':%o,\n", aut_group_str);
  // base_field
  base_field_data := BaseFieldData(s);
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
  end for;
  str *:= Sprintf("\'embeddings\':%o,\n", orbit_embeddings);
  // pass_size
  // assert #Passport(s) eq #PointedPassport(s);
  str *:= Sprintf("\'pass_size\':%o,\n", #PointedPassport(s));
  // curve and map
  X := BelyiCurves(s)[inds[1]];
  phi := BelyiMaps(s)[inds[1]];
  K<nu> := BaseField(X);
  g := Genus(s);
  assert Genus(X) eq Genus(s);
  if g eq 0 then
    KX<x> := Parent(phi);
    str *:= Sprintf("\'curve\':\'PP1\',\n");
    str *:= Sprintf("\'map\':\'%o\',\n", phi);
  elif g eq 1 then
    assert IsProjective(X);
    v,u := HyperellipticPolynomials(X);
    _<x> := Parent(u);
    _<x> := Parent(v);
    if u eq 0 then
      curve_str := Sprintf("y^2=%o",  v);
    else
      curve_str := Sprintf("y^2+%o*y=%o", u, v);
    end if;
    str *:= Sprintf("\'curve\':\'%o\',\n", curve_str);
    KX<x,y> := Parent(phi);
    str *:= Sprintf("\'map\':\'%o\',\n", phi);
  elif Type(X) eq CrvHyp then
    assert IsProjective(X);
    v,u := HyperellipticPolynomials(X);
    _<x> := Parent(u);
    _<x> := Parent(v);
    if u eq 0 then
      curve_str := Sprintf("y^2=%o", v);
    else
      curve_str := Sprintf("y^2+%o*y=%o", u, v);
    end if;
    str *:= Sprintf("\'curve\':\'%o\',\n", curve_str);
    KX<x,y> := Parent(phi);
    str *:= Sprintf("\'map\':\'%o\',\n", phi);
  else
    X<[x]> := X;
    B := Basis(Ideal(X));
    P<[x]> := Parent(B[1]);
    AssignNames(~P, VarSeq("x", 1, Rank(P)));
    str *:= Sprintf("\'curve\':\'%o\',\n", B);
    KX<[x]> := Parent(phi);
    str *:= Sprintf("\'map\':\'%o\',\n",phi);
  end if;
  // orbit_size
  str *:= Sprintf("\'orbit_size\':%o,\n", #inds);
  // degree
  str *:= Sprintf("\'deg\':%o,\n", Degree(s));
  // group
  l := BelyiDBGetInfo(Filename(s));
  assert l[2] eq "T";
  assert l[1] eq Degree(s);
  group_str := Sprintf("%oT%o", l[1], l[3][2]);
  str *:= Sprintf("\'group\':\'%o\',\n", group_str);
  // group_num
  str *:= Sprintf("\'group_num\':%o,\n", l[3][2]);
  // geomtype
  str *:= Sprintf("\'geomtype\':\'%o\',\n", ShortType(s));
  // abc
  str *:= Sprintf("\'abc\':%o,\n", Orders(s));
  // a_s
  abc_sorted := Sort(Orders(s));
  str *:= Sprintf("\'a_s\':%o,\n", abc_sorted[1]);
  // b_s
  str *:= Sprintf("\'b_s\':%o,\n", abc_sorted[2]);
  // c_s
  str *:= Sprintf("\'c_s\':%o,\n", abc_sorted[3]);
  // lambdas
  sigma := PermutationTriple(s);
  lambdas_str := "[";
  lambdas_str *:= Sprintf("%o,", PermutationToPartition(sigma[1]));
  lambdas_str *:= Sprintf("%o,", PermutationToPartition(sigma[2]));
  lambdas_str *:= Sprintf("%o", PermutationToPartition(sigma[3]));
  lambdas_str *:= "]";
  str *:= Sprintf("\'lambdas\':%o,\n", lambdas_str);
  // g
  assert l[#l] eq Genus(s);
  str *:= Sprintf("\'g\':%o", Genus(s));
  return str;
end intrinsic;

intrinsic BelyiDBToDictionary(s::BelyiDB) -> MonStgElt
  {return a dictionary with the attributes of the passport}
  assert BelyiMapIsComputed(s);
  // assert GaloisOrbitsSanityCheck(s);
  // assert IsPolredabsMatch(s);
  // assert EmbeddingsSanityCheck(s);
  str := "[\n{\n";
  /* passport dictionary */
  // plabel
  str *:= Sprintf("\'plabel\':\'%o\',\n", Name(s));
  // deg
  str *:= Sprintf("\'deg\':%o,\n", Degree(s));
  // group
  l := BelyiDBGetInfo(Filename(s));
  assert l[2] eq "T";
  assert l[1] eq Degree(s);
  group_str := Sprintf("%oT%o", l[1], l[3][2]);
  str *:= Sprintf("\'group\':\'%o\',\n", group_str);
  // geomtype
  str *:= Sprintf("\'geomtype\':\'%o\',\n", ShortType(s));
  // abc
  str *:= Sprintf("\'abc\':%o,\n", Orders(s));
  // lambdas
  sigma := PermutationTriple(s);
  lambdas_str := "[";
  lambdas_str *:= Sprintf("%o,", PermutationToPartition(sigma[1]));
  lambdas_str *:= Sprintf("%o,", PermutationToPartition(sigma[2]));
  lambdas_str *:= Sprintf("%o", PermutationToPartition(sigma[3]));
  lambdas_str *:= "]";
  str *:= Sprintf("\'lambdas\':%o,\n", lambdas_str);
  // g
  assert l[#l] eq Genus(s);
  str *:= Sprintf("\'g\':%o,\n", Genus(s));
  // maxdegbf
  base_field_data := BaseFieldData(s);
  degrees := [Degree(base_field_data[i][1]) : i in [1..#base_field_data]];
  max_degree := Max(degrees);
  str *:= Sprintf("\'maxdegbf\':%o,\n", max_degree);
  // pass_size
  // assert #Passport(s) eq #PointedPassport(s);
  // str *:= Sprintf("\'pass_size\':%o,\n", #Passport(s));
  str *:= Sprintf("\'pass_size\':%o,\n", #PointedPassport(s));
  // num_orbits
  str *:= Sprintf("\'num_orbits\':%o\n", #GaloisOrbits(s));
  /* galmaps dictionaries */
  gal_orbits_before_sorting := GaloisOrbits(s); // we will sort by size (increasing)
  gal_orbits := gal_orbits_before_sorting;
  gal_orbits_sizes := [#orbit : orbit in gal_orbits_before_sorting];
  ParallelSort(~gal_orbits_sizes, ~gal_orbits);
  for i := 1 to #gal_orbits-1 do
    assert #gal_orbits[i] le #gal_orbits[i+1];
  end for;
  pass := PointedPassport(s);
  str *:= "}\n,\n[\n";
  for i := 1 to #gal_orbits-1 do
    gal_orbit := gal_orbits[i];
    inds := [Index(pass, triple) : triple in gal_orbit];
    str *:= Sprintf("{\n%o\n}\n,\n", GalmapsDictionary(s, inds, i));
  end for;
  str *:= "{\n";
  gal_orbit := gal_orbits[#gal_orbits];
  inds := [Index(pass, triple) : triple in gal_orbit];
  str *:= Sprintf("%o\n", GalmapsDictionary(s, inds, #gal_orbits));
  str *:= "}\n]\n]";
  /* return */
  return str;
end intrinsic;
