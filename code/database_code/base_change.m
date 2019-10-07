intrinsic BaseChangeToRationals(X::Crv,phi::FldFunFracSchElt) -> Any
  {}
  // Input: A curve X defined over RationalsAsNumberField(), phi an element of the function field of X
  // Output: Their base changes to Rationals() 
  QQ := Rationals();
  K := BaseRing(X);
  assert Degree(K) eq 1;
  KX := FunctionField(X);
  X_QQ := ChangeRing(X,QQ);
  KX_QQ := FunctionField(X_QQ);
  crv_map := hom< KX -> KX_QQ | [KX_QQ.1,KX_QQ.2]>;
  phi_QQ := crv_map(phi);
  return X_QQ, phi_QQ;
end intrinsic;

intrinsic BaseChangeToRationalsAsNumberField(X_QQ::Crv,phi_QQ::FldFunFracSchElt) -> Any
  {}
  // Input: A curve X_QQ defined over Rationals(), phi an element of the function field of X_QQ
  // Output: Their base changes to RationalsAsNumberField() 
  QQ := BaseRing(X_QQ);
  assert QQ eq Rationals();
  K := RationalsAsNumberField();
  KX_QQ := FunctionField(X_QQ);
  X := ChangeRing(X_QQ,K);
  KX := FunctionField(X);
  crv_map := hom< KX_QQ -> KX | [KX.1,KX.2]>;
  phi := crv_map(phi_QQ);
  return X, phi;
end intrinsic;
