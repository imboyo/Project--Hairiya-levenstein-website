from rest_framework.views import APIView
from rest_framework.permissions import IsAuthenticated

from proposal.models import Proposal
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
            list_plagiarism = check_plagiarism_all(f'{settings.BASE_DIR}/media/proposal/{file_name}.pdf')

            final_list = []

            for item in list_plagiarism:
                try:
                    proposal = Proposal.objects.get(file=f'proposal/{item["file"]}')
                    mahasiswa = proposal.mahasiswa.all()

                    for mhs in mahasiswa:
                        final_list.append({
                            'proposal_id': proposal.id,
                            'mhs_id': mhs.id,
                            'name': f'{mhs.first_name} {mhs.last_name}',
                            'nim': mhs.profile.nomor_induk,
                            'plagiarism': item['plagiarism'],
                            'percentage': item['percentage'],
                            'title': proposal.title,
                            'file': item['file'],
                            'created_at': proposal.created_at
                        })
                except:
                    pass

            return Response({"result": final_list}, status=status.HTTP_200_OK)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
