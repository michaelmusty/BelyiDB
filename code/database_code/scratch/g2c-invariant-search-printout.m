f := [];
for i := 1 to 7 do
  f_i := BelyiDBGetFilenames(i,2 : only_hyperbolic := true);
  f cat:= f_i;
end for;
f;
name := f[#f];
name;
s := BelyiDBRead(name);
s;
names := [];
  for i := 1 to #f do
  s := BelyiDBRead(f[i]);
  if assigned s`BelyiDBBelyiMaps then
    Append(~names, f[i]);
  end if;
end for;
curves := [**];
for i := 1 to #names do
  s := BelyiDBRead(names[i]);
  curves cat:= BelyiCurves(s);
end for;
g2s := [**];
for Y in curves do
  Append(~g2s, G2Invariants(Y));
end for;
g2s;
Index(g2s,[
6400000/3,
440000/9,
-32000/81
]);
curves[5];
IgusaClebsch(curves[5]);
IgusaClebschInvariants(curves[5]);
C := HyperellipticCurve(R![0, 0, 0, 0, 0, 0, -1], R![1]);
R;
R<x> := PolynomialRing(QQ);
C := HyperellipticCurve(R![0, 0, 0, 0, 0, 0, -1], R![1]);
IgusaClebschInvariants;
IgusaClebschInvariants(C);
X;
