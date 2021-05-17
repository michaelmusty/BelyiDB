
// Belyi maps downloaded from the LMFDB on 03 August 2020.
// Magma code for Belyi map with label 4T4-3.1_3.1_2.2-a


// Group theoretic data

d := 4;
i := 4;
G := TransitiveGroup(d,i);
sigmas := [[Sym(4) | [2, 3, 1, 4], [2, 4, 3, 1], [3, 4, 1, 2]]];
embeddings := [ComplexField(15)![1.0, 0.0]];

// Geometric data

// Define the base field
K<nu> := RationalsAsNumberField();
// Define the curve
X := Curve(ProjectiveSpace(PolynomialRing(K, 2)));
// Define the map
KX<x> := FunctionField(X);
phi := x/(x^4 - 3*x^3 + 15/8*x^2 + 9/16*x + 9/256);