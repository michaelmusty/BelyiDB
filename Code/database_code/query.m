intrinsic BelyiConstant(d_bound::RngIntElt, k::RngIntElt) -> FldRatElt
  {}
  RR := RealField();
  if d_bound le 4 then
    return RR!1;
  end if;
  // d=1
  num_passes := 1;
  num_orbits := 1;
  // d>1
  for d := 2 to d_bound do
    t0 := Cputime();
    all := [BelyiDBRead(f) : f in BelyiDBFilenames(d)];
    size_k := [];
    for s in all do
      if #s`BelyiDBPointedPassport le k then
        Append(~size_k, s);
      end if;
    end for;
    num_passes +:= #size_k;
    num_orbits_d_k := 0;
    for s in size_k do
      if assigned s`BelyiDBBelyiCurves then
        if assigned s`BelyiDBGaloisOrbits then
          num_orbits_d_k +:= #s`BelyiDBGaloisOrbits;
        else
          error Sprintf("%o has size le %o with Belyi maps computed but Galois orbits not computed.\n", s`BelyiDBName, k);
        end if;
      else
        error Sprintf("%o has size le %o but Belyi maps not computed.\n", s`BelyiDBName, k);
      end if;
    end for;
    num_orbits +:= num_orbits_d_k;
    t1 := Cputime();
    vprintf Shimura : "d=%o: %o seconds.\n", d, t1-t0;
  end for;
  vprintf Shimura : "#passports: %o\n", num_passes;
  vprintf Shimura : "#orbits: %o\n", num_orbits;
  return RR!(num_passes/num_orbits);
end intrinsic;

intrinsic BelyiDBFields(d::RngIntElt) -> List
  {for internal use only}
  l_d := [* *];
  filenames_d := BelyiDBFilenames(d);
  for i := 1 to #filenames_d do
    s := BelyiDBRead(filenames_d[i]);
    if assigned s`BelyiDBBaseFieldData then
      name_s := s`BelyiDBName;
      fields_s := s`BelyiDBBaseFieldData;
      l_s := [* *];
      for j := 1 to #fields_s do
        Append(~l_s, fields_s[j][1]);
      end for;
      Append(~l_d, [* name_s, l_s *]);
    end if;
  end for;
  return l_d;
end intrinsic;

intrinsic BelyiDBAdhoc(s::BelyiDB) -> Any
  {internal use for size 1 nonhyperbolic.}
  assert s`BelyiDBType ne "Hyperbolic";
  pass := s`BelyiDBPointedPassport;
  assert #pass eq 1;
  sigma := pass[1];
  if s`BelyiDBType eq "Spherical" then
    X, phi := SphericalBelyiMap(sigma);
  else
    X, phi := EuclideanBelyiMap(sigma);
  end if;
  for tau in Sym(3) do
    phi_tau := S3Action(tau, phi);
    if BelyiMapSanityCheck(sigma, X, phi_tau) then
      phi := phi_tau;
    end if;
  end for;
  assert BelyiMapSanityCheck(sigma, X, phi);
  bfd := MakeBaseFieldData(sigma, X, phi);
  s`BelyiDBBaseFieldData := [* bfd *];
  s`BelyiDBBelyiCurves := [* X *];
  s`BelyiDBBelyiMaps := [* phi *];
  BelyiDBWrite(s);
  t := BelyiDBRead(s`BelyiDBFilename);
  assert BelyiMapSanityCheck(t);
  return t;
end intrinsic;

intrinsic BelyiDBMatch(s::BelyiDB) -> BoolElt
  {True if name of s appears in database. This assumes the working directory is /BelyiDB.}
  // pull information from s
    d := s`BelyiDBDegree;
    sfilename := s`BelyiDBFilename;
  // directory stuff
    dir := GetCurrentDirectory();
    parentdir := Pipe(Sprintf("basename 'dirname %o'", dir), "");
    if parentdir eq "BelyiDB\n" then
      dbdirectory := dir;
    else
      error "make sure your working directory is /BelyiDB";
    end if;
    directory := dbdirectory cat Sprintf("/%o/", d);
  // check to see if directory /BelyiDB/d exists
    command := Sprintf("ls");
    ls := Pipe(command, "");
    BelyiDBDirectories := Split(ls, "\n");
    if Sprintf("%o", d) notin BelyiDBDirectories then
      return false;
    end if;
  // get the filenames for some specified degree d
    command := Sprintf("ls %o", d);
    ls := Pipe(command, "");
    filenames := Split(ls, "\n");
    if sfilename in filenames then
      return true;
    else
      return false;
    end if;
end intrinsic;

intrinsic BelyiMapSanityCheck(s::BelyiDB : lax := false) -> Any
  {overloaded for BelyiDB.}
  if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps and assigned s`BelyiDBPointedPassport then
    assert assigned s`BelyiDBBelyiCurves;
    assert assigned s`BelyiDBBelyiMaps;
    assert #s`BelyiDBPointedPassport eq #s`BelyiDBBelyiCurves;
    assert #s`BelyiDBPointedPassport eq #s`BelyiDBBelyiMaps;
    pass := s`BelyiDBPointedPassport;
    curves := s`BelyiDBBelyiCurves;
    maps := s`BelyiDBBelyiMaps;
    // list in case we set lax true
    for i in [1..#pass] do
      sane := BelyiMapSanityCheck(pass[i], curves[i], maps[i] : lax := lax);
      if not sane then
        return false;
      end if;
    end for;
    return true;
  else
    return false;
  end if;
end intrinsic;

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
    assert assigned Gamma`TrianglePowserBases;
    s`BelyiDBPowserIndat := Gamma`TrianglePowserBases[1][1];
    s`BelyiDBPowserBases := Gamma`TrianglePowserBases[1][2][1];
  // TODO assertions
  /* pick attributes to check are assigned
    attrs := GetAttributes(Type(s));
    for attr in attrs do
      assert assigned s``attr;
    end for;
  */
    assert BelyiMapSanityCheck(s);
    assert BelyiDBMatch(s);
  // return
    return s;
