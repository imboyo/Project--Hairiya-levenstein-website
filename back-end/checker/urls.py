from .views import CheckPlagiarismAPIView
from django.urls import path, include

urlpatterns = [
    path('', CheckPlagiarismAPIView.as_view()),
]
