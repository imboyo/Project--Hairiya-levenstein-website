from abc import ABC
from rest_framework import serializers


class CheckPlagiarismSerializer(serializers.Serializer):
    file_name = serializers.CharField(required=True)

    class Meta:
        fields = 'file_name'

