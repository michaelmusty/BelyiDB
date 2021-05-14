/* functions to help with printing */

intrinsic SequenceToString(l::SeqEnum) -> MonStgElt
  {[a,b,c] -> "a,b,c"}
  str := "";
  for i := 1 to #l-1 do
    str *:= Sprintf("%o, ", l[i]);
  end for;
  str *:= Sprintf("%o", l[#l]);
  return str;
end intrinsic;

intrinsic VarText(var::MonStgElt, lower::RngIntElt, upper::RngIntElt) -> MonStgElt
  {returns text "varlower, varlower+1, ..., varupper-1, varupper".}
  assert upper ge lower;
  var_text := "";
  if upper eq lower then
    var_text *:= Sprintf("%o%o", var, lower);
  else
    for i := lower to upper-1 by 1 do
      var_text *:= Sprintf("%o%o, ", var, i);
    end for;
    var_text *:= Sprintf("%o%o", var, upper);
  end if;
  return var_text;
end intrinsic;

intrinsic VarSeq(var::MonStgElt, lower::RngIntElt, upper::RngIntElt) -> SeqEnum[MonStgElt]
  {returns SeqEnum ["varlower", "varlower+1", ..., "varupper-1", "varupper"].}
  assert upper ge lower;
  var_seq := [];
  for i := lower to upper do
    Append(~var_seq, Sprintf("%o%o", var, i));
  end for;
  return var_seq;
end intrinsic;

intrinsic HomText(var::MonStgElt, lower::RngIntElt, upper::RngIntElt) -> MonStgElt
  {returns text "var.lower, var.lower+1, ..., var.upper"}
  assert upper ge lower;
  var_text := "";
  if upper eq lower then
    var_text *:= Sprintf("%o.%o", var, lower);
  else
    for i := lower to upper-1 by 1 do
      var_text *:= Sprintf("%o.%o, ", var, i);
    end for;
    var_text *:= Sprintf("%o.%o", var, upper);
  end if;
  return var_text;
end intrinsic;

/* more auxiliary functions */

intrinsic BelyiDBDeleteLineBreaks(str::MonStgElt) -> MonStgElt
  {Given a string str possibly with line breaks return a string without the line breaks.}
  str_new := "";
  for i in [1..#str] do
    if str[i] ne "\n" then
      str_new *:= str[i];
    end if;
  end for;
  return str_new;
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

intrinsic BelyiDBBaseFieldDataWriter(base_field_data::List, i::RngIntElt) -> MonStgElt
  {text to load base field data.}
  K<nu> := base_field_data[1];
  Kv := base_field_data[2];
  conj := base_field_data[3];
  z := base_field_data[4];
  assert ISA(Type(K), FldNum) or ISA(Type(K), FldRat);
  assert ISA(Type(Kv), PlcNumElt);
  assert ISA(Type(conj), BoolElt);
  // text for K
  gens := GeneratorsSequence(K);
  assert #gens eq 1;
  if AbsoluteDegree(K) eq 1 then
    str := Sprintf("K%o<nu%o> := RationalsAsNumberField();\n", i, i);
  else
    str := Sprintf("K%o<nu%o> := NumberField(%m);\n", i, i, DefiningPolynomial(K));
  end if;
  // text for Kv
  plc_ind := BelyiDBPlaceIndex(base_field_data);
  str *:= Sprintf("place%o := InfinitePlaces(K%o)[%o];\n", i, i, plc_ind);
  // text for conj
  str *:= Sprintf("conj%o := %m;\n", i, conj);
  // text for z
  CC<I> := ComplexField(Precision(Parent(z)));
  str *:= Sprintf("CC<I> := ComplexField(%o);\n", Precision(Parent(z)));
  str *:= Sprintf("z%o := %m;\n", i, z);
  // append
  str *:= Sprintf("base_field_data_%o := [* K%o, place%o, conj%o, z%o *];\n", i, i, i, i, i);
  return str;
end intrinsic;

intrinsic BelyiDBBelyiMapWriter(base_field_data::List, X::Crv, phi::FldFunFracSchElt, i::RngIntElt, phi_from_factorization, phisep_reduced) -> MonStgElt
  {text to load curve and Belyi map.}
  // base field
  K := base_field_data[1];
  nu_text := Sprintf("nu%o", i);
  AssignNames(~K, [nu_text]);
  Kv := base_field_data[2];
  conj := base_field_data[3];
  z := base_field_data[4];
  // assertions
  curve_field := BaseField(X);
  map_field := BaseField(Curve(Parent(phi)));
  assert curve_field eq map_field;
  if Type(curve_field) eq FldNum then
    assert GeneratorsSequence(curve_field) eq GeneratorsSequence(map_field);
    assert #GeneratorsSequence(curve_field) eq #GeneratorsSequence(K);
  end if;
  assert ISA(Type(K), FldNum) or ISA(Type(K), FldRat);
  assert ISA(Type(Kv), PlcNumElt);
  assert ISA(Type(conj), BoolElt);
  KX := FunctionField(X);
  Kpol<x>:=PolynomialRing(K);

  //coefs:=[ [ &+[ Eltseq(a)[i]*(K.1^(i-1)) : i in [1..Degree(K)] ] :  a in Coefficients(f) ] : f in phi_reduced ];
  //phi_recon:=[ Kpol!(&+[ coefs[1][i]*(Kpol.1^(i-1)) : i in [1..Degree(phi_reduced[1])+1] ]),
  //             Kpol!(&+[ coefs[2][i]*(Kpol.1^(i-1)) : i in [1..Degree(phi_reduced[2])+1] ]) ];
  assert Parent(phi) eq KX;
  phi_from_factorization:=KX!phi_from_factorization;
  assert Parent(phi_from_factorization) eq KX;

  phisep_recon:=[* [ <KX!Evaluate(T[1],KX.1), T[2]> : T in phisep_reduced[1] ], [ <KX!Evaluate(T[1],KX.1), T[2]> : T in phisep_reduced[2] ], K!phisep_reduced[3] *];

  //assert Parent(phi_recon[1]) eq Kpol;
  // make the string
  str := "";
  if Genus(X) eq 0 then
    X<x> := X;
    KX<x> := KX;
    assert Sprintf("%o", KX.1) eq "x";

    str *:= Sprintf("X%o := Curve(ProjectiveSpace(PolynomialRing(K%o, 2)));\n", i, i);
    str *:= Sprintf("KX%o<x> := FunctionField(X%o);\n", i, i);
    str *:= Sprintf("phi%o := KX%o!(%o);\n", i, i, phi);
    str *:= Sprintf("phi_improvedg0%o := KX%o!(%o);\n", i, i, phi_from_factorization);
    str *:= Sprintf("phi_improved_factorizedg0%o := %o;\n", i, phisep_recon);
  elif Type(X) eq CrvEll then
    X<x,y,z> := X;
    KX<x,y> := KX;
    aInvs := aInvariants(X);
    str *:= BelyiDBDeleteLineBreaks(Sprintf("aInvs%o := %o;\n", i, aInvs)) cat "\n";
    str *:= Sprintf("E%o := EllipticCurve(aInvs%o);\n", i, i);
    str *:= Sprintf("X%o := BaseChange(E%o, K%o);\n", i, i, i);
    assert Sprintf("%o", KX.1) eq "x";
    assert Sprintf("%o", KX.2) eq "y";
    str *:= Sprintf("KX%o<%o,%o> := FunctionField(X%o);\n", i, KX.1, KX.2, i);
    str *:= Sprintf("phi%o := KX%o!(%o);\n", i, i, phi);
  elif Type(X) eq CrvHyp then
    X<x,y,z> := X;
    KX<x,y> := KX;
    f, h := HyperellipticPolynomials(X);
    P := Parent(f);
    AssignNames(~P, ["t"]);
    str *:= Sprintf("P<t> := PolynomialRing(K%o);\n", i);
    str *:= Sprintf("X%o := HyperellipticCurve(%o, %o);\n", i, f, h);
    assert Sprintf("%o", KX.1) eq "x";
    assert Sprintf("%o", KX.2) eq "y";
    str *:= Sprintf("KX%o<%o,%o> := FunctionField(X%o);\n", i, KX.1, KX.2, i);
    str *:= Sprintf("phi%o := KX%o!(%o);\n", i, i, phi);
  else
    X<[x]> := X;
    I<[x]> := Ideal(X);
    P<[x]> := Generic(I);
    num_vars := Rank(P);
    str *:= Sprintf("P<[x]> := PolynomialRing(K%o, %o);\n", i, num_vars);
    str *:= Sprintf("I<[x]> := ideal< P | %o >;\n", Basis(I));
    if IsAffine(X) then
      str *:= Sprintf("X%o<[x]> := Curve(AffineSpace(P), I);\n", i);
    else
      assert IsProjective(X);
      str *:= Sprintf("X%o<[x]> := Curve(ProjectiveSpace(P), I);\n", i);
    end if;
    KX<[x]> := Parent(phi);
    str *:= Sprintf("KX%o<[x]> := FunctionField(X%o);\n", i, i);
    str *:= Sprintf("phi%o := KX!(%o);\n", phi);
  end if;
  return str;
end intrinsic;

intrinsic BelyiDBText(s::BelyiDB) -> MonStgElt
  {Create (magma-loadable) text for BelyiDB object.}
  SetColumns(0);
  str := "s := BelyiDBInitialize();\n";
  // %m attributes
  all_attrs := GetAttributes(Type(s));
  automatic_attrs := []; // can be printed using %m
  Append(~automatic_attrs, "BelyiDBName");
  Append(~automatic_attrs, "BelyiDBFilename");
  Append(~automatic_attrs, "BelyiDBDegree");
  Append(~automatic_attrs, "BelyiDBOrders");
  Append(~automatic_attrs, "BelyiDBType");
  Append(~automatic_attrs, "BelyiDBGenus");
  Append(~automatic_attrs, "BelyiDBSize");
  Append(~automatic_attrs, "BelyiDBPointedSize");
  Append(~automatic_attrs, "BelyiDBPermutationTriple");
  Append(~automatic_attrs, "BelyiDBAutomorphismGroup");
  Append(~automatic_attrs, "BelyiDBPointedAutomorphismGroup");
  Append(~automatic_attrs, "BelyiDBMonodromyGroup");
  Append(~automatic_attrs, "BelyiDBPassport");
  Append(~automatic_attrs, "BelyiDBPointedPassport");
  Append(~automatic_attrs, "BelyiDBGaloisOrbits");
  Append(~automatic_attrs, "BelyiDBComputationTime");
  Append(~automatic_attrs, "BelyiDBSanityCheckTiming");
  Append(~automatic_attrs, "BelyiDBLocalSanityCheckTiming");
  Append(~automatic_attrs, "BelyiDBLocalSanityCheckPrime");
  Append(~automatic_attrs, "BelyiDBLFTInfo");
  // BelyiDBBaseFieldData, [* [* K, Kv, conj, complex embeddding *],... *]
  str *:= "\n/*\nBase Field Data\n*/\n\n";
  if assigned s`BelyiDBBaseFieldData then
    assert assigned s`BelyiDBBelyiCurves and assigned s`BelyiDBBelyiMaps;
    assert #s`BelyiDBBaseFieldData eq #s`BelyiDBPointedPassport;
    // base field data list will contain base_field_data_i
    str *:= "base_field_data := [* *];\n";
    for i := 1 to #BaseFieldData(s) do
      // makes text for base_field_data_i
      str *:= BelyiDBBaseFieldDataWriter(BaseFieldData(s)[i], i);
      // append base_field_data_i to base_field_data
      str *:= Sprintf("Append(~base_field_data, base_field_data_%o);\n", i);
    end for;
    str *:= Sprintf("s`BelyiDBBaseFieldData := base_field_data;\n");
  end if;
  // BelyiDBBelyiCurves and BelyiDBBelyiMaps
    str *:= "\n/*\nBelyi Maps\n*/\n\n";
    if assigned s`BelyiDBBelyiMaps then
      assert assigned s`BelyiDBBaseFieldData and assigned s`BelyiDBBelyiCurves;
      assert #s`BelyiDBBelyiMaps eq #s`BelyiDBPointedPassport;
      assert #s`BelyiDBBelyiCurves eq #s`BelyiDBPointedPassport;
      // curves list will contain Xi
      str *:= "curves := [* *];\n";
      // maps list will contain phii
      str *:= "maps := [* *];\n";
      str *:= "maps_improvedg0 := [* *];\n";
      str *:= "maps_improved_factorizedg0 := [* *];\n";
      for i := 1 to #s`BelyiDBBelyiMaps do
        base_field_data := s`BelyiDBBaseFieldData[i];
        // str *:= Sprintf("K := K%o;\n", i);
        str *:= Sprintf("K%o<nu%o> := K%o;\n", i, i, i);
        X := s`BelyiDBBelyiCurves[i];
        phi := s`BelyiDBBelyiMaps[i];
        phi_from_factorization := s`BelyiDBImprovedModelg0[i];
        phi_reduced := s`BelyiDBImprovedModelFactorizedg0[i];
        str *:= BelyiDBBelyiMapWriter(base_field_data, X, phi, i, phi_from_factorization, phi_reduced);
        // append curve_i to curves
        str *:= Sprintf("Append(~curves, X%o);\n", i);
        // append map_i to maps
        str *:= Sprintf("Append(~maps, phi%o);\n", i);
        str *:= Sprintf("Append(~maps_improvedg0, phi_improvedg0%o);\n", i);
        str *:= Sprintf("Append(~maps_improved_factorizedg0, phi_improved_factorizedg0%o);\n", i);
      end for;
      str *:= Sprintf("s`BelyiDBBelyiCurves := curves;\n");
      str *:= Sprintf("s`BelyiDBBelyiMaps := maps;\n");
      str *:= Sprintf("s`BelyiDBBelyiMapsImprovedg0 := maps_improvedg0;\n");
      str *:= Sprintf("s`BelyiDBBelyiMapsImprovedFactorizedg0 := maps_improved_factorizedg0;\n");
    end if;
  // write text for %m attributes
  str *:= "\n/*\nauto printing\n*/\n\n";
  for attr in automatic_attrs do
    if assigned s``attr then
      str *:= Sprintf("s`%o := ", attr);
      str *:= Sprintf("%m;\n", s``attr);
    end if;
  end for;
  // numerical
    str *:= "\n/*\nNumerical Data\n*/\n\n";
    if assigned s`BelyiDBRescalingFactors then
      str *:= Sprintf("CC<I> := ComplexField(%o);\n", Precision(Parent(s`BelyiDBRescalingFactors[1])));
      str *:= Sprintf("s`BelyiDBRescalingFactors := %m;\n", s`BelyiDBRescalingFactors);
    end if;
  // BelyiDBPowserBases
    str *:= "\n/*\nPowser Bases\n*/\n\n";
    if assigned s`BelyiDBPowserBases then
      indat := s`BelyiDBPowserIndat;
      pows := s`BelyiDBPowserBases;
      // TODO
      pow := pows[1][1];
      str *:= Sprintf("CC<I> := ComplexField(%o);\n", Precision(BaseRing(Parent(pow))));
      str *:= Sprintf("Ser<w> := PowerSeriesRing(CC, %o);\n", Precision(Parent(pow)));
      str *:= Sprintf("s`BelyiDBPowserIndat := %m;\n", indat);
      str *:= Sprintf("s`BelyiDBPowserBases := [];\n");
      for i := 1 to #pows do
        str *:= Sprintf("expansions := [];\n");
        for j := 1 to #pows[i] do
          str *:= Sprintf("Append(~expansions, Ser!(%m));\n", Eltseq(pows[i][j]));
        end for;
        str *:= Sprintf("Append(~s`BelyiDBPowserBases, expansions);\n");
      end for;
    end if;
  // return statement for eval fuction and writing
    str *:= "\n/*\nReturn for eval\n*/\n\n";
    str *:= Sprintf("return s;");
  return str;
end intrinsic;

intrinsic BelyiDBWrite(s::BelyiDB) -> MonStgElt
  {Write BelyiDBText information to the proper file.}
  SetColumns(0);
  // directory stuff
  dir := GetCurrentDirectory();
  parentdir := Pipe(Sprintf("basename 'dirname %o'", dir), "");
  if parentdir ne "BelyiDB\n" then
    error "make sure your working directory is the BelyiDB repository.";
  end if;
  // makes sure the object has some basic information
  if assigned s`BelyiDBDegree and assigned s`BelyiDBName then
    savedir := Sprintf("%o/belyi_db/%o/%o", dir, Degree(s), Filename(s));
  else
    error "this BelyiDB object does not have enough information worth saving!";
  end if;
  // BelyiDBText
  str := BelyiDBText(s);
  // write to file
  Write(savedir, str : Overwrite := true);
  returnText := Sprintf("%o written in directory %o\n", Filename(s), savedir);
  return returnText;
end intrinsic;
