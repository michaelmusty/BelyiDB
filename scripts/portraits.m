// script for drawing a fundamental domain picture for each Galois orbit computed

function GeneratePortraitDirectoriesByDegree(d)
  names := BelyiDBFilename(d);
  System(Sprintf("mkdir ~/BelyiDB/portraits/%o/%o", d));
end function;

function DrawPortraitByDegree(d)
  names := BelyiDBFilenames(d)
  for name in names do
    printf "Processing passport with label %o\n", name;
    s := BelyiDBRead(name);
    if (s`BelyiDBType eq "Hyperbolic") and BelyiMapIsComputed(s) then
      gal_orbs := s`BelyiDBGaloisOrbits;
      for orb in gal_orbs do
        sigma := orb[1];
        Gamma := TriangleSubgroup(sigma);
        //TODO
        SavePath := 
        TriangleDrawDessinToFile(Gamma : 
      end for;
    end if;
  end for;
end function;
