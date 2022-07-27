<script setup lang="ts">
import PageHeader from "~/components/header/PageHeader.vue";
import UserForm from "~/components/pages/user/UserForm.vue";
import { getAccessToken } from "~/my_modules/api_services/auth";
import { splitArrayInto2Array, splitStringBySpace } from "~/my_modules/string";
import axios from "axios";
import { baseApiUrl } from "~/my_modules/environment";
import Swal from "sweetalert2";
import { checkIsUserExist } from "~/my_modules/api_services/user";

useHead({
  titleTemplate: (title) => `Tambah User - ${title}`,
});
const router = useRouter();
const tambahUserFormRef = ref<InstanceType<typeof UserForm> | null>(null);
const errorMessage = ref("");

const handleClick = ({ isError, formData, isLoading }) => {
  if (!isError && !isLoading) {
    tambahUserFormRef.value?.toggleIsLoading();

    const authorization = `Bearer ${getAccessToken()}`;
    const nameArray = () => {
      const array = splitStringBySpace(formData.name);
      if (array.length > 1) {
        return splitArrayInto2Array(array);
      } else {
        return array;
      }
    };

    let formDataSend = {
      username: formData.username,
      first_name: nameArray()[0],
      email: formData.email,
      password: formData.password,
      "profile.role": formData.role,
      "profile.nomor_induk": formData.nim,
    };

    if (nameArray.length > 1) {
      formData.last_name = nameArray()[1];
    }

    axios
      .post(`${baseApiUrl}user/`, formDataSend, {
        headers: { authorization, "Content-Type": "multipart/form-data" },
      })
      .then((response) => {
        Swal.fire("Berhasil", "User berhasil ditambahkan", "success");
        router.push("/admin/user/list");
      })
      .catch((error) => {
        Swal.fire("Gagal", "User gagal ditambahkan", "error");
        tambahUserFormRef.value?.toggleIsLoading();
        // errorMessage.value = error.response.data.message;
        errorMessage.value = error.response.data;
      });
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
        <form class="flex flex-col gap-5" @submit.prevent autocomplete="off">
          <UserForm @clicked="handleClick($event)" ref="tambahUserFormRef" />
        </form>
      </section>
    </div>
  </NuxtLayout>
</template>
