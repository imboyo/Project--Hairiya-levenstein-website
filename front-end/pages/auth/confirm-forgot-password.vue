<script lang="ts" setup>
import ConfirmForgotPasswordFirstSection from "~/components/pages/auth/confirm-forgot-password/ConfirmForgotPasswordFirstSection.vue";
import ConfirmForgotPasswordSecondSection from "~/components/pages/auth/confirm-forgot-password/ConfirmForgotPasswordSecondSection.vue";

useHead({
  titleTemplate: (title) => `Konfirmasi Lupa Password - ${title}`,
});

const formIsError = ref("");
const formIsSubmitted = ref(false);

const handleClick = () => {
  if (!formIsError.value) {
    // TODO : Send email
    formIsSubmitted.value = true;
    console.log("Form is valid");
  } else {
    console.log("Form is invalid");
  }
};
</script>

<template>
  <NuxtLayout name="auth">
    <div class="flex flex-col gap-8 w-full md:w-[22.5rem] mt-[48px] md:mt-96px">
      <Transition name="first-transition" :duration="300" mode="out-in">
        <!--  First Section  -->
        <div v-if="!formIsSubmitted">
          <ConfirmForgotPasswordFirstSection
            @btn-clicked="
              formIsError = $event;
              handleClick();
            "
          />
        </div>
        <!--  Second Section  -->
        <div v-else>
          <ConfirmForgotPasswordSecondSection />
        </div>
      </Transition>
    </div>
  </NuxtLayout>
</template>

<style scoped>
.first-transition-enter-active,
.first-transition-leave-active {
  transition: all 0.5s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.first-transition-leave-to {
  opacity: 0;
  transform: translateX(100%);
}

.first-transition-enter-from {
  opacity: 0;
  transform: translateX(-100%);
}
</style>
