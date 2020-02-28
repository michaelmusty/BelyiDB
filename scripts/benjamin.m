g1 := [];
for d := 4 to 9 do
  g1_list := BelyiDB(d,1 : only_hyperbolic := true);
  for s in g1_list do
    if BelyiMapIsComputed(s) then
      Append(~g1, s);
    end if;
  end for;
end for;
