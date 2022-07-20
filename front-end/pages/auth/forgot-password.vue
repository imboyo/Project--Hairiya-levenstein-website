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
    formIsSubmitted.value = true;
    console.log("Form is valid");
  } else {
    console.log("Form is invalid");
  }
};
</script>

<template>
  <div class="flex flex-col gap-8 w-full md:w-[22.5rem] mt-[48px] md:mt-[96px]">
    <!--  Form  -->
    <ForgotPasswordFirstSection
      v-if="!formIsSubmitted"
      @typing="emailState = $event"
      @btn-clicked="
        formIsError = $event;
        handleClick();
      "
    />
    <!--  End Form  -->
    <ForgotPasswordSecondSection
      v-if="formIsSubmitted"
      :emailText="emailState"
    />
  </div>
</template>
