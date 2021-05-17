SetDebugOnError(true);
SetProfile(true);
load "../belyi_lmfdb/belyiredbest-2.m";


AttachSpec("code/spec_database");
filenames := BelyiDBFilenames(1);
filenames cat:= BelyiDBFilenames(2);
filenames cat:= BelyiDBFilenames(3);
filenames cat:= BelyiDBFilenames(4);
filenames cat:= BelyiDBFilenames(5);
filenames cat:= BelyiDBFilenames(6);
filenames cat:= BelyiDBFilenames(7);
filenames cat:= BelyiDBFilenames(8);
filenames cat:= BelyiDBFilenames(9);

//Index(filenames, "9T9-[4,4,2]-441-441-22221-g0.m");
for i in [1..#filenames] do
    filename:=filenames[i];
    try
    s := BelyiDBRead(filename);

    if BelyiMapIsComputed(s) and s`BelyiDBGenus eq 0 then

        base_field_info:=BaseFieldData(s);
        unique_base_fields:=[ <base_field_info[1,1], Degree(base_field_info[1,1])> ];
        for E in base_field_info do
            if Set([ IsIsomorphic(E[1],F[1]) : F in unique_base_fields ]) eq Set([false]) then
                Append(~unique_base_fields, < E[1],Degree(E[1]) > );
            end if;
        end for;

        unique_improved_maps:=[* *];
        unique_improved_maps_factorized:=[* *];
        for E in unique_base_fields do
            K1:=E[1];
            X1 := Curve(ProjectiveSpace(PolynomialRing(K1, 2)));
            KX1<x> := FunctionField(X1);
            belyi_ind:=Index([ H[1] : H in base_field_info ], K1);
            phi1:=KX1!BelyiMaps(s)[belyi_ind];
            nnn,lft:=phirat0(phi1,X1,K1);
            phisep_reduced:=BelyiReduction(phi1,X1,K1);
            Kpolx<x>:=PolynomialRing(K1);
            phi_reduced:=[* [ < Kpolx!P[1], P[2] > : P in phisep_reduced[1] ],
            [ < Kpolx!P[1], P[2]> : P in phisep_reduced[2] ], phisep_reduced[3] *];

            phi_from_factorization:=(KX1!phi_reduced[3])*(KX1!&*[ fac[1]^fac[2] : fac in phi_reduced[1] ])/
            (KX1!&*[ fac[1]^fac[2] : fac in phi_reduced[2] ]);
            sigma:=s`BelyiDBPermutationTriple;


            Append(~unique_improved_maps, <phi_from_factorization, K1>);
            Append(~unique_improved_maps_factorized, <phi_reduced, K1>);
        end for;

        improved_attr:=[* *];
        improved_attr_factorized:=[* *];
        for i in [1..#base_field_info] do
            Append(~improved_attr, [ G[1] : G in unique_improved_maps | IsIsomorphic(base_field_info[i,1],G[2]) ][1]);
            Append(~improved_attr_factorized, [ G[1] : G in unique_improved_maps_factorized | IsIsomorphic(base_field_info[i,1],G[2]) ][1]);
        end for;

        unlax_phi:=(improved_attr[1]*lft[1,1]+lft[1,2])/(improved_attr[1]*lft[2,1]+lft[2,2]);
        assert BelyiMapSanityCheck(sigma,X1,unlax_phi: lax:=false);

            AddAttribute(Type(s),"BelyiDBImprovedModelg0");
            s`BelyiDBImprovedModelg0 := improved_attr;
            AddAttribute(Type(s),"BelyiDBImprovedModelFactorizedg0");
            s`BelyiDBImprovedModelFactorizedg0 := improved_attr_factorized;

            AddAttribute(Type(s),"BelyiDBLFTInfo");
            s`BelyiDBLFTInfo := lft;
            //filename;
            //BelyiMaps(s);
            //s`BelyiDBImprovedModelg0;


            BelyiDBWrite(s);
    end if;

        catch e
        ;
        end try;
end for;

SetProfile(false);
G:=ProfileGraph();
ProfilePrintByTotalTime(G : Max:=30);


//PO:=Open("belyi_db/6/6T10-[4,4,2]-42-42-2211-g0.m", "r");
//s := BelyiDBRead("7T6-[4,4,4]-421-421-421-g0.m");
//s := BelyiDBRead("9T34-[7,6,2]-711-63-222111-g0.m");
//s := BelyiDBRead("7T2-[7,2,2]-7-2221-2221-g0.m");

//     while true do
//         line := Gets(PO);
//         if IsEof(line) then
//             break;
///         end if;
//         if #line ge 4 and &cat[ line[i] : i in [1..4] ] eq "phi1" then
//             Write("belyi_db/8/8T49-[15,3,4]-53-3311-4211-g0_copy_exp.m",line);
