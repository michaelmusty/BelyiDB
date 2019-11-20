// Minimization and reduction of binary forms (mod scaling)
//
// Given a binary form f in Z[x,y],
// find matrix T and scalar s such that  s^-1 f^T  is integral and reduced
// and has smallest possible absolute value of its discriminant.

declare verbose Minimize, 2;

intrinsic MinimizeAtP(f::RngMPolElt, p::RngIntElt) -> RngMPolElt, AlgMatElt, RngIntElt
{Minimize the integral binary form f at the prime p.
 Returns the minimized form, the transformation matrix and the scaling factor.}
  require Rank(Parent(f)) eq 2: "f must be a binary form.";
  require IsHomogeneous(f): "f must be homogeneous.";
  Pf := Parent(f);
  R := BaseRing(Pf);
  cs := Coefficients(f);
  require R cmpeq Integers() or (R cmpeq Rationals() and forall{c : c in cs | IsIntegral(c)}):
          "the coefficients of f must be integers.";
  require IsPrime(p): "p must be a prime number.";
  vprintf Minimize, 1: "\nMinimizing %o at %o\n", f, p;
  s := 1; // scaling factor
  T := IdentityMatrix(Integers(), 2); // transformation matrix
  if f eq 0 then return f, T, s; end if; // nothing to do here
  PZ := PolynomialRing(Integers(), 2);
  P1 := PolynomialRing(Integers());
  f := PZ!f;
  v := Minimum([Valuation(c, p) : c in cs]);
  s := p^v;
  f := ExactQuotient(f, s);
  PF := PolynomialRing(GF(p), 2);
  d := Degree(f);
  while true do
    // necessary condition is that f mod p has a linear factor of multiplicity > half the degree
    fact := [e : e in Factorization(PF!f) | 2*e[2] gt d];
    if IsEmpty(fact) then
      vprintf Minimize, 2: "  no further minimization possible.\n";
      break;
    end if;
    lin := fact[1,1]; // the linear factor
    mc := MonomialCoefficient(lin, PF.1);
    if mc eq 1 then
      // lin = x - a*y, replace x by x + a*y
      a := Integers()!-MonomialCoefficient(lin, PF.2);
      if 2*a gt p then a -:= p; end if;
      tr := Parent(T)![1, a, 0, 1];
    elif mc eq 0 then
      // lin = y, swap x and y
      tr := Parent(T)![0, 1, 1, 0];
    else
      error "something is wrong with the factorization in MinimizeAtP";
    end if;
    ff := f^tr;
    TT := T*tr;
    // check valuations of coefficients
    f1 := Evaluate(ff, [P1.1, 1]);
    b := Min([Valuation(Coefficient(f1, j), p) + j : j in [0..d]]);
    if 2*b gt d then
      // minimization possible
      tr := Parent(T)![p, 0, 0, 1];
      f := ExactQuotient(ff^tr, p^b);
      T := TT*tr;
      s *:= p^b;
      vprintf Minimize, 2: "  current scaling factor is %o, matrix is %o\n", s, Eltseq(T);
    else
      vprintf Minimize, 2: "  no further minimization possible.\n";
      break;
    end if;
  end while;
  return Pf!f, T, s;
end intrinsic;

// use appropriate precision for root computation --> covariants!

