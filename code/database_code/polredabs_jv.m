/* jv polredabs  */

intrinsic Polredabs(f::RngUPolElt : Best := true) -> RngUPolElt
  { A smallest generating polynomial of the number field, using pari. }
  if Best then
    cmdp := "polredbest";
  else
    cmdp := "polredabs";
  end if;
  cmd := Sprintf(
     "{u = %o(Pol(Vecrev(%o)),1); print(Vecrev(Vec(u[1])),Vecrev(Vec(lift(u[2]))))}", 
     cmdp, Coefficients(f));
  s := Pipe("gp -q", cmd);
  c := Index(s,"][");
  spol := s[1..c];
  sroot := s[c+1..#s-1];
  sspol := [ StringToInteger(x) : x in Split(spol, ", []\n") | x ne "" ];
  ssroot := [ StringToRational(x) : x in Split(sroot, ", []\n") | x ne "" ];
  return Parent(f) ! sspol, ssroot;
end intrinsic;

intrinsic Polredabs(K::FldNum) -> FldNum
  {}
  if Degree(K) le 1 then
    assert K eq RationalsAsNumberField();
    return K;
  else
    fredabs, fredroot := Polredabs(Polredabs(DefiningPolynomial(K) : Best := true));
    Kredabs := NumberField(fredabs);
    iotaredabs := hom<K -> Kredabs | fredroot>;
    return Kredabs, iotaredabs;
  end if;
end intrinsic;
