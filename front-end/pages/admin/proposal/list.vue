<script lang="ts" setup>
import PageHeader from "~/components/header/PageHeader.vue";
import InputField from "~/components/inputs/InputField.vue";
import MyTable from "~/components/tables/MyTable.vue";
import MyTableRow from "~/components/tables/MyTableRow.vue";
import MyTableCol from "~/components/tables/MyTableCol.vue";
import axios from "axios";
import { baseApiUrl } from "~/my_modules/environment";
import { getAccessToken } from "~/my_modules/auth";
import { getOffsetPage } from "~/my_modules/pagination";
import { getFullDate } from "~/my_modules/date";

useHead({
  titleTemplate: (title) => `Daftar Proposal- ${title}`,
});

const proposalHeader = ["Proposal", "Persentase Plagiarism", "Tanggal Upload"];
const searchState = ref("");
const proposal = ref<Proposal[]>([]);
const tableIsLoading = ref(true);

const proposalPagination = reactive({
  currentPage: 1,
  totalPage: 1,
  limit: 20,
});

// Do it after done backend
const fetchProposal = async () => {
  const limit = proposalPagination.limit;
  const currPage = proposalPagination.currentPage;
  await axios
    .get(
      `${baseApiUrl}proposal?limit=${limit}&offset=${getOffsetPage(
        currPage,
        limit
      )}`,
      {
        headers: { Authorization: `Bearer ${getAccessToken()}` },
      }
    )
    .then((response) => {
      const data = response.data;
      proposal.value = data.results;
      // Round to higher

      proposalPagination.totalPage = Math.ceil(data.count / limit);
      tableIsLoading.value = false;
    })
    .catch((error) => {
      console.log(error);
    });
};

onMounted(() => fetchProposal());

const handlePrevClick = (isPrev) => {
  if (isPrev) {
    proposalPagination.currentPage--;
    fetchProposal();
  }
};

const handleNextClick = (isNext) => {
  if (isNext) {
    proposalPagination.currentPage++;
    fetchProposal();
  }
};
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
          :pagination="proposalPagination"
          @prevClicked="handlePrevClick($event)"
          @nextClicked="handleNextClick($event)"
        >
          <template v-if="!tableIsLoading">
            <MyTableRow v-for="(item, index) in proposal" :key="index">
              <MyTableCol>{{ item.title }}</MyTableCol>
              <MyTableCol>{{ item.plagiarism_percentage }}</MyTableCol>
              <MyTableCol>{{ getFullDate(item.created_at) }}</MyTableCol>
              <td
                class="py-4 px-6 text-right flex flex-row gap-4 justify-center"
              >
                <NuxtLink
                  to="/admin/proposal/edit/{{ item.id }}"
                  class="font-medium text-blue-600 dark:text-blue-500 hover:underline inline-block"
                  >Edit
                </NuxtLink>
                <button
                  class="font-medium text-blue-600 dark:text-blue-500 hover:underline inline-block"
                >
                  Delete
                </button>
              </td>
            </MyTableRow>
            <div v-if="proposal.length === 0" class="text-center p-5">
              <h1 class="text-display-md text-gray-400">
                Belum ada proposal. Mohon tambahkan proposal
              </h1>
            </div>
          </template>
        </MyTable>
      </section>
    </div>
  </NuxtLayout>
</template>
