/* accessing information from filenames */

intrinsic BelyiDBGetInfo(filename::MonStgElt) -> List
  {returns a list with [* degree, group_database, group_id=[order,id], orders, partition_strings, genus *] without reading the file.}
  // directory stuff
  dir := GetCurrentDirectory();
  parentdir := Pipe(Sprintf("basename 'dirname %o'", dir), "");
  if parentdir ne "BelyiDB\n" then
    error "make sure your working directory is the BelyiDB repository.";
  end if;
  // first split
  raw := Split(filename, "-");
  assert #raw eq 6;
  // determine group database being used
  if Regexp("T", raw[1]) then // transitive group database
    group_database := "T";
  elif Regexp("S", raw[1]) then // small group database
    group_database := "S";
  else // manual group identification
    error "not implemented yet...use M maybe?";
  end if;
  // extract degree and group_id
  if group_database eq "T" then
    degree_group := Split(raw[1], "T");
    assert #degree_group eq 2;
    degree := StringToInteger(degree_group[1]);
    transitive_group_id := StringToInteger(degree_group[2]);
    group_id := [degree, transitive_group_id];
  elif group_database eq "S" then
    degree_group := Split(raw[1], "S");
    assert #degree_group eq 2;
    degree := StringToInteger(degree_group[1]);
    group_raw := degree_group[2];
    group_raw := Split(group_raw, ",");
    assert #group_raw eq 2;
    small_group_order := StringToInteger(group_raw[1]);
    small_group_id := StringToInteger(group_raw[2]);
    group_id := [small_group_order, small_group_id];
  else
    error "group database not recognized.";
  end if;
  assert #group_id eq 2;
  // extract orders
  assert raw[2][1] eq "[";
  assert raw[2][#raw[2]] eq "]";
  raw2 := raw[2][2..#raw[2]-1];
  splraw2 := Split(raw2,",");
  assert #splraw2 eq 3;
  orders := [];
  for i := 1 to 3 do
    Append(~orders, StringToInteger(splraw2[i]));
  end for;
  // extract partition strings
  partition_strings := [];
  for i := 3 to 5 do
    Append(~partition_strings, raw[i]);
  end for;
  // extract genus
  raw_genus := raw[6];
  raw_genus := Split(raw_genus, ".");
  assert #raw_genus eq 2;
  raw_genus := raw_genus[1];
  raw_genus := Split(raw_genus, "g");
  genus := StringToInteger(raw_genus[#raw_genus]); // machine dependent :/
  // return
  return [* degree, group_database, group_id, orders, partition_strings, genus *];
end intrinsic;

intrinsic BelyiDBGetGenus(filename::MonStgElt) -> RngIntElt
  {extract genus from filename.}
  l := BelyiDBGetInfo(filename);
  return l[#l];
end intrinsic;

intrinsic BelyiDBGetDegree(filename::MonStgElt) -> RngIntElt
  {extract degree from filename.}
  l := BelyiDBGetInfo(filename);
  return l[1];
end intrinsic;

intrinsic BelyiDBGetGroup(filename::MonStgElt) -> RngIntElt
  {extract transitive group or small group from filename.}
  l := BelyiDBGetInfo(filename);
  degree := l[1];
  group_database := l[2];
  group_id := l[3];
  assert #group_id eq 2;
  if group_database eq "T" then
    assert degree eq group_id[1];
    return TransitiveGroup(degree, group_id[2]);
  elif group_database eq "S" then
    G := SmallGroup(group_id[1], group_id[2]);
    test_id := IdentifyGroup(G);
    assert test_id[1] eq group_id[1] and test_id[2] eq group_id[2];
    return G;
  else
    error "BelyiDB %o filename does not produce correct group!\n", filename;
  end if;
end intrinsic;

intrinsic BelyiDBIsHyperbolic(filename::MonStgElt) -> BoolElt
  {determine if hyperbolic from filename.}
  l := BelyiDBGetInfo(filename);
  orders := l[4];
  assert #orders eq 3;
  a,b,c := Explode(orders);
  if (1/a+1/b+1/c) lt 1 then
    return true;
  else
    return false;
  end if;
end intrinsic;

intrinsic BelyiDBFilenames(d::RngIntElt) -> SeqEnum[MonStgElt]
  {Returns the filenames (MonStgElts) in BelyiDB/d as a SeqEnum.}
  // directory stuff
  dir := GetCurrentDirectory();
  parentdir := Pipe(Sprintf("basename 'dirname %o'", dir), "");
  if parentdir ne "BelyiDB\n" then
    error "make sure your working directory is the BelyiDB repository.";
  end if;
  // check to see if directory /BelyiDB/d exists
  command := Sprintf("ls belyi_db");
  ls := Pipe(command, "");
  BelyiDBDirectories := Split(ls, "\n");
  if Sprintf("%o", d) notin BelyiDBDirectories then
    return [];
  end if;
  // get the filenames for some specified degree d
  command := Sprintf("ls belyi_db/%o", d);
  ls := Pipe(command, "");
  filenames := Split(ls, "\n");
  return filenames;
end intrinsic;

intrinsic BelyiDBGetFilenames(d::RngIntElt, genus::RngIntElt : only_hyperbolic := false, only_nonhyperbolic := false) -> Any
  {sort through filenames of a given degree and genus. the optional arguments further restrict which filenames get returned.}
  // directory stuff
  dir := GetCurrentDirectory();
  parentdir := Pipe(Sprintf("basename 'dirname %o'", dir), "");
  if parentdir ne "BelyiDB\n" then
    error "make sure your working directory is the BelyiDB repository.";
  end if;
  // silly case
  if only_hyperbolic and only_nonhyperbolic then
    error "empty intersection.";
  end if;
  // get filenames
  filenames := BelyiDBFilenames(d);
  // sort through
  return_filenames := [];
  for filename in filenames do
    d_test := BelyiDBGetDegree(filename);
    genus_test := BelyiDBGetGenus(filename);
    is_hyperbolic := BelyiDBIsHyperbolic(filename);
    if d eq d_test and genus eq genus_test then
      if only_hyperbolic then
        // only return it if it is hyperbolic
        if is_hyperbolic then
          Append(~return_filenames, filename);
        end if;
      else
        if only_nonhyperbolic then
          // only return it if it is NOT hyperbolic
          if not is_hyperbolic then
            Append(~return_filenames, filename);
          end if;
        else
          // return regardless
          Append(~return_filenames, filename);
        end if;
      end if;
    end if;
  end for;
  // return
  return return_filenames;
end intrinsic;

/* reading in files */

intrinsic BelyiDBRead(filename::MonStgElt) -> BelyiDB
  {Read in the BelyiDB in filename.}
  // directory stuff
  dir := GetCurrentDirectory();
  parentdir := Pipe(Sprintf("basename 'dirname %o'", dir), "");
  if parentdir ne "BelyiDB\n" then
    error "make sure your working directory is the BelyiDB repository.";
  end if;
  // get degree from filename and read in file to string
  l := BelyiDBGetInfo(filename);
  d := l[1];
  file := dir cat Sprintf("/belyi_db/%o/%o", d, filename);
  str := Read(file);
  // eval the string and return
  s := eval str;
  assert Type(s) eq BelyiDB;
  return s;
end intrinsic;

intrinsic BelyiDBGet(d::RngIntElt, genus::RngIntElt : only_hyperbolic := false, only_nonhyperbolic := false) -> Any
  {}
  return_filenames := BelyiDBGetFilenames(d, genus : only_hyperbolic := only_hyperbolic, only_nonhyperbolic := only_nonhyperbolic);
  return [ BelyiDBRead(f) : f in return_filenames ];
end intrinsic;

intrinsic BelyiDBGetNotComputed(d::RngIntElt, genus::RngIntElt : only_hyperbolic := false, only_nonhyperbolic := false) -> Any
  {}
  objs := BelyiDBGet(d, genus : only_hyperbolic := only_hyperbolic, only_nonhyperbolic := only_nonhyperbolic);
  not_computed := [];
  for s in objs do
    if not BelyiMapIsComputed(s) then
      Append(~not_computed, s);
    end if;
  end for;
  return not_computed;
end intrinsic;
