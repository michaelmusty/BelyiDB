// https://magma.maths.usyd.edu.au/magma/handbook/text/663#7535

TransitiveGroups(4);
$1[3];
G := $1;
MinimalPartition(G);
partition := $1;
GSet(G,partition);
X := $1;
G_prim := ActionImage(G,X);
G_prim;
StandardGroup(G_prim);
G_prim := $1;

//BlocksAction(G,partition);
