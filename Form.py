
import json

##################################################################
# Helper Class for Serializing Form Elements
###################################################################
class JsonConvert(object):
    mappings = {}
    @classmethod
    def class_mapper(clsself, d):
        for keys, cls in clsself.mappings.items():
            if keys.issuperset(d.keys()):  # are all required arguments present?
                return cls(**d)
        else:
            # Raise exception instead of silently returning None
            raise ValueError('Unable to find a matching class for object: {!s}'.format(d))

    @classmethod
    def complex_handler(clsself, Obj):
        if hasattr(Obj, '__dict__'):
            return Obj.__dict__
        else:
            raise TypeError('Object of type %s with value of %s is not JSON serializable' % (type(Obj), repr(Obj)))

    @classmethod
    def register(clsself, cls):
        clsself.mappings[frozenset(tuple([attr for attr, val in cls().__dict__.items()]))] = cls
        return cls

    @classmethod
    def ToJSON(clsself, obj):
        return json.dumps(obj.__dict__, default=clsself.complex_handler, indent=4)

    @classmethod
    def FromJSON(clsself, json_str):
        return json.loads(json_str, object_hook=clsself.class_mapper)

    @classmethod
    def ToFile(clsself, obj, path):
        with open(path, 'w') as jfile:
            jfile.writelines([clsself.ToJSON(obj)])
        return path

    @classmethod
    def FromFile(clsself, filepath):
        result = None
        with open(filepath, 'r') as jfile:
            result = clsself.FromJSON(jfile.read())
        return result

##################################################################
# Form object
###################################################################
@JsonConvert.register
class Label(object):
    def __init__(self, x=0.0, y=0.0, width=0.0, height=0.0, text:str=""):
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        self.text = text

@JsonConvert.register
class TextField(object):
    def __init__(self, x=0.0, y=0.0, width=0.0, height=0.0, scan_id:str=""):
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        self.scan_id = scan_id


@JsonConvert.register
class QRCodeLabel(object):
    def __init__(self, x: float=0.0, y: float=0.0, width: float=0.0, height: float=0.0, data: str=""):
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        self.data = data

@JsonConvert.register
class Page(object):
    def __init__(self, qrcode:str = "", labels: [Label] = [], textfields: [TextField] = []):
        self.qrcode = qrcode
        self.labels = labels
        self.textfields = textfields

@JsonConvert.register
class Form(object):
    def __init__(self, pages:[Page] = [], form_id: str = ""):
        self.pages = pages
        self.form_id = form_id



