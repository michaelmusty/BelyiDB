intrinsic BelyiDBGaloisOrbitsComputer(t::BelyiDB : ignore := false) -> BelyiDB
  {Compute Galois orbits for s and save to s.}
  s := BelyiDBCopy(t);
  if BelyiMapIsComputed(s) then
    assert IsPolredabsMatch(s);
    ppass := PointedPassport(s);
    base_field_data := BaseFieldData(s);
    maps := BelyiMaps(s);
    assert #{#ppass, #base_field_data, #maps} eq 1;
    fields := [base_field_data[i][1] : i in [1..#ppass]];
    minpolys := [DefiningPolynomial(fields[i]) : i in [1..#fields]];
    minpolys_notQQ := [];
    fields_notQQ := [];
    ppass_notQQ := [];
    maps_notQQ := [* *];
    gal_fields := [];
    gal_minpolys := [];
    gal_ppass := [];
    gal_maps := [* *];
    for i := 1 to #ppass do
      if Degree(fields[i]) eq 1 then // all QQ in single orbit
        Append(~gal_fields, [fields[i]]);
        Append(~gal_ppass, [ppass[i]]);
        Append(~gal_minpolys, [minpolys[i]]);
        Append(~gal_maps, [* maps[i] *]);
      else // all notQQ in new list to check iso
        Append(~fields_notQQ, fields[i]);
        Append(~ppass_notQQ, ppass[i]);
        Append(~minpolys_notQQ, minpolys[i]);
        Append(~maps_notQQ, maps[i]);
      end if;
    end for;
    if #fields_notQQ gt 0 then
      Append(~gal_fields, [fields_notQQ[1]]);
      Append(~gal_minpolys, [minpolys_notQQ[1]]);
      Append(~gal_ppass, [ppass_notQQ[1]]);
      Append(~gal_maps, [* maps_notQQ[1] *]);
      for i := 2 to #fields_notQQ do // i loops over all not QQ fields
        new_orbit := true; // new orbit by default
        for j := 1 to #gal_fields do // j loops over all galois orbits so far
          condition_1 := DefiningPolynomial(fields_notQQ[i]) eq DefiningPolynomial(gal_fields[j][1]);
          condition_2 := BelyiDBCompareBelyiMaps(maps_notQQ[i], gal_maps[j][1]);
          if ignore then // ignore condition2
            if condition_1 then
              Append(~gal_fields[j], fields_notQQ[i]);
              Append(~gal_ppass[j], ppass_notQQ[i]);
              Append(~gal_minpolys[j], minpolys_notQQ[i]);
              Append(~gal_maps[j], maps_notQQ[i]);
              new_orbit := false;
            end if;
          else
            if condition_1 and condition_2 then
              Append(~gal_fields[j], fields_notQQ[i]);
              Append(~gal_ppass[j], ppass_notQQ[i]);
              Append(~gal_minpolys[j], minpolys_notQQ[i]);
              Append(~gal_maps[j], maps_notQQ[i]);
              new_orbit := false;
            end if;
          end if;
        end for;
        if new_orbit then
          Append(~gal_fields, [fields_notQQ[i]]);
          Append(~gal_ppass, [ppass_notQQ[i]]);
          Append(~gal_minpolys, [minpolys_notQQ[i]]);
          Append(~gal_maps, [* maps_notQQ[i] *]);
        end if;
      end for;
    end if;
    s`BelyiDBGaloisOrbits := gal_ppass;
    return s;
  else
    vprintf BelyiDB : "%o : Belyi maps not computed.\n", Name(s);
    return s;
  end if;
end intrinsic;

intrinsic BelyiDBCompareBelyiMaps(f::FldFunFracSchElt, g::FldFunFracSchElt) -> BoolElt
  {True is f and g are the same "up to base field".}
  K1 := BaseField(Curve(Parent(f)));
  K2 := BaseField(Curve(Parent(g)));
  is_iso, mp := IsIsomorphic(K1, K2);
  if is_iso then
    num_f := Coefficients(Numerator(f));
    num_g := Coefficients(Numerator(g));
    den_f := Coefficients(Denominator(f));
    den_g := Coefficients(Denominator(g));
    if #num_f ne #num_g or #den_f ne #den_f then
      return false;
    else
      for i := 1 to #num_f do
        if Eltseq(num_f[i]) ne Eltseq(num_g[i]) then
          return false;
        end if;
      end for;
      for i := 1 to #den_f do
        if Eltseq(den_f[i]) ne Eltseq(den_g[i]) then
          return false;
        end if;
      end for;
      return true;
    end if;
  else
    return false;
  end if;
end intrinsic;

/*
intrinsic CompareUpToBaseFieldIsomorphism(f1::FldFunFracSchElt, f2::FldFunFracSchElt) -> BoolElt
  {True if f1 and f2 have isomorphic base fields and have the same coefficients after applying this isomorphism.}
  K1 := BaseField(Curve(Parent(f1)));
  K2 := BaseField(Curve(Parent(f2)));
  is_iso, mp := IsIsomorphic(K1, K2);
  if is_iso then
    assert DefiningPolynomial(K1) eq DefiningPolynomial(K2); // since they should be polredabs
    vprintf BelyiDB : "%o\n",mp;
    num_1 := Coefficients(Numerator(f1));
    num_2 := Coefficients(Numerator(f2));
    den_1 := Coefficients(Denominator(f1));
    den_2 := Coefficients(Denominator(f2));
    vprintf BelyiDB : "alpha1     = %o\n", num_1[1];
    vprintf BelyiDB : "mp(alpha1) = %o\n", mp(num_1[1]);
    vprintf BelyiDB : "alpha2     = %o\n", num_2[1];
    if mp(num_1) eq num_2 and mp(den_1) eq den_2 then
      return true;
    else
      return false;
    end if;
  else
    return false;
  end if;
end intrinsic;
*/
