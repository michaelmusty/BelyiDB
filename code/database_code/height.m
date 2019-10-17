/* HEIGHTS */

intrinsic Height(s::BelyiDB) -> RngIntElt
  {}
  if BelyiMapIsComputed(s) then
    curves := BelyiCurves(s);
    maps := BelyiMaps(s);
    return &+[Height(curves[i]) + Height(maps[i]) : i in [1..#curves]];
  else
    return -1;
  end if;
end intrinsic;

intrinsic Height(X::Crv) -> RngIntElt
  {}
  _<[x]> := Parent(DefiningPolynomials(X)[1]);
  if Degree(BaseField(X)) eq 1 then
   _<eta> := BaseField(X);
  end if;
  return #Sprintf("%o", DefiningEquations(X));
end intrinsic;

intrinsic Height(phi::FldFunFracSchElt) -> RngIntElt
  {}
  _<y> := Parent(phi);
  _<x> := BaseRing(Parent(phi));
  return #Sprintf("%o", phi);
end intrinsic;

/* MEASURES */

intrinsic Measure(s::BelyiDB) -> RngIntElt
  {}
  error "deprecated use Height instead";
  if BelyiMapIsComputed(s) then
    curves := BelyiCurves(s);
    maps := BelyiMaps(s);
    return &+[Measure(curves[i]) + Measure(maps[i]) : i in [1..#curves]];
  else
    return -1;
  end if;
end intrinsic;

/* measure curves */

intrinsic Measure(X::Crv) -> RngIntElt
  {}
  if Genus(X) eq 0 then
    return 0;
  else
    polys := DefiningEquations(X);
    return &+[Measure(poly) : poly in polys];
  end if;
end intrinsic;

intrinsic Measure(poly::RngMPolElt) -> RngIntElt
  {}
  coeffs := Coefficients(poly);
  if Parent(coeffs[1]) eq Rationals() then
    return &+[Height(x) : x in coeffs];
  else
    return &+[CoefficientHeight(x) : x in coeffs];
  end if;
end intrinsic;

/* measure maps */

intrinsic Measure(phi::FldFunFracSchElt) -> RngIntElt
  {}
  return Measure(Numerator(phi)) + Measure(Denominator(phi));
end intrinsic;

intrinsic Measure(poly::RngMPolResElt) -> RngIntElt
  {}
  coeffs := Coefficients(poly);
  if Parent(coeffs[1]) eq Rationals() then
    return &+[Height(x) : x in coeffs];
  else
    return &+[CoefficientHeight(x) : x in coeffs];
  end if;
end intrinsic;
