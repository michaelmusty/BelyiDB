/* auxiliary functions */

intrinsic Eval(alpha::FldNumElt, v::PlcNumElt, is_conjugated::BoolElt) -> FldComElt
  {}
  z := Evaluate(alpha, v);
  if is_conjugated then
    return ComplexConjugate(z);
  else
    return z;
  end if;
end intrinsic;

intrinsic Eval(l::List) -> FldComElt
  {}
  return Eval(l[1].1, l[2], l[3]);
end intrinsic;

intrinsic MachineZero(z::FldReElt) -> BoolElt
  {}
  prec := Precision(Parent(z));
  if AbsoluteValue(z) le 10^(-prec/2) then
    return true;
  else
    return false;
  end if;
end intrinsic;

intrinsic MachineZero(z::FldComElt) -> BoolElt
  {}
  prec := Precision(Parent(z));
  if AbsoluteValue(z) le 10^(-prec/2) then
    return true;
  else
    return false;
  end if;
end intrinsic;

/* pari interpreter */

intrinsic Polred(f::RngUPolElt) -> RngUPolElt
  { A smallest generating polynomial of the number field, using pari. }
  cmd := Sprintf(
    "{print(Vecrev(Vec(polredabs(Pol(Vecrev(%o))))))}", Coefficients(f));
  s := Pipe("gp -q", cmd);
  ss := [ StringToInteger(x) : x in Split(s, ", []\n") | x ne "" ];
  return Parent(f) ! ss;
end intrinsic;

intrinsic Polredbest(f::RngUPolElt) -> RngUPolElt
  { A smallest generating polynomial of the number field, using pari. }
  cmd := Sprintf(
   "{print(Vecrev(Vec(polredbest(Pol(Vecrev(%o))))))}",
   Coefficients(f));
  s := Pipe("gp -q", cmd);
  ss := [ StringToInteger(x)
  : x in Split(s, ", []\n") | x ne "" ];
  return Parent(f) ! ss;
end intrinsic;

intrinsic Polredabs(f::RngUPolElt) -> RngUPolElt
  {first do best...twice then do abs.}
  return Polred(Polredbest(Polredbest(f)));
end intrinsic;

/* polredabsify base fields */

intrinsic Polredabs(K::FldNum) -> FldNum
  {}
  if Degree(K) le 1 then
    assert DefiningPolynomial(K) eq DefiningPolynomial(RationalsAsNumberField());
    return K;
  else
    return NumberField(Polredabs(DefiningPolynomial(K)));
  end if;
end intrinsic;

intrinsic Polredabs(mp::Map, K::FldNum, vK::PlcNumElt, is_conjugated::BoolElt) -> Any
  {returns L, vL, and a boolean where L is Polredabs(K) and vL is pullback of vK under the isomorphism mp : L -> K.}
  if Degree(K) eq 1 then // we don't polredabsify QQ
    return K, vK, is_conjugated;
  end if;
  /*
  // after we do some sanity checking uncomment this?
  if DefiningPolynomial(K) eq Polredabs(DefiningPolynomial(K)) then
    return l;
  end if;
  */
  assert ISA(Type(K), FldNum) and ISA(Type(vK), PlcNumElt) and ISA(Type(is_conjugated), BoolElt);
  L := Domain(mp); // mp : L -> K
  assert DefiningPolynomial(L) eq DefiningPolynomial(Polredabs(L));
  assert DefiningPolynomial(L) eq DefiningPolynomial(Polredabs(K));
  assert K eq Codomain(mp);
  vprintf BelyiDB : "Starting field: \n%o\n", K;
  if IsReal(vK) then
    vprintf BelyiDB : "Real place : %o\n", vK;
  else
    vprintf BelyiDB : "Complex place : %o, %o\n", vK, is_conjugated;
  end if;
  vprintf BelyiDB : "Isomorphism : ";
  if mp(L.1) eq K.1 then
    vprintf BelyiDB : "identity : ";
  end if;
  vprintf BelyiDB : "%o -> %o\n", L.1, mp(L.1);
  vprintf BelyiDB : "\n";
  places_K := InfinitePlaces(K);
  places_L := InfinitePlaces(L);
  assert #places_K eq #places_L;
  assert vK in places_K;
  for vL in places_L do
    if Extends(vL, vK) then
      if IsReal(vL) then
        assert IsReal(vK);
        test_value := Evaluate(L.1, vL) - Evaluate(mp(L.1), vL);
        assert MachineZero(test_value);
        return L, vL, false;
      else // vL is a complex place
        test_true := Eval(L.1, vL, true) - Eval(mp(L.1), vK, is_conjugated);
        test_false := Eval(L.1, vL, false) - Eval(mp(L.1), vK, is_conjugated);
        if MachineZero(test_true) then
          return L, vL, true;
        elif MachineZero(test_false) then
          return L, vL, false;
        else
          error "failed to pullback complex place!";
        end if;
      end if;
    end if;
  end for;
