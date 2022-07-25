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
      <section class="flex flex-col gap-8">
        <PageHeader>Detail Proposal - blabla</PageHeader>
        <div class="w-full">
          <InputField
            placeholder="Cari Mahasiswa"
            :rules="[]"
            type="text"
            icon="search"
            @typing="searchState = $event.inputValue"
          />
        </div>
      </section>

      <!--  Table Mahasiswa  -->
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
            </MyTableRow>
          </template>
        </MyTable>
      </section>
    </div>
  </NuxtLayout>
</template>
