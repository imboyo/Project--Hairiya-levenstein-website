<script lang="ts" setup>
import PageHeader from "~/components/header/PageHeader.vue";
import InputField from "~/components/inputs/InputField.vue";
import MyTable from "~/components/tables/MyTable.vue";
import MyTableRow from "~/components/tables/MyTableRow.vue";
import MyTableCol from "~/components/tables/MyTableCol.vue";
import axios from "axios";
import { baseApiUrl } from "~/my_modules/environment";
import { getOffsetPage } from "~/my_modules/pagination";
import { getAccessToken, headers } from "~/my_modules/api_services/auth";
import { getUsersService } from "~/my_modules/api_services/user";
import Swal from "sweetalert2";
import { verifyRolePageUser } from "~/my_modules/reusable_component";

// For redirecting user is not have permission in this page then redirect them.
const initialPageIsLoading = ref(true);
verifyRolePageUser("admin", initialPageIsLoading);

useHead({
  titleTemplate: (title) => `Daftar User - ${title}`,
});

definePageMeta({
  layout: "general",
});

const userHeader = ["Nama", "Nomor Induk", "Email", "Role", "Aksi"];

// State
const searchState = ref("");
const typeSelectState = ref("");
const users = ref<User[]>([]);
const tableIsLoading = ref(false);

const userPagination = reactive({
  currentPage: 1,
  totalPage: 1,
  limit: 20,
});

const thisPageGetUsers = async () => {
  await getUsersService(
    userPagination.limit,
    userPagination.currentPage,
    searchState.value,
    typeSelectState.value,
    (data) => {
      users.value = data.results;
      userPagination.totalPage = Math.ceil(data.count / userPagination.limit);
      tableIsLoading.value = false;
    },
    () => {}
  );
};

onMounted(() => thisPageGetUsers());

// Pagination button handler
const handlePrevClick = (isPrev) => {
  if (isPrev) {
    userPagination.currentPage--;
    thisPageGetUsers();
  }
};

const handleNextClick = (isNext) => {
  if (isNext) {
    userPagination.currentPage++;
    thisPageGetUsers();
  }
};

// Form input handler
watch(
  () => searchState.value,
  () => {
    tableIsLoading.value = true;
    thisPageGetUsers();
  },
  { immediate: true }
);

watch(
  () => typeSelectState.value,
  () => {
    tableIsLoading.value = true;
    thisPageGetUsers();
  },
  { immediate: true }
);

// handle delete user
const handleClickDeleteUser = (id) => {
  Swal.fire({
    title: "Yakin ingin menghapus proposal ini?",
    showCancelButton: true,
    confirmButtonText: "Delete",
  }).then(async (result) => {
    if (result.isConfirmed) {
      await axios
        .delete(`${baseApiUrl}user/${id}/`, {
          headers: { Authorization: `Bearer ${getAccessToken()}` },
        })
        .then((response) => {
          Swal.fire("Berhasil dihapus!", "", "success");
          thisPageGetUsers();
        })
        .catch((error) => {
          console.log(error);
        });
    }
  });
};
</script>

<template>
  <div>
    <!-- * Heard & Form  -->
    <section class="flex flex-col gap-8 lg:flex-row">
      <div class="flex lg:justify-start lg:w-6/12">
        <PageHeader>Daftar User</PageHeader>
      </div>
      <div class="flex lg:justify-end lg:w-6/12">
        <div class="w-full">
          <InputField
            placeholder="Cari User"
            :rules="[]"
            type="text"
            icon="search"
            @typing="searchState = $event.inputValue"
          />
        </div>
      </div>
    </section>

    <section class="mt-4">
      <select
        id="countries"
        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
        v-model="typeSelectState"
      >
        <option disabled value="">Pilih Jenis User</option>
        <option value="dosen">Dosen</option>
        <option value="mahasiswa">Mahasiswa</option>
        <option value="admin">Admin</option>
      </select>
    </section>
    <!-- ! End Header & Form  -->

    <!--  Table User  -->
    <section class="mt-3">
      <MyTable
        title="Daftar User"
        :header="userHeader"
        :pagination="userPagination"
        @prevClicked="handlePrevClick($event)"
        @nextClicked="handleNextClick($event)"
      >
        <template v-if="!tableIsLoading">
          <MyTableRow v-for="item in users" :key="item.id">
            <MyTableCol class="font-bold"
              >{{ item.first_name }} {{ item.last_name }}</MyTableCol
            >
            <MyTableCol>{{ item.profile.nomor_induk }}</MyTableCol>
            <MyTableCol>{{ item.email }}</MyTableCol>
            <MyTableCol class="uppercase font-bold">{{
              item.profile.role
            }}</MyTableCol>
            <td class="py-4 px-6 text-right flex flex-row gap-4">
              <NuxtLink
                class="font-medium text-blue-600 dark:text-blue-500 hover:underline inline-block"
                :to="`/admin/user/edit-${item.id}`"
                >Edit
              </NuxtLink>
              <button
                @click="handleClickDeleteUser(item.id)"
                class="font-medium text-blue-600 dark:text-blue-500 hover:underline inline-block"
              >
                Delete
              </button>
            </td>
          </MyTableRow>
        </template>
      </MyTable>
    </section>
  </div>
</template>
