<script lang="ts" setup>
import PageHeader from "~/components/header/PageHeader.vue";
import PageSubHeader from "~/components/header/PageSubHeader.vue";
import UserSettingForm from "~/components/pages/user/UserSettingForm.vue";

const userSettingFormRef = ref<InstanceType<typeof UserSettingForm> | null>(
  null
);

const handleClick = (value) => {
  if (value) {
    userSettingFormRef.value?.toggleIsLoading();
  } else {
    console.log("form is not valid");
  }
};
</script>

<template>
  <div>
    <section class="flex flex-col gap-8">
      <PageHeader>Pengaturan</PageHeader>
      <div class="flex flex-col gap-5">
        <PageSubHeader>
          <template #title>Info Pribadi</template>
          <template #description
            >Perbarui foto dan detail pribadi Anda di sini</template
          >
        </PageSubHeader>
        <hr />

        <UserSettingForm
          @clicked="handleClick($event)"
          ref="userSettingFormRef"
          :value="{ name: 'John Doe', email: 'sasuke@gmail.com' }"
        />
      </div>
    </section>
  </div>
</template>
