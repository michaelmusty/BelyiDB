l := eval Read("scripts/c4c6.m");
curves := [EllipticCurve(pair) : pair in l];
js := [jInvariant(E) : E in curves];
return js;
