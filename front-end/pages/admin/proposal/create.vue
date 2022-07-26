<script setup lang="ts">
import PageSubHeader from "~/components/header/PageSubHeader.vue";
import PageHeader from "~/components/header/PageHeader.vue";
import ProposalForm from "~/components/pages/proposal/ProposalForm.vue";
import axios from "axios";
import { baseApiUrl } from "~/my_modules/environment";

useHead({
  titleTemplate: (title) => `Upload Proposal - ${title}`,
});

const proposalFormRef = ref<InstanceType<typeof ProposalForm> | null>(null);

const handleClick = async (value) => {
  if (value) {
    proposalFormRef.value?.toggleIsLoading();

    await axios.post(`${baseApiUrl}`);
  } else {
    console.log("form is not valid");
  }
};
</script>

<template>
  <NuxtLayout name="admin">
    <div>
      <section class="flex flex-col gap-8">
        <!-- * Header Section    -->
        <PageHeader>Upload Proposal</PageHeader>
        <!--   ! End Header Section -->
        <!-- Form Section   -->
        <div class="flex flex-col gap-5">
          <!--    Header Form    -->
          <PageSubHeader>
            <template #title>
              File proposal yang diupload hanya berisi BAB 2 & 3
            </template>
            <template #description
              >Untuk lainnya silahkan dihapus terlebih dahulu agar hasil yang
              didapatkan sesua dengan yang diharapkan
            </template>
          </PageSubHeader>
          <!--   End Header Form    -->
          <hr />
          <ProposalForm @clicked="handleClick($event)" ref="proposalFormRef" />
        </div>
      </section>
    </div>
  </NuxtLayout>
</template>
