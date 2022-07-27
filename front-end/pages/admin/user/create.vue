<script setup lang="ts">
import PageHeader from "~/components/header/PageHeader.vue";
import UserForm from "~/components/pages/user/UserForm.vue";
import { getAccessToken } from "~/my_modules/api_services/auth";

useHead({
  titleTemplate: (title) => `Tambah User - ${title}`,
});

const tambahUserFormRef = ref<InstanceType<typeof UserForm> | null>(null);

const handleClick = ({ isError, formData, isLoading }) => {
  if (!isError && !isLoading) {
    tambahUserFormRef.value?.toggleIsLoading();
    const authorization = `Bearer ${getAccessToken()}`;
  } else {
    console.log("form is not valid");
  }
};
</script>
<template>
  <NuxtLayout name="admin">
    <div>
      <section class="flex flex-col gap-8">
        <PageHeader>Tambah User</PageHeader>
        <hr />
        <!--   Form Section   -->
        <div class="flex flex-col gap-5">
          <UserForm @clicked="handleClick($event)" ref="tambahUserFormRef" />
        </div>
      </section>
    </div>
  </NuxtLayout>
</template>
