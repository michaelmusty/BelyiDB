// script for drawing a fundamental domain picture for each Galois orbit computed

function GeneratePortraitDirectoriesByDegree(d);
  //load "config.m";
  names := BelyiDBFilenames(d);
  for name_m in names do
  name := Split(name_m, ".")[1];
    printf "Processing passport with label %o\n", name;
    s := BelyiDBRead(name_m);
    if (s`BelyiDBType eq "Hyperbolic") and BelyiMapIsComputed(s) then
      printf "Making directory for %o\n", name;
      System(Sprintf("mkdir -p ~/github/BelyiDB/portraits/%o/%o", d, name));
    end if;
  end for;
  returnText := Sprintf("Made directories for all computed hyperbolic passports of degree %o", d);
  return returnText;
end function;

function DrawPortraitsByDegree(d);
  //load "config.m";
  names := BelyiDBFilenames(d);
  for name_m in names do
    name := Split(name_m, ".")[1];
    printf "Processing passport with label %o\n", name;
    s := BelyiDBRead(name_m);
    if (s`BelyiDBType eq "Hyperbolic") and BelyiMapIsComputed(s) then
      gal_orbs := s`BelyiDBGaloisOrbits;
      for orb in gal_orbs do
        sigma := orb[1];
        sigma_str := BelyiDBDeleteLineBreaks(Sprint(sigma));
        printf "Making TeX file for orbit represented by %o\n", sigma_str;
        //System(Sprintf("mkdir -p ~/github/BelyiDB/portraits/%o/%o/%o", d, name, sigma_str));
        Gamma := TriangleSubgroup(sigma);
        savePath := Sprintf("~/github/BelyiDB/portraits/%o/%o/%o.tex", d, name, sigma_str);
        TriangleDrawDessinToFile(Gamma : filename := savePath);
      end for;
    end if;
  end for;
  returnText := Sprintf("Made TeX files for all computed hyperbolic passports of degree %o", d);
  return returnText;
end function;
