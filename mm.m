// for mini Belyi days testing
load "config.m";
filenames := BelyiDBGetFilenames(6,1);
objs := BelyiDBGet(6,1 : only_hyperbolic := true);
s := BelyiDBRead("6T15-[5,5,5]-51-51-51-g1.m");
attr := "BelyiDBBelyiMaps";
s``attr;  // print attr before
S3Action(Sym(3)!(1,2), s);
s``attr;  // print attr after
exit;
