
// Belyi maps downloaded from the LMFDB on 03 August 2020.
// Magma code for Belyi map with label 6T1-6_6_1.1.1.1.1.1-a


// Group theoretic data

d := 6;
i := 1;
G := TransitiveGroup(d,i);
sigmas := [[Sym(6) | [2, 3, 4, 5, 6, 1], [6, 1, 2, 3, 4, 5], [1, 2, 3, 4, 5, 6]]];
embeddings := [ComplexField(15)![1.0, 0.0]];

// Geometric data

// Define the base field
K<nu> := RationalsAsNumberField();
// Define the curve
X := Curve(ProjectiveSpace(PolynomialRing(K, 2)));
// Define the map
KX<x> := FunctionField(X);
phi := -1/(x^6 - 1);