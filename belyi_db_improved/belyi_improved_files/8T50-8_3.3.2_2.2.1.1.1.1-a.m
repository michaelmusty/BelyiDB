
// Belyi maps downloaded from the LMFDB on 11 June 2020.
// Magma code for Belyi map with label 8T50-8_3.3.2_2.2.1.1.1.1-a


// Group theoretic data

d := 8;
i := 5;
G := TransitiveGroup(d,i);
sigmas := [[Sym(8) | [7, 3, 5, 6, 4, 1, 8, 2], [8, 6, 5, 2, 3, 4, 1, 7], [2, 1, 4, 3, 5, 6, 7, 8]], [Sym(8) | [8, 3, 5, 7, 6, 4, 1, 2], [8, 7, 6, 2, 3, 5, 4, 1], [2, 1, 4, 3, 5, 6, 7, 8]]];
embeddings := [ComplexField(15)![0.0, -1.0], ComplexField(15)![0.0, 1.0]];

// Geometric data

// Define the base field
R<T> := PolynomialRing(Rationals());
K<nu> := NumberField(R![1, 0, 1]);

// Define the curve
X := Curve(ProjectiveSpace(PolynomialRing(K, 2)));
// Define the map
KX<x> := FunctionField(X);
phi := 1/169*(48*nu + 189)*x^8/(x^8 + 1/195*(96*nu + 352)*x^7 + 1/38025*(90528*nu - 79904)*x^6 + 1/63375*(7424*nu - 216832)*x^5 + 1/12675*(-70016*nu + 12288)*x^4 + 1/38025*(-11776*nu + 45568)*x^3 + 1/12675*(45568*nu + 11776)*x^2 + 1/190125*(-124928*nu - 80896));