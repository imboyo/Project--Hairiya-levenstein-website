<script setup lang="ts">
import PageHeader from "~/components/header/PageHeader.vue";
import UserForm from "~/components/pages/user/UserForm.vue";
import { getAccessToken } from "~/my_modules/api_services/auth";
import { splitArrayInto2Array, splitStringBySpace } from "~/my_modules/string";
import axios from "axios";
import { baseApiUrl } from "~/my_modules/environment";
import Swal from "sweetalert2";
import { verifyRolePageUser } from "~/my_modules/reusable_component";
import { onBeforeMount } from "#imports";

// For redirecting user is not have permission in this page then redirect them.
const initialPageIsLoading = ref(true);
verifyRolePageUser("admin", initialPageIsLoading);

definePageMeta({
  layout: "admin",
});

useHead({
  titleTemplate: (title) => `Tambah User - ${title}`,
});

const route = useRoute();
const router = useRouter();
const tambahUserFormRef = ref<InstanceType<typeof UserForm> | null>(null);
const errorMessage = ref("");
const userDetails = ref<User>();
const formValues = reactive({
  username: "",
  name: "",
  nim: "",
  email: "",
  role: "",
});

onBeforeMount(async () => {
  // get user detail
  const id = route.params.id;
  const response = await axios.get(`${baseApiUrl}user/${id}`, {
    headers: { Authorization: `Bearer ${getAccessToken()}` },
  });
  const data = response.data;
  userDetails.value = data;

  // assign formValues data
  formValues.username = data.username;
  formValues.name = `${data.first_name} ${data.last_name}`;
  formValues.nim = data.profile.nomor_induk;
  formValues.email = data.email;
  formValues.role = data.profile.role;
});

const handleClick = async ({ isError, formData, isLoading }) => {
  if (!isError && !isLoading) {
    tambahUserFormRef.value?.toggleIsLoading();

    const nameArray = () => {
      const array = splitStringBySpace(formData.name);
      if (array.length > 1) {
        return splitArrayInto2Array(array);
      } else {
        return array;
      }
    };

    console.log(nameArray());

    let formDataSend = {
      username: formData.username,
      first_name: nameArray()[0],
      email: formData.email,
      password: formData.password,
      "profile.role": formData.role,
      "profile.nomor_induk": formData.nim,
    };

    if (nameArray().length > 1) {
      formDataSend.last_name = nameArray()[1];
    }

    await axios
      .patch(`${baseApiUrl}user/${route.params.id}/`, formDataSend, {
        headers: {
          Authorization: `Bearer ${getAccessToken()}`,
          "Content-Type": "multipart/form-data",
        },
      })
      .then((response) => {
        Swal.fire("Berhasil", "User berhasil ditambahkan", "success");
        router.push("/admin/user/list");
      })
      .catch((error) => {
        tambahUserFormRef.value?.toggleIsLoading();
        errorMessage.value = error.response.data;
        Swal.fire("Gagal", "User gagal diedit", "error");
      });
  } else {
    console.log("form is not valid");
  }
};
</script>
<template>
  <div v-if="!initialPageIsLoading">
    <section class="flex flex-col gap-8">
      <PageHeader class="capitalize"
        >Edit User -
        {{
          `${userDetails.profile.role} - ${userDetails.username}`
        }}</PageHeader
      >
      <hr />
      <!--   Form Section   -->
      <form class="flex flex-col gap-5" @submit.prevent autocomplete="off">
        <UserForm
          @clicked="handleClick($event)"
          ref="tambahUserFormRef"
          :value="formValues"
        />
      </form>
    </section>
  </div>
</template>
