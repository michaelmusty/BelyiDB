intrinsic BelyiDBToGammas(s::BelyiDB) -> SeqEnum[GrpPSL2]
  {Creates a sequence of GrpPSL2s from a BelyiDB object.}
  assert s`BelyiDBType eq "Hyperbolic";
  ppass := s`BelyiDBPointedPassport;
  Gammas := [];
  for sigma in ppass do
    lcm := LeastCommonMultiple(s`BelyiDBOrders);
    vprint Shimura : Sprintf("\nComputing Gamma with LCM(a,b,c) = %o...\n", lcm);
    if lcm lt 100 then // TODO this is a bit of a hack
      Gamma := TriangleSubgroup(sigma);
    else
      Gamma := TriangleSubgroup(sigma : Simplify := 0);
    end if;
    Append(~Gammas, Gamma);
  end for;
  return Gammas;
end intrinsic;

intrinsic GammasToBelyiDB(Gammas::SeqEnum[GrpPSL2]) -> BelyiDB
  {Assumes Gammas have everything computed and creates a BelyiDB object with sanity checks.}
  // setup
    ppass := [];
    for i := 1 to #Gammas do
      Append(~ppass, Gammas[i]`TriangleSigma);
    end for;
    s := BelyiDBExample(ppass);
  // easy attrs assertions
    for Gamma in Gammas do
      assert s`BelyiDBOrders eq Gamma`TriangleABC;
    end for;
    assert s`BelyiDBType eq "Hyperbolic";
    for Gamma in Gammas do
      assert s`BelyiDBGenus eq Genus(Gamma);
    end for;
    assert s`BelyiDBSize le s`BelyiDBPointedSize;
    assert s`BelyiDBPointedSize eq #Gammas;
  // permutation attrs assertions
    for Gamma in Gammas do
      assert sub< Sym(Gamma`TriangleD) | Gamma`TriangleSigma > eq s`BelyiDBMonodromyGroup;
    end for;
  // BelyiMaps
    base_field_data := [* *];
    curves := [* *];
    maps := [* *];
    for i := 1 to #Gammas do
      Gamma := Gammas[i];
      K := Gamma`TriangleK;
      Kv := Gamma`TriangleKv;
      conj := Gamma`TriangleKIsConjugated;
      z := Gamma`TriangleKNumericalGenerator;
      Append(~base_field_data, [* K, Kv, conj, z *]);
      Append(~curves, Gamma`TriangleBelyiCurve);
      Append(~maps, Gamma`TriangleBelyiMap);
    end for;
    s`BelyiDBBaseFieldData := base_field_data;
    s`BelyiDBBelyiCurves := curves;
    s`BelyiDBBelyiMaps := maps;
    assert #SequenceToSet([#s`BelyiDBBaseFieldData, #s`BelyiDBBelyiCurves, #s`BelyiDBBelyiMaps, #s`BelyiDBPointedPassport]) eq 1;
  // Galois orbits
    s := BelyiDBGaloisOrbitsComputer(s);
  // exact attrs
    exact_attrs := [];
    Append(~exact_attrs, "BelyiDBExactCurveInvariants");
    Append(~exact_attrs, "BelyiDBExactCurveCoefficients");
    Append(~exact_attrs, "BelyiDBExactBelyiMapLeadingCoefficients");
    Append(~exact_attrs, "BelyiDBExactBelyiMapNumeratorCoefficients");
    Append(~exact_attrs, "BelyiDBExactBelyiMapDenominatorCoefficients");
    for attr in exact_attrs do
      s``attr := [* *];
    end for;
    for Gamma in Gammas do
      // might not be assigned to Gamma
      // FIXME bool instead of deleting attribute of s
      if assigned Gamma`TriangleExactCurveInvariants then
        Append(~s`BelyiDBExactCurveInvariants, Gamma`TriangleExactCurveInvariants);
      else
        delete s`BelyiDBExactCurveInvariants;
      end if;
      if assigned Gamma`TriangleExactCurveCoefficients then
        Append(~s`BelyiDBExactCurveCoefficients, Gamma`TriangleExactCurveCoefficients);
      else
        delete s`BelyiDBExactCurveCoefficients;
      end if;
      // should always be assigned
      lc := Gamma`TriangleExactBelyiMapLeadingCoefficient;
      dens := Gamma`TriangleExactBelyiMapDenominatorCoefficients;
      nums := Gamma`TriangleExactBelyiMapNumeratorCoefficients;
      // assertions!
      assert #dens gt 0;
      assert #nums gt 0;
      assert #[lc] gt 0;
      // printf "LEADING COEFF for Gammas[%o] for %o = \n%o\n", Index(Gammas, Gamma), s`BelyiDBName, lc;
      // printf "DENOM COEFFS for Gammas[%o] for %o = \n%o\n", Index(Gammas, Gamma), s`BelyiDBName, dens;
      assert Type([lc]) eq Type(dens); // Gamma doesn't have correct data to be written to file
      assert Type([lc][1]) eq Type(dens[1]); // Gamma doesn't have correct data to be written to file
      Append(~s`BelyiDBExactBelyiMapLeadingCoefficients, [Gamma`TriangleExactBelyiMapLeadingCoefficient]);
      Append(~s`BelyiDBExactBelyiMapNumeratorCoefficients, Gamma`TriangleExactBelyiMapNumeratorCoefficients);
      Append(~s`BelyiDBExactBelyiMapDenominatorCoefficients, Gamma`TriangleExactBelyiMapDenominatorCoefficients);
    end for;
  // numerical attrs
    s`BelyiDBRescalingFactors := [* *];
    all_rescaling_factors_assigned := true;
    for Gamma in Gammas do
      if assigned Gamma`TriangleRescalingFactor then
        Append(~s`BelyiDBRescalingFactors, Gamma`TriangleRescalingFactor);
      else
        all_rescaling_factors_assigned := false;
      end if;
    end for;
    if not all_rescaling_factors_assigned then
      delete s`BelyiDBRescalingFactors;
    end if;
  // Powser
    if assigned Gamma`TrianglePowserBases then
      s`BelyiDBPowserIndat := Gamma`TrianglePowserBases[1][1];
      s`BelyiDBPowserBases := Gamma`TrianglePowserBases[1][2][1];
    end if;
  // TODO assertions
  /* pick attributes to check are assigned
    attrs := GetAttributes(Type(s));
    for attr in attrs do
      assert assigned s``attr;
    end for;
  */
    // assert BelyiMapSanityCheck(s);
  // return
    return s;
end intrinsic;
