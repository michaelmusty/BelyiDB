intrinsic AutomorphismGroup(sigma::SeqEnum[GrpPermElt]) -> GrpPerm
  {Returns the automorphism group of the dessin.}
  S := Generic(Parent(sigma[1]));
  G := sub<S|sigma>;
  sigma := [G!sigma[i] : i in [1..3]];
  return &meet[ Centralizer(S, s) : s in sigma ];
end intrinsic;

intrinsic PointedAutomorphismGroup(sigma::SeqEnum[GrpPermElt] : bp := 1, sh := 1) -> GrpPerm
  {Returns the automorphism group of the dessin, pointed by the sheet 1 above
  the first branch point.}
  G := AutomorphismGroup(sigma);
  cycles := CycleDecomposition(sigma[bp]);
  gset := GSet(G, Set(cycles));
  cycle := [ cycle : cycle in cycles | sh in cycle ][1];
  return Stabilizer(G, gset ! cycle);
end intrinsic;
