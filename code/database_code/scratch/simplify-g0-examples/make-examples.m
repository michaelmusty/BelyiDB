load "config.m";
names := ["6T15-[5,3,3]-51-33-3111-g0.m", "8T50-[15,4,6]-53-41111-332-g0.m", "9T33-[15,2,3]-531-22221-333-g0.m", "7T5-[4,3,3]-421-331-331-g0.m", "6T15-[5,4,2]-51-42-2211-g0.m"];

for name in names do
  s := BelyiDBRead(name);
  belyi_str := BelyiDBText(s);
  i := Index(belyi_str, "auto printing");
  i := i - 6;
  belyi_str := belyi_str[1..i];
  save_name := Sprintf("simplify-%o",name);
  printf "Writing %o to file", name;
  Write(save_name, belyi_str);
end for;
