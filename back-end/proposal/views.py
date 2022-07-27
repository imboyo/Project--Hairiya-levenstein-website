from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.views import APIView
from rest_framework.viewsets import ModelViewSet

from checker.utils import check_plagiarism_all, get_highest_percentage
from .models import Proposal
from .serializers import ProposalSerializer, DosenProposalSerializer, MahasiswaProposalSerializer
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import SearchFilter, OrderingFilter
from user.permission import IsAdminUser
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth.models import User
import os
from django.conf import settings


# Create your views here.


class ProposalViewSet(ModelViewSet):
    queryset = Proposal.objects.all()
    serializer_class = ProposalSerializer
    filter_backends = [DjangoFilterBackend, OrderingFilter, SearchFilter]
    search_fields = ['title']

    def get_permissions(self):
        permissions_classes = [IsAuthenticated]

        if self.action == 'create' or self.action == 'update' or self.action == 'partial_update' or self.action == 'destroy':
            permissions_classes = [IsAdminUser]
        elif self.action == 'list':
            permissions_classes = [AllowAny]

        return [permissions() for permissions in permissions_classes]

    def perform_destroy(self, instance):
        file_path = f'{settings.BASE_DIR}/media/{instance.file}'
        os.remove(file_path)
        instance.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

    def perform_update(self, serializer):
        parameter = self.kwargs.get('pk')
        proposal = Proposal.objects.get(id=parameter)
        file_path = f'{settings.BASE_DIR}/media/{proposal.file}'
        os.remove(file_path)

        instance = serializer.save()
        plagiarism_list = check_plagiarism_all(f'{settings.BASE_DIR}/media/{instance.file}')
        plagiarism_percentage = get_highest_percentage(plagiarism_list)
        instance.plagiarism_percentage = plagiarism_percentage
        instance.save()

        return Response(status=status.HTTP_204_NO_CONTENT)


class DosenProposalAPIView(APIView):
    permission_classes = [IsAdminUser]

    def post(self, request):
        data = request.data
        serializer = DosenProposalSerializer(data=data)

        if serializer.is_valid():
            try:
                proposal = Proposal.objects.get(id=data['proposal_id'])
                try:
                    user = User.objects.get(id=data['dosen'])
                    proposal.dosen.add(data['dosen'])
                    proposal.save()
                    return Response({"result": f"success add {user.username}"}, status=status.HTTP_200_OK)
                except:
                    return Response({"result": "dosen not found"}, status=status.HTTP_400_BAD_REQUEST)
            except:
                return Response({"message": "Proposal not found"}, status=status.HTTP_404_NOT_FOUND)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request):
        data = request.data
        serializer = DosenProposalSerializer(data=data)

        if serializer.is_valid():
            try:
                proposal = Proposal.objects.get(id=data['proposal_id'])
                try:
                    user = User.objects.get(id=data['dosen'])
                    proposal.dosen.remove(data['dosen'])
                    proposal.save()
                    return Response({"result": f"success delete {user.username}"}, status=status.HTTP_200_OK)
                except:
                    return Response({"result": "dosen not found"}, status=status.HTTP_400_BAD_REQUEST)
            except:
                return Response({"message": "Proposal not found"}, status=status.HTTP_404_NOT_FOUND)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class MahasiswaProposalAPIView(APIView):
    permission_classes = [IsAdminUser]

    def post(self, request):
        data = request.data
        serializer = MahasiswaProposalSerializer(data=data)

        if serializer.is_valid():
            try:
                proposal = Proposal.objects.get(id=data['proposal_id'])
                try:
                    user = User.objects.get(id=data['mahasiswa'])
                    proposal.mahasiswa.add(data['mahasiswa'])
                    proposal.save()
                    return Response({"result": f"success add {user.username}"}, status=status.HTTP_200_OK)
                except:
                    return Response({"result": "mahasiswa not found"}, status=status.HTTP_400_BAD_REQUEST)
            except:
                return Response({"message": "Proposal not found"}, status=status.HTTP_404_NOT_FOUND)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request):
        data = request.data
        serializer = MahasiswaProposalSerializer(data=data)

        if serializer.is_valid():
            try:
                proposal = Proposal.objects.get(id=data['proposal_id'])
                try:
                    user = User.objects.get(id=data['mahasiswa'])
                    proposal.mahasiswa.remove(data['mahasiswa'])
                    proposal.save()
                    return Response({"result": f"success delete {user.username}"}, status=status.HTTP_200_OK)
                except:
                    return Response({"result": "mahasiswa not found"}, status=status.HTTP_400_BAD_REQUEST)
            except:
                return Response({"message": "Proposal not found"}, status=status.HTTP_404_NOT_FOUND)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
