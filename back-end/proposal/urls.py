from .views import ProposalViewSet, DosenProposalAPIView, MahasiswaProposalAPIView
from django.urls import path, include
from rest_framework import routers

router = routers.SimpleRouter()
router.register('', ProposalViewSet)

urlpatterns = [
    path('dosen/', DosenProposalAPIView.as_view()),
    path('mahasiswa/', MahasiswaProposalAPIView.as_view()),
    path('', include(router.urls)),
]