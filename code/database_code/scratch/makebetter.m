ZZ_K := Integers(K);

polsize := function(f);
  return
    &+[&+[&+[Numerator(c)^2+Denominator(c)^2] : c in Eltseq(e)] : e in Coefficients(f)];
end function;

ratsize := function(fg);
  return polsize(Numerator(fg)) + polsize(Denominator(fg));
end function;

phirat := RestrictionToPatch(phi,AffinePatch(X,1));
_<xrat> := FunctionField(K);
phirat := Evaluate(phirat,[xrat]);

print ratsize(phirat);

phirat0 := 1/Evaluate(phirat,1/xrat); 
   // moves x = 0 above t = 0 to x = oo above t = oo, 
   // so make as close to a polynomial as possible

if Degree(Numerator(phirat0)) eq Degree(Denominator(phirat0)) then
  c := LeadingCoefficient(Numerator(phirat0));   
      // absorb this into t
  phirat0 := phirat0/c;
end if;

print ratsize(phirat0);

rescale1 := function(fg);
  // try to find a substitution x <- x/a, based on the factorization of the 
  // leading coefficient, that makes it smaller

  f := Numerator(fg);

  ffactc := Factorization(LeadingCoefficient(f)*ZZ_K);   
      // scary, but we are expecting this to be smooth
      // could replace by taking gcd of c*ZZ_K and TrialFactorization(Norm(c))
  dfg := Degree(f)-Degree(Denominator(fg));
  aa := &*[ff[1]^(-Floor(ff[2]/dfg)) : ff in ffactc];
  aagens := LLLBasis(aa);
      // no guarantees, but we'll be getting something "small" which belongs to the ideal

  xf := Parent(f).1;
  evals := [Evaluate(fg,xf*aagens[i]) : i in [1..#aagens]];
  _, mineval := Min([ratsize(fga) : fga in evals]);
  return evals[mineval], aagens[mineval];
end function;

phirat0 := rescale1(phirat0);
print ratsize(phirat0);

// Clear denominators to find a polynomial that x satisfies with integral coefficients
// Something nontrivial happens when we write the rational function as a polynomial
// with coefficients in K[t]?
Kt<t> := PolynomialRing(K);
Ktx<xt> := PolynomialRing(Kt);
phit := Evaluate(Numerator(phirat0),xt) - t*Evaluate(Denominator(phirat0),xt);
phit /:= LeadingCoefficient(phit);

newpolsize := function(f);
  return &+[&+[&+[c^2 : c in Eltseq(cf)] : cf in Eltseq(e)] : e in Coefficients(f)];
end function;

print newpolsize(phit);

makeintegral := function(f);
  bb := &+[&+[cc*ZZ_K : cc in Eltseq(c)] : c in Coefficients(f)];
  bb := bb^-1;   
      // multiply by a small element in the inverse ideal of the gcd of the coeffs
  return f*LLLBasis(bb)[1];
      // could do better by looping over the LLL-basis?
end function;

phit := makeintegral(phit);
print newpolsize(phit);

rescale2 := function(f);
  // Take a nonmonic polynomial that x satisfies (with coefficients in ZZ_K[t])
  // and find a small multiple of x that is integral
  ccpow := &+[c*ZZ_K : c in Eltseq(LeadingCoefficient(f))];
  ffactccpow := Factorization(ccpow);
       // again scary, but same comments apply as in rescale1
  cc := &*[ff[1]^(Floor(ff[2]/Degree(f))) : ff in ffactccpow];
  ccgens := LLLBasis(cc);
  xf := Parent(f).1;
  fnew := Evaluate(f,xf/ccgens[1]);
  fnew /:= LeadingCoefficient(fnew);
  return makeintegral(fnew), ccgens[1];
end function;

phit := rescale2(phit);
print newpolsize(phit);
phit;

