from django.contrib.auth.models import User
from rest_framework.viewsets import ModelViewSet
from user.serializers import UserSerializer
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import SearchFilter, OrderingFilter


# Create your views here.
class UserViewSet(ModelViewSet):
    permission_classes = []

    queryset = User.objects.all()
    serializer_class = UserSerializer
    filter_backends = [DjangoFilterBackend, OrderingFilter, SearchFilter]
    filterset_fields = ['profile__role', 'username', 'first_name', 'last_name']
    ordering_fields = ['id', 'username', 'date_joined']
    search_fields = ['username', 'first_name', 'last_name']
