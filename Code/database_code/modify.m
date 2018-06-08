intrinsic PolredabsConversion(s::BelyiDB) -> BoolElt
  {Convert BelyiDB to polredabsified BelyiDB, sanity check the maps, write to file, and read in again. Return true if successful.}
  sanity_bools := [];
  vprintf BelyiDB : "%o:\n", Name(s);
  t := Polredabs(s);
  vprintf BelyiDB : "  Polredabsified\n";
  vprintf BelyiDB : "  p=%o sanity check: ", 101;
  bool_local_101 := BelyiLocalSanityCheck(t, 101);
  vprintf BelyiDB : "%o\n", bool_local_101;
  Append(~sanity_bools, bool_local_101);
  vprintf BelyiDB : "  p=%o sanity check: ", 830111;
  bool_local_830111 := BelyiLocalSanityCheck(t, 830111);
  Append(~sanity_bools, bool_local_830111);
  vprintf BelyiDB : "%o\n", bool_local_830111;
  if #SequenceToSet(sanity_bools) eq 1 and sanity_bools[1] eq true then
    BelyiDBWrite(t);
    t := BelyiDBRead(Filename(t));
    if BelyiLocalSanityCheck(t, 18287) then
      vprintf BelyiDB : "Reading in file successful.\n";
      return true;
    else
      error "sanity check failed after writing file and reading back in!";
    end if;
  else
    error "sanity check of polredabsified BelyiDB failed!";
  end if;
end intrinsic;

intrinsic PolredabsConversion(d::RngIntElt) -> MonStgElt
  {Convert every BelyiDB of degree d.}
  f := BelyiDBFilenames(d);
  objs := [BelyiDBRead(f[i]) : i in [1..#f]];
  for s in objs do
    vprintf BelyiDB : "%o : ", Name(s);
    if BelyiMapIsComputed(s) then
      is_polredabs := IsPolredabsMatch(s);
      if is_polredabs then
        vprintf BelyiDB : "already polredabsified\n";
      else
        vprintf BelyiDB : "\n";
        PolredabsConversion(s); // errors will occur here if at all
      end if;
    else
      vprintf BelyiDB : "Belyi maps not computed\n";
    end if;
  end for;
  // if we make it through then process completed without errors
  return Sprintf("\nPolredabs conversion complete for degree %o\n", d);
end intrinsic;
