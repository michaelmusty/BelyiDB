from base64 import b64encode
img64 = b64encode(open('a.png', 'rb').read())
img64 = "data:image/png;base64," + quote(img64)
