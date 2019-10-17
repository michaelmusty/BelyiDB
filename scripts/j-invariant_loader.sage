# for loading .sobj file with c4, c6 of ellcrvs

good_red = sage.misc.persist.load("curves__S_2_p_pMax250")
c4c6 = good_red[0]
c4c6 = c4c6[1]

js = []
for el in c4c6:
    A = -27*el[0]
    B = -54*el[1]
    E = EllipticCurve([A,B])
    # make sure good reduction outside 2,3
    f = (E.discriminant()).factor()
    for f_pair in f:
        assert f_pair[0] in [2,3]
    js.append(E.j_invariant())
js = list(set(js))
