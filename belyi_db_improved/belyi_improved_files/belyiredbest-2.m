//K:=RationalsAsNumberField();
//ZZ_K:=Integers(K);
//X:=Curve(ProjectiveSpace(PolynomialRing(K, 2)));
SetClassGroupBounds("GRH");

polsize := function(f);
  return  &+[&+[&+[Numerator(c)^2+Denominator(c)^2] : c in Eltseq(e)] : e in Coefficients(f)];
end function;

ratsize := function(fg);
  return polsize(Numerator(fg)) + polsize(Denominator(fg));
end function;

phirat0:=function(phi,X,K)
    phirat_init := RestrictionToPatch(phi,AffinePatch(X,1));
    _<xrat> := FunctionField(K);
    phirat := Evaluate(phirat_init,[xrat]);


//print ratsize(phirat);
    if (Degree(Numerator(phirat)) lt Degree(Denominator(phirat)))
       or #[ y : y in Coefficients(Numerator(phirat)) | y eq 0 ] gt
       #[ y : y in Coefficients(Denominator(phirat)) | y eq 0 ] then
       phi0 := 1/phirat;
       LFT:=[[0,1],[1,0]];
    else
       phi0:=phirat;
       LFT:=[[1,0],[0,1]];
    end if;

   if Degree(Denominator(phi0)) gt Degree(Numerator(phi0))/2
    or Degree(Denominator(phi0)) eq Degree(Numerator(phi0)) then
       phi0:=Evaluate(phi0, 1/xrat);
    end if;
   // so make as close to a polynomial as possible

  //if Degree(Numerator(phi0)) eq Degree(Denominator(phi0)) then
    //c := LeadingCoefficient(Numerator(phi0));
      // absorb this into t
    //phi0 := phi0/c;
   //end if;
return phi0, LFT;
end function;

//print ratsize(phirat0);


///////////////////////////
//////////////////////////

