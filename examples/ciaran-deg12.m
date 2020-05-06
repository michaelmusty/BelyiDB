sigma :=
  [Sym(12)|
    (1, 8)(4, 11)(5, 10)(6, 12)(7, 9),
    (1, 6, 3, 4)(2, 5, 8, 7)(9, 10, 12, 11),
    (1, 5, 9, 8, 4, 12)(2, 7, 11, 3, 6, 10)
  ];
//sigma := S3Action(Sym(3)!(3,2,1), sigma_old);
Gamma := TriangleSubgroup(sigma);
//X, phi := BelyiMap(Gamma : prec := 100);
X, phi := BelyiMap(Gamma : prec := 60, Al := "NumericalKernel");
