from rest_framework.views import APIView
from rest_framework.response import Response
from back_end.common.QRCode import qr_encode, qr_decode
from django.conf import settings
from uuid import uuid4
import os
from back_end.common.Renderer import Renderer
from fpdf import Template
from PIL import Image
from pdf2image import convert_from_path
from rest_framework.decorators import api_view
import cv2
import numpy as np
import json

from django.core.files.base import ContentFile

def detect_markers():
    # Read image
    im = cv2.imread("./markers.png", cv2.IMREAD_GRAYSCALE)
    im = cv2.resize(im, (300, 400))
    # Setup SimpleBlobDetector parameters.
    params = cv2.SimpleBlobDetector_Params()

    params.filterByCircularity = True
    params.maxCircularity = .85
    params.minCircularity = .785
    # Create a detector with the parameters
    ver = (cv2.__version__).split('.')
    if int(ver[0]) < 3:
        detector = cv2.SimpleBlobDetector(params)
    else:
        detector = cv2.SimpleBlobDetector_create(params)

    # Detect blobs.
    keypoints = detector.detect(im)
    im_with_keypoints = cv2.drawKeypoints(im, keypoints, np.array([]), (0, 0, 255),
                                          cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)

    # Show blobs
    cv2.imshow("Keypoints", im_with_keypoints)
    cv2.waitKey(0)

def crop(image_path, coords, saved_location):
    """
        @param image_path: The path to the image to edit
        @param coords: A tuple of x/y coordinates (x1, y1, x2, y2)
        @param saved_location: Path to save the cropped image
    """
    image_obj = convert_from_path(image_path)[0]
    width, height = image_obj.size
    print(width, height)
    xScale = width/215.9
    yScale = height/279.4
    margin = 5
    arr = [coords[0] * xScale + margin, coords[1] * yScale + margin, coords[2] * xScale -margin , coords[3] * yScale -margin]
    cropped_image = image_obj.crop(tuple(arr))
    cropped_image.save(saved_location)
    cropped_image.show()

def crop_textboxes(template, elements, out):
    for el in elements:
        if el['type'] == 'B':
            coords = (el['x1'] ,el['y1'], el['x2'], el['y2'])
            outFN = out + '/' + el['name'] + '.png'
            crop(template, coords, outFN)

def processDocument(doc_path, elements):
    image_obj = convert_from_path(doc_path)[0]
    image_obj.save(doc_path)
    crop_textboxes(doc_path, elements, './back_end/crops')

elements_ = []
@api_view(['GET', 'POST', ])
def upload(request, format=None):
    uploaded_filename = request.FILES['file'].name
    # save the uploaded file inside that folder.
    full_filename = './back_end/crops/uploads/' + uploaded_filename
    fout = open(full_filename, 'wb+')
    # Iterate through the chunks.
    file_content = ContentFile(request.FILES['file'].read())
    for chunk in file_content.chunks():
        fout.write(chunk)
    fout.close()

    base_name = uploaded_filename.split('.')[0]
    elements = loadElements('./back_end/crops/uploads/' + base_name + '.json')
    processDocument(full_filename, elements)
    return Response({'uuid': "Suss"})

def saveElements( elements, path):
    with open(path, 'w') as outfile:
        json.dump(elements, outfile)

def loadElements(path):
    with open(path) as f:
        data = json.load(f)
        return data

class FormBuilderView(APIView):

    def get(self, request):
        uuid = str(uuid4())
        media_name = uuid + '.png'
        out_path = os.path.join(settings.MEDIA_ROOT, media_name)
        qr_encode(uuid, out_path)
        return Response({'uuid': uuid, 'qr': settings.MEDIA_URL + media_name})

    def post(self, request):
        renderer = Renderer()
        result = renderer.render(request.data)
        form_uuid = result['uuid']
        elements = result['items']
        saveElements(elements, './back_end/crops/uploads/' + form_uuid +'.json')
        media_name = form_uuid + '.png'
        qrcode = os.path.join(settings.MEDIA_ROOT, media_name)
        f = Template(format="letter", elements=elements,title="DocuScan")
        f.add_page()
        f['company_logo'] = qrcode
        f.render("./template.pdf")
        os.system('open ' + './template.pdf')
        return Response({'uuid':"Suss"})