end intrinsic;

intrinsic BelyiDBCompareBelyiMaps(f::FldFunFracSchElt, g::FldFunFracSchElt) -> BoolElt
  {True is f and g are the same "up to base field".}
  // TODO assert base fields equal
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
end intrinsic;

intrinsic BelyiDBGaloisOrbitsComputer(s::BelyiDB) -> BelyiDB
  {Given a BelyiDB object with BelyiMaps computed return the BelyiDB object with passport split into Galois orbits.}
  assert #SequenceToSet([#s`BelyiDBBaseFieldData, #s`BelyiDBBelyiCurves, #s`BelyiDBBelyiMaps, #s`BelyiDBPointedPassport]) eq 1; // assert all lists have the right size
  ppass := s`BelyiDBPointedPassport;
  fields := [];
  minpolys := [];
  maps := [* *];
  for i := 1 to #ppass do
    Append(~fields, AbsoluteField(s`BelyiDBBaseFieldData[i][1]));
    assert #GeneratorsSequence(fields[i]) eq 1;
    Append(~minpolys, MinimalPolynomial(fields[i].1));
    Append(~maps, s`BelyiDBBelyiMaps[i]);
  end for;
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
        // TODO IsIsomorphic causes SEG FAULT for 7T6-[4,4,4]-421-421-421-g0
        // 7T6-[4,4,4]-421-421-421-g0
        // if IsIsomorphic(fields_notQQ[i], gal_fields[j][1]) and minpolys_notQQ[i] eq gal_minpolys[j][1] then
        // if IsIsomorphic(fields_notQQ[i], gal_fields[j][1]) then // hacky? no, wrong
        // if minpolys_notQQ[i] eq gal_minpolys[j][1] and BelyiDBCompareBelyiMaps(maps_notQQ[i], gal_maps[j][1]) then
        if IsIsomorphic(fields_notQQ[i], gal_fields[j][1]) and BelyiDBCompareBelyiMaps(maps_notQQ[i], gal_maps[j][1]) then
          Append(~gal_fields[j], fields_notQQ[i]);
          Append(~gal_ppass[j], ppass_notQQ[i]);
          Append(~gal_minpolys[j], minpolys_notQQ[i]);
          Append(~gal_maps[j], maps_notQQ[i]);
          new_orbit := false;
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
end intrinsic;

// TODO make g0 automagic (makeshift GaloisOrbits adjusting for smaller m and ByRam when Newton breaks)
intrinsic BelyiMap(s::BelyiDB : prec := 0, Al := "Newton") -> BelyiDB
  {wrapper to use with BelyiDB objects.}
  if s`BelyiDBType ne "Hyperbolic" then
    error "Nonhyperbolic!";
  else
    Gammas := BelyiDBToGammas(s);
    if s`BelyiDBGenus eq 0 then
      // DegreeBound automated
      for Gamma in Gammas do
        for m := #s`BelyiDBPointedPassport to 1 by -1 do
          try
            BelyiMap(Gamma : prec := prec, DegreeBound := m);
          catch e
            vprintf Shimura : "%o button did not work error: %o\n", s`BelyiDBName, e;
            vprintf Shimura : "%o try DegreeBound = %o\n", s`BelyiDBName, m-1;
          end try;
          if not assigned Gamma`TriangleBelyiMap or not assigned Gamma`TriangleBelyiCurve or not assigned Gamma`TriangleK then
            vprintf Shimura : "%o try ByRamification with prec = %o\n", s`BelyiDBName, 2*prec;
            try
              BelyiMap(Gamma : prec := 2*prec, Al := "ByRamification");
            catch e
              vprintf Shimura : "%o button did not work error: %o\n", s`BelyiDBName, e;
            end try;
          end if;
          if assigned Gamma`TriangleBelyiMap and assigned Gamma`TriangleBelyiCurve and assigned Gamma`TriangleK then
            break m;
          end if;
        end for;
      end for;
    end if;
    if s`BelyiDBGenus eq 1 then
      // CHANGE THIS IF GALOIS ORBITS NEWTON WORKS input Gammas
      try_bool := true;
      for i := 1 to #Gammas do
        Gamma := Gammas[i];
        if try_bool then
          try
            BelyiMap(Gamma : prec := prec);
          catch e
            vprintf Shimura : "%o button did not work error: %o\n", s`BelyiDBName, e;
            try_bool := false;
          end try;
        end if;
      end for;
    end if;
    if s`BelyiDBGenus gt 1 then
      try
        BelyiMap(Gammas : Al := "NumericalKernel", ExactAl := "GaloisOrbits", prec := prec);
      catch e
        vprintf Shimura : "%o button did not work error: %o\n", s`BelyiDBName, e;
      end try;
    end if;
    s := GammasToBelyiDB(Gammas);
    if BelyiMapSanityCheck(s) then
      return s;
    else
      error "failed sanity check";
    end if;
  end if;
end intrinsic;

intrinsic BelyiMapNonhyp(s::BelyiDB) -> BelyiDB
  {}
  assert s`BelyiDBType ne "Hyperbolic";
  ppass := s`BelyiDBPointedPassport;
  curves := [* *];
  maps := [* *];
  for sigma in ppass do
    X, phi := BelyiMap(sigma);
    assert BelyiMapSanityCheck(sigma, X, phi);
    Append(~curves, X);
    Append(~maps, phi);
  end for;
  s`BelyiDBBelyiCurves := curves;
  s`BelyiDBBelyiMaps := maps;
  return s;
end intrinsic;

intrinsic BelyiDBSanityCheck(d::RngIntElt) -> Any
  {}
  f := BelyiDBFilenames(d);
  incorrect_map := [];
  checked := [];
  for i := 1 to #f do
    s := BelyiDBRead(f[i]);
    if assigned s`BelyiDBBelyiCurves then
      if not BelyiMapSanityCheck(s) then
        Append(~incorrect_map, s);
      end if;
    end if;
    BelyiDBWrite(s);
    s := BelyiDBRead(f[i]);
    Append(~checked, s);
  end for;
  return checked, f, incorrect_map;
end intrinsic;

intrinsic BelyiDBStatusReport(d::RngIntElt : return_everything := false, return_hyp_notcomputed := true) -> Any
  {This assumes the current directory is /BelyiDB. Returns a string with information about BelyiMaps in /BelyiDB of degree d. This can easily be modified to give lots of information but for now is pretty minimal.}
  // directory stuff
  dir := GetCurrentDirectory();
  parentdir := Pipe(Sprintf("basename 'dirname %o'", dir), "");
  if parentdir eq "BelyiDB\n" then
    dbdirectory := dir;
  else
    error "make sure your working directory is /BelyiDB";
  end if;
  directory := dbdirectory cat Sprintf("/%o/", d);
  f := BelyiDBFilenames(d);
  info := "";
  genus0 := [];
  genus1 := [];
  genus2 := [];
  genus3 := [];
  highergenus := [];
  for i in {1..#f} do
    vprintf Shimura : "%o: (%o/%o)\n", f[i], i, #f;
    s := BelyiDBRead(f[i]);
    if s`BelyiDBGenus eq 0 then
      Append(~genus0, s);
    else
      if s`BelyiDBGenus eq 1 then
        Append(~genus1, s);
      else
        if s`BelyiDBGenus eq 2 then
          Append(~genus2, s);
        else
          if s`BelyiDBGenus eq 3 then
            Append(~genus3, s);
          else
            Append(~highergenus, s);
          end if;
        end if;
      end if;
    end if;
  end for;
  // g0
    g0nonhyp := [];
    g0nonhyp_notcomputed := [];
    g0nonhyp_computed := [];
    g0nonhyp_failedlaxsanity := [];
    g0hyp := [];
    g0hyp_notcomputed := [];
    g0hyp_computed := [];
    g0hyp_failedsanity := [];
  // g1
    g1nonhyp := [];
    g1nonhyp_notcomputed := [];
    g1nonhyp_computed := [];
    g1nonhyp_failedlaxsanity := [];
    g1hyp := [];
    g1hyp_notcomputed := [];
    g1hyp_computed := [];
    g1hyp_failedsanity := [];
  // g2
    g2nonhyp := [];
    g2nonhyp_notcomputed := [];
    g2nonhyp_computed := [];
    g2nonhyp_failedlaxsanity := [];
    g2hyp := [];
    g2hyp_notcomputed := [];
    g2hyp_computed := [];
    g2hyp_failedsanity := [];
  // g3
    g3nonhyp := [];
    g3nonhyp_notcomputed := [];
    g3nonhyp_computed := [];
    g3nonhyp_failedlaxsanity := [];
    g3hyp := [];
    g3hyp_notcomputed := [];
    g3hyp_computed := [];
    g3hyp_failedsanity := [];
  // gg
    ggnonhyp := [];
    ggnonhyp_notcomputed := [];
    ggnonhyp_computed := [];
    ggnonhyp_failedlaxsanity := [];
    gghyp := [];
    gghyp_notcomputed := [];
    gghyp_computed := [];
    gghyp_failedsanity := [];
  for i := 1 to #genus0 do
    s := genus0[i];
    vprintf Shimura : "genus 0 sanity checks: (%o/%o)\n", i, #genus0;
    if s`BelyiDBType eq "Hyperbolic" then
      // hyperbolic
      Append(~g0hyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // hyperbolic and belyi maps computed
        Append(~g0hyp_computed, s);
        if not BelyiMapSanityCheck(s) then
          Append(~g0hyp_failedsanity, s);
        end if;
      else
        // hyperbolic and belyi maps not computed
        Append(~g0hyp_notcomputed, s);
      end if;
    else
      // nonhyperbolic
      Append(~g0nonhyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // nonhyperbolic and belyi maps computed
        Append(~g0nonhyp_computed, s);
        sanity := BelyiMapSanityCheck(s : lax := true);
        if not sanity then
          Append(~g0nonhyp_failedsanity, s);
        end if;
      else
        // nonhyperbolic and belyi maps not computed
        Append(~g0nonhyp_notcomputed, s);
      end if;
    end if;
  end for;
  for i := 1 to #genus1 do
    s := genus1[i];
    vprintf Shimura : "genus 1 sanity checks: (%o/%o)\n", i, #genus1;
    if s`BelyiDBType eq "Hyperbolic" then
      // hyperbolic
      Append(~g1hyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // hyperbolic and belyi maps computed
        Append(~g1hyp_computed, s);
        sanity := BelyiMapSanityCheck(s);
        if not sanity then
          Append(~g1hyp_failedsanity, s);
        end if;
      else
        // hyperbolic and belyi maps not computed
        Append(~g1hyp_notcomputed, s);
      end if;
    else
      // nonhyperbolic
      Append(~g1nonhyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // nonhyperbolic and belyi maps computed
        Append(~g1nonhyp_computed, s);
        sanity := BelyiMapSanityCheck(s : lax := true);
        if not sanity then
          Append(~g1nonhyp_failedsanity, s);
        end if;
      else
        // nonhyperbolic and belyi maps not computed
        Append(~g1nonhyp_notcomputed, s);
      end if;
    end if;
  end for;
  for i := 1 to #genus2 do
    s := genus2[i];
    vprintf Shimura : "genus 2 sanity checks: (%o/%o)\n", i, #genus2;
    if s`BelyiDBType eq "Hyperbolic" then
      // hyperbolic
      Append(~g2hyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // hyperbolic and belyi maps computed
        Append(~g2hyp_computed, s);
        sanity := BelyiMapSanityCheck(s);
        if not sanity then
          Append(~g2hyp_failedsanity, s);
        end if;
      else
        // hyperbolic and belyi maps not computed
        Append(~g2hyp_notcomputed, s);
      end if;
    else
      // nonhyperbolic
      Append(~g2nonhyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // nonhyperbolic and belyi maps computed
        Append(~g2nonhyp_computed, s);
        sanity := BelyiMapSanityCheck(s : lax := true);
        if not sanity then
          Append(~g2nonhyp_failedsanity, s);
        end if;
      else
        // nonhyperbolic and belyi maps not computed
        Append(~g2nonhyp_notcomputed, s);
      end if;
    end if;
  end for;
  for i := 1 to #genus3 do
    s := genus3[i];
    vprintf Shimura : "genus 3 sanity checks: (%o/%o)\n", i, #genus3;
    if s`BelyiDBType eq "Hyperbolic" then
      // hyperbolic
      Append(~g3hyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // hyperbolic and belyi maps computed
        Append(~g3hyp_computed, s);
        sanity := BelyiMapSanityCheck(s);
        if not sanity then
          Append(~g3hyp_failedsanity, s);
        end if;
      else
        // hyperbolic and belyi maps not computed
        Append(~g3hyp_notcomputed, s);
      end if;
    else
      // nonhyperbolic
      Append(~g3nonhyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // nonhyperbolic and belyi maps computed
        Append(~g3nonhyp_computed, s);
        sanity := BelyiMapSanityCheck(s : lax := true);
        if not sanity then
          Append(~g3nonhyp_failedsanity, s);
        end if;
      else
        // nonhyperbolic and belyi maps not computed
        Append(~g3nonhyp_notcomputed, s);
      end if;
    end if;
  end for;
  for i := 1 to #highergenus do
    s := highergenus[i];
    vprintf Shimura : "higher genus sanity checks: (%o/%o)\n", i, #highergenus;
    if s`BelyiDBType eq "Hyperbolic" then
      // hyperbolic
      Append(~gghyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // hyperbolic and belyi maps computed
        Append(~gghyp_computed, s);
        sanity := BelyiMapSanityCheck(s);
        if not sanity then
          Append(~gghyp_failedsanity, s);
        end if;
      else
        // hyperbolic and belyi maps not computed
        Append(~gghyp_notcomputed, s);
      end if;
    else
      // nonhyperbolic
      Append(~ggnonhyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // nonhyperbolic and belyi maps computed
        Append(~ggnonhyp_computed, s);
        sanity := BelyiMapSanityCheck(s : lax := true);
        if not sanity then
          Append(~ggnonhyp_failedsanity, s);
        end if;
      else
        // nonhyperbolic and belyi maps not computed
        Append(~ggnonhyp_notcomputed, s);
      end if;
    end if;
  end for;
  // g0
    info *:= Sprintf("%o passport(s) of degree %o in BelyiDB/%o:\n", #f, d, d);
    assert #genus0 eq #g0hyp+#g0nonhyp;
    info *:= Sprintf("  %o genus 0:\n", #g0nonhyp+#g0hyp);
    info *:= Sprintf("    %o nonhyperbolic:\n", #g0nonhyp);
    info *:= Sprintf("      %o not computed.\n", #g0nonhyp_notcomputed);
    info *:= Sprintf("      %o computed:\n", #g0nonhyp_computed);
    // info *:= Sprintf("        %o failed lax sanity.\n", #g0nonhyp_failedlaxsanity);
    info *:= Sprintf("        %o failed sanity.\n", #g0nonhyp_failedlaxsanity);
    info *:= Sprintf("    %o hyperbolic:\n", #g0hyp);
    info *:= Sprintf("      %o not computed.\n", #g0hyp_notcomputed);
    info *:= Sprintf("      %o computed:\n", #g0hyp_computed);
    // info *:= Sprintf("        %o failed (non) lax sanity.\n", #g0hyp_failedsanity);
    info *:= Sprintf("        %o failed sanity.\n", #g0hyp_failedsanity);
  // g1
    // info *:= Sprintf("%o passport(s) of degree %o in BelyiDB/%o:\n", #f, d, d);
    assert #genus1 eq #g1hyp+#g1nonhyp;
    info *:= Sprintf("  %o genus 1:\n", #g1nonhyp+#g1hyp);
    info *:= Sprintf("    %o nonhyperbolic:\n", #g1nonhyp);
    info *:= Sprintf("      %o not computed.\n", #g1nonhyp_notcomputed);
    info *:= Sprintf("      %o computed:\n", #g1nonhyp_computed);
    // info *:= Sprintf("        %o failed lax sanity.\n", #g1nonhyp_failedlaxsanity);
    info *:= Sprintf("        %o failed sanity.\n", #g1nonhyp_failedlaxsanity);
    info *:= Sprintf("    %o hyperbolic:\n", #g1hyp);
    info *:= Sprintf("      %o not computed.\n", #g1hyp_notcomputed);
    info *:= Sprintf("      %o computed:\n", #g1hyp_computed);
    // info *:= Sprintf("        %o failed (non) lax sanity.\n", #g1hyp_failedsanity);
    info *:= Sprintf("        %o failed sanity.\n", #g1hyp_failedsanity);
  // g2
    // info *:= Sprintf("%o passport(s) of degree %o in BelyiDB/%o:\n", #f, d, d);
    assert #genus2 eq #g2hyp+#g2nonhyp;
    info *:= Sprintf("  %o genus 2:\n", #g2nonhyp+#g2hyp);
    info *:= Sprintf("    %o nonhyperbolic:\n", #g2nonhyp);
    info *:= Sprintf("      %o not computed.\n", #g2nonhyp_notcomputed);
    info *:= Sprintf("      %o computed:\n", #g2nonhyp_computed);
    // info *:= Sprintf("        %o failed lax sanity.\n", #g2nonhyp_failedlaxsanity);
    info *:= Sprintf("        %o failed sanity.\n", #g2nonhyp_failedlaxsanity);
    info *:= Sprintf("    %o hyperbolic:\n", #g2hyp);
    info *:= Sprintf("      %o not computed.\n", #g2hyp_notcomputed);
    info *:= Sprintf("      %o computed:\n", #g2hyp_computed);
    // info *:= Sprintf("        %o failed (non) lax sanity.\n", #g2hyp_failedsanity);
    info *:= Sprintf("        %o failed sanity.\n", #g2hyp_failedsanity);
  // g3
    // info *:= Sprintf("%o passport(s) of degree %o in BelyiDB/%o:\n", #f, d, d);
    assert #genus3 eq #g3hyp+#g3nonhyp;
    info *:= Sprintf("  %o genus 3:\n", #g3nonhyp+#g3hyp);
    info *:= Sprintf("    %o nonhyperbolic:\n", #g3nonhyp);
    info *:= Sprintf("      %o not computed.\n", #g3nonhyp_notcomputed);
    info *:= Sprintf("      %o computed:\n", #g3nonhyp_computed);
    // info *:= Sprintf("        %o failed lax sanity.\n", #g3nonhyp_failedlaxsanity);
    info *:= Sprintf("        %o failed sanity.\n", #g3nonhyp_failedlaxsanity);
    info *:= Sprintf("    %o hyperbolic:\n", #g3hyp);
    info *:= Sprintf("      %o not computed.\n", #g3hyp_notcomputed);
    info *:= Sprintf("      %o computed:\n", #g3hyp_computed);
    // info *:= Sprintf("        %o failed (non) lax sanity.\n", #g3hyp_failedsanity);
    info *:= Sprintf("        %o failed sanity.\n", #g3hyp_failedsanity);
  // gg
    // info *:= Sprintf("%o passport(s) of degree %o in BelyiDB/%o:\n", #f, d, d);
    assert #highergenus eq #gghyp+#ggnonhyp;
    info *:= Sprintf("  %o higher genus:\n", #ggnonhyp+#gghyp);
    info *:= Sprintf("    %o nonhyperbolic:\n", #ggnonhyp);
    info *:= Sprintf("      %o not computed.\n", #ggnonhyp_notcomputed);
    info *:= Sprintf("      %o computed:\n", #ggnonhyp_computed);
    // info *:= Sprintf("        %o failed lax sanity.\n", #ggnonhyp_failedlaxsanity);
    info *:= Sprintf("        %o failed sanity.\n", #ggnonhyp_failedlaxsanity);
    info *:= Sprintf("    %o hyperbolic:\n", #gghyp);
    info *:= Sprintf("      %o not computed.\n", #gghyp_notcomputed);
    info *:= Sprintf("      %o computed:\n", #gghyp_computed);
    // info *:= Sprintf("        %o failed (non) lax sanity.\n", #gghyp_failedsanity);
    info *:= Sprintf("        %o failed sanity.\n", #gghyp_failedsanity);
  // vprintf Shimura: "%o\n", info;
  if return_everything then
    print info;
    return g0nonhyp, g0nonhyp_notcomputed, g0nonhyp_computed, g0nonhyp_failedlaxsanity, g0hyp, g0hyp_notcomputed, g0hyp_computed, g0hyp_failedsanity, g1nonhyp, g1nonhyp_notcomputed, g1nonhyp_computed, g1nonhyp_failedlaxsanity, g1hyp, g1hyp_notcomputed, g1hyp_computed, g1hyp_failedsanity, g2nonhyp, g2nonhyp_notcomputed, g2nonhyp_computed, g2nonhyp_failedlaxsanity, g2hyp, g2hyp_notcomputed, g2hyp_computed, g2hyp_failedsanity, g3nonhyp, g3nonhyp_notcomputed, g3nonhyp_computed, g3nonhyp_failedlaxsanity, g3hyp, g3hyp_notcomputed, g3hyp_computed, g3hyp_failedsanity, ggnonhyp, ggnonhyp_notcomputed, ggnonhyp_computed, ggnonhyp_failedlaxsanity, gghyp, gghyp_notcomputed, gghyp_computed, gghyp_failedsanity;
    // return g0hyp_notcomputed, g0hyp_computed, g1hyp_notcomputed, g1hyp_computed, g2hyp_notcomputed, g2hyp_computed, g3hyp_notcomputed, g3hyp_computed, gghyp_notcomputed, gghyp_computed;
  else
    if return_hyp_notcomputed then
      print info;
      return g0hyp_notcomputed, g1hyp_notcomputed, g2hyp_notcomputed, g3hyp_notcomputed, gghyp_notcomputed;
    else
      return info;
    end if;
  end if;
end intrinsic;

intrinsic BelyiDBStatus(d::RngIntElt) -> Any
  {This assumes the current directory is /BelyiDB. Returns a string with information about BelyiMaps in /BelyiDB of degree d. This can easily be modified to give lots of information but for now is pretty minimal.}
  // directory stuff
  dir := GetCurrentDirectory();
  parentdir := Pipe(Sprintf("basename 'dirname %o'", dir), "");
  if parentdir eq "BelyiDB\n" then
    dbdirectory := dir;
  else
    error "make sure your working directory is /BelyiDB";
  end if;
  directory := dbdirectory cat Sprintf("/%o/", d);
  f := BelyiDBFilenames(d);
  info := "";
  genus0 := [];
  genus1 := [];
  genus2 := [];
  genus3 := [];
  highergenus := [];
  for i in {1..#f} do
    vprintf Shimura : "%o: (%o/%o)\n", f[i], i, #f;
    s := BelyiDBRead(f[i]);
    if s`BelyiDBGenus eq 0 then
      Append(~genus0, s);
    else
      if s`BelyiDBGenus eq 1 then
        Append(~genus1, s);
      else
        if s`BelyiDBGenus eq 2 then
          Append(~genus2, s);
        else
          if s`BelyiDBGenus eq 3 then
            Append(~genus3, s);
          else
            Append(~highergenus, s);
          end if;
        end if;
      end if;
    end if;
  end for;
  // g0
    g0nonhyp := [];
    g0nonhyp_notcomputed := [];
    g0nonhyp_computed := [];
    g0hyp := [];
    g0hyp_notcomputed := [];
    g0hyp_computed := [];
  // g1
    g1nonhyp := [];
    g1nonhyp_notcomputed := [];
    g1nonhyp_computed := [];
    g1hyp := [];
    g1hyp_notcomputed := [];
    g1hyp_computed := [];
  // g2
    g2nonhyp := [];
    g2nonhyp_notcomputed := [];
    g2nonhyp_computed := [];
    g2hyp := [];
    g2hyp_notcomputed := [];
    g2hyp_computed := [];
  // g3
    g3nonhyp := [];
    g3nonhyp_notcomputed := [];
    g3nonhyp_computed := [];
    g3hyp := [];
    g3hyp_notcomputed := [];
    g3hyp_computed := [];
  // gg
    ggnonhyp := [];
    ggnonhyp_notcomputed := [];
    ggnonhyp_computed := [];
    gghyp := [];
    gghyp_notcomputed := [];
    gghyp_computed := [];
  for i := 1 to #genus0 do
    s := genus0[i];
    if s`BelyiDBType eq "Hyperbolic" then
      // hyperbolic
      Append(~g0hyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // hyperbolic and belyi maps computed
        Append(~g0hyp_computed, s);
      else
        // hyperbolic and belyi maps not computed
        Append(~g0hyp_notcomputed, s);
      end if;
    else
      // nonhyperbolic
      Append(~g0nonhyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // nonhyperbolic and belyi maps computed
        Append(~g0nonhyp_computed, s);
      else
        // nonhyperbolic and belyi maps not computed
        Append(~g0nonhyp_notcomputed, s);
      end if;
    end if;
  end for;
  for i := 1 to #genus1 do
    s := genus1[i];
    if s`BelyiDBType eq "Hyperbolic" then
      // hyperbolic
      Append(~g1hyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // hyperbolic and belyi maps computed
        Append(~g1hyp_computed, s);
      else
        // hyperbolic and belyi maps not computed
        Append(~g1hyp_notcomputed, s);
      end if;
    else
      // nonhyperbolic
      Append(~g1nonhyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // nonhyperbolic and belyi maps computed
        Append(~g1nonhyp_computed, s);
      else
        // nonhyperbolic and belyi maps not computed
        Append(~g1nonhyp_notcomputed, s);
      end if;
    end if;
  end for;
  for i := 1 to #genus2 do
    s := genus2[i];
    if s`BelyiDBType eq "Hyperbolic" then
      // hyperbolic
      Append(~g2hyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // hyperbolic and belyi maps computed
        Append(~g2hyp_computed, s);
      else
        // hyperbolic and belyi maps not computed
        Append(~g2hyp_notcomputed, s);
      end if;
    else
      // nonhyperbolic
      Append(~g2nonhyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // nonhyperbolic and belyi maps computed
        Append(~g2nonhyp_computed, s);
      else
        // nonhyperbolic and belyi maps not computed
        Append(~g2nonhyp_notcomputed, s);
      end if;
    end if;
  end for;
  for i := 1 to #genus3 do
    s := genus3[i];
    if s`BelyiDBType eq "Hyperbolic" then
      // hyperbolic
      Append(~g3hyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // hyperbolic and belyi maps computed
        Append(~g3hyp_computed, s);
      else
        // hyperbolic and belyi maps not computed
        Append(~g3hyp_notcomputed, s);
      end if;
    else
      // nonhyperbolic
      Append(~g3nonhyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // nonhyperbolic and belyi maps computed
        Append(~g3nonhyp_computed, s);
      else
        // nonhyperbolic and belyi maps not computed
        Append(~g3nonhyp_notcomputed, s);
      end if;
    end if;
  end for;
  for i := 1 to #highergenus do
    s := highergenus[i];
    if s`BelyiDBType eq "Hyperbolic" then
      // hyperbolic
      Append(~gghyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // hyperbolic and belyi maps computed
        Append(~gghyp_computed, s);
      else
        // hyperbolic and belyi maps not computed
        Append(~gghyp_notcomputed, s);
      end if;
    else
      // nonhyperbolic
      Append(~ggnonhyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // nonhyperbolic and belyi maps computed
        Append(~ggnonhyp_computed, s);
      else
        // nonhyperbolic and belyi maps not computed
        Append(~ggnonhyp_notcomputed, s);
      end if;
    end if;
  end for;
  // g0
    assert #genus0 eq #g0hyp+#g0nonhyp;
    info *:= Sprintf("%o genus 0 hyperbolic:\n", #g0hyp);
    info *:= Sprintf("  %o not computed.\n", #g0hyp_notcomputed);
    info *:= Sprintf("  %o computed:\n", #g0hyp_computed);
  // g1
    assert #genus1 eq #g1hyp+#g1nonhyp;
    info *:= Sprintf("%o genus 1 hyperbolic:\n", #g1hyp);
    info *:= Sprintf("  %o not computed.\n", #g1hyp_notcomputed);
    info *:= Sprintf("  %o computed:\n", #g1hyp_computed);
  // g2
    assert #genus2 eq #g2hyp+#g2nonhyp;
    info *:= Sprintf("%o genus 2 hyperbolic:\n", #g2hyp);
    info *:= Sprintf("  %o not computed.\n", #g2hyp_notcomputed);
    info *:= Sprintf("  %o computed:\n", #g2hyp_computed);
  // g3
    assert #genus3 eq #g3hyp+#g3nonhyp;
    info *:= Sprintf("%o genus 3 hyperbolic:\n", #g3hyp);
    info *:= Sprintf("  %o not computed.\n", #g3hyp_notcomputed);
    info *:= Sprintf("  %o computed:\n", #g3hyp_computed);
  // gg
    assert #highergenus eq #gghyp+#ggnonhyp;
    info *:= Sprintf("%o higher genus hyperbolic:\n", #gghyp);
    info *:= Sprintf("  %o not computed.\n", #gghyp_notcomputed);
    info *:= Sprintf("  %o computed:\n", #gghyp_computed);
  // print and return
  print info;
  return g0hyp_notcomputed, g0hyp_computed, g1hyp_notcomputed, g1hyp_computed, g2hyp_notcomputed, g2hyp_computed, g3hyp_notcomputed, g3hyp_computed, gghyp_notcomputed, gghyp_computed;
end intrinsic;

intrinsic BelyiDBNonhyp(d::RngIntElt) -> Any
  {This assumes the current directory is /BelyiDB. Returns a string with information about BelyiMaps in /BelyiDB of degree d. This can easily be modified to give lots of information but for now is pretty minimal.}
  // directory stuff
  dir := GetCurrentDirectory();
  parentdir := Pipe(Sprintf("basename 'dirname %o'", dir), "");
  if parentdir eq "BelyiDB\n" then
    dbdirectory := dir;
  else
    error "make sure your working directory is /BelyiDB";
  end if;
  directory := dbdirectory cat Sprintf("/%o/", d);
  f := BelyiDBFilenames(d);
  info := "";
  genus0 := [];
  genus1 := [];
  genus2 := [];
  genus3 := [];
  highergenus := [];
  for i in {1..#f} do
    vprintf Shimura : "%o: (%o/%o)\n", f[i], i, #f;
    s := BelyiDBRead(f[i]);
    if s`BelyiDBGenus eq 0 then
      Append(~genus0, s);
    else
      if s`BelyiDBGenus eq 1 then
        Append(~genus1, s);
      else
        if s`BelyiDBGenus eq 2 then
          Append(~genus2, s);
        else
          if s`BelyiDBGenus eq 3 then
            Append(~genus3, s);
          else
            Append(~highergenus, s);
          end if;
        end if;
      end if;
    end if;
  end for;
  // g0
    g0nonhyp := [];
    g0nonhyp_notcomputed := [];
    g0nonhyp_computed := [];
    g0hyp := [];
    g0hyp_notcomputed := [];
    g0hyp_computed := [];
  // g1
    g1nonhyp := [];
    g1nonhyp_notcomputed := [];
    g1nonhyp_computed := [];
    g1hyp := [];
    g1hyp_notcomputed := [];
    g1hyp_computed := [];
  // g2
    g2nonhyp := [];
    g2nonhyp_notcomputed := [];
    g2nonhyp_computed := [];
    g2hyp := [];
    g2hyp_notcomputed := [];
    g2hyp_computed := [];
  // g3
    g3nonhyp := [];
    g3nonhyp_notcomputed := [];
    g3nonhyp_computed := [];
    g3hyp := [];
    g3hyp_notcomputed := [];
    g3hyp_computed := [];
  // gg
    ggnonhyp := [];
    ggnonhyp_notcomputed := [];
    ggnonhyp_computed := [];
    gghyp := [];
    gghyp_notcomputed := [];
    gghyp_computed := [];
  for i := 1 to #genus0 do
    s := genus0[i];
    if s`BelyiDBType eq "Hyperbolic" then
      // hyperbolic
      Append(~g0hyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // hyperbolic and belyi maps computed
        Append(~g0hyp_computed, s);
      else
        // hyperbolic and belyi maps not computed
        Append(~g0hyp_notcomputed, s);
      end if;
    else
      // nonhyperbolic
      Append(~g0nonhyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // nonhyperbolic and belyi maps computed
        Append(~g0nonhyp_computed, s);
      else
        // nonhyperbolic and belyi maps not computed
        Append(~g0nonhyp_notcomputed, s);
      end if;
    end if;
  end for;
  for i := 1 to #genus1 do
    s := genus1[i];
    if s`BelyiDBType eq "Hyperbolic" then
      // hyperbolic
      Append(~g1hyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // hyperbolic and belyi maps computed
        Append(~g1hyp_computed, s);
      else
        // hyperbolic and belyi maps not computed
        Append(~g1hyp_notcomputed, s);
      end if;
    else
      // nonhyperbolic
      Append(~g1nonhyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // nonhyperbolic and belyi maps computed
        Append(~g1nonhyp_computed, s);
      else
        // nonhyperbolic and belyi maps not computed
        Append(~g1nonhyp_notcomputed, s);
      end if;
    end if;
  end for;
  for i := 1 to #genus2 do
    s := genus2[i];
    if s`BelyiDBType eq "Hyperbolic" then
      // hyperbolic
      Append(~g2hyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // hyperbolic and belyi maps computed
        Append(~g2hyp_computed, s);
      else
        // hyperbolic and belyi maps not computed
        Append(~g2hyp_notcomputed, s);
      end if;
    else
      // nonhyperbolic
      Append(~g2nonhyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // nonhyperbolic and belyi maps computed
        Append(~g2nonhyp_computed, s);
      else
        // nonhyperbolic and belyi maps not computed
        Append(~g2nonhyp_notcomputed, s);
      end if;
    end if;
  end for;
  for i := 1 to #genus3 do
    s := genus3[i];
    if s`BelyiDBType eq "Hyperbolic" then
      // hyperbolic
      Append(~g3hyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // hyperbolic and belyi maps computed
        Append(~g3hyp_computed, s);
      else
        // hyperbolic and belyi maps not computed
        Append(~g3hyp_notcomputed, s);
      end if;
    else
      // nonhyperbolic
      Append(~g3nonhyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // nonhyperbolic and belyi maps computed
        Append(~g3nonhyp_computed, s);
      else
        // nonhyperbolic and belyi maps not computed
        Append(~g3nonhyp_notcomputed, s);
      end if;
    end if;
  end for;
  for i := 1 to #highergenus do
    s := highergenus[i];
    if s`BelyiDBType eq "Hyperbolic" then
      // hyperbolic
      Append(~gghyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // hyperbolic and belyi maps computed
        Append(~gghyp_computed, s);
      else
        // hyperbolic and belyi maps not computed
        Append(~gghyp_notcomputed, s);
      end if;
    else
      // nonhyperbolic
      Append(~ggnonhyp, s);
      if assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps then
        // nonhyperbolic and belyi maps computed
        Append(~ggnonhyp_computed, s);
      else
        // nonhyperbolic and belyi maps not computed
        Append(~ggnonhyp_notcomputed, s);
      end if;
    end if;
  end for;
  // g0
    assert #genus0 eq #g0hyp+#g0nonhyp;
    info *:= Sprintf("%o genus 0 nonhyperbolic:\n", #g0nonhyp);
    info *:= Sprintf("  %o not computed.\n", #g0nonhyp_notcomputed);
    info *:= Sprintf("  %o computed:\n", #g0nonhyp_computed);
  // g1
    assert #genus1 eq #g1hyp+#g1nonhyp;
    info *:= Sprintf("%o genus 1 nonhyperbolic:\n", #g1nonhyp);
    info *:= Sprintf("  %o not computed.\n", #g1nonhyp_notcomputed);
    info *:= Sprintf("  %o computed:\n", #g1nonhyp_computed);
  // g2
    assert #genus2 eq #g2hyp+#g2nonhyp;
    info *:= Sprintf("%o genus 2 nonhyperbolic:\n", #g2nonhyp);
    info *:= Sprintf("  %o not computed.\n", #g2nonhyp_notcomputed);
    info *:= Sprintf("  %o computed:\n", #g2nonhyp_computed);
  // g3
    assert #genus3 eq #g3hyp+#g3nonhyp;
    info *:= Sprintf("%o genus 3 nonhyperbolic:\n", #g3nonhyp);
    info *:= Sprintf("  %o not computed.\n", #g3nonhyp_notcomputed);
    info *:= Sprintf("  %o computed:\n", #g3nonhyp_computed);
  // gg
    assert #highergenus eq #gghyp+#ggnonhyp;
    info *:= Sprintf("%o higher genus nonhyperbolic:\n", #ggnonhyp);
    info *:= Sprintf("  %o not computed.\n", #ggnonhyp_notcomputed);
    info *:= Sprintf("  %o computed:\n", #ggnonhyp_computed);
  // print and return
  print info;
  return g0nonhyp_notcomputed, g0nonhyp_computed, g1nonhyp_notcomputed, g1nonhyp_computed, g2nonhyp_notcomputed, g2nonhyp_computed, g3nonhyp_notcomputed, g3nonhyp_computed, ggnonhyp_notcomputed, ggnonhyp_computed;
end intrinsic;
