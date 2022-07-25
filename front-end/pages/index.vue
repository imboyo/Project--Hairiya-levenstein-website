<script lang="ts" setup>
import MyTable from "~/components/tables/MyTable.vue";
import MyTableRow from "~/components/tables/MyTableRow.vue";
import MyTableCol from "~/components/tables/MyTableCol.vue";

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
const proposalHeader = ["Proposal", "Persentase Plagiarism", "Tanggal Upload"];
</script>

<template>
  <div>
    <MyTable
      title="Daftar Proposal"
      :header="proposalHeader"
      :body="proposal"
      :isLoading="tableIsLoading"
    >
      <template #body>
        <MyTableRow v-for="(item, index) in proposal" :key="index">
          <MyTableCol>{{ item.proposal }}</MyTableCol>
          <MyTableCol>{{ item.percentage }}</MyTableCol>
          <MyTableCol>{{ item.date }}</MyTableCol>
          <td class="py-4 px-6 text-right flex flex-row gap-4 justify-center">
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
  </div>
</template>
