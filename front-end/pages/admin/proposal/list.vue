<script lang="ts" setup>
import PageHeader from "~/components/header/PageHeader.vue";
import InputField from "~/components/inputs/InputField.vue";
import MyTable from "~/components/tables/MyTable.vue";
import MyTableRow from "~/components/tables/MyTableRow.vue";
import MyTableCol from "~/components/tables/MyTableCol.vue";

const searchState = ref("");

const proposalHeader = ["Proposal", "Persentase Plagiarism", "Tanggal Upload"];
const proposal = ref<{}[]>([
  {
    proposal: "How to be Hokage",
    percentage: 20,
    date: "20 Januari 2022",
  },
  {
    proposal: "How to be Hokage",
    percentage: 20,
    date: "20 Januari 2022",
  },
]);

const tableIsLoading = ref(false);

const proposalPagination = ref({
  currentPage: 1,
  totalPage: 1,
  perPage: 10,
});
</script>

<template>
  <NuxtLayout name="admin">
    <div>
      <section class="flex flex-col gap-8 lg:flex-row">
        <div class="flex lg:justify-start lg:w-6/12">
          <PageHeader>Daftar Proposal</PageHeader>
        </div>
        <div class="flex lg:justify-end lg:w-6/12">
          <div class="w-full">
            <InputField
              placeholder="Cari Mahasiswa"
              :rules="[]"
              type="text"
              icon="search"
              @typing="searchState = $event.inputValue"
            />
          </div>
        </div>
      </section>

      <!--  Table Mahasiswa  -->
      <section>
        <MyTable
          title="Daftar Proposal"
          :header="proposalHeader"
          :isLoading="tableIsLoading"
          :pagination="proposalPagination"
        >
          <template #body>
            <MyTableRow v-for="(item, index) in proposal" :key="index">
              <MyTableCol>{{ item.proposal }}</MyTableCol>
              <MyTableCol>{{ item.percentage }}</MyTableCol>
              <MyTableCol>{{ item.date }}</MyTableCol>
              <td
                class="py-4 px-6 text-right flex flex-row gap-4 justify-center"
              >
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
  </NuxtLayout>
</template>
