<script lang="ts" setup>
import PageHeader from "~/components/header/PageHeader.vue";
import InputField from "~/components/inputs/InputField.vue";
import MyTable from "~/components/tables/MyTable.vue";
import MyTableRow from "~/components/tables/MyTableRow.vue";
import MyTableCol from "~/components/tables/MyTableCol.vue";
import { fetchProposal } from "~/my_modules/proposal";

import { getFullDate } from "~/my_modules/date";
import axios from "axios";
import { baseApiUrl } from "~/my_modules/environment";
import { getAccessToken } from "~/my_modules/api_services/auth";
import Swal from "sweetalert2";
import { verifyRolePageUser } from "~/my_modules/reusable_component";
import NotFoundComponent from "~/components/NotFoundComponent.vue";

useHead({
  titleTemplate: (title) => `Daftar Proposal- ${title}`,
});

// For redirecting user is not have permission in this page then redirect them.
const initialPageIsLoading = ref(true);
verifyRolePageUser("admin", initialPageIsLoading);

definePageMeta({
  layout: "admin",
});

const proposalHeader = [
  "Proposal",
  "Persentase Plagiarism",
  "Tanggal Upload",
  "Tindakan",
];
const searchState = ref("");
const proposal = ref<Proposal[]>([]);
const tableIsLoading = ref(true);

const proposalPagination = reactive({
  currentPage: 1,
  totalPage: 1,
  limit: 20,
});

const thisPageGetProposal = async () => {
  await fetchProposal(
    proposal,
    proposalPagination.limit,
    proposalPagination.currentPage,
    searchState,
    tableIsLoading,
    proposalPagination
  );
};

onMounted(() => thisPageGetProposal());

watch(
  () => searchState.value,
  (value) => {
    tableIsLoading.value = true;
    thisPageGetProposal();
  },
  { immediate: true }
);

const handlePrevClick = (isPrev) => {
  if (isPrev) {
    proposalPagination.currentPage--;
    thisPageGetProposal();
  }
};

const handleNextClick = (isNext) => {
  if (isNext) {
    proposalPagination.currentPage++;
    thisPageGetProposal();
  }
};

const handleClickDeleteProposal = (id) => {
  Swal.fire({
    title: "Yakin ingin menghapus proposal ini?",
    showCancelButton: true,
    confirmButtonText: "Delete",
  }).then(async (result) => {
    if (result.isConfirmed) {
      await axios
        .delete(`${baseApiUrl}proposal/${id}/`, {
          headers: { Authorization: `Bearer ${getAccessToken()}` },
        })
        .then((response) => {
          Swal.fire("Berhasil dihapus!", "", "success");
          thisPageGetProposal();
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
    <div v-if="!initialPageIsLoading">
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
            <MyTableRow v-for="(item, index) in proposal" :key="item.id">
              <NuxtLink :to="`/admin/proposal/detail-${item.id}`">
                <MyTableCol>{{ item.title }}</MyTableCol>
              </NuxtLink>
              <MyTableCol>{{ item.plagiarism_percentage }}</MyTableCol>
              <MyTableCol>{{ getFullDate(item.created_at) }}</MyTableCol>
              <td
                class="py-4 px-6 text-right flex flex-row gap-4 justify-center"
              >
                <NuxtLink
                  :to="`/admin/proposal/edit-${item.id}/`"
                  class="font-medium text-blue-600 dark:text-blue-500 hover:underline inline-block"
                  >Edit
                </NuxtLink>
                <button
                  @click="handleClickDeleteProposal(item.id)"
                  class="font-medium text-blue-600 dark:text-blue-500 hover:underline inline-block"
                >
                  Delete
                </button>
              </td>
            </MyTableRow>
            <div v-if="proposal.length === 0" class="text-center p-5">
              <h1 class="text-display-md text-gray-400">
                Tidak ditemukan proposal
              </h1>
            </div>
          </template>
        </MyTable>
      </section>
    </div>
    <div v-else>
      <NotFoundComponent />
    </div>
  </div>
</template>
