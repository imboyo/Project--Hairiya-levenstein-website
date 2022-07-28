from rest_framework import serializers
from django.contrib.auth.models import User
from django.contrib.auth.hashers import make_password

from user.models import UserProfile


class UserProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserProfile
        fields = ('id', 'user', 'nomor_induk', 'role')
        read_only_fields = ('id', 'user')
        extra_kwargs = {"user": {"required": False}}


class UserSerializer(serializers.ModelSerializer):
    profile = UserProfileSerializer()
    password = serializers.CharField(style={"input_type": "password"}, write_only=True)
    first_name = serializers.CharField(required=True)
    last_name = serializers.CharField(required=False)
    email = serializers.EmailField(required=True)

    class Meta:
        model = User
        fields = [
            'id', 'username', 'first_name', 'last_name', 'email', 'is_active', 'is_active', 'password', 'last_login',
            "profile"]
        read_only_fields = ('id', 'last_login', 'date_joined', 'last_login', 'is_active')

    # ? Post Method Create User Custom
    def create(self, validated_data):
        profile_data = validated_data.pop('profile')
        user = User.objects.create(**validated_data)

        # ? Password Harus di set manual agar hashing tidak error
        user.set_password(validated_data["password"])
        user.save()
        UserProfile.objects.create(user=user, **profile_data)

        return user

    def update(self, instance, validated_data):
        profile = instance.profile
        profile_data = validated_data.pop('profile')

        profile.role = profile_data.get('role', profile.role)
        profile.nomor_induk = profile_data.get('nomor_induk', profile.nomor_induk)

        instance.username = validated_data['username']
        instance.password = make_password(validated_data['password'])
        instance.first_name = validated_data['first_name']
        try:
            instance.last_name = validated_data['last_name']
        except:
            instance.last_name = ""

        instance.email = validated_data['email']

        profile.save()
        instance.save()

        return instance


class CheckUsernameSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ['username']
        read_only_fields = ['username']
        lookup_field = 'username'
        extra_kwargs = {'url': {'lookup_field': 'username'}}
