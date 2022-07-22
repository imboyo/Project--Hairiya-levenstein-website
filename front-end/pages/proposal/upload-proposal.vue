<script setup lang="ts">
import PageSubHeader from "~/components/header/PageSubHeader.vue";
import PageHeader from "~/components/header/PageHeader.vue";
import ProposalForm from "~/components/pages/proposal/ProposalForm.vue";

useHead({
  titleTemplate: (title) => `Upload Proposal - ${title}`,
});

const handleClick = (value) => {
  console.log(value);
};
</script>

<template>
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
        <ProposalForm @clicked="handleClick($event)" />
      </div>
    </section>
  </div>
</template>
