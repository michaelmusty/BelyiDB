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

intrinsic PermutationTripleToLabel(sigma::SeqEnum[GrpPermElt]) -> MonStgElt
  {Given a permutation triple sigma}
  assert #sigma eq 3;
  G := sub< Parent(sigma[1]) | sigma >;
  d, k := TransitiveGroupIdentification(G);
  label := Sprintf("%oT%o-", d, k);
  for sig in sigma do
    label *:= PermutationToCycleStructure(sig);
    label *:= "_";
  end for;
  label := label[1..#label-1];
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

intrinsic SortPermutations(~sigma::SeqEnum[GrpPermElt])
  {}
  sigma := SortPermutations(sigma);
end intrinsic;

intrinsic BelyiDBObjToLMFDB(s::BelyiDB) -> MonStgElt
  {}

end intrinsic;