end intrinsic;

intrinsic Polredabs(l::List) -> List
  {overloaded for [K,vK,conj] or [K,vK,conj,zCC]}
  t0 := Cputime();
  assert #l in [3, 4];
  K := l[1];
  vK := l[2];
  is_conjugated_K := l[3];
  assert ISA(Type(K), FldNum) and ISA(Type(vK), PlcNumElt) and ISA(Type(is_conjugated_K), BoolElt);
  if #l eq 4 then
    assert ISA(Type(l[4]), FldComElt) or ISA(Type(l[4]), FldReElt);
  end if;
  L := Polredabs(K);
  is_iso, mp := IsIsomorphic(L, K);
  assert is_iso;
  L, vL, is_conjugated_L := Polredabs(mp, K, vK, is_conjugated_K);
  if #l eq 3 then
    return [* L, vL, is_conjugated_L *];
  else
    return [* L, vL, is_conjugated_L, l[4] *];
  end if;
end intrinsic;

/* polredabsify curves and maps */

intrinsic Polredabs(l::List, X::Crv, phi::FldFunFracSchElt) -> List
  {}
  lnew := Polredabs(l);
  is_iso, mp := IsIsomorphic(l[1], lnew[1]);
  Y := BaseChange(X, mp);
  K := lnew[1];
  KX := FunctionField(X);
  assert Parent(phi) eq KX;
  KY := FunctionField(Y);
  m := Rank(Generic(Ideal(Curve(KY))))-1;
  h := eval Sprintf("return hom<KX->KY|[%o]>;", HomText("KY",1,m));
  return [* lnew, Y, h(phi) *];
end intrinsic;

/* polredabsify BelyiDB */

