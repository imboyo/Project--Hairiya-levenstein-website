<script lang="ts" setup>
import FeaturedIcon from "~/components/icons/FeaturedIcon.vue";
import AuthTextHeader from "~/components/pages/auth/AuthTextHeader.vue";
import MyButton from "~/components/buttons/MyButton.vue";

const router = useRouter();
</script>

<template>
  <div class="flex flex-col gap-6 items-center">
    <!--  FeaturedIcon  -->
    <FeaturedIcon size="xl" theme="lightOutline" color="success">
      task_alt
    </FeaturedIcon>
    <!--   Text Header   -->
    <AuthTextHeader>
      <template #title>Kata sandi diubah</template>
      <template #subTitle
        >Kata sandi Anda telah berhasil diatur ulang. Klik di bawah ini untuk
        masuk secara ajaib.
      </template>
    </AuthTextHeader>
    <!--    End Text Header  -->

    <div class="flex flex-col gap-6">
      <MyButton
        hieararchy="primary"
        size="lg"
        width="full"
        @clicked="router.push('/auth/login')"
      >
        <template #text>Kembali ke halaman login</template>
      </MyButton>
    </div>
  </div>
</template>
