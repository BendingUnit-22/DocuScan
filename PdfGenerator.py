from fpdf import FPDF
from JsonGenerator import Form, TextField, Label, QRCodeLabel, Page, Rect, form2Json
import json, io

# rounded off to 595  842 points

def exampleForm():
    fullnameLabel = Label(Rect(0, 40, 95, 30), "Full Name", 1001)
    nameTextField = TextField(Rect(297.5, 20, 297.5, 30), 1001)

    addressLabel = Label(Rect(0, 80, 95, 30), "Address", 1001)
    addressTextField = TextField(Rect(297.5, 60, 297.5, 30), 1001)

    cityLabel = Label(Rect(0, 120, 95, 30), "City", 1001)
    cityTextField = TextField(Rect(297.5, 100, 297.5, 30), 1001)

    stateLabel = Label(Rect(0, 160, 95, 30), "State", 1001)
    stateTextField = TextField(Rect(297.5, 140, 297.5, 30), 1001)

    zipLabel = Label(Rect(0, 200, 95, 30), "Zip Code", 1001)
    zipTextfield = TextField(Rect(297.5, 180, 297.5, 30), 1001)

    qrcode = QRCodeLabel(Rect(100, 10, 100, 10), 12313);
    page = Page(qrcode,
                [fullnameLabel, addressLabel, cityLabel, stateLabel, zipLabel],
                [nameTextField, addressTextField, cityTextField, stateTextField,
                 zipTextfield])
    return Form([page], 12312312313)

exampleForm()

if __name__ == '__main__':
    fpdf = FPDF(orientation='P', unit='pt', format='A4')
    fpdf.set_title("DocuScan")

    form = exampleForm()

    for page in form.pages:
        fpdf.add_page()
        # add labels in page
        for label in page.labels:
            fpdf.set_font('Arial', 'B', 16)
            fpdf.text(label.rect.x, label.rect.y, label.text)

        for textfield in page.textfields:
            fpdf.rect(textfield.rect.x, textfield.rect.y, textfield.rect.width, textfield.rect.height, 'D')
    fpdf.output("output.pdf", 'F')
    with open('form.json', 'w') as write_file:
        json.dump(form2Json(form), write_file)