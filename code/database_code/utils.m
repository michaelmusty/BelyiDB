/*
intrinsic ReplaceStringOld(s::MonStgElt, fs::MonStgElt, ts::MonStgElt) -> MonStgElt
  {Return a string obtained from the string s by replacing all occurences of fs with ts.}
  assert fs ne ts;
  s:=CodeToString(255) cat Sprint(s) cat CodeToString(255);
  while Position(s,fs) ne 0 do
    p:=Position(s,fs);
    p:=[p-1,#fs,#s-p-#fs+1];
    s1,s2,s3:=Explode(Partition(Eltseq(s),p));
    s:=&cat(s1) cat ts cat &cat(s3);
  end while;
  return s[[2..#s-1]];
end intrinsic;
// TODO: fix this: split doesn't work correctly for multiple characters
intrinsic ReplaceString(s::MonStgElt, fs::MonStgElt, ts::MonStgElt) -> MonStgElt
  {Return a string obtained from the string s by replacing all occurences of fs with ts.}
  spl := Split(s, fs);
  new := Join(spl, ts);
  // if string begins or ends with fs, this gets lost, so add back in if necessary
  if s[1] eq fs then
    new := ts*new;
  end if;
  if s[#s] eq fs then
    new := new*ts;
  end if;
  return new;
end intrinsic;
*/

intrinsic ReplaceString(s::MonStgElt, fs::MonStgElt, ts::MonStgElt) -> MonStgElt
  {Return a string obtained from the string s by replacing all occurences of fs with ts.}
  i:=Position(s,fs);
  if i eq 0 then
    strg:=s;  // nothing to find
  elif (i+#fs-1) eq #s   then // if fs is at end
    strg:=Substring(s,1,i-1) cat ts;
  elif i eq 1 then // if fs is at beginning
    strg:=ts cat $$(Substring(s,i+#fs,#s-i),fs,ts);
  else
    strg:=Substring(s,1,i-1) cat ts cat $$(Substring(s,i+#fs,#s-i),fs,ts); // recursively call on tail
  end if;
  return strg;
end intrinsic;

intrinsic ReplaceString(s::MonStgElt, fs::[MonStgElt], ts::[MonStgElt]) -> MonStgElt
  {Return a string obtained from the string s by replacing all occurences of strings in fs with strings in ts.}
  //assert fs ne ts;
  for i:=1 to #fs do
    s:=ReplaceString(s,fs[i],ts[i]);
  end for;
  return s;
end intrinsic;

// procedure versions
intrinsic ReplaceString(~s::MonStgElt, fs::MonStgElt, ts::MonStgElt)
  {In the string s, replace all occurences of fs with ts.}
  s := ReplaceString(s,fs,ts);
end intrinsic;

intrinsic ReplaceString(~s::MonStgElt, fs::[MonStgElt], ts::[MonStgElt])
  {In the string s, replace all occurences of strings in fs with strings in ts.}
  for i:=1 to #fs do
    ReplaceString(~s,fs[i],ts[i]);
  end for;
end intrinsic;
