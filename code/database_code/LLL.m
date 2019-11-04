intrinsic GetSpecializationValues() -> Any
  {}
  vals :=  SetToSequence(SequenceToSet(eval Read("scripts/c4c6toJ.m")));
  Remove(~vals,1); // first value is always 0
  return vals;
end intrinsic;

intrinsic PlaneEquation(phi::FldFunFracSchElt) -> Any
  {Given a Belyi map phi, return a plane model for its domain such that x is the Belyi map}
  KC := Parent(phi);
  C := Curve(KC);
  K<nu> := BaseRing(C);
  phi0 := Numerator(phi);
  phioo := Denominator(phi);
  if Genus(C) eq 0 then // defined on PP1, so no curve equation
    R<X,Phi,v> := PolynomialRing(K,3);
    h := hom< KC -> R | [X]>;
    I := ideal< R | h(phioo)*Phi - h(phi0), v*h(phioo) - 1>; // need last equation to avoid points where phioo = 0
    // eliminate v to obtain plane equation
    basis := Basis(EliminationIdeal(I,{X,Phi}));
    assert #basis eq 1;
    new_eqn := basis[1];
    S<x,y> := PolynomialRing(K,2);
    h_plane := hom< Parent(new_eqn) -> S | [y,x,0] >;
  else // so the curve actually has an equation
    KC<x,y> := KC;
    R<X,Y,Phi,v> := PolynomialRing(K,4);
    h := hom< KC -> R | [X,Y]>;
    curve_eqn := DefiningEquation(AffinePatch(C,1));
    h_curve := hom< Parent(curve_eqn) -> R | [X,Y] >;
    // need last equation to avoid points where phioo = 0
    I := ideal< R | h_curve(curve_eqn), h(phioo)*Phi - h(phi0), v*h(phioo) - 1>;
    // eliminate X and v to obtain plane equation
    basis := Basis(EliminationIdeal(I,{Y,Phi}));
    assert #basis eq 1;
    new_eqn := basis[1];
    S<x,y> := PolynomialRing(K,2);
    h_plane := hom< Parent(new_eqn) -> S | [0,y,x,0] >;
  end if;
  C_plane := Curve(AffineSpace(S),h_plane(new_eqn));
  printf "New curve is %o\n", C_plane;
  KC_plane<x> := FunctionField(C_plane);
  printf "New Belyi map is x\n";
  pts0, mults0 := Support(Divisor(x));
  pts1, mults1 := Support(Divisor(x-1));
  printf "x has divisor\n%o,\n%o\n", pts0, mults0;
  printf "x-1 has divisor\n%o,\n%o\n", pts1, mults1;
  // sanity check here? compare with divisor of phi. how to get sigma, though...?
  return C_plane;
end intrinsic;

intrinsic SpecializePolynomial(f::RngMPolElt, t::FldRatElt) -> Any
  {}
  S := Parent(f);
  K := BaseRing(S);
  assert Rank(S) eq 2;
  R<y> := PolynomialRing(K);
  h := hom< S -> R | [t,y] >;
  return h(f);
end intrinsic;

// should really define T2 of an element, which is the T2 of its characteristic (not minimal poly)
// so for instance, if number field has deg 4, but alpha is in quadratic subfield, should
// compute T2 of minpoly squared
// LLLWithGram() then ShortestVectors()
intrinsic T2Norm(a::FldNumElt : Precision := 100) -> Any
  {}
  prec := Precision;
  K<nu> := Parent(a);
  f := MinimalPolynomial(a);
  t2 := T2Norm(f : Precision := prec);
  t2 := (AbsoluteDegree(K)/Degree(f))*t2;
  return t2;
end intrinsic;

intrinsic T2Norm(f::RngUPolElt : Precision := 100) -> Any
  {}
  CC<I> := ComplexField(Precision);
  roots_pairs := Roots(f,CC);
  roots := [];
  for el in roots_pairs do
    for i := 1 to el[2] do
      Append(~roots, el[1]);
    end for;
  end for;
  t2 := &+[AbsoluteValue(el)^2 : el in roots];
  return t2;
end intrinsic;

intrinsic T2BilinearForm(f::RngUPolElt, g::RngUPolElt : Precision := 100) -> Any
  {}
  prec := Precision;
  return (T2Norm(f+g : Precision := prec) - T2Norm(f : Precision := prec) - T2Norm(g : Precision := prec));
end intrinsic;

intrinsic T2GramMatrix(basis::SeqEnum : Precision := 100) -> Any
  {}
  prec := Precision;
  CC<I> := ComplexField(prec);
  M := ZeroMatrix(CC, #basis, #basis);
  for i := 1 to #basis do
    for j := 1 to #basis do
      M[i,j] := T2BilinearForm(basis[i], basis[j] : Precision := prec);
    end for;
  end for;
  return M;
end intrinsic;

intrinsic PolredGramMatrix(F::RngMPolElt, vals::SeqEnum) -> Any
  {}

end intrinsic;

intrinsic PolredCoefficients(F::RngMPolElt, val::FldRatElt) -> Any
  {}
  f := SpecializePolynomial(F,val);
  K<nu> := NumberField(f);
  f2 := DefiningPolynomial(K);
  f_abs, cs := Polredbestabs(f2);
  K_abs := NumberField(f_abs);
  _, iota := IsIsomorphic(K,K_abs);
  return Eltseq((iota^-1)(K_abs.1));
end intrinsic;

intrinsic PolredFunctionFieldabs(F::RngMPolElt) -> Any
  {}
  as := [];
  vals := GetSpecializationValues();
  for val in vals do
    Append(~as, PolredCoefficients(F,val));
  end for;
  a_polys := [];
  for i := 1 to #as[1] do
    a := Interpolation(vals,[el[i] : el in as]);
  end for;
  Append(~a_polys,a);
  return a_polys;
end intrinsic;
