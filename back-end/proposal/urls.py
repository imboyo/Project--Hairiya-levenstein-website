from .views import ProposalViewSet
from django.urls import path, include
from rest_framework import routers

router = routers.DefaultRouter()
router.register('', ProposalViewSet)

urlpatterns = [
    path('', include(router.urls)),
]