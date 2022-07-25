from rest_framework.views import APIView
from rest_framework.permissions import IsAuthenticated
from .utils import check_plagiarism_all
from .serializers import CheckPlagiarismSerializer
from rest_framework.response import Response
from rest_framework import status
from django.conf import settings


# Create your views here.
class CheckPlagiarismAPIView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        data = request.data
        serializer = CheckPlagiarismSerializer(data=data)

        if serializer.is_valid():
            file_name = serializer.validated_data['file_name']
            return Response({"result": check_plagiarism_all(f'{settings.BASE_DIR}/media/proposal/{file_name}.pdf')}, status=status.HTTP_200_OK)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
