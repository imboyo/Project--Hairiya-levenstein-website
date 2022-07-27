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
import { getPagination } from "~/my_modules/pagination";

useHead({
  titleTemplate: (title) => `Detail Proposal - ${title}`,
});

const route = useRoute();
const router = useRouter();

const proposalHeader = ["Proposal", "Persentase Plagiarism", "Tanggal Upload"];

// State
const proposalDetail = ref<Proposal>();
const proposalList = ref<Proposal[]>([]);
const proposalListPaginated = ref<Proposal[]>([]);
const tableIsLoading = ref(true);

const proposalPagination = reactive({
  currentPage: 1,
  totalPage: 1,
  limit: 10,
});

const paginateList = () => {
  // Make data paginated biar rapi
  const { dataPagination, totalPage, total } = getPagination(
    proposalList.value,
    proposalPagination.limit,
    proposalPagination.currentPage
  );

  proposalListPaginated.value = dataPagination;
  proposalPagination.totalPage = totalPage;
};

watch(
  () => proposalPagination.currentPage,
  (value) => {
    paginateList();
  }
);

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

          paginateList();
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

const handlePrevClick = (isPrev) => {
  if (isPrev) {
    proposalPagination.currentPage--;
  }
};

const handleNextClick = (isNext) => {
  if (isNext) {
    proposalPagination.currentPage++;
  }
};

const percentageClassDynamic = computed(() => {
  return (number) => {
    if (number >= 20 && number <= 40) {
      return "text-secondary-700";
    } else if (number >= 40 && number <= 60) {
      return "text-warning-700";
    } else if (number >= 60) {
      return "text-error-700";
    } else {
      return "text-success-700";
    }
  };
});
</script>

<template>
  <NuxtLayout name="admin">
    <div>
      <section class="flex flex-col gap-8" v-if="proposalDetail">
        <PageHeader
          >Detail Proposal -
          {{ truncate(proposalDetail.title, 20) }}
        </PageHeader>
      </section>

      <!--  Table Mahasiswa  -->
      <!--  Table Mahasiswa  -->
      <section>
        <MyTable
          title="Daftar Proposal"
          :header="proposalHeader"
          :isLoading="tableIsLoading"
          :pagination="proposalPagination"
          @prevClicked="handlePrevClick($event)"
          @nextClicked="handleNextClick($event)"
        >
          <MyTableRow v-for="item in proposalListPaginated" :key="item.id">
            <MyTableCol>
              <div class="flex flex-col">
                <p class="text-gray-700 font-bold text-md">{{ item.title }}</p>
                <p>{{ item.name }}</p>
                <p>{{ item.nim }}</p>
              </div>
            </MyTableCol>
            <MyTableCol
              class="text-lg text-gray-700 font-bold"
              :class="percentageClassDynamic(item.percentage)"
              >{{ item.percentage }}%
            </MyTableCol>
            <MyTableCol class="text-gray-700 text-md"
              >{{ getFullDate(item.created_at) }}
            </MyTableCol>
          </MyTableRow>
        </MyTable>
      </section>
    </div>
  </NuxtLayout>
</template>
