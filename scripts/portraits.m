// script for drawing a fundamental domain picture for each Galois orbit computed

// obsolete: putting all files in one directory now
/*
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
*/

function DrawPortraitsByDegree(d : compile := true);
  //load "config.m";
  names := BelyiDBFilenames(d);
  for name_m in names do
    name := Split(name_m, ".")[1];
    printf "Processing passport with label %o\n", name;
    s := BelyiDBRead(name_m);
    if (s`BelyiDBType eq "Hyperbolic") and BelyiMapIsComputed(s) then
      gal_orbs_presort := s`BelyiDBGaloisOrbits;
      gal_orbs := gal_orbs_presort;
      gal_orbs_sizes := [#orbit : orbit in gal_orbs_presort];
      ParallelSort(~gal_orbs_sizes, ~gal_orbs);
      for i := 1 to #gal_orbs do
        orb := gal_orbs[i];
        sigma := orb[1];
        sigma_str := BelyiDBDeleteLineBreaks(Sprint(sigma));
        printf "Making TeX file for orbit represented by %o\n", sigma_str;
        //System(Sprintf("mkdir -p ~/github/BelyiDB/portraits/%o/%o/%o", d, name, sigma_str));
        Gamma := TriangleSubgroup(sigma);
        //savePath := Sprintf("~/github/BelyiDB/portraits/%o/%o/%o.tex", d, name, IntegerToLetter(i));
        //savePath := Sprintf("~/github/BelyiDB/portraits/%o-%o.tex", name, IntegerToLetter(i));
        savePath := Sprintf("~/BelyiDB/portraits/%o-%o.tex", name, IntegerToLetter(i));
        TriangleDrawDessinToFile(Gamma : filename := savePath, includeLegend := false);
        Write(savePath, "\n% "*sigma_str : Overwrite := false);
        if compile then
          //outputPath := Sprintf("~/github/BelyiDB/portraits/%o/%o/", d, name);
          //outputPath := Sprintf("~/github/BelyiDB/portraits/");
          outputPath := Sprintf("~/BelyiDB/portraits/");
          //System(Sprintf("pdflatex --shell-escape -output-directory %o %o", outputPath, savePath));
          System(Sprintf("xelatex --shell-escape -output-directory %o %o", outputPath, savePath));
          //pdfPath := Sprintf("~/github/BelyiDB/portraits/%o/%o/%o.pdf", d, name, IntegerToLetter(i));
          //pdfPath := Sprintf("~/github/BelyiDB/portraits/%o-%o.pdf", name, IntegerToLetter(i));
          pdfPath := Sprintf("~/BelyiDB/portraits/%o-%o.pdf", name, IntegerToLetter(i));
          System(Sprintf("pdfcrop %o", pdfPath));
          //pdfCropPath := Sprintf("~/github/BelyiDB/portraits/%o-%o-crop.pdf", name, IntegerToLetter(i));
          pdfCropPath := Sprintf("~/BelyiDB/portraits/%o-%o-crop.pdf", name, IntegerToLetter(i));
          //pngPath := Sprintf("~/github/BelyiDB/portraits/%o-%o.png", name, IntegerToLetter(i));
          pngPath := Sprintf("~/BelyiDB/portraits/%o-%o.png", name, IntegerToLetter(i));
          System(Sprintf("convert -density 300 %o %o", pdfCropPath, pngPath));
        end if;
      end for;
    end if;
  end for;
  returnText := Sprintf("Made TeX files for all computed hyperbolic passports of degree %o", d);
  return returnText;
end function;

function OldNameNewName()
  for d := 4 to 9 do
    names := BelyiDBFilenames(d);
    for name_m in names do
      name := Split(name_m, ".")[1];
      printf "Processing passport with label %o\n", name;
      s := BelyiDBRead(name_m);
      if (s`BelyiDBType eq "Hyperbolic") and BelyiMapIsComputed(s) then
        gal_orbs_presort := s`BelyiDBGaloisOrbits;
        gal_orbs := gal_orbs_presort;
        gal_orbs_sizes := [#orbit : orbit in gal_orbs_presort];
        ParallelSort(~gal_orbs_sizes, ~gal_orbs);
        for i := 1 to #gal_orbs do
          orb := gal_orbs[i];
          old_ind := Index(gal_orbs_presort, orb);
          //savePath := Sprintf("~/github/BelyiDB/portraits/%o/%o/%o.tex", d, name, IntegerToLetter(i));
          for ext in ["-crop.pdf", ".aux", ".log", ".pdf", ".png", ".tex"] do
            oldSavePath := Sprintf("~/github/BelyiDB/portraits/%o-%o%o", name, IntegerToLetter(old_ind), ext);
            newSavePath := Sprintf("~/github/BelyiDB/portraits/New/%o-%o%o", name, IntegerToLetter(i), ext);
            System(Sprintf("cp %o %o", oldSavePath, newSavePath));
          end for;
        end for;
      end if;
    end for;
  end for;
  return "Changed old names to new names; new files written to New";
end function;
