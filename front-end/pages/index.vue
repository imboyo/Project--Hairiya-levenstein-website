<script lang="ts" setup>
import MyTable from "~/components/tables/MyTable.vue";

const proposal = ref<TableBody[]>([
  {
    id: 1,
    proposal: "How to be Hokage",
    percentage: 20,
    date: "20 Januari 2022",
  },
  {
    id: 3,
    proposal: "How to be Hokage",
    percentage: 20,
    date: "20 Januari 2022",
  },
]);

const tableIsLoading = ref(false);
const proposalHeader = ["Proposal", "Persentase Plagiarism", "Tanggal Upload"];
</script>

<template>
  <div>
    <MyTable
      title="Daftar Proposal"
      :header="proposalHeader"
      :body="proposal"
      :isLoading="tableIsLoading"
    />
  </div>
</template>