intrinsic MinimizeAndReduce(f::RngMPolElt) -> RngMPolElt, AlgMatElt, RngIntElt
{Minimize and reduce the integral or rational binary form f.
 Returns the minimized and reduced form, the transformation matrix and the scaling factor.}
  require Rank(Parent(f)) eq 2: "f must be a binary form.";
  require IsHomogeneous(f): "f must be homogeneous.";
  Pf := Parent(f);
  R := BaseRing(Pf);
  cs := Coefficients(f);
  require R cmpeq Integers() or R cmpeq Rationals():
          "the coefficients of f must be integers or rational numbers.";
  if f eq 0 then return f, IdentityMatrix(Integers(), 2), 1; end if;
  vprintf Minimize, 1: "Minimizing and reducing %o\n", f;
  if R cmpeq Rationals() then
    // scale to make integral
    den := LCM([Denominator(c) : c in Coefficients(f)]);
    f *:= den;
  else
    den := 1;
  end if;
  PZ := PolynomialRing(Integers(), 2);
  P1 := PolynomialRing(Integers());
  // work with a polynomial over the integers
  f := PZ!f;
  // divide by gcd of the coefficients
  s := GCD(Coefficients(f));
  // make sure that sign is correct
  if LeadingCoefficient(Evaluate(f, [P1.1, 1])) lt 0 then
    s := -s;
  end if;
  f := ExactQuotient(f, s);
  // Use squarefree part of f (otherwise Reduce does not work).
  // At the end, we apply the transformation obtained to the original f.
  f0 := &*[e[1] : e in Factorization(f)];
  d := Degree(f0);
  // special case when d = 1 or 2
  if d eq 1 then
    // form is equivalent to x
    // determine the correct transformation
    a := MonomialCoefficient(f0, PZ.1);
    b := MonomialCoefficient(f0, PZ.2);
    if a ne 0 then
      T := Matrix([[1, -b], [0, a]]);
      s *:= a;
    else
      T := Matrix([[0, 1], [1, 0]]);
      s *:= b;
    end if;
  elif d eq 2 then
    // distinguish between split and irreducible quadratic forms
    s := GCD(Coefficients(f0));
    f := ExactQuotient(f0, s);
    fact := Factorization(f0);
    if #fact eq 2 then
      // split --> form is equivalent to x*y
      a1 := MonomialCoefficient(fact[1,1], PZ.1);
      b1 := MonomialCoefficient(fact[1,1], PZ.2);
      a2 := MonomialCoefficient(fact[2,1], PZ.1);
      b2 := MonomialCoefficient(fact[2,1], PZ.2);
      T := Matrix([[b2, -b1], [-a2, a1]]);
      s1 := Determinant(T);
      f0 := ExactQuotient(f0^T, s1);
      s *:= s1*Integers()!ExactQuotient(f0, PZ.1*PZ.2);
    else
      // irreducible: reduce to x^2 (+ x*y) + D*y^2 with smallest possible D
      a := MonomialCoefficient(f0, PZ.1^2);
      b := MonomialCoefficient(f0, PZ.1*PZ.2);
      c := MonomialCoefficient(f0, PZ.2^2);
      // a ne 0 since irreducible
      T := Matrix([[1, 0], [0, 2*a]]);
      s := a;
      // --> x^2 + 2*b*x*y + 4*a*c*y^2
      T := T*Matrix([[1, -b], [0, 1]]);
      D := b^2 - 4*a*c;
      D0, r := SquarefreeFactorization(D);
      T := T*Matrix([[r, 0], [0, 1]]);
      s *:= r^2;
      if D0 mod 4 eq 1 then
        T := T*Matrix([[2, 1], [0, 1]]);
        s *:= 4;
      end if;
    end if;
  else // d >= 3
    // find bad primes
    f1 := Evaluate(f0, [P1.1, 1]);
    // f has factor y^n mod p with n > d/2:
    bad := Set(PrimeDivisors(GCD([Coefficient(f1, d-j) : j in [0..d div 2]])));
    // if f has factor (x-a)^n mod p with n > d/2, then f(a) = f'(a) = ...= f^(e)(a)/e! = 0 mod p
    // with e = d div 2
    P1a := PolynomialRing(Integers(), 1);
    derivatives := [i eq 0 select f1 else ExactQuotient(Derivative(Self(i)), i) : i in [0..d div 2]];
    I := ideal<P1a | [Evaluate(der, P1a.1) : der in derivatives]>;
    gen := Integers()!Basis(EliminationIdeal(I, {}))[1];
    assert gen ne 0;
    bad join:= Set(PrimeDivisors(gen));
    vprintf Minimize, 1: "  potentially bad primes: %o\n", bad;
    s := 1; // scaling factor
    T := IdentityMatrix(Integers(), 2); // transformation matrix
    // minimize at p for each of the potentially bad primes p
    for p in bad do
      f0, T1, s1 := MinimizeAtP(f0, p);
      T := T*T1;
      s *:= s1;
      if s1 ne 1 then
        // do a reduction step when a transformation was made
        _, tr := Reduce(Evaluate(f0, [P1.1, 1]), d : Simple);
        f0 := f0^tr;
        T := T*tr;
      end if;
    end for;
    // last reduction using Julia covariant
    _, tr := Reduce(Evaluate(f0, [P1.1, 1]), d);
    T := T*tr;
  end if;
  // eliminate gcd of matrix entries
  g := GCD(Eltseq(T));
  T := Parent(T)![ExactQuotient(t, g) : t in Eltseq(T)];
  // apply T to original form
  f := f^T;
  // find suitable s
  s := GCD(Coefficients(f));
  if R cmpeq Integers() then
    return Pf!ExactQuotient(f, s), T, s;
  else
    return Pf!ExactQuotient(f, s), T, s/den;
  end if;
