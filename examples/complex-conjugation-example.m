name := "7T6-[5,4,6]-511-421-322-g0.m";
s := BelyiDBRead(name);
triples := PointedPassport(s);
orb1 := [triples[3]];
orb2 := [triples[1], triples[2], triples[4]];
sigma1 := triples[2];
sigma2 := triples[4];

conjs_0 := [];
for rho in Sym(7) do
  if sigma1[1]^rho eq sigma2[1]^-1 then
    Append(~conjs_0, rho);
  end if;
end for;

conjs_1 := [];
for rho in conjs_0 do
  if sigma1[2]^rho eq sigma2[2]^-1 then
    Append(~conjs_1, rho);
  end if;
end for;

conjugators := Set(conjs_0) meet Set(conjs_1);

// check that it doesn't work for the one that isn't complex conjugate
sigma3 := triples[1];
conjs3_0 := [];
for rho in Sym(7) do
  if sigma3[1]^rho eq sigma2[1]^-1 then
    Append(~conjs3_0, rho);
  end if;
end for;

conjs3_1 := [];
for rho in Sym(7) do
  if sigma3[2]^rho eq sigma2[2]^-1 then
    Append(~conjs3_1, rho);
  end if;
end for;

// should be empty
Set(conjs3_0) meet Set(conjs3_1);
