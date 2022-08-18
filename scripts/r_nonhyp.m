load "config.m";
AttachSpec("../Belyi/Code/spec");
SetVerbose("Shimura", true);
Attach("code/database_code/query.m");

doh := [];
for d := 6 to 9 do
  filenames := BelyiDBFilenames(d);
  for f in filenames do
    print "=====";
    print "Trying", f;
    try
      sDat := BelyiDBGetInfo(f);
      if &+[1/s : s in sDat[4]] lt 1 then
        continue;
      end if;
      sIn := BelyiDBRead(f);
      sOut := BelyiDBAdhoc(sIn);
      print sOut;
    catch e;
      Append(~doh, f);
    end try;
  end for;
end for;
