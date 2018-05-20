
import json

def form2Json(form):
    return json.dumps(form, indent=4, cls=PDFEncoder)

class PDFEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, Form):
            return {
                'pages': o.pages,
                'form_id': o.form_id
                }
        if isinstance(o, Page):
            return {
                'qrcode': o.qrcode,
                'labels': o.labels,
                'textfields': o.textfields
            }
        if isinstance(o, Rect):
            return {
                'x': o.x,
                'y': o.y,
                'width': o.width,
                'height': o.height
            }
        if isinstance(o, QRCodeLabel):
            return {
                'rect': o.rect,
                'format': o.format
            }
        if isinstance(o, Label):
            return {
                'rect': o.rect,
                'text': o.text,
                'fontsize': o.fontsize
            }

        if isinstance(o, TextField):
            return {
                'rect': o.rect,
                'scan_id': o.scan_id
            }
        else:
            return {'__{}__'.format(o.__class__.__name__): o.__dict__}

#
# def decode_object(o):
#     if 'Page' in o:
#         form = Form()
#         form.__dict__.update(o['Form'])
#         return form


class Form(object):
    def __init__(self, pages, form_id):
        self.pages = pages
        self.form_id = form_id


class Page(object):
    def __init__(self, qrcode, labels, textfields):
        self.qrcode = qrcode
        self.labels = labels
        self.textfields = textfields


class Rect(object):
    def __init__(self, x, y, width, height):
        self.x = x
        self.y = y
        self.width = width
        self.height = height

class QRCodeLabel(object):
    def __init__(self, rect, format):
        self.rect = rect
        self.format = format

class Label(object):
    def __init__(self, rect, text, fontsize):
        self.rect = rect
        self.text = text
        self.fontsize = fontsize

class TextField(object):
    def __init__(self, rect, scan_id):
        self.rect = rect
        self.scan_id = scan_id


