from rest_framework.permissions import IsAuthenticated
from rest_framework.viewsets import ModelViewSet
from .models import Proposal
from .serializers import ProposalSerializer
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import SearchFilter, OrderingFilter
from user.permission import IsAdminUser


# Create your views here.


class ProposalViewSet(ModelViewSet):
    queryset = Proposal.objects.all()
    serializer_class = ProposalSerializer
    filter_backends = [DjangoFilterBackend, OrderingFilter, SearchFilter]
    filterset_fields = ['title']
    search_fields = ['title']

    def get_permissions(self):
        permissions_classes = [IsAuthenticated]

        if self.action == 'create' or self.action == 'update' or self.action == 'partial_update' or self.action == 'destroy':
            permissions_classes = [IsAdminUser]
        elif self.action == 'list':
            permissions_classes = [IsAuthenticated]

        return [permissions() for permissions in permissions_classes]
