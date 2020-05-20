X := Curve(ProjectiveSpace(QQ,1));
KX<t> := FunctionField(X);
phi := 4*t^2*(1-2*t)^3*(1+3*t)^2*(15 - 10*t - 60*t^2 + 72*t^3);
/*
Support(Divisor(phi));
Support(Divisor(phi-1));
Support(Divisor(Differential(phi)));
lambdas := [[<3,1>,<2,2>,<1,3>],[<2,5>],[<10,1>]];
results_full := PassportRepresentatives(10 : partitions := lambdas);
results := []
for el in results_full do
  if #el[2] ne 0 then
    Append(~results, el);
  end if;
end for;
*/
sigmas :=
  [
    [Sym(10) |
    (1, 4, 9, 2, 5, 10, 7, 6, 3, 8),
    (1, 6)(2, 7)(3, 8)(4, 9)(5, 10),
    (1, 3)(2, 4, 6)(5, 7)
    ],
    [Sym(10) |
    (1, 2, 9, 10, 5, 8, 3, 4, 7, 6),
    (1, 6)(2, 7)(3, 8)(4, 9)(5, 10),
    (2, 6)(4, 8, 10)(7, 9)
    ]
  ];
Gammas := [TriangleSubgroups(el) : el in sigmas];
