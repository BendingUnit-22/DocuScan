from fpdf import FPDF
from JsonGenerator import PDFEncoder, Form, TextField, Label, QRCodeLabel, Page, Rect, form2Json
import json


if __name__ == '__main__':

    textfield = TextField(Rect(0, 0, 100, 10), 1001)
    label = Label(Rect(0, 0, 100, 10), "Docuform", 16)
    qrcode = QRCodeLabel(Rect(100, 10, 100, 10), 12313);
    page = Page(qrcode, [label], [textfield])

    pdf = Form([page], 12312312313)
    print form2Json(pdf)
