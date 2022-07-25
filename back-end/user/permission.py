from rest_framework import permissions


class IsAdminUser(permissions.BasePermission):
    def has_permission(self, request, view):
        is_admin_user = False
        try:
            is_admin_user = request.user.profile.role == 'admin'
        finally:
            return is_admin_user


class IsLoggendInUser(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):
        return request.user == obj
