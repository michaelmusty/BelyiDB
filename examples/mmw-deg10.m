// examples from MMW's BELYI-EXTENDING MAPS AND THE GALOIS ACTION ON DESSINS D’ENFANTS
d := 10;
sigma0 := Sym(d)!(1, 2, 3, 4)(5, 6, 7)(8, 9);
sigma1 := Sym(d)!(1, 8, 4, 7)(2, 3, 10)(5, 6);
// s0*s1*soo = 1 => soo = s1^-1*s0^-1;
sigmaoo := sigma1^-1*sigma0^-1;
sigma_mmw := [sigma0, sigma1, sigmaoo];
sigma := [el^-1 : el in sigma_mmw];
name := BelyiDBGenerateName(sigma);

sigma0_p := Sym(d)!(1, 2, 3, 4)(5, 6, 7)(8, 9);
sigma1_p := Sym(d)!(1, 3, 8, 9)(2, 10)(4, 5, 6);
sigmaoo_p := sigma1^-1*sigma0^-1;
sigma_p_mmw := [sigma0_p, sigma1_p, sigmaoo_p];
sigma_p := [el^-1 : el in sigma_p_mmw];
name_p := BelyiDBGenerateName(sigma_p);

// MMW uses the map xi(t) = 27*t^2*(t−1)^2/(4*(t^2−t+1)^3) which is a dynamical Belyi map
// xi is 6T2-[3,2,2]-33-222-222-g0-a
// letting phi, phi_p be the maps associated with sigma, sigma_p, she considers the deg 60 maps xi o phi
// and xi o phi_p, or at least their dessins
