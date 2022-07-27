<script lang="ts" setup>
import PageHeader from "~/components/header/PageHeader.vue";
import InputField from "~/components/inputs/InputField.vue";
import MyTable from "~/components/tables/MyTable.vue";
import MyTableRow from "~/components/tables/MyTableRow.vue";
import MyTableCol from "~/components/tables/MyTableCol.vue";
import { truncate } from "~/my_modules/string";
import { parseLatestFileName, removeExtensionFile } from "~/my_modules/array";
import {
  getPlagiarismList,
  getProposalDetail,
} from "~/my_modules/api_services/proposal";
import Swal from "sweetalert2";
import { getFullDate } from "~/my_modules/date";

useHead({
  titleTemplate: (title) => `Detail Proposal - ${title}`,
});

const route = useRoute();
const router = useRouter();

const proposalHeader = ["Proposal", "Persentase Plagiarism", "Tanggal Upload"];

// State
const searchState = ref("");
const proposalDetail = ref<Proposal>();
const proposalList = ref<Proposal[]>([]);
const tableIsLoading = ref(true);

const proposalPagination = ref({
  currentPage: 1,
  totalPage: 1,
  perPage: 10,
});

// * Get Proposal List
onBeforeMount(() =>
  //  Ambil data proposal dari API
  getProposalDetail(
    route.params.id,
    (data) => {
      proposalDetail.value = data;
      const fileName = removeExtensionFile(parseLatestFileName(data.file));

      // Ambil data plagiarism list dari API
      getPlagiarismList(
        fileName,
        (data) => {
          proposalList.value = data.result;
          tableIsLoading.value = false;
        },
        () => {}
      );
    },
    () =>
      Swal.fire(
        "Gagal",
        "Gagal mengambil data proposal - silahkan coba lagi",
        "error"
      )
  )
);

// Get Proporsal Plagiarism List
</script>

<template>
  <NuxtLayout name="admin">
    <div>
      <section class="flex flex-col gap-8" v-if="proposalDetail">
        <PageHeader
          >Detail Proposal -
          {{ truncate(proposalDetail.title, 20) }}
        </PageHeader>
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
          <MyTableRow v-for="item in proposalList" :key="item.id">
            <MyTableCol>{{ item.title }}</MyTableCol>
            <MyTableCol>{{ item.percentage }}%</MyTableCol>
            <MyTableCol>{{ getFullDate(item.created_at) }}</MyTableCol>
          </MyTableRow>
        </MyTable>
      </section>
    </div>
  </NuxtLayout>
</template>
