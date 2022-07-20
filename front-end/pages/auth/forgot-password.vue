<script lang="ts" setup>
// Page Meta and main data
import ForgotPasswordFirstSection from "~/components/pages/auth/forgot-password/ForgotPasswordFirstSection.vue";
import ForgotPasswordSecondSection from "~/components/pages/auth/forgot-password/ForgotPasswordSecondSection.vue";

definePageMeta({
  layout: "auth",
});
useHead({
  titleTemplate: (title) => `Lupa Password - ${title}`,
});

const emailState = ref("");
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
  <div class="flex flex-col gap-8 w-full md:w-[22.5rem] mt-[48px] md:mt-[96px]">
    <!--  First Section -->
    <Transition name="first-transition" :duration="300" mode="out-in">
      <div v-if="!formIsSubmitted">
        <ForgotPasswordFirstSection
          @typing="emailState = $event"
          @btn-clicked="
            formIsError = $event;
            handleClick();
          "
        />
      </div>
      <div v-else-if="formIsSubmitted">
        <ForgotPasswordSecondSection :emailText="emailState" />
      </div>
    </Transition>
    <!--  Second Section  -->
    <div class="flex justify-center text-gray-500 text-sm">
      <NuxtLink to="login">
        <span class="material-icons-outlined align-middle pr-[8px]">
          arrow_back
        </span>
        <span class="align-middle font-medium">Kembali ke halaman login</span>
      </NuxtLink>
    </div>
  </div>
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
