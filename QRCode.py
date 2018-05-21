import pyqrcode
import zbarlight

from PIL import Image

def qr_encode(data, outPath):
    qr = pyqrcode.create(data)
    qr.png(outPath, scale=6)

def qr_decode(png_path):
    with open(png_path, 'rb') as image_file:
        image = Image.open(image_file)
        image.load()
    codes = zbarlight.scan_codes('qrcode', image)
    print('QR codes: %s' % codes)