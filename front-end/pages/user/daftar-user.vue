<script lang="ts" setup>
import PageHeader from "~/components/header/PageHeader.vue";
import InputField from "~/components/inputs/InputField.vue";
import MyTable from "~/components/tables/MyTable.vue";
import MyTableRow from "~/components/tables/MyTableRow.vue";
import MyTableCol from "~/components/tables/MyTableCol.vue";

const searchState = ref("");
const typeSelectState = ref("");

const userHeader = ["Nama", "Nomor Induk", "Email", "Role", "Aksi"];
const user = ref<{}[]>([
  {
    id: 1,
    name: "Uzumaki Naruto",
    nim: "123456789",
    username: "naruto@gmail.com",
    role: "Mahasiswa",
  },
  {
    id: 2,
    name: "Sasuke Uchiha",
    nim: "123456789",
    username: "sasuke@gmail.com",
    role: "Dosen",
  },
  {
    id: 3,
    name: "Sakura Haruno",
    nim: "123456789",
    username: "saku@gmail.com",
    role: "Admin",
  },
]);

const tableIsLoading = ref(false);

const userPagination = ref({
  currentPage: 1,
  totalPage: 1,
  perPage: 10,
});
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
        <option value="Dosen">Dosen</option>
        <option value="Mahasiswa">Mahasiswa</option>
        <option value="Admin">Admin</option>
      </select>
    </section>
    <!-- ! End Header & Form  -->

    <!--  Table User  -->
    <section class="mt-3">
      <MyTable
        title="Daftar User"
        :is-loading="tableIsLoading"
        :header="userHeader"
        :pagination="userPagination"
      >
        <template #body>
          <MyTableRow v-for="(item, index) in user" :key="index">
            <MyTableCol>{{ item.name }}</MyTableCol>
            <MyTableCol>{{ item.nim }}</MyTableCol>
            <MyTableCol>{{ item.email }}</MyTableCol>
            <MyTableCol>{{ item.role }}</MyTableCol>
            <td class="py-4 px-6 text-right flex flex-row gap-4">
              <NuxtLink
                class="font-medium text-blue-600 dark:text-blue-500 hover:underline inline-block"
                >Edit
              </NuxtLink>
              <a
                href="#"
                class="font-medium text-blue-600 dark:text-blue-500 hover:underline inline-block"
                >Delete</a
              >
            </td>
          </MyTableRow>
        </template>
      </MyTable>
    </section>
  </div>
</template>
