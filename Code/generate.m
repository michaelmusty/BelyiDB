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
