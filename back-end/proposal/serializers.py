from rest_framework import serializers

from checker.utils import check_plagiarism_all, get_highest_percentage
from .models import Proposal
from django.conf import settings


class ProposalSerializer(serializers.ModelSerializer):
    class Meta:
        model = Proposal
        fields = ('id', 'title', 'file', 'created_at', 'plagiarism_percentage', 'dosen', 'mahasiswa')
        read_only_fields = ('id', 'created_at', 'plagiarism_percentage', 'dosen', 'mahasiswa')

    def create(self, validated_data):
        proposal = Proposal.objects.create(**validated_data)

        plagiarism_list = check_plagiarism_all(f'{settings.BASE_DIR}/media/{proposal.file}')
        print(plagiarism_list)
        plagiarism_percentage = get_highest_percentage(plagiarism_list)
        proposal.plagiarism_percentage = plagiarism_percentage

        proposal.save()
        return proposal


class DosenProposalSerializer(serializers.Serializer):
    proposal_id = serializers.IntegerField(required=True)
    dosen = serializers.IntegerField(required=True)

    class Meta:
        fields = ('dosen')


class MahasiswaProposalSerializer(serializers.Serializer):
    proposal_id = serializers.IntegerField(required=True)
    mahasiswa = serializers.IntegerField(required=True)

    class Meta:
        fields = ('mahasiswa')
