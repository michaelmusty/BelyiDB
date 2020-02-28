from base64 import b64encode
import os
import datetime
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

# TODO: finish this
def make_upload_file(direc):
    d = datetime.datetime.today()
    upload_name = "upload-"+d.strftime('%Y-%m-%d--%H:%M')+".txt"
    upload_path = os.path.join(direc,upload_name)
    upload_file = open(upload_path, 'w')
    files = os.listdir(direc)
    for f in files:
        fs = f.split('.')
        if (fs[1] == 'txt') and (fs[0][0] in ['4','5','6','7','8','9']): # to exclude upload file...
            label = fs[0]
            assert verify_orbit_label(f)
            b64 = open(f,'r')
            img_str = "%s|%s\n" % (label, b64)
            upload_file.write(img_str,'a')
    upload_file.close()
    return_text = "Created upload file at %s" % upload_path
    return return_text
