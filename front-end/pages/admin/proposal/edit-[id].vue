<script setup lang="ts">
import PageHeader from "~/components/header/PageHeader.vue";
import PageSubHeader from "~/components/header/PageSubHeader.vue";
import ProposalForm from "~/components/pages/proposal/ProposalForm.vue";

definePageMeta({
  layout: "admin",
});

const route = useRoute();

useHead({
  titleTemplate: (title) => `Edit Proposal - ${title}`,
});

const proposalFormRef = ref<InstanceType<typeof ProposalForm> | null>(null);

const handleClick = (value) => {
  if (value) {
    proposalFormRef.value?.toggleIsLoading();
  } else {
    console.log("form is not valid");
  }
};
</script>
<template>
  <div>
    <section class="flex flex-col gap-8">
      <!-- * Header Section    -->
      <PageHeader>Edit Proposal</PageHeader>
      <!--   ! End Header Section -->
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
        <ProposalForm
          @clicked="handleClick($event)"
          ref="proposalFormRef"
          :value="{
            title: 'Uzumaki Naruto',
            dosen: 'Jiraiya',
            mahasiswa: 'Sasuke',
          }"
        />
      </div>
    </section>
  </div>
</template>
