<script lang="ts" setup>
import FeaturedIcon from "~/components/icons/FeaturedIcon.vue";
import AuthTextHeader from "~/components/pages/auth/AuthTextHeader.vue";
import MyButton from "~/components/buttons/MyButton.vue";

// Props
interface Props {
  emailText: string;
}

const props = defineProps<Props>();

// State
const buttonIsDisabled = ref(false);
const timer = ref(30);

const handleClick = () => {
  // Check button is disabled or not
  if (!buttonIsDisabled.value) {
    buttonIsDisabled.value = true;
    console.log("I'm doing my work...");
    // Start timer
    const interval = setInterval(() => {
      timer.value--;
      if (timer.value === 0) {
        clearInterval(interval);
        buttonIsDisabled.value = false;
        timer.value = 30;
      }
    }, 1000);
  } else {
    console.log("Button is disabled");
  }
};
</script>

<template>
  <div class="flex flex-col gap-6 items-center">
    <!--   FeaturedIcon   -->
    <FeaturedIcon size="xl" theme="lightOutline" color="primary">
      email
    </FeaturedIcon>
    <!--   Text Header   -->
    <AuthTextHeader>
      <template #title>Periksa email anda</template>
      <template #subTitle
        >Kami mengirim reset link ke {{ emailText }}
      </template>
    </AuthTextHeader>
    <!--    End Text Header  -->

    <div class="flex flex-col gap-6">
      <MyButton
        hieararchy="primary"
        size="lg"
        width="full"
        :disabled="buttonIsDisabled"
        @clicked="handleClick"
      >
        <template #text>
          <span v-if="buttonIsDisabled"> Mohon tunggu {{ timer }} detik </span>
          <span v-else>Kirim Ulang</span>
        </template>
      </MyButton>
    </div>
  </div>
</template>