intrinsic Polredabs(t::BelyiDB) -> BelyiDB
  {Polredabs fields, curves, and maps of t.}
  s := BelyiDBCopy(t);
  // assert BaseFieldDataSanityCheck(s);
  ppass := s`BelyiDBPointedPassport;
  lists := s`BelyiDBBaseFieldData;
  curves := s`BelyiDBBelyiCurves;
  maps := s`BelyiDBBelyiMaps;
  assert #SequenceToSet([#lists, #curves, #maps, #ppass]) eq 1;
  // base field data: TODO fix isomorphisms
  for l in lists do
    assert IsAbsoluteField(l[1]);
  end for;
  lists_new := [* *];
  curves_new := [* *];
  maps_new := [* *];
  for i := 1 to #maps do
    triple := Polredabs(lists[i], curves[i], maps[i]);
    Append(~lists_new, triple[1]);
    Append(~curves_new, triple[2]);
    Append(~maps_new, triple[3]);
  end for;
  s`BelyiDBBaseFieldData := lists_new;
  s`BelyiDBBelyiCurves := curves_new;
  s`BelyiDBBelyiMaps := maps_new;
  return s;
end intrinsic;

/* sanity checking */

intrinsic IsPolredabsMatch(s::BelyiDB) -> BoolElt
  {check that base fields of the passport match polredabs.}
  ppass := s`BelyiDBPointedPassport;
  assert #SequenceToSet([#s`BelyiDBBaseFieldData, #s`BelyiDBBelyiCurves, #s`BelyiDBBelyiMaps, #s`BelyiDBPointedPassport]) eq 1;
  curves := s`BelyiDBBelyiCurves;
  maps := s`BelyiDBBelyiMaps;
  fields := [];
  for i := 1 to #ppass do
    Append(~fields, AbsoluteField(s`BelyiDBBaseFieldData[i][1]));
    assert #GeneratorsSequence(fields[i]) eq 1;
  end for;
  bools := [];
  for i := 1 to #fields do
    F := fields[i];
    X := curves[i];
    F_X := BaseField(X);
    phi := maps[i];
    assert Parent(phi) eq FunctionField(X);
    F_phi := BaseField(Curve(Parent(phi)));
    if Degree(F) gt 1 then
      field_bool := DefiningPolynomial(F) eq Polredabs(DefiningPolynomial(F));
    else
      field_bool := true;
    end if;
    if Degree(F_X) gt 1 then
      curve_bool := DefiningPolynomial(F_X) eq Polredabs(DefiningPolynomial(F_X));
    else
      curve_bool := true;
    end if;
    if Degree(F_phi) gt 1 then
      map_bool := DefiningPolynomial(F_phi) eq Polredabs(DefiningPolynomial(F_phi));
    else
      map_bool := true;
    end if;
    bool := field_bool and curve_bool and map_bool;
    Append(~bools, bool);
  end for;
  if #SequenceToSet(bools) eq 1 then
    return true;
  else
    return false;
  end if;
end intrinsic;

intrinsic PolredabsSanityCheck(d::RngIntElt) -> BoolElt
  {Check every BelyiDB of degree d.}
  f := BelyiDBFilenames(d);
  objs := [BelyiDBRead(f[i]) : i in [1..#f]];
  bools := [];
  for s in objs do
    vprintf BelyiDB : "%o : ", Name(s);
    if BelyiMapIsComputed(s) then
      bool := IsPolredabsMatch(s);
      Append(~bools, bool);
      vprintf BelyiDB : "%o\n", bool;
    else
      vprintf BelyiDB : "Belyi maps not computed\n";
    end if;
  end for;
  bools_set := SequenceToSet(bools);
  if #bools_set in [0,1] then
    return true;
  else
    assert #bools_set eq 2;
    return false;
  end if;
end intrinsic;

/* code that modifies files */

intrinsic PolredabsConversion(s::BelyiDB) -> BoolElt
  {Convert BelyiDB to polredabsified BelyiDB, sanity check the maps, write to file, and read in again. Return true if successful.}
  sanity_bools := [];
  vprintf BelyiDB : "%o:\n", Name(s);
  t := Polredabs(s);
  vprintf BelyiDB : "  Polredabsified\n";
  vprintf BelyiDB : "  p=%o sanity check: ", 101;
  bool_local_101 := BelyiLocalSanityCheck(t, 101);
  vprintf BelyiDB : "%o\n", bool_local_101;
  Append(~sanity_bools, bool_local_101);
  vprintf BelyiDB : "  p=%o sanity check: ", 830111;
  bool_local_830111 := BelyiLocalSanityCheck(t, 830111);
  Append(~sanity_bools, bool_local_830111);
  vprintf BelyiDB : "%o\n", bool_local_830111;
  if #SequenceToSet(sanity_bools) eq 1 and sanity_bools[1] eq true then
    BelyiDBWrite(t);
    t := BelyiDBRead(Filename(t));
    if BelyiLocalSanityCheck(t, 18287) then
      vprintf BelyiDB : "Reading in file successful.\n";
      return true;
    else
      error "sanity check failed after writing file and reading back in!";
    end if;
  else
    error "sanity check of polredabsified BelyiDB failed!";
  end if;
end intrinsic;

intrinsic PolredabsConversion(d::RngIntElt) -> MonStgElt
  {Convert every BelyiDB of degree d.}
  f := BelyiDBFilenames(d);
  objs := [BelyiDBRead(f[i]) : i in [1..#f]];
  for s in objs do
    vprintf BelyiDB : "%o : ", Name(s);
    if BelyiMapIsComputed(s) then
      is_polredabs := IsPolredabsMatch(s);
      if is_polredabs then
        vprintf BelyiDB : "already polredabsified\n";
      else
        vprintf BelyiDB : "\n";
        PolredabsConversion(s); // errors will occur here if at all
      end if;
    else
      vprintf BelyiDB : "Belyi maps not computed\n";
    end if;
  end for;
  // if we make it through then process completed without errors
  return Sprintf("\nPolredabs conversion complete for degree %o\n", d);
end intrinsic;
