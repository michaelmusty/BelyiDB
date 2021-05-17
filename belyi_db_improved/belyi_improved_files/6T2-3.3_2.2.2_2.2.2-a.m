
// Belyi maps downloaded from the LMFDB on 03 August 2020.
// Magma code for Belyi map with label 6T2-3.3_2.2.2_2.2.2-a


// Group theoretic data

d := 6;
i := 2;
G := TransitiveGroup(d,i);
sigmas := [[Sym(6) | [3, 4, 5, 6, 1, 2], [2, 1, 6, 5, 4, 3], [4, 3, 2, 1, 6, 5]]];
embeddings := [ComplexField(15)![1.0, 0.0]];

// Geometric data

// Define the base field
K<nu> := RationalsAsNumberField();
// Define the curve
X := Curve(ProjectiveSpace(PolynomialRing(K, 2)));
// Define the map
KX<x> := FunctionField(X);
phi := -4*x^3/(x^6 - 2*x^3 + 1);