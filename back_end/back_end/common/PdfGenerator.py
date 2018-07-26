from fpdf import FPDF
from back_end.common.Form import Form, Page, Label, TextField, QRCodeLabel, JsonConvert
from back_end.common.QRCode import qr_decode, qr_encode
# rounded off to 595  842 points

def exampleForm():
    fullnameLabel = Label(0, 40, 95, 30, "Full Name")
    nameTextField = TextField(297.5, 20, 297.5, 30, scan_id=2)

    addressLabel = Label(0, 80, 95, 30, "Address")
    addressTextField = TextField(297.5, 60, 297.5, 30, scan_id=3)

    cityLabel = Label(0, 120, 95, 30, "City")
    cityTextField = TextField(297.5, 100, 297.5, 30, scan_id=4)

    stateLabel = Label(0, 160, 95, 30, "State")
    stateTextField = TextField(297.5, 140, 297.5, 30, scan_id=5)

    zipLabel = Label(0, 200, 95, 30, "Zip Code")
    zipTextfield = TextField(297.5, 180, 297.5, 30, scan_id=6)

    qrcode = QRCodeLabel(100, 10, 100, 10, "This is a secret message")

    page = Page(qrcode, [fullnameLabel, addressLabel, cityLabel, stateLabel, zipLabel],
                [nameTextField, addressTextField, cityTextField, stateTextField,
                 zipTextfield])

    return Form([page], form_id="1")


if __name__ == '__main__':
    fpdf = FPDF(orientation='P', unit='pt', format='A4')
    fpdf.set_title("DocuScan")
    form = exampleForm()

    # Output PDF
    for page in form.pages:
        fpdf.add_page()
        # add labels in page
        for label in page.labels:
            fpdf.set_font('Arial', 'B', 16)
            fpdf.text(label.x, label.y, label.text)

        for textfield in page.textfields:
            fpdf.rect(textfield.x, textfield.y, textfield.width, textfield.height, 'D')
    fpdf.output("output.pdf", 'F')

    # Output encoded json
    filepath = JsonConvert.ToFile(form, "output.json")

    fromFile = JsonConvert.FromFile(filepath)

    print(fromFile)
    #
    qr_encode(form.pages[0].qrcode.data, 'qr.png')
    qr_decode('qr.png')