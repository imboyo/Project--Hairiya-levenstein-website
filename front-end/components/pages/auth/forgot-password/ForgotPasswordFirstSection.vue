<script lang="ts" setup>
import {
  checkFormIsError,
  isEmail,
  isRequired,
} from "~/my_modules/input_validation";
import InputField from "~/components/inputs/InputField.vue";
import MyButton from "~/components/buttons/MyButton.vue";
import FeaturedIcon from "~/components/icons/FeaturedIcon.vue";
import AuthTextHeader from "~/components/pages/auth/AuthTextHeader.vue";

// Form Input Rules
const formInputRules = {
  username: [
    {
      validate: isRequired,
      text: "Tolong masukkan email anda",
    },
    {
      validate: isEmail,
      text: "Tolong massukan email dengan benar",
    },
  ],
};

// Form input state
const emailState = ref("");
const emailErrorState = ref("");

// Check input value is error or validated
const formIsError = computed(() => {
  return checkFormIsError({ emailErrorState: emailErrorState.value });
});

// * Child Ref Component for accesing child funciton
// ? Note : Buat Ref di component html di template sesaui dengan nama const disini
const emailField = ref<InstanceType<typeof InputField> | null>(null);

const handleClick = () => {
  emailField.value?.refreshValidation((value) => {
    emailErrorState.value = value;
  });
};

const emit = defineEmits(["btn-clicked", "typing"]);
</script>

<template>
  <!--  Header  -->
  <div class="flex flex-col gap-6 items-center">
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
  <!--   Form   -->
  <div class="flex flex-col gap-6">
    <InputField
      placeholder="Email"
      :rules="formInputRules.email"
      type="email"
      label="Email"
      required
      ref="emailField"
      @typing="
        emailState = $event.inputValue;
        emailErrorState = $event.errorState;
        $emit('typing', emailState);
      "
    />
    <!--  Button    -->
    <MyButton
      hieararchy="primary"
      size="lg"
      width="full"
      :disabled="formIsError"
      @clicked="
        handleClick();
        $emit('btn-clicked', formIsError);
      "
    >
      <template #text>Reset Password</template>
    </MyButton>
  </div>
</template>
