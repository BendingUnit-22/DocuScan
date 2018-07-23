from rest_framework.views import APIView
from rest_framework.response import Response
from back_end.api.serializers import HeaderSerializer
from back_end.common.QRCode import qr_encode, qr_decode
from django.conf import settings
from uuid import uuid4
import os

class FormBuilderView(APIView):

    def get(self, request):
        # serializer = HeaderSerializer()
        # return Response(serializer.data)
        uuid = str(uuid4())
        media_name = uuid + '.png'
        out_path = os.path.join(settings.MEDIA_ROOT, media_name)
        qr_encode(uuid, out_path)
        return Response({'uuid': uuid, 'qr': settings.MEDIA_URL + media_name})


    def post(self, request):
        print(request.data)
