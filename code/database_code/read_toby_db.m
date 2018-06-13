intrinsic BelyiDBReadFromTobyDB(filename::MonStgElt) -> BelyiDB
  {}
  dir := GetCurrentDirectory();
  l := BelyiDBGetInfo(filename);
  d := l[1];
  // file := dir cat Sprintf("/belyi_db/%o/%o", d, filename);
  file := Sprintf("~/Dropbox/belyi/BelyiDB/%o/%o", d, filename);
  str := Read(file);
  // eval the string and return
  s := eval str;
  assert Type(s) eq BelyiDB;
  return s;
end intrinsic;
