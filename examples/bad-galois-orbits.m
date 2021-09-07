s := BelyiDBRead("8T50-[6,10,4]-62-521-41111-g0.m");
t := BelyiDBRead("8T49-[7,4,4]-71-4211-4211-g0.m");
maps := s`BelyiDBBelyiMaps;
f := maps[1];
f;
g := maps[3];
g;
K1 := BaseField(Curve(Parent(f)));
K2 := BaseField(Curve(Parent(g)));
is_iso, mp := IsIsomorphic(K1, K2);
Support(Divisor(f));
f0, f0_mults := $1;
Support(Divisor(g));
g0, g0_mults := $1;
Support(Divisor(f-1));
f1, f1_mults := $1;
Support(Divisor(g-1));
g1, g1_mults := $1;
f0 := [RepresentativePoint(el) : el in f0];
f1 := [RepresentativePoint(el) : el in f1];
g0 := [RepresentativePoint(el) : el in g0];
g1 := [RepresentativePoint(el) : el in g1];
KX := Parent(f);
PP1 := Curve(KX);
L<b> := Parent(f0[1][1]);
iso_bool, fld_mp := IsIsomorphic(Parent(g1[1][1]), L);
assert iso_bool;
PP1L := ChangeRing(PP1,L);
KXL<x> := FunctionField(PP1L);
S<X,Y> := CoordinateRing(PP1L);

//pts_from := f1[1..3];
pts_from := [];
for i := 1 to 3 do
  Append(~pts_from, PP1L!Eltseq(f1[i]));
end for;
pts_to := [];
for i := 1 to 3 do
  Append(~pts_to, PP1L!Eltseq(g1[i]));
end for;
pts_to := [pts_to[1], pts_to[3], pts_to[2]];

// make Moebius transform mapping ramification points and compose with f

mob := MoebiusTransformation(PP1L, pts_from, pts_to);
for i := 1 to #pts_from do
  assert mob(pts_from[i]) eq pts_to[i];
end for;
KXL<x> := FunctionField(PP1L);
fL := KXL!f;
fL_mp := ProjectiveMap(fL);
f_eqns := DefiningEquations(fL_mp);
fL_mp := map< PP1L -> PP1L | f_eqns>;
//fmob := fL_mp*mob;
fmob := mob^-1*fL_mp;
fmob_eqns := DefiningEquations(fmob);
g_test := Evaluate(fmob_eqns[1], [x,1])/Evaluate(fmob_eqns[2], [x,1]);
print "Did we get it? mob o f = g?";
KX!g_test eq KX!g;

mob_eqns := DefiningEquations(mob^-1);
chg := Evaluate(mob_eqns[1], [x,1])/Evaluate(mob_eqns[2], [x,1]);
printf "the change of variables is x |-> %o\n", chg;
