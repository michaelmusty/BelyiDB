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
      gal_orbs := s`BelyiDBGaloisOrbits;
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
