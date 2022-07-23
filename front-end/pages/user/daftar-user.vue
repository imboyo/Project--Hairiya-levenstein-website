<script lang="ts" setup>
import PageHeader from "~/components/header/PageHeader.vue";
import InputField from "~/components/inputs/InputField.vue";
import MyTable from "~/components/tables/MyTable.vue";

const searchState = ref("");
const typeState = ref("");

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
</script>

<template>
  <div>
    <h1>Daftar User</h1>
  </div>
</template>
