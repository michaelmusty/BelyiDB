from base64 import b64encode
import os
from lmfdb import db

def encode_image(filename):
    img64 = b64encode(open(filename, 'rb').read())
    img64 = "data:image/png;base64," + quote(img64)
    return(img64)

def image_to_text(direc):
    files = os.listdir(direc)
    for f in files:
        fs = f.split('.')
        if fs[1] == 'png':
            f_path = os.path.join(direc,f)
            f_str = encode_image(f)
            path_out = os.path.join(direc, fs[0] + ".txt")
            text_file = open(path_out, 'w')
            text_file.write(f_str)
            text_file.close()
    return_text = "Wrote images to base64 text for all PNG files in %s" % direc
    return return_text

def verify_orbit_label(label):
    """
    Make sure orbit label of portrait is consistent with label in database by checking permutation in TeX file.
    """
    tex = label.split('.')[0]
    tex += '.tex'
    f = open(tex, "r")
    perms = f.readlines()[-1]
    f.close()
    perms = perms.split('[')[1]
    perms = perms.split(']')[0]
    perms_list = perms.split(',(')
    perms_list[1] = '(' + perms_list[1]
    perms_list[2] = '(' + perms_list[2]
    rec = db.belyi_galmaps.lookup(label)
    return perms_list in rec['triples_cyc']
