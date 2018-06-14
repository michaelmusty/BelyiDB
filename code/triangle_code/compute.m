intrinsic BelyiMapWrapper(s::BelyiDB) -> MonStgElt
	{}
	if TriangleType(s) eq "Hyperbolic" then
		t0 := Cputime();
		Gammas := BelyiDBToGammas(s);
		try
			BelyiMap(Gammas : prec := 25, precNewton := 5000);
			t := GammasToBelyiDB(Gammas);
			t1 := Cputime();
			t`BelyiDBComputationTime := t1-t0;
			assert AllSanityChecks(t);
			BelyiDBWrite(t);
			t := BelyiDBRead(Filename(t));
			assert AllSanityChecks(t);
			return Sprintf("%o : success!\n", Filename(s));
		catch e
			return Sprintf("%o: failed\n", Filename(s));
		end try;
	else
		return "Can only use wrapper with hyperbolic permutation triples.";
	end if;
end intrinsic;

intrinsic BelyiMapWrapper(d::RngIntElt) -> MonStgElt
	{}
	SetVerbose("BelyiDB", 0);
	SetVerbose("Shimura", 0);
	objs := BelyiDBGetNotComputed(d, 0 : only_hyperbolic := true);
	for i := 1 to #objs do
		s := objs[i];
		printf "%o: (%o out of %o)\n", Name(s), i, #objs;
		BelyiMapWrapper(s);
	end for;
	return Sprintf("\nBelyiMapWrapper for degree %o genus 0 hyperbolic complete.", d);
end intrinsic;