end intrinsic;

intrinsic MinimizeAndReduce(f::RngUPolElt : degree := Degree(f)) -> RngUPolElt, AlgMatElt, RngIntElt
{Minimize and reduce the integral binary form f, given in dehomogenized form.
 Returns the minimized and reduced form, the transformation matrix and the scaling factor.}
  require degree ge Degree(f): "Homogeneous degree must be at least dehomogenized degree.";
  P := Parent(f);
  // homogenize f
  P2 := PolynomialRing(BaseRing(P), 2);
  fhom := &+[Coefficient(f, i)*P2.1^i*P2.2^(degree-i) : i in [0..Degree(f)]];
  fhom, T, s := MinimizeAndReduce(fhom);
  // dehomogenize again
  return Evaluate(fhom, [P.1, 1]), T, s;
end intrinsic;

intrinsic ImproveParametrization(param::MapSch) -> MapSch
{Given a map from P^1 to a scheme, produce a map that is as simple as possible
 that differs from the given one by pre-composing with an automorphism of P^1.
 This requires the base field to be the rationals.}
  // do some checks
  P := Domain(param);
  require IsProjective(P) and Dimension(Ambient(P)) eq 1 and Dimension(P) eq 1:
          "Domain of the map must be P^1 as a curve.";
  require BaseRing(P) cmpeq Rationals(): "The base field must be the rationals.";
  // improve it:
  // we find an automorphism of P^1 that simplifies the irreducible factors
  //  of the defining polynomials of param
  form := &*[pol : pol in DefiningPolynomials(param) | pol ne 0];
  _, T := MinimizeAndReduce(LCM([Denominator(c) : c in Coefficients(form)])*form);
  T := ChangeRing(T, Rationals());
  // now we apply T to the defining polynomials and normalize
  pols := [pol^T : pol in DefiningPolynomials(param)];
  l := LCM([Denominator(c) : c in &cat[Coefficients(pol) : pol in pols]]);
  pols := [l*pol : pol in pols];
  g := GCD(ChangeUniverse(&cat[Coefficients(pol) : pol in pols], Integers()));
  pols := [pol/g : pol in pols];
  if HasKnownInverse(param) then
    // this is the corresponding operation for the polynomials giving the inverse
    pols1 := DefiningPolynomials(Inverse(param));
    pols1 := [T[2,2]*pols1[1] - T[1,2]*pols1[2], -T[2,1]*pols1[1] + T[1,1]*pols1[2]];
    l := LCM([Denominator(c) : c in &cat[Coefficients(pol) : pol in pols1]]);
    pols1 := [l*pol : pol in pols1];
    g := GCD(ChangeUniverse(&cat[Coefficients(pol) : pol in pols1], Integers()));
    pols1 := [pol/g : pol in pols1];
    // return new parametrization
    return map<P -> Codomain(param) | pols, pols1>;
  else
    return map<P -> Codomain(param) | pols>;
  end if;
end intrinsic;
