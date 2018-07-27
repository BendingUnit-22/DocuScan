
from django.conf import settings
import os
import math
import uuid
from PIL import Image
import fpdf

class Renderer(object):

    MAX_WIDTH = 215.9
    MAX_HEIGHT = 279.4
    MARGIN = 5
    MARKER_WIDTH = 5
    x1 = MARGIN
    y1 = MARGIN
    x2 = MAX_WIDTH - MARGIN
    y2 = MAX_HEIGHT - MARGIN

    def createBoxes(self, cx, cy):
        _incr = 0.01
        line = self.item("Hello", 'L', cx + _incr, cy, cx + _incr, cy, size=5)
        return line

    def item(self, id, type, x1, y1, x2, y2, text='', align='I', italic=0, bold=0, size=12, color=0):
        _item = {'name': id,
                  'type': type,
                  'x1': x1,
                  'y1': y1,
                  'x2': x2,
                  'y2': y2,
                  'font': 'Arial',
                  'size': size,
                  'bold': bold,
                  'italic': italic,
                  'underline': 0,
                  'foreground': 0,
                  'background': color,
                  'align': align,
                  'text': text,
                  'priority': 2}
        return _item

    def header(self, elID, dy, title, uuid):
        width = 30
        qrcode = self.item('company_logo', 'I', self.x1, self.y1 + dy, self.x1 + width, self.y1 + width + dy)
        title = self.item(elID, 'T', qrcode['x2'],10 + dy, self.x2, 20 + dy, text=title, align='C', italic=0, bold=0)
        uuid = self.item(elID, 'T',qrcode['x2'], 10 + dy, self.x2, 40 + dy, align='C', text=uuid)
        return [qrcode, title, uuid]

    def title(self, elID, dy, title):
        line = self.item(elID, 'L', self.x1, self.y1 + dy, self.x2, self.y1 + dy, size=0)
        title = self.item(elID, 'T', self.x1,2.5 + dy,self.x2, 20 + dy, text=title, align='L', italic=0, bold=1)
        return [line, title]

    def textfield(self, elID, dy, title, information):
        title = self.item(elID, 'T', self.x1, self.y1 + dy, self.x2, 20 + dy, text=title, align='L', italic=0, bold=0)
        text_box = self.item(elID, 'B', self.x1, title['y2'], self.x2, title['y2'] + 10, text='', align='L', italic=0, bold=1, size=0, color=0x00FFFF)
        info = self.item(elID, 'T', self.x1, text_box['y2'] - 10, self.x2, 20 + text_box['y2'], text=information, align='L', italic=0, bold=0)
        return [title, text_box, info]

    def column(self, elID1, elID2, dy, text1, text2):
        midX = self.MAX_WIDTH/2.0
        title1 = self.item(elID1, 'T', self.x1, self.y1 + dy, midX, 20 + dy, text=text1, align='C', italic=0, bold=0)
        title2 = self.item(elID2, 'T', self.x1 + midX, self.y1 + dy, self.x2, 20 + dy, text=text2, align='C', italic=0, bold=0)
        text_box1 = self.item(elID1, 'B', self.x1, title1['y2'], midX -2.5, 10 + title1['y2'], text='', align='I', italic=0, bold=1, size=0)
        text_box2 = self.item(elID2, 'B', midX + 2.5, title2['y2'], self.x2, 10 + title2['y2'], text='', align='I', italic=0, bold=1, size=0)
        return [title1, title2,text_box1, text_box2]


    def max_height(self, items):
        max_height = float("-inf")
        min_height = float("inf")
        for item in items:
            if item['y2'] >= max_height:
                max_height = item['y2']
            if item['y1'] <= min_height:
                min_height = item['y1']
        return max_height - min_height

    def render(self, data):
        items = []
        items.append(self.createBoxes(5, 5))
        items.append(self.createBoxes(self.MAX_WIDTH - self.MARKER_WIDTH, 5))
        items.append(self.createBoxes(5, self.MAX_HEIGHT - self.MARKER_WIDTH))
        items.append(self.createBoxes(self.MAX_WIDTH - self.MARKER_WIDTH, self.MAX_HEIGHT - self.MARKER_WIDTH))
        dy = 5
        form_uuid = ''
        for d in data:
            print(d)
            _uuid_ = str(uuid.uuid4())
            if d['itemType'] == 'header':
                # extract uuid
                form_uuid = d['formUUID']
                header = self.header(_uuid_, dy, d['title'], d['formUUID'])
                dy += self.max_height(header)
                items = items + header

            elif d['itemType'] == 'titleview':
                title = self.title(_uuid_, dy, d['title'])
                dy += self.max_height(title)
                items = items + title
            elif d['itemType'] == 'textfield':
                textfield = self.textfield(_uuid_, dy, d['title'], d['information'])
                dy += self.max_height(textfield)
                items = items + textfield
            elif d['itemType'] == 'phoneview':
                _uuid_1  = str(uuid.uuid4())
                _uuid_2  = str(uuid.uuid4())
                column = self.column(_uuid_1, _uuid_2, dy, d['title1'], d['title2'])
                dy += self.max_height(column)
                items = items + column
        return {'uuid': form_uuid, 'items': items}