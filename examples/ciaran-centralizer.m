sigma=[Sym(12) |
    (1, 10)(2, 9)(3, 12)(4, 5)(8, 11),
    (1, 4, 3, 6)(2, 7, 8, 5)(9, 11, 12, 10),
    (1, 12, 4, 8, 9, 5)(2, 10, 6, 3, 11, 7)
    ];
sigma2 := [Sym(6) | Sym(6)!1, (1, 2)(3, 4)(5, 6), (1, 5, 3)(2, 6, 4) ];

// copy-pasta
/*
sigma_old :=
  [Sym(12)|
    (1, 8)(4, 11)(5, 10)(6, 12)(7, 9),
    (1, 6, 3, 4)(2, 5, 8, 7)(9, 10, 12, 11),
    (1, 5, 9, 8, 4, 12)(2, 7, 11, 3, 6, 10)
  ];
sigma := sigma_old;
Gamma := TriangleSubgroup(sigma);
BelyiMap(Gamma : prec := 60, Al := "NumericalKernel");
X, phi := $1;
jInvariant(X);
Conductor(X);
PP1 := Curve(ProjectiveSpace(QQ,1));
KPP1<t> := FunctionField(PP1);
Evaluate(phi,t);
Numerator(phi);
psi := (972/31*t^5 - 323676/961*t^4 + 46609344/29791*t^3 - 3735675936/923521*t^2 + 164789225280/28629151*t - 3450165990336/887503681)/(t^6 + 108/31*t^5 - 972/31*t^4 - 2402784/29791*t^3 + 11022480/29791*t^2 + 13888324800/28629151*t - 1458274104000/887503681);
Support(Divisor(psi));
Support(Divisor(phi));
pts0 := Support(Divisor(psi));
pts0 := [RepresentativePoint(el) : el in pts0];
[psi(el) : el in pts0];
for el in pts0 do
psi(el);
end for;
Support(Divisor(psi));
pts1 := $1;
pts1 := [RepresentativePoint(el) : el in pts1];
for el in pts1 do
psi(el);
end for;
Support(Divisor(psi-1));
pts1 := $1;
pts1 := [RepresentativePoint(el) : el in pts1];
for el in pts1 do
psi(el);
end for;
PlaneEquation;
PlaneEquation(psi);
Type(psi);
BaseRing(Parent(psi));
BaseRing(Curve(Parent(psi)));
$1.1;
PlaneEquation(psi);
QuadraticField(5);
$1.1;
$1^2;
Numerator(psi);
Denominator(psi);
print psi;
phi;
sigma6 := [Sym(6) | (1,4)(2,3), (1,2)(3,4,5,6), (1,3,6)(2,4,5)];
G := sub< Sym(6) | sigma6>;
TransitiveGroupDescription(G);
TransitiveGroupIdentification(G);
PassportRepresentatives(sigma6);
sigma6[3]*sigma6[2]*sigma6[1];
sigma6 := Reverse(sigma6);
sigma6[3]*sigma6[2]*sigma6[1];
sigma6 := [Sym(6) | (1,4)(2,3), (1,2)(3,4,5,6), (1,3,6)(2,4,5)];
PlaneEquation(phi);
BelyiDBRead("6T7-[4,3,2]-42-33-2211-g0.m");
s0 := $1;
s0`BelyiDBBelyiMaps;
sigma6 := [Sym(6) | (1,4)(2,3), (1,2)(3,6,5,4), (1,6,3)(2,5,4)];
PassportRepresentatives(sigma6);
sigma6[3]*sigma6[2]*sigma6[1];
sigma6_old := sigma6;
sigma6 := [el^-1 : el in sigma6_old];
sigma6[3]*sigma6[2]*sigma6[1];
sigma6_old[1]*sigma6_old[2]*sigma6_old[3];
sigma6[1]*sigma6[2]*sigma6[3];
PermutationTriples;
PassportRepresentatives;
PassportRepresentatives(Sym(4) : abc := [2,3,4]);
sigma;
PassportRepresentatives(TransitiveGroups(6)[7] : abc := [2,3,4]);
PassportRepresentatives(TransitiveGroups(6)[7] : abc := [2,4,3]);
sigma;
[Order(el) : el in sigma];
PassportRepresentatives(TransitiveGroups(6)[7] : abc := [2,4,3])[1][2];
PassportRepresentatives(TransitiveGroups(6)[7] : abc := [2,4,3])[1][2][1];
sigma6 := $1;
S3Action(Sym(3)!(2,3), sigma6);
y;
Parent(y);
X;
KX.2;
KX := FunctionField(X);
KX.2;
Support(Divisor(y));
Support(Divisor(KX.2));
Support(Divisor(KX.1));
sigma6;
sigma;
sigma6 := S3Action(Sym(3)!(2,3), sigma6);
psi;
Support(Divisor(psi));
Support(Divisor(phi));
Support(Divisor(psi));
Support(Divisor(KX.1));
Support(Divisor(phi));
sigma;
sigma6;
Support(Divisor(Differential(KX.1)));
Support(Divisor(Differential(psi)));
Support(Divisor(psi-1));
Support(Divisor(Differential(KX.1)));
Evaluate(KX.1, X![0,1,0]);
sigma;
*/
