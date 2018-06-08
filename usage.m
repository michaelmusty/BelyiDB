/* load this file to see some basic examples of how to use BelyiDB */

// attach BelyiDB intrinsics
AttachSpec("code/spec");

// get filenames for all degree 6, genus 1 passports
filenames := BelyiDBGetFilenames(6,1);

// get BelyiDB objects for all degree 6, genus 1 passports (only hyperbolic this time)
objs := BelyiDBGet(6,1 : only_hyperbolic := true);

// 6T15-[5,5,5]-51-51-51-g1
s := BelyiDBRead("6T15-[5,5,5]-51-51-51-g1.m");
sigma := PermutationTriple(s);
base_field_data := BaseFieldData(s);
curves := BelyiCurves(s);
maps := BelyiMaps(s);
galois_orbits := GaloisOrbits(s);
