<script lang="ts" setup>
// Page Meta and main data
import FeaturedIcon from "~/components/icons/FeaturedIcon.vue";
import AuthTextHeader from "~/components/pages/auth/AuthTextHeader.vue";
import {
  checkFormIsError,
  isEmail,
  isRequired,
} from "~/my_modules/input_validation";
import InputField from "~/components/inputs/InputField.vue";
import MyButton from "~/components/buttons/MyButton.vue";
import AuthForgotPasswordForm from "~/components/pages/auth/AuthForgotPasswordForm.vue";

definePageMeta({
  layout: "auth",
});
useHead({
  titleTemplate: (title) => `Lupa Password - ${title}`,
});

const emailState = ref("");
const formIsError = ref("");

const handleClick = () => {
  console.log(formIsError.value);
};
</script>

<template>
  <div
    class="flex flex-col h-screen justify-center gap-8 w-full md:w-[22.5rem]"
  >
    <!--  Header  -->
    <div class="flex flex-col items-center justify-center gap-6">
      <!--   FeaturedIcon   -->
      <FeaturedIcon size="xl" theme="lightOutline" color="primary">
        vpn_key
      </FeaturedIcon>
      <!--   Text Header   -->
      <AuthTextHeader>
        <template #title>Lupa kata sandi</template>
        <template #subTitle
          >Jangan khawatir, kami akan mengirimkan instruksi untuk mereset.
        </template>
      </AuthTextHeader>
      <!--    End Text Header  -->
    </div>
    <!--  End Header -->
    <!--  Form  -->
    <AuthForgotPasswordForm
      @typing="emailState = $event"
      @btnClicked="
        formIsError = $event;
        handleClick();
      "
    />
    <!--  End Form  -->
  </div>
</template>
