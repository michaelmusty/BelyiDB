from base64 import b64encode
import os

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
    return_text = "Wrote images to base 64 text for all files in %s" % direc
    return return_text
