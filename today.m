SetColumns(0);

AttachSpec("code/spec_database");
// SetVerbose("BelyiDB", 1);

AttachSpec("code/spec_triangle");
SetVerbose("Shimura", 1);

// bool, bad := GaloisOrbitsSanityCheck(6);
s := BelyiDBGet(5,0 : only_hyperbolic := true)[1];

Gammas := BelyiDBToGammas(s);

BelyiMap(Gammas[1] : prec := 20);
