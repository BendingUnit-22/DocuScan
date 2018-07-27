from rest_framework import serializers
from back_end.api.models import Header

class HeaderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Header
        fields = 'id', 'uuid', 'title', 'formUUID', 'qrcodeURL'