IdealShortVectorsProcess:=function(I, l,u: Minkowski:=true, timeout:=2);
//l,u are size in which to search over lattice, scaled by a medium sized vector in parallelepiped.
    if Degree(NumberField(Order(I))) gt 1 then

    if Minkowski eq true then

        Ibasis:=Basis(I);
        IxDen:=&*[ pp[1]^pp[2] : pp in Factorization(I*Denominator(I)) ];
        IxDen_gens,mxDen:=MinkowskiLattice(IxDen);
        Igens:=IxDen_gens/Denominator(I);
        BI:=Basis(Igens);
        dimL:=#BI;

        prec:=100+6*dimL;
        Rprec:=RealField(prec);
        VS:=VectorSpace(Rprec,dimL);
        BI_gens:=[ [ Rprec!v : v in Eltseq(gen) ] : gen in BI ];

        while Dimension(sub< VS | BI_gens >) lt dimL do
            prec:=prec+20;
            Rprec:=RealField(prec);
            VS:=VectorSpace(Rprec,dimL);
            BI_gens:=[ [ Rprec!v : v in Eltseq(gen) ] : gen in BI ];
        end while;

        LWB:=LatticeWithBasis(RMatrixSpace(Rprec,dimL,dimL)!&cat(BI_gens)); //lower the precision for efficiency
        OLWB:=LWB; // save original lattice in case wanted
	      LWB:=CoordinateLattice(LWB);

        min_vec:=Min(LWB);
        avg_vec:=Determinant(LWB)^(1/(dimL));
        //EC:=EnumerationCost(LWB20, 10*Sqrt(avg_vec));
        SVP:=ShortVectorsProcess(LWB, avg_vec*l, avg_vec*u);

        SV:=[];
        while not(IsEmpty(SVP)) do
            Append(~SV, NextVector(SVP));
        end while;

        t:=Realtime(); //set a timeout
        SVcoord :=[];
        for w in SV do
            while Realtime(t) lt timeout do
                Append(~SVcoord, [ Round(c) : c in Eltseq(w) ]);
            end while;
        end for;

        SIelts := [ &+[w[i]*Ibasis[i] : i in [1..#Ibasis]] : w in SVcoord ] cat [1];
        //assert something to make sure there was no precision error
        return SIelts;

    else
        Igens := LLLBasis(I);
        assert [ A/Denominator(I) : A in LLLBasis(I*Denominator(I)) ] eq Igens;
        Zn :=StandardLattice(#Igens);
        SVP:=ShortVectorsProcess(Zn, Ceiling(l),Ceiling(u));
        SV:=[];
        while not(IsEmpty(SVP)) do
            Append(~SV, NextVector(SVP));
        end while;
        MM := [ Eltseq(w) : w in SV ];
        SIelts:=[ (&+[ M[i]*Igens[i] : i in [1..#Igens] ]) : M in MM ] cat [1];
        return SIelts;
    end if;

    else
       tr, I_pr:=IsPrincipal(I);
       return [I_pr];
    end if;

end function;



TranslateTopP1:=function(fg)
//removes second coefficient.
  fden:= Denominator(fg);
  fnum := Numerator(fg);
  assert IsMonic(fden);
  assert fnum/fden eq fg;
  xf := Parent(fnum).1;

  fnum_mon:=fnum/LeadingCoefficient(fnum);
  assert IsMonic(fnum_mon);

  coef:=Coefficients(fnum_mon);
  anm1:=coef[#coef-1];
  ev:=Evaluate(fg, xf + (-anm1/Degree(fnum_mon)) );
  //assert #Sprint(ev) le #Sprint(fg);
  return ev;
end function;




ScaleTopP1 := function(fg ,l,u,K : Minkowski:=true, MeasureByString:=true, timeout:=2);
  // try to find a substitution x <- x/a, based on the factorization of the
  // leading coefficient, that makes it smaller
  //AttemptRadius is the multiple of the size of the minimum of L in which to look for short vectors
  //adjust so that number of vectors is same for LLL and Minkowski
  ZZ_K:=Integers(K);
  fden:= Denominator(fg);
  fnum := Numerator(fg);
  assert IsMonic(fden);
  assert fnum/fden eq fg;
  xf := Parent(fnum).1;

  if not(IsMonic(fnum) or IsMonic(-fnum) or (Degree(fnum) eq Degree(fden))) then
      ffactc := Factorization(LeadingCoefficient(fnum)*ZZ_K);
      dfg := Degree(fnum)-Degree(fden);
      aa_init := &*[ff[1]^(-Floor(ff[2]/dfg)) : ff in ffactc];
  if not(aa_init eq 1*ZZ_K) then

  aa:=&*[ pp[1]^pp[2] : pp in Factorization(aa_init) ];
  local_Minkowski:=Minkowski;
  local_timeout:=timeout;
      // scary, but we are expecting this to be smooth
      // could replace by taking gcd of c*ZZ_K and TrialFactorization(Norm(c))
  ISVP:=IdealShortVectorsProcess(aa, l, u: Minkowski:=local_Minkowski, timeout:=local_timeout);
  evals := [ Evaluate(fg,xf*ac) : ac in ISVP ];

  if MeasureByString eq true then
       minsize, mineval := Min([ #Sprint(fga) : fga in evals ]);
       return evals[mineval], minsize, #evals;
  elif MeasureByString eq false then
       minsize, mineval := Min([ratsize(fga) : fga in evals]);
       return evals[mineval], minsize, #evals;
  end if;

  else
      return fg;
  end if;

  else
      return fg;
  end if;
end function;



// Clear denominators to find a polynomial that x satisfies with integral coefficients
// Something nontrivial happens when we write the rational function as a polynomial
// with coefficients in K[t]?
//phit /:= LeadingCoefficient(phit);

newpolsize := function(f);
  return &+[&+([0] cat [&+[Numerator(c)^2+Denominator(c)^2 : c in Eltseq(cf)] : cf in Eltseq(e)]) : e in Coefficients(f)];
end function;

SolveFort:=function(FF,K)
//given f = a(x)- t*b(x), return [a(x),b(x)]

Kt<t> := PolynomialRing(K);
Ktx<xt> := PolynomialRing(Kt);

    phiFF_coef:= Coefficients(FF);
    new_num_coef:=[];
    for A in phiFF_coef do
        if A eq 0 then
            Append(~new_num_coef, K!0);
        else
            Append(~new_num_coef, Coefficients(A)[1]);
        end if;
    end for;
    new_num_pol:=&+[ new_num_coef[i]*xt^(i-1) : i in [1..#new_num_coef] ];

    new_den_coef:=[];
    for A in phiFF_coef do
        if (A eq 0) or (#Coefficients(A) eq 1) then
            Append(~new_den_coef, K!0);
        else
            Append(~new_den_coef, Coefficients(A)[2]);
        end if;
    end for;
    new_den_pol:=-&+[ new_den_coef[i]*xt^(i-1) : i in [1..#new_den_coef] ];
    return [new_num_pol,new_den_pol];
end function;




//print newpolsize(phit);

MakeIntegral := function(f, l, u, K : Minkowski:=true, MeasureByString:=true, timeout:=2);
// multiply by a small element in the inverse ideal of the gcd of the coeffs
//units? phi(x) = a(x)/b(x)=t

Kt<t> := PolynomialRing(K);
Ktx<xt> := PolynomialRing(Kt);
  ZZ_K:=Integers(K);

  phit := Evaluate(Numerator(f),xt) - t*Evaluate(Denominator(f),xt);
  bb_init := (&+[&+([0*ZZ_K] cat [cc*ZZ_K : cc in Eltseq(c)]) : c in Coefficients(phit)])^-1;
  if bb_init ne 1*ZZ_K then
  bb:=&*[ pp[1]^pp[2] : pp in Factorization(bb_init) ];
  is_pr, bb_pr:=IsPrincipal(bb);

  if is_pr then
      return SolveFort(phit*bb_pr,K);
  else

  local_Minkowski:=Minkowski;
  local_timeout:=timeout;
  ISVP:=IdealShortVectorsProcess(bb, l, u: Minkowski:=local_Minkowski, timeout:=local_timeout);
  evals := [ phit*ac : ac in ISVP ];

  if MeasureByString eq true then
      minsize, mineval := Min([ #Sprint(fga) : fga in evals ]);
      //assert phi_integral[1]/phi_integral[2] eq Evaluate(phi_topscaled,xt);
      return SolveFort(evals[mineval],K), minsize, #evals;
  elif MeasureByString eq false then
       minsize, mineval := Min([newpolsize(fga) : fga in evals]);
       return evals[mineval], minsize, #evals;
  end if;

  end if;
  else
      return SolveFort(phit,K);
  end if;

end function;



ScaleBottomP1 := function(f, l, u, K : Minkowski:=true, MeasureByString:=true, timeout:=2);
  // Take a nonmonic polynomial that x satisfies (with coefficients in ZZ_K[t])
  // and find a small multiple of x that is integral

  Kt<t> := PolynomialRing(K);
  Ktx<xt> := PolynomialRing(Kt);

  ZZ_K:=Integers(K);
  fsep:=[ f[1], f[2] ];

  local_Minkowski:=Minkowski;
  local_timeout:=timeout;

  //first lets see if we can take a gcd out of the top P1
  nonconst_coefs:=[ (Coefficients(fsep[1])[i])^(Degree(fsep[1])-i+2) : i in [2..#Coefficients(fsep[1])] ]
  cat [ ((Coefficients(fsep[2]) cat [ 0 : i in [1..Degree(fsep[1])-Degree(fsep[2])] ])[i])^(Degree(fsep[1])-i+2) : i in [2..#Coefficients(fsep[1])] ];
  nonc_bb:= (&+[&+([0*ZZ_K] cat [cc*ZZ_K : cc in Eltseq(c)]) : c in nonconst_coefs ])^-1;
  if nonc_bb ne 1*ZZ_K then
      nonc_scale:=&*[ pp[1]^Floor(pp[2]/Degree(fsep[1])) : pp in Factorization(nonc_bb) ];
      is_pr, nonc_pr:=IsPrincipal(nonc_scale);
      if is_pr then
          fsep:=[ Evaluate(fsep[1], xt*nonc_pr), Evaluate(fsep[2], xt*nonc_pr) ];
      else
          ISVP_nonc:=IdealShortVectorsProcess(nonc_scale, l, u: Minkowski:=local_Minkowski, timeout:=local_timeout);
          evals_nonc := [ Evaluate(fsep[1], xt*an) : an in ISVP_nonc ];
          minsize_nonc, mineval_nonc := Min([ #Sprint(fga) : fga in evals_nonc ]);
          fsep:= [ Evaluate(fsep[1], xt*ISVP_nonc[mineval_nonc]), Evaluate(fsep[2], xt*ISVP_nonc[mineval_nonc]) ];
      end if;
  end if;


  facf_num,uf_num:=Factorization(fsep[1]);
  irr_factors_num:=[];
  //consists of sequence of < h, b, e > where h is irreducible factor, b is leading coefficient of h and e is exponent in factorization.
  for g in facf_num do
  cc_num_init := (&+[&+([0*ZZ_K] cat [cc*ZZ_K : cc in Eltseq(c)]) : c in Coefficients(g[1]) ])^-1;
  if Factorization(cc_num_init) ne [] then
     cc_num:=&*[ pp[1]^pp[2] : pp in Factorization(cc_num_init) ];
     trcn,cn_pr:=IsPrincipal(cc_num);
        if trcn then
            Append(~irr_factors_num,<g[1]*cn_pr, g[2]>);
        else
            ISVP_num:=IdealShortVectorsProcess(cc_num, l, u: Minkowski:=local_Minkowski, timeout:=local_timeout);
            evals_num := [ g[1]*an : an in ISVP_num ];
            minsize_num, mineval_num := Min([ #Sprint(fga) : fga in evals_num ]);
            Append(~irr_factors_num,<evals_num[mineval_num], g[2]>);
        end if;
    else
       Append(~irr_factors_num, <Ktx!g[1],g[2]>);
  end if;
  end for;

  facf_den,uf_den:=Factorization(fsep[2]);
  irr_factors_den:=[];
  //consists of sequence of < h, b, e > where h is irreducible factor, b is leading coefficient of h and e is exponent in factorization.
  if facf_den ne [] then
  for g in facf_den do
  cc_den_init := (&+[&+([0*ZZ_K] cat [cc*ZZ_K : cc in Eltseq(c)]) : c in Coefficients(g[1]) ])^-1;
  if Factorization(cc_den_init) ne [] then
     cc_den:=&*[ pp[1]^pp[2] : pp in Factorization(cc_den_init) ];
     trcn,cn_pr:=IsPrincipal(cc_den);
        if trcn then
            Append(~irr_factors_den,<g[1]*cn_pr, g[2]>);
        else
            ISVP_den:=IdealShortVectorsProcess(cc_den, l, u: Minkowski:=local_Minkowski, timeout:=local_timeout);
            evals_den := [ g[1]*an : an in ISVP_den ];
            minsize_den, mineval_den := Min([ #Sprint(fga) : fga in evals_den ]);
            Append(~irr_factors_den,<evals_den[mineval_den], g[2]>);
        end if;
    else
       Append(~irr_factors_den, <Ktx!g[1],g[2]>);
  end if;
  end for;
  else
     Append(~irr_factors_den, <Ktx!1,1>);
  end if;

  lc_num:=(Ktx!uf_num)*(Ktx!(&*[ (1/LeadingCoefficient(h[1]))^h[2] : h in irr_factors_num ]));
  lc_den:=(Ktx!uf_den)*(Ktx!(&*([1] cat [ (1/LeadingCoefficient(h[1]))^h[2] : h in irr_factors_den ])));

  assert fsep[1] eq lc_num*(Ktx!(&*[ h[1]^h[2] : h in irr_factors_num ]));
  assert fsep[2] eq lc_den*(Ktx!&*([1] cat [ h[1]^h[2] : h in irr_factors_den ]));
  LC:=lc_num/lc_den;
  return [* irr_factors_num, irr_factors_den, LC *];

end function;





IntervalsMeasurement:=function(RescaleFunction, f,u,K: Minkowski:=true, MeasureByString:=true,timeout:=5)
//measure in intervals of average vector up to bound u.
    t1:=Cputime();

    local_Minkowski:=Minkowski;
    local_measure:=MeasureByString;
    local_timeout:=timeout;
    in1,in2,in3:= RescaleFunction(f, 0.0001,1: Minkowski:=local_Minkowski, MeasureByString:=local_measure,timeout:=local_timeout);
    list:=[in2];
    no_lattice_pts:=[in3];
    for m in [2..u] do
       a1,a2,a3:= RescaleFunction(f, m-1,m: Minkowski:=local_Minkowski, MeasureByString:=local_measure,timeout:=local_timeout);
       Append(~list, a2);
       Append(~no_lattice_pts,a3);
    end for;
    mn,mon_pos:=Min(list);
    printf "| Minimimum size: %o | Interval with minimum size: %o | Bound: %o | Time: %o | Number of lattice points: %o | Degree of field: %o | Minimum by interval: %o\n |",mn, mon_pos, u, Cputime(t1), &+no_lattice_pts, Degree(K),   list;
    return "";
end function;





BelyiReduction:=function(psi,X,K);
   phi_inverted:=phirat0(psi,X,K);
   phi_top:=TranslateTopP1(phi_inverted);
   phi_topscaled:=ScaleTopP1(phi_top, 0.00001,2, K: Minkowski:=true, MeasureByString:=true, timeout:=2);
   phi_integral:=MakeIntegral(phi_topscaled, 0.00001, 2,K : Minkowski:=true, MeasureByString:=true, timeout:=2);
   phi_bottomscaled:=ScaleBottomP1(phi_integral,0.00001,2,K: Minkowski:=true, MeasureByString:=true, timeout:=2);
   return phi_bottomscaled;
end function;

//R20:=RealField(20);
//LO,MO:=MinkowskiLattice(ZZ_K);
//dimLO:=Dimension(LO);
//BLO:=Basis(LO);
//LO_gens20:=[ [ R20!v : v in Eltseq(gen) ] : gen in BLO ];
//LO20:=LatticeWithBasis(RMatrixSpace(R20,dimLO,dimLO)!&cat(LO_gens20));

//[ &+[w[i]*Ibasis[i] : i in [1..#Ibasis]] : w in SVcoord ];

//U,mU:=UnitGroup(ZZ_K);
//TU,tU:=TorsionUnitGroup(ZZ_K);
//Ugens:=[ w : w in Generators(U) | Order(w) eq 0 ];
//Zu :=StandardLattice(#Ugens);
//Zusv:=ShortVectors(Zu,20);
//units:=[K!1] cat [ mU(&+[ Ugens[i]*Eltseq(vec[1])[i] : i in [1..#Ugens] ] + Inverse(mU)(tU(tu))) : vec in Zusv, tu in Setseq(Set(TU)) ];

//Ugens20:=[ [ R20!v : v in Eltseq(MO(mU(gen))) ] : gen in Ugens ];
//H20:=sub< LO20 | Ugens20 >;

//SVH20:=ShortVectors(H20, 10*Minimum(H20));
//SVHcoord := [ [ Round(c) : c in Eltseq(CoordinateVector(w[1])) ] : w in SVH20 ];
//SIHelts := [ mU(&+[w[i]*(Ugens[i]) : i in [1..#Ugens] ]) : w in SVHcoord  ];
//assert Set([ IsUnit(r) : r in SIHelts ]) eq Set([true]);


//evalsU := [ Evaluate(phi_top,(Parent(phi_top).1)*ac) : ac in units ];
//evalst:=[ phit_bot*ac :  ]
//minsizeU, minevalU := Min([ #Sprint(fga) : fga in evalsU ]);
//phi_topU:=evalsU[minevalU];



/////////////////////////
/////////////////////////


MultivariatePolsizeFrac:=function(fd,K)
//given a polynomial f \in Q(a1_,..,a_n)[y] return the (bit)size of f as in polsize
//The a_i represent Z-linear combinations of the LLL-basis of the leading coefficient.
int:=FieldOfFractions(PolynomialRing(Integers(),Degree(K)));
U:=PolynomialRing(K,Degree(K));
UK<y>:=PolynomialRing(U);
ZZ_K:=Integers(K);

fyco:=Coefficients(fd);
camsize:=0;
for fpol in fyco do
    camco,cammo:=CoefficientsAndMonomials(fpol);
    fy:=&+([0] cat [ (UK!cammo[j])*(UK!(&+[ an*y^(Index(Eltseq(camco[j]),an)-1) : an in Eltseq(camco[j]) ])) : j in [1..#cammo] ]);
    if fy ne 0 then
        coefsy:=Coefficients(fy);
        lcms:=[ LCM([ Denominator(Rationals()!a) : a in Coefficients(P) ]) : P in coefsy ];
        ZZfy:=[ (int!(coefsy[l]*lcms[l]))/(int!lcms[l]) : l in [1..#lcms] ];
        camsize:=camsize + (&+[ Numerator(zf)^2 + Denominator(zf)^2 : zf in ZZfy ]);
    end if;
end for;
return camsize;
end function;

MultivariatePolsize:=function(psi,K)
//Compute the (bit)size of the belyi map after scaling by a Z-linear combination of the LLL-basis in Deg(K) variables.
    int:=FieldOfFractions(PolynomialRing(Integers(),Degree(K)));
    U:=PolynomialRing(K,Degree(K));
    UK<y>:=PolynomialRing(U);
    ZZ_K:=Integers(K);

    fden:= Denominator(psi);
    fnum := Numerator(psi);
    ffactc := Factorization(LeadingCoefficient(fnum)*ZZ_K);
    dfg := Degree(fnum)-Degree(fden);
    aa := &*[ff[1]^(-Floor(ff[2]/dfg)) : ff in ffactc];
    aagens := LLLBasis(aa);
    assert #aagens eq Degree(K);

    c:=&+[ Name(U,i)*aagens[i] : i in [1..#aagens] ];
    coeffden:=Coefficients(fden);
    coeffnum:=Coefficients(fnum);
    fdeny:=UK!&+[ coeffden[i]*(c*y)^(i-1) : i in [1..#coeffden] ];
    fnumy:=UK!&+[ coeffnum[i]*(c*y)^(i-1) : i in [1..#coeffnum] ];
    return MultivariatePolsizeFrac(fnumy) + MultivariatePolsizeFrac(fdeny);
end function;

//G:=MultivariatePolsize(phirat0);
//MM:=[ [a1,a2,a3,a4,a5,a6] : a1,a2,a3,a4,a5,a6 in [-1..1] | [a1,a2,a3,a4,a5,a6] ne [0,0,0,0,0,0] ];
//mG, mInd:=Minimum([Evaluate(G, M) : M in MM ]);
//MM[mInd];
//JacG:=JacobianMatrix([G]);

//Set( [ #IntegerToString(ratsize(Z)) : Z in evals ]);
