from .views import UserViewSet, CheckUsernameViewSet
from django.urls import path, include
from rest_framework import routers

router = routers.SimpleRouter()
router.register('check-username', CheckUsernameViewSet)
router.register('', UserViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
