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

// TODO: doesn't work for 2-digit ramification indices
intrinsic LMFDBLabelToBelyiDBLabel(label::MonStgElt : dot_m := false) -> MonStgElt
  {Given a LMFDB Belyi passport label, e.g., "7T7-7_4.3_4.3", return the corresponding BelyiDB passports
    label, e.g., "7T7-[7,12,12]-7-43-43-g2". If dot_m, then include .m in the output.}
  slabel := Split(label, "-");
  label_new := "";
  label_new *:= slabel[1];
  label_new *:= "-";
  rams := Split(slabel[2], "_");
  tail := "";
  ram_inds := [];
  for ram in rams do
    sram := Split(ram, ".");
    tail *:= Join(sram, "")*"-";
    Append(~ram_inds, [eval el : el in sram]);
  end for;
  tail := tail[1..#tail-1];
  lcms := [Lcm(el) : el in ram_inds];
  label_new *:= ReplaceString(Sprint(lcms), " ", "")*"-";
  label_new *:= tail*"-";
  // compute genus
  d := eval Split(slabel[1],"T")[1];
  degK := -2*d;
  for inds in ram_inds do
    for e in inds do
      degK +:= (e-1);
    end for;
  end for;
  assert degK mod 2 eq 0;
  label_new *:= "g"*Sprint((degK+2) div 2);
  if dot_m then
    label_new *:= ".m";
  end if;
  return label_new;
end intrinsic;

intrinsic ShortGeometryType(s::BelyiDB) -> MonStgElt
  {}
  return TriangleType(s)[1];
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

intrinsic SortedPointedPassport(s::BelyiDB) -> SeqEnum
  {}
  ppass := s`BelyiDBPointedPassport;
  ppass_sort := [];
  for sigma in ppass do
    Append(~ppass_sort, SortPermutations(sigma));
  end for;
  return ppass_sort;
end intrinsic;

intrinsic PassportFileHeaders() -> MonStgElt
  {}
  return "geomtype|pass_size|abc|group|g|maxdegbf|lambdas|plabel|BelyiDB_plabel|num_orbits|deg|a_s|b_s|c_s|aut_group";
  //return "geomtype|pass_size|abc|group|g|maxdegbf|lambdas|plabel|BelyiDB_plabel|num_orbits|deg|a_s|b_s|c_s|passport_pointed|aut_group";
end intrinsic;

// sorted version
intrinsic BelyiDBPassportToLMFDB(s::BelyiDB) -> MonStgElt
  {return string containing one row of data}
  row := "";
  ppass := SortedPointedPassport(s);
  sigma := ppass[1];
  // geomtype
  row *:= ShortGeometryType(s);
  // pass_size
  row *:= Sprintf("|%o", #ppass);
  // abc
  row *:= Sprintf("|%o", [Order(el) : el in sigma]);
  // group
  row *:= Sprintf("|%o", Split(s`BelyiDBFilename,"-")[1]);
  // g
  row *:= Sprintf("|%o", s`BelyiDBGenus);
  // maxdegbf (maximum degree of base field)
  row *:= Sprintf("|%o", Maximum([#el : el in s`BelyiDBGaloisOrbits]));
  // lambdas (partitions)
  lambdas_str := "[";
  for i := 1 to 2 do
    lambdas_str *:= Sprintf("%o,", PermutationToPartition(sigma[i]));
  end for;
  lambdas_str *:= Sprintf("%o", PermutationToPartition(sigma[3]));
  lambdas_str *:= "]";
  row *:= Sprintf("|%o", lambdas_str);
  // plabel
  row *:= Sprintf("|%o", PermutationTripleToLMFDBLabel(sigma));
  // BelyiDB_plabel
  row *:= Split(s`BelyiDBFilename,".")[1];
  // num_orbits
  row *:= Sprintf("|%o", #s`BelyiDBGaloisOrbits);
  // deg
  row *:= Sprintf("|%o", s`BelyiDBDegree);
  // a_s, b_s, c_s (sorted abc)
  abc_sorted := Sort(Orders(s));
  for i := 1 to 3 do
    row *:= Sprintf("|%o", abc_sorted[i]);
  end for;
  row *:= Sprintf("|%o", ConvertToOneLine(ppass));
  // aut_group
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
  row *:= Sprintf("|%o", aut_group_str);
  return row;
end intrinsic;

// unsorted version
/*
intrinsic BelyiDBPassportToLMFDB(s::BelyiDB) -> MonStgElt
  {return string containing one row of data}
  row := "";
  // geomtype
  row *:= ShortGeometryType(s);
  // pass_size
  row *:= Sprintf("|%o", #(s`BelyiDBPassport));
  // abc
  row *:= Sprintf("|%o", s`BelyiDBOrders);
  // group
  row *:= Sprintf("|%o", Split(s`BelyiDBFilename,"-")[1]);
  // g
  row *:= Sprintf("|%o", s`BelyiDBGenus);
  // maxdegbf (maximum degree of base field)
  row *:= Sprintf("|%o", Maximum([#el : el in s`BelyiDBGaloisOrbits]));
  // lambdas (partitions)
  sigma := s`BelyiDBPermutationTriple;
  lambdas_str := "[";
  for i := 1 to 2 do
    lambdas_str *:= Sprintf("%o,", PermutationToPartition(sigma[i]));
  end for;
  lambdas_str *:= Sprintf("%o", PermutationToPartition(sigma[3]));
  lambdas_str *:= "]";
  row *:= Sprintf("|%o", lambdas_str);
  // plabel
  row *:= Sprintf("|%o", PermutationTripleToLMFDBLabel(sigma));
  // num_orbits
  row *:= Sprintf("|%o", #s`BelyiDBGaloisOrbits);
  // deg
  row *:= Sprintf("|%o", s`BelyiDBDegree);
  // a_s, b_s, c_s (sorted abc)
  abc_sorted := Sort(Orders(s));
  for i := 1 to 3 do
    row *:= Sprintf("|%o", abc_sorted[i]);
  end for;
  // passport_pointed
  // will sorting cause problems? abc and lambdas out of order?
  // not to mention the Belyi map...
  ppass := PointedPassport(s)
  row *:= Sprintf("|%o", ConvertToOneLine(ppass));
  // aut_group
  aut := AutomorphismGroup(ppass[1]);
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
  return row;
end intrinsic;
*/
