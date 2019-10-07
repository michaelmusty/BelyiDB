load "config.m";
load "scripts.base_change.m";

filenames := [];
for i := 1 to 9 do
  filenames cat:= BelyiDBFilenames(i);
end for;
// pick out only g1 names
g1_names := [];
for f in filenames do
  if f[#f-2] eq "1" then
    Append(~g1_names,f);
  end if;
end for;
// change to minimal model if possible
for f in g1_names do
  s := BelyiDBRead(f);
  assert Genus(s) eq 1;
  maps := s`BelyiDBBelyiMaps;
  curves := s`BelyiDBBelyiCurves;
  curves_min := [**];
  maps_min := [**];
  for i := 1 to #curves do
    X := curves[i];
    phi := maps[i];
    K := BaseRing(X);
    if ClassNumber(K) eq 1 then
      printf "%o has class number 1; computing minimal model\n", K;
      X_min, mp := MinimalModel(X);
      phi_min := Pushforward(mp,phi);
    else
      X_min := X;
      phi_min := phi;
    end if;
    Append(~curves_min, X_min);
    Append(~maps_min, phi_min);
  end for;
  // replace curves and maps of s with minimal versions
  s`BelyiDBBelyiCurves := curves_min;
  s`BelyiDBBelyiMaps := maps_min;
  // write edited file to the DB
  //BelyiDBWrite(s);
end for;
// TODO: finish genus 2 (and 3?)
// pick out only g2 names
g2_names := [];
for f in filenames do
  if f[#f-2] eq "2" then
    Append(~g2_names,f);
  end if;
end for;
for f in g2_names do
  s := BelyiDBRead(f);
  assert Genus(s) eq 2;
  maps := s`BelyiDBBelyiMaps;
  curves := s`BelyiDBBelyiCurves;
  curves_min := [**];
  maps_min := [**];
  for i := 1 to #curves do
    X := curves[i];
    phi := maps[i];
    K := BaseRing(X);
    if Degree(K) eq 1 then
      printf "%o defined over QQ; computing reduced minimal model\n", K;
      X_QQ, phi_QQ := BaseChangeToRationals(X,phi);
      X_min, mp := ReducedMinimalWeierstrassModel(X_QQ);
      phi_min := Pushforward(mp,phi_QQ);
      X_min, phi_min := BaseChangeToRationalsAsNumberField(X_min, phi_min);
    else
      X_min := X;
      phi_min := phi;
    end if;
    Append(~curves_min, X_min);
    Append(~maps_min, phi_min);
  end for;
  // replace curves and maps of s with minimal versions
  s`BelyiDBBelyiCurves := curves_min;
  s`BelyiDBBelyiMaps := maps_min;
  // write edited file to the DB
  //BelyiDBWrite(s);
end for;
