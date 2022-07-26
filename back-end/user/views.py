from django.contrib.auth.models import User
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.viewsets import ModelViewSet

from user.permission import IsAdminUser, IsLoggendInUser
from user.serializers import UserSerializer
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import SearchFilter, OrderingFilter


# Create your views here.
class UserViewSet(ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    filter_backends = [DjangoFilterBackend, OrderingFilter, SearchFilter]
    filterset_fields = ['profile__role', 'username', 'first_name', 'last_name']
    ordering_fields = ['id', 'username', 'date_joined']
    search_fields = ['username', 'first_name', 'last_name']

    def get_permissions(self):
        permissions_classes = [AllowAny]

        if self.action == 'create' or self.action == 'destroy':
            permissions_classes = [IsAdminUser]
        elif self.action == 'update' or self.action == 'partial_update':
            permissions_classes = [IsLoggendInUser, IsAdminUser]
        elif self.action == 'list':
            permissions_classes = [AllowAny]

        return [permissions() for permissions in permissions_classes]
